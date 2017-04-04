DELETE FROM global_property where property = 'emrapi.sqlSearch.validatedPatients';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.validatedPatients',
"SELECT
  presentation.`Date of presentation`,
  personWithoutExpectedDate.patient_identifier AS `identifier`,
  personWithoutExpectedDate.name AS PATIENT_LISTING_QUEUES_HEADER_NAME,
  personWithoutExpectedDate.age AS `Age`,
  paddress.address3 AS `Country`,
  obs_across_visits.`Name of MLO`,
  obs_across_visits.Stage,
  obs_across_visits.Specialty,
  priority.Priority,
  comments.`Comments about Validation`,
  surgical_final_validation.`Does the patient need surgical final validation`,
  obs_across_visits.`Expected Month/Year of Arrival`,
  careTakerRequired.`Is care taker required` AS `Is Caretaker Required?`,
  statusOfOfficialDocuments.`Status of Official ID Documents`,
  personWithoutExpectedDate.uuid AS uuid

FROM
  (
    SELECT
      concat(pn.given_name, ' ', pn.family_name)    AS name,
      floor(DATEDIFF(CURDATE(), p.birthdate) / 365) AS age,
      pi.identifier                                 AS patient_identifier,
      p.person_id                                   AS person_id,
      p.uuid                                        AS uuid,
      person_with_expected_date_of_arrival.expected_date_of_arrival
    FROM person p
      JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
      JOIN person_name pn ON p.person_id = pn.person_id AND p.voided IS FALSE
      LEFT JOIN (
                  SELECT pa.value AS expected_date_of_arrival, pa.person_id
                  FROM person_attribute pa
                    JOIN person_attribute_type pat
                      ON pat.name = 'expectedDateofArrival' AND pat.person_attribute_type_id = pa.person_attribute_type_id
                         AND pa.voided IS FALSE
                  GROUP BY pa.person_id
                ) person_with_expected_date_of_arrival ON person_with_expected_date_of_arrival.person_id = p.person_id
    GROUP BY p.person_id) personWithoutExpectedDate
  JOIN patient_program pp ON personWithoutExpectedDate.person_id = pp.patient_id AND pp.date_completed IS NULL AND pp.voided IS FALSE
                             AND personWithoutExpectedDate.expected_date_of_arrival IS NULL
  JOIN
  (
    (
      SELECT outcome_followup.person_id
      FROM obs outcome_followup
        JOIN obs validation_followup ON validation_followup.obs_id = outcome_followup.obs_group_id  AND
                                        outcome_followup.voided IS FALSE AND validation_followup.voided IS FALSE
        JOIN encounter e ON e.encounter_id =  validation_followup.encounter_id AND e.voided IS FALSE
        JOIN
        (SELECT
           MAX(e.encounter_datetime) AS encounter_datetime,
           o.person_id
         FROM obs o
           JOIN concept_name cn
             ON cn.concept_id = o.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE AND o.voided IS FALSE AND
                cn.name = 'Follow-up validation'
           JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
         GROUP BY o.person_id) latest_followup ON latest_followup.encounter_datetime = e.encounter_datetime AND validation_followup.person_id = latest_followup.person_id
        JOIN concept_name cn
          ON cn.concept_name_type = 'FULLY_SPECIFIED' AND outcome_followup.concept_id = cn.concept_id
             AND cn.voided IS FALSE AND cn.name = 'FUP, Outcomes for follow-up surgical validation'
        JOIN concept_name answer ON answer.name = 'Further stage admission' AND
                                    answer.concept_name_type = 'FULLY_SPECIFIED' AND
                                    answer.voided IS FALSE AND
                                    answer.concept_id = outcome_followup.value_coded
    )
    UNION
    (
      SELECT latest_firststage_form.person_id
      FROM
        (SELECT
           MAX(e.encounter_datetime) AS encounter_datetime,
           o.person_id
         FROM obs o
           JOIN concept_name cn
             ON cn.concept_id = o.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE AND o.voided IS FALSE AND
                cn.name = 'First Stage Validation'
           JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                AND o.person_id NOT IN (
             SELECT DISTINCT (o.person_id)
             FROM obs o
               JOIN concept_name cn ON cn.concept_name_type = 'FULLY_SPECIFIED' AND o.concept_id = cn.concept_id AND
                                       cn.voided IS FALSE AND o.voided IS FALSE AND cn.name = 'Follow-up validation')
         GROUP BY o.person_id) latest_firststage_form
        JOIN encounter e ON e.encounter_datetime = latest_firststage_form.encounter_datetime AND e.patient_id = latest_firststage_form.person_id AND e.voided IS FALSE
        JOIN obs validation_form ON validation_form.encounter_id = e.encounter_id AND validation_form.person_id = latest_firststage_form.person_id AND validation_form.voided IS FALSE
        JOIN obs outcome_section ON outcome_section.obs_group_id = validation_form.obs_id AND outcome_section.voided IS FALSE
        JOIN concept_name section_name ON section_name.concept_id = outcome_section.concept_id AND section_name.concept_name_type = 'FULLY_SPECIFIED' AND
                                          section_name.voided IS FALSE AND section_name.name = 'FSTG, First Stage Validation'
        JOIN obs outcome_surgical ON outcome_surgical.obs_group_id = outcome_section.obs_id AND outcome_surgical.voided IS FALSE
        JOIN concept_name surgical_name ON surgical_name.concept_id = outcome_surgical.concept_id AND surgical_name.concept_name_type = 'FULLY_SPECIFIED' AND
                                           surgical_name.name = 'FSTG, Outcomes for 1st stage surgical validation' AND surgical_name.voided IS FALSE
        JOIN concept_name surgical_answer ON surgical_answer.concept_id = outcome_surgical.value_coded AND
                                             surgical_answer.name = 'Valid' AND surgical_answer.concept_name_type = 'FULLY_SPECIFIED' AND
                                             surgical_answer.voided IS FALSE
        JOIN obs outcome_anaesthesia ON outcome_anaesthesia.obs_group_id = outcome_section.obs_id AND outcome_anaesthesia.voided IS FALSE
        JOIN concept_name anaesthesia_name ON anaesthesia_name.concept_id = outcome_anaesthesia.concept_id AND anaesthesia_name.concept_name_type = 'FULLY_SPECIFIED' AND
                                              anaesthesia_name.name = 'FSTG, Outcomes for 1st stage Anaesthesia validation' AND anaesthesia_name.voided IS FALSE
        JOIN concept_name anaesthesia_answer ON anaesthesia_answer.concept_id = outcome_anaesthesia.value_coded AND anaesthesia_answer.name = 'Fits anaesthesia criteria' AND
                                                anaesthesia_answer.concept_name_type = 'FULLY_SPECIFIED' AND anaesthesia_answer.voided IS FALSE
    )
  ) AS validated_patients ON validated_patients.person_id = personWithoutExpectedDate.person_id
  LEFT JOIN person_address paddress ON personWithoutExpectedDate.person_id = paddress.person_id AND paddress.voided IS FALSE
  LEFT JOIN (SELECT
               obs.person_id,
               GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO',
                                         COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of MLO',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Expected Date of Arrival',
                                         DATE_FORMAT(obs.value_datetime, '%b/%Y'),
                                         NULL)))                                            AS 'Expected Month/Year of Arrival',
               max(obs.value_numeric)                                                       AS 'Stage',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                         COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Specialty'
             FROM (SELECT
                     cn.name             AS c_name,
                     o.person_id,
                     max(e.encounter_datetime) AS encounter_datetime,
                     o.concept_id
                   FROM obs o
                     JOIN concept_name cn ON cn.name IN
                                             ('MH, Name of MLO', 'FV, Expected Date of Arrival','Stage', 'FSTG, Specialty determined by MLO')
                                             AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                             o.voided IS FALSE
                     JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                   GROUP BY person_id, concept_id) result
               JOIN obs ON obs.concept_id = result.concept_id AND obs.person_id = result.person_id AND
                           obs.voided IS FALSE
               JOIN encounter e ON e.encounter_id = obs.encounter_id AND
                                   e.encounter_datetime = result.encounter_datetime AND
                                   e.patient_id = obs.person_id AND e.voided IS FALSE
               LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                    AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND coded_fscn.voided IS FALSE
               LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                   AND coded_fscn.concept_name_type = 'SHORT'
                                                   AND coded_scn.voided IS FALSE
             GROUP BY obs.person_id
            ) obs_across_visits ON personWithoutExpectedDate.person_id = obs_across_visits.person_id
    LEFT JOIN (
              SELECT
                DATE_FORMAT(presentation_obs.value_datetime, '%d/%m/%Y') AS 'Date of presentation',
                presentation_obs.value_datetime AS 'date_of_presentation',
                presentation_obs.person_id
              FROM (
                     SELECT
                       MAX(o.obs_datetime) AS max_obs_datetime,
                       o.person_id
                     FROM obs o
                       JOIN concept_name cn ON cn.name IN
                                               ('FUP, Date of presentation at Followup', 'FSTG, Date of presentation at 1st stage')
                                               AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                               o.voided IS FALSE
                     GROUP BY o.person_id
                   ) latest_presentation_obs
                JOIN obs presentation_obs ON latest_presentation_obs.person_id = presentation_obs.person_id AND
                                             presentation_obs.voided IS FALSE AND presentation_obs.obs_datetime = latest_presentation_obs.max_obs_datetime
                JOIN concept_view cv ON cv.concept_id = presentation_obs.concept_id AND cv.concept_full_name IN
                                                                                        ('FUP, Date of presentation at Followup', 'FSTG, Date of presentation at 1st stage')
                                        AND cv.retired IS FALSE
            ) presentation ON presentation.person_id = personWithoutExpectedDate.person_id

  LEFT JOIN (
              SELECT
                coalesce(priority_answer.concept_short_name, priority_answer.concept_full_name) AS 'Priority',
                priority_obs.person_id
              FROM (
                     SELECT
                       MAX(o.obs_datetime) AS max_obs_datetime,
                       o.person_id
                     FROM obs o
                       JOIN concept_name cn ON cn.name IN ('FSTG, Priority', 'FUP, Priority')
                                               AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                               o.voided IS FALSE
                     GROUP BY o.person_id
                   ) latest_priority_obs
                JOIN obs priority_obs ON priority_obs.person_id = latest_priority_obs.person_id AND
                                         priority_obs.voided IS FALSE AND latest_priority_obs.max_obs_datetime = priority_obs.obs_datetime
                JOIN concept_view cv ON cv.concept_id = priority_obs.concept_id AND
                                        cv.concept_full_name IN ('FSTG, Priority', 'FUP, Priority') AND
                                        cv.retired IS FALSE
                JOIN concept_view priority_answer
                  ON priority_obs.value_coded = priority_answer.concept_id AND priority_answer.retired IS FALSE
            ) priority ON priority.person_id = personWithoutExpectedDate.person_id

  LEFT JOIN (
              SELECT
                comments_obs.value_text AS 'Comments about Validation',
                comments_obs.person_id
              FROM (
                     SELECT
                       MAX(o.obs_datetime) AS max_obs_datetime,
                       o.person_id
                     FROM obs o
                       JOIN concept_name cn
                         ON cn.name IN ('FSTG, Comments', 'FUP, Comments about further stage admission')
                            AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND o.voided IS FALSE
                     GROUP BY o.person_id
                   ) latest_comments_obs
                JOIN obs comments_obs ON comments_obs.person_id = latest_comments_obs.person_id AND
                                         comments_obs.voided IS FALSE AND latest_comments_obs.max_obs_datetime = comments_obs.obs_datetime

                JOIN concept_view cv ON cv.concept_id = comments_obs.concept_id AND cv.concept_full_name IN
                                                                                    ('FSTG, Comments', 'FUP, Comments about further stage admission')
                                        AND cv.retired IS FALSE
            ) comments ON comments.person_id = personWithoutExpectedDate.person_id

    LEFT JOIN (
                SELECT
                  coalesce(surgical_validation_answer.concept_short_name, surgical_validation_answer.concept_full_name) AS 'Does the patient need surgical final validation',
                  surfical_validation_obs.person_id
                FROM (
                       SELECT
                         MAX(o.obs_datetime) AS max_obs_datetime,
                         o.person_id
                       FROM obs o
                         JOIN concept_name cn ON cn.name IN ('FSTG, Does the Patient need Surgical Final Validation', 'FUP, Does the Patient need Surgical Final Validation')
                                                 AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                                 o.voided IS FALSE
                       GROUP BY o.person_id
                     ) latest_surgical_final_validation_obs
                  JOIN obs surfical_validation_obs ON surfical_validation_obs.person_id = latest_surgical_final_validation_obs.person_id AND
                                           surfical_validation_obs.voided IS FALSE AND surfical_validation_obs.obs_datetime = latest_surgical_final_validation_obs.max_obs_datetime
                  JOIN concept_view cv ON cv.concept_id = surfical_validation_obs.concept_id AND
                                          cv.concept_full_name IN ('FSTG, Does the Patient need Surgical Final Validation', 'FUP, Does the Patient need Surgical Final Validation') AND
                                          cv.retired IS FALSE
                  JOIN concept_view surgical_validation_answer
                    ON surfical_validation_obs.value_coded = surgical_validation_answer.concept_id AND surgical_validation_answer.retired IS FALSE
              ) surgical_final_validation ON surgical_final_validation.person_id = personWithoutExpectedDate.person_id
    LEFT JOIN (
              SELECT
                p.person_id,
                if(pa.value = 'true', 'Yes', NULL) AS 'Is care taker required'
              FROM person p
                JOIN person_attribute_type pat ON pat.name = 'isCareTakerRequired' AND pat.retired IS FALSE
                JOIN person_attribute pa
                  ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pa.voided IS FALSE AND
                     pa.person_id = p.person_id
            ) careTakerRequired ON careTakerRequired.person_id = personWithoutExpectedDate.person_id
  LEFT JOIN (
              SELECT
                p.person_id,
                coalesce(fscn.name) AS 'Status of Official ID Documents'
              FROM person p
                JOIN person_attribute_type pat ON pat.name = 'statusofOfficialIDdocuments' AND pat.retired IS FALSE
                JOIN person_attribute pa
                  ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pa.voided IS FALSE AND
                     pa.person_id = p.person_id
                JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND
                                          fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided IS FALSE
            ) statusOfOfficialDocuments ON statusOfOfficialDocuments.person_id = personWithoutExpectedDate.person_id
ORDER BY presentation.`date_of_presentation`
", 'Validated Patients Queue', @uuid);