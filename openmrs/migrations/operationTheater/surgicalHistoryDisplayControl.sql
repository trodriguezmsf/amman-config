DELETE FROM global_property WHERE property = 'bahmni.sqlGet.otSurgicalHistory';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.otSurgicalHistory',
"SELECT
  surgical_appointment_with_stage.stage                       AS Stage,
  DATE_FORMAT(sb.start_datetime, '%d/%m/%Y')                  AS 'Date of Surgery',
  CONCAT(pn.given_name, ' ', pn.family_name)                  AS Surgeon,
  surgical_appointment_procedure.value                        AS Procedures,
  sa.status                                                   AS `Status`,
  l.name                                                      AS OT,
  latest_encounter_with_sb.codes                              AS `Type of Anaesthesia Administered`,
  latest_encounter_with_sb.complication                       AS `Complication of Anaesthesia`,
  latest_encounter_with_sb.description                        AS `Description of Complication`,
  latest_encounter_with_sb.bloodTransfusion                   AS `Blood Transfusion`,
  latest_encounter_with_sb.bloodProduct                       AS `Blood Product`,
  latest_encounter_with_sb.numberOfUnits                      AS `No.of Units Given`,
  latest_encounter_with_sb.reaction                           AS `Intra-operative Reaction`,
  latest_encounter_with_sb.comments                           AS `Reaction Comments`,
  DATE_FORMAT(latest_encounter_with_sb.anaesthesiaStartDate, '%d/%m/%Y') AS `Anaesthesia Start Date`
