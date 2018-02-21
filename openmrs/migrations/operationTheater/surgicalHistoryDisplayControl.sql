DELETE FROM global_property WHERE property = 'bahmni.sqlGet.otSurgicalHistory';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.otSurgicalHistory',
"SELECT
  surgical_appointment_with_stage.stage                  AS Stage,
  DATE_FORMAT(sb.start_datetime, '%d/%m/%Y')             AS 'Date of Surgery',
  surgical_appointment_procedure.value                   AS `Procedure`,
  latest_encounter_with_sb.type_of_administered          AS `Type of anaesthesia administered`,
  latest_encounter_with_sb.`Complication of Anaesthesia` AS `Complication of anaesthesia`,
  latest_encounter_with_sb.blood_transfusion             AS `Blood Transfusion`,
  latest_encounter_with_sb.Transfusion                   AS `Transfusion and Adverse Reactions`
FROM surgical_block sb
  INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                        AND sa.voided IS FALSE
  INNER JOIN person person ON person.person_id = sa.patient_id
                              AND person.uuid = ${patientUuid}
                              AND person.voided IS FALSE
  INNER JOIN provider p ON p.provider_id = sb.primary_provider_id
                           AND p.retired IS FALSE
  INNER JOIN person_name pn ON pn.person_id = p.person_id
                               AND pn.voided IS FALSE
  LEFT OUTER JOIN (
                    SELECT
                      surgical_appointment_id AS surgical_appointment_id,
                      value                   AS value
                    FROM surgical_appointment_attribute saa
                      INNER JOIN surgical_appointment_attribute_type saat
                        ON saat.surgical_appointment_attribute_type_id =
                           saa.surgical_appointment_attribute_type_id AND saat.name = 'procedure'
                           AND saat.retired IS FALSE AND saa.voided IS FALSE
                  ) surgical_appointment_procedure
    ON surgical_appointment_procedure.surgical_appointment_id = sa.surgical_appointment_id
  LEFT OUTER JOIN
  (
    SELECT
      sa.surgical_appointment_id       AS surgical_appointment_id,
      max(encounters_with_stage.stage) AS stage
    FROM
      surgical_block sb
      INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                            AND sa.voided IS FALSE
      LEFT OUTER JOIN (
                        SELECT
                          e.patient_id         AS patient_id,
                          e.encounter_id       AS encounter_id,
                          e.encounter_datetime AS encounter_datetime,
                          o.value_numeric      AS stage
                        FROM
                          encounter e
                          INNER JOIN obs o ON o.encounter_id = e.encounter_id
                                              AND e.voided IS FALSE
                                              AND o.voided IS FALSE
                          INNER JOIN concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
                                                                AND outcome_cn.concept_name_type =
                                                                    'FULLY_SPECIFIED'
                                                                AND outcome_cn.name = 'Stage'
                                                                AND outcome_cn.voided IS FALSE
                      ) encounters_with_stage ON encounters_with_stage.patient_id = sa.patient_id AND
                                                 encounters_with_stage.encounter_datetime <= sb.end_datetime
    GROUP BY surgical_appointment_id
  ) surgical_appointment_with_stage
    ON surgical_appointment_with_stage.surgical_appointment_id = sa.surgical_appointment_id
  LEFT OUTER JOIN
  (
    SELECT
      latest_encounters.surgical_appointment_id,
      latest_encounters.encounter_id,
      latest_encounters.start_date,
      latest_encounters.patient_id,
      non_concatenated_concepts.blood_transfusion,
      non_concatenated_concepts.type_of_administered,
      concatenated_concepts.Transfusion,
      concatenated_concepts.`Complication of Anaesthesia`
    FROM (SELECT
            anaesthesia.anaesthesiaStartDate,
            surgical_details.start_date,
            max(anaesthesia.encounter_id) AS encounter_id,
            surgical_details.patient_id,
            surgical_details.surgical_appointment_id
          FROM
            (SELECT
               CAST(sb.start_datetime AS DATE) AS start_date,
               sa.surgical_appointment_id,
               sa.patient_id,
               sa.status
             FROM surgical_block sb INNER JOIN surgical_appointment sa ON sb.surgical_block_id = sa.surgical_block_id
                                                                          AND sb.voided IS FALSE AND sa.voided IS FALSE
             WHERE sa.patient_id = (SELECT person_id
                                    FROM person
                                    WHERE uuid = ${patientUuid})) surgical_details
            INNER JOIN
            (SELECT
               cast(obs.value_datetime AS DATE) AS anaesthesiaStartDate,
               obs.encounter_id,
               obs.obs_group_id,
               obs.person_id
             FROM obs obs
             WHERE obs.concept_id = (SELECT concept_view.concept_id
                                     FROM concept_view
                                     WHERE concept_view.concept_full_name = 'APN, Anaesthesia start time') AND
                   obs.voided IS FALSE) anaesthesia
              ON surgical_details.patient_id = anaesthesia.person_id AND
                 surgical_details.start_date = anaesthesia.anaesthesiaStartDate
          GROUP BY anaesthesia.anaesthesiaStartDate) latest_encounters
      LEFT OUTER JOIN (
                        SELECT
                          coded.encounter_id,
                          group_concat(if(coded.concept_full_name = 'APN, Type of anaesthesia administered',
                                          coded.answer_value, NULL) SEPARATOR ', ') AS type_of_administered,
                          group_concat(if(coded.concept_full_name = 'APN, Blood transfusion',
                                          coded.answer_value, NULL) SEPARATOR ', ') AS blood_transfusion
                        FROM
                          (
                            SELECT
                              obs.concept_id,
                              group_concat(concept_view.concept_full_name SEPARATOR ', ') AS answer_value,
                              cv.concept_full_name,
                              obs.encounter_id
                            FROM obs
                              INNER JOIN concept_view cv
                                ON obs.concept_id = cv.concept_id AND cv.retired IS FALSE AND
                                   cv.concept_full_name IN
                                   ('APN, Type of anaesthesia administered',
                                    'APN, Blood transfusion')
                                   AND person_id = (SELECT person_id
                                                    FROM person
                                                    WHERE uuid = ${patientUuid})
                              INNER JOIN concept_view
                                ON concept_view.concept_id = obs.value_coded AND obs.voided IS FALSE
                            GROUP BY encounter_id, cv.concept_full_name) coded
                        GROUP BY
                          encounter_id) non_concatenated_concepts
        ON non_concatenated_concepts.encounter_id = latest_encounters.encounter_id
      LEFT OUTER JOIN (SELECT
                         group_concat(if(result.obs_group_name = 'APN, Transfusion', result.concatenated_answer,
                                         NULL) SEPARATOR ', ')                             AS `Transfusion`,
                         group_concat(if(result.obs_group_name = 'Post-operative Anaesthesia Note',
                                         result.concatenated_answer, NULL) SEPARATOR
                                      ', ')                                                AS `Complication of Anaesthesia`,
                         result.encounter_id,
                         result.person_id
                       FROM
                         (SELECT
                            group_concat(transfusion.concatenated_answer SEPARATOR ', ') AS concatenated_answer,
                            transfusion.concept_id,
                            if(cv.concept_full_name = 'Intra-operative blood products', 'APN, Transfusion',
                               cv.concept_full_name)                                     AS obs_group_name,
                            transfusion.encounter_id,
                            transfusion.person_id
                          FROM (SELECT
                                  obs.concept_id,
                                  obs.person_id,
                                  group_concat(grouped_answers.concatenated_answer SEPARATOR
                                               ', ') AS concatenated_answer,
                                  grouped_answers.obs_group_id,
                                  grouped_answers.encounter_id
                                FROM
                                  (SELECT
                                     concat(group_concat(concept_view.concept_full_name SEPARATOR ', '), ' (',
                                            (if((if(non_coded_concepts.value_text IS NULL,
                                                    non_coded_concepts.value_numeric,
                                                    non_coded_concepts.value_text)) IS NULL, '',
                                                (if(non_coded_concepts.value_text IS NULL,
                                                    non_coded_concepts.value_numeric,
                                                    non_coded_concepts.value_text)))), ')') AS concatenated_answer,
                                     coded_concepts.obs_group_id,
                                     coded_concepts.encounter_id,
                                     coded_concepts.concept_id
                                   FROM (SELECT *
                                         FROM obs
                                         WHERE obs.voided IS FALSE AND
                                               concept_id IN (
                                                 SELECT concept_id
                                                 FROM concept_view
                                                 WHERE concept_view.retired IS FALSE AND
                                                       concept_full_name IN
                                                       ('APN, Blood product, intra-operatively',
                                                        'APN, Intra-operative transfusion related reaction',
                                                        'APN, Complication of anaesthesia')
                                               ) AND person_id = (SELECT person_id
                                                                  FROM person
                                                                  WHERE
                                                                    uuid = ${patientUuid})) coded_concepts INNER JOIN
                                     concept_view
                                       ON concept_view.concept_id = coded_concepts.value_coded
                                     LEFT JOIN (
                                                 SELECT *
                                                 FROM obs
                                                 WHERE obs.voided IS FALSE AND concept_id IN (
                                                   SELECT concept_id
                                                   FROM concept_view
                                                   WHERE concept_view.retired IS FALSE AND
                                                         concept_full_name IN
                                                         ('APN, Number of units given',
                                                          'APN, Intra-operative transfusion related reaction, comments',
                                                          'APN, Description of complication')
                                                 ) AND person_id = (SELECT person_id
                                                                    FROM person
                                                                    WHERE
                                                                      uuid = ${patientUuid})) non_coded_concepts
                                       ON coded_concepts.obs_group_id = non_coded_concepts.obs_group_id
                                   GROUP BY coded_concepts.obs_group_id) grouped_answers
                                  INNER JOIN obs ON grouped_answers.obs_group_id = obs.obs_id AND
                                                    grouped_answers.encounter_id = obs.encounter_id
                                                    AND obs.voided IS FALSE
                                GROUP BY obs.concept_id, obs.encounter_id) transfusion
                            INNER JOIN concept_view cv ON cv.concept_id = transfusion.concept_id
                          GROUP BY transfusion.encounter_id, obs_group_name
                         ) result
                       GROUP BY encounter_id) concatenated_concepts
        ON concatenated_concepts.encounter_id = latest_encounters.encounter_id
  ) latest_encounter_with_sb ON latest_encounter_with_sb.surgical_appointment_id = sa.surgical_appointment_id
WHERE sa.status = 'COMPLETED'
ORDER BY sb.start_datetime DESC;"
, 'Surgical history for patient', @uuid);