FROM surgical_block sb
  INNER JOIN location l ON sb.location_id = l.location_id
                           AND l.retired IS FALSE
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
      sa.surgical_appointment_id AS surgical_appointment_id,
      latest_encounter.*
    FROM
      surgical_block sb
      INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                            AND sa.voided IS FALSE
      LEFT OUTER JOIN (
                        SELECT
                          encounter_coded_answer.patient_id,
                          encounter_coded_answer.encounter_id,
                          encounter_coded_answer.codes,
                          encounter_coded_answer.complication,
                          encounter_coded_answer.bloodTransfusion,
                          encounter_coded_answer.reaction,
                          encounter_coded_answer.bloodProduct,
                          encounters_non_coded_value.comments,
                          encounters_non_coded_value.description,
                          encounters_non_coded_value.anaesthesiaStartDate,
                          encounters_non_coded_value.numberOfUnits,
                          encounter_coded_answer.encounter_datetime AS encounter_datetime
                        FROM (
                               SELECT
                                 encounters_coded_answer_code.patient_id,
                                 encounters_coded_answer_code.encounter_id,
                                 encounters_coded_answer_code.encounter_datetime,
                                 group_concat(
                                     if(encounters_coded_answer_code.name = 'APN, Type of anaesthesia administered',
                                        concept_name.name,
                                        NULL))          AS codes,
                                 group_concat(if(encounters_coded_answer_code.name = 'APN, Complication of anaesthesia',
                                                 concept_name.name,
                                                 NULL)) AS complication,
                                 group_concat(
                                     if(encounters_coded_answer_code.name = 'APN, Blood transfusion', concept_name.name,
                                        NULL))          AS bloodTransfusion,
                                 group_concat(
                                     if(encounters_coded_answer_code.name = 'APN, Blood product, intra-operatively',
                                        concept_name.name,
                                        NULL))          AS bloodProduct,
                                 group_concat(
                                     if(encounters_coded_answer_code.name =
                                        'APN, Intra-operative transfusion related reaction',
                                        concept_name.name,
                                        NULL))          AS reaction
                               FROM (SELECT
                                       e.patient_id         AS patient_id,
                                       e.encounter_id       AS encounter_id,
                                       e.encounter_datetime AS encounter_datetime,
                                       o.value_coded        AS value_coded,
                                       o.value_datetime,
                                       o.concept_id,
                                       outcome_cn.name
                                     FROM
                                       encounter e
                                       INNER JOIN
                                       obs o ON o.encounter_id = e.encounter_id
                                                AND e.voided IS FALSE
                                                AND o.voided IS FALSE
                                       INNER JOIN
                                       concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
                                                                  AND outcome_cn.concept_name_type =
                                                                      'FULLY_SPECIFIED'
                                                                  AND outcome_cn.name IN
                                                                      ('APN, Type of anaesthesia administered',
                                                                       'APN, Complication of anaesthesia',
                                                                       'APN, Blood transfusion',
                                                                       'APN, Blood product, intra-operatively',
                                                                       'APN, Intra-operative transfusion related reaction'
                                                                      )
                                                                  AND outcome_cn.voided IS FALSE
                                     WHERE e.patient_id = (SELECT person_id
                                                           FROM person
                                                           WHERE uuid = ${patientUuid})) AS encounters_coded_answer_code
                                 INNER JOIN
                                 concept_name
                                   ON encounters_coded_answer_code.value_coded = concept_name.concept_id AND
                                      concept_name_type = 'FULLY_SPECIFIED'
                               GROUP BY encounter_id) encounter_coded_answer
                          INNER JOIN
                          (
                            SELECT
                              non_coded_values.patient_id,
                              group_concat(anaesthesiaStartDate) AS anaesthesiaStartDate,
                              group_concat(comments)             AS comments,
                              group_concat(description)          AS description,
                              group_concat(numberOfUnits)        AS numberOfUnits,
                              non_coded_values.encounter_id
                            FROM
                              (SELECT
                                 e.patient_id           AS patient_id,
                                 e.encounter_id         AS encounter_id,
                                 e.encounter_datetime   AS encounter_datetime,
                                 outcome_cn.name,
                                 if(outcome_cn.name = 'APN, Number of units given', o.value_numeric,
                                    NULL)               AS numberOfUnits,
                                 o.value_coded          AS value_coded,
                                 o.value_datetime       AS anaesthesiaStartDate,
                                 o.concept_id,
                                 if(outcome_cn.name =
                                    'APN, Intra-operative transfusion related reaction, comments',
                                    o.value_text, NULL) AS comments,
                                 if(outcome_cn.name = 'APN, Description of complication', o.value_text,
                                    NULL)               AS description
                               FROM
                                 encounter e

                                 INNER JOIN
                                 obs o ON o.encounter_id = e.encounter_id
                                          AND e.voided IS FALSE
                                          AND o.voided IS FALSE
                                 INNER JOIN
                                 concept_name outcome_cn
                                   ON outcome_cn.concept_id = o.concept_id
                                      AND outcome_cn.concept_name_type = 'FULLY_SPECIFIED'
                                      AND
                                      outcome_cn.name IN
                                      ('APN, Anaesthesia start time',
                                       'APN, Intra-operative transfusion related reaction, comments',
                                       'APN, Number of units given',
                                       'APN, Description of complication'
                                      )
                                      AND outcome_cn.voided IS FALSE
                               WHERE e.patient_id =
                                     (SELECT person_id
                                      FROM person
                                      WHERE uuid =
                                            ${patientUuid})) non_coded_values
                            GROUP BY
                              encounter_id) encounters_non_coded_value
                            ON encounters_non_coded_value.encounter_id = encounter_coded_answer.encounter_id
                        ORDER BY encounter_coded_answer.encounter_id DESC
                        LIMIT 1
                      ) latest_encounter ON latest_encounter.patient_id = sa.patient_id AND
                               latest_encounter.encounter_datetime <= sb.end_datetime
    GROUP BY surgical_appointment_id
  ) latest_encounter_with_sb ON latest_encounter_with_sb.surgical_appointment_id = sa.surgical_appointment_id
WHERE sa.status = 'COMPLETED' ORDER BY sb.start_datetime DESC;"
, 'Surgical history for patient', @uuid);