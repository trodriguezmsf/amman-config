SELECT
  `dateOfMedicalFileReceived`                                             AS `Date of medical file received`,
  `Date of Presentation`,
  `Identifier`,
  Name,
  `Age`,
  `Nationality`,
  `City`,
  `Country`,
  `Name of MLO`,
  `Specialty`,
  `nameOfSurgeon`                                                         AS `Name of surgeon`,
  `stage`                                                                 AS `Stage`,
  `priority`                                                              AS `Priority`,
  programStateName,
  IF(encounter_date_time_for_flp_outcome >=
     encounter_date_time_for_fstg_outcome,
     `Outcomes for flp surgical validation`,
     `Outcomes for 1st Stage surgical validation`)                        AS `Outcome for Surgical Validation`,
  `Outcomes for 1st stage Anaesthesia validation`,
  `latestFinalValidationOutcome`                                          AS `Outcome for Final validation`,
  CONCAT_WS(', ', surgical_assessment_medical_info,
            anaesthesia_assessment_medical_info)                          AS `Type of medical information needed for next submission`,
  `postPoneReason`                                                        AS `Postpone Reason`,
  `postPoneComments`                                                      AS `Comments about postpone reason`,
  `refusedReason`                                                         AS `Refused reason`,
  `refusedComments`                                                       AS `Comments about refusal`,
  `doesPatientNeedSurgicalValidation`                                     AS `Does the patient need surgical final validation`,
  `finalValidationExpectedArrival`                                        AS `Expected month / year of arrival`,
  `isCareTakerRequired`                                                   AS `Is caretaker required`,
  `caretakerGender`                                                       AS `Caretaker Gender`,
  `caretakerNameEnglish`                                                  AS `Caretaker name`,
  `statusofOfficialIDdocuments`                                           AS `Status of official ID documents`,
  `Phone Number`                                                          AS `Phone Number 1, Phone Number 2, Phone Number 3`
FROM (SELECT
        concat(pn.given_name, ' ', ifnull(pn.family_name, '')) AS Name,
        FLOOR(DATEDIFF(CURDATE(), p.birthdate) /
              365)                                             AS `Age`,
        pi.identifier                                          AS `Identifier`,
        p.uuid                                                 AS uuid,
        paddr.address6                                         AS `City`,
        paddr.address3                                         AS `Country`,
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name),
                                  NULL)))                      AS 'Nationality',
        GROUP_CONCAT(DISTINCT (IF(
            obs_fscn.name = 'FSTG, Date of presentation at 1st stage' AND latest_encounter.person_id IS NOT NULL,
            DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'Date of Presentation',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage surgical validation' AND
                                  latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name),
                                  NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'Outcomes for 1st Stage surgical validation',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage surgical validation' AND
                                  latest_encounter.person_id IS NOT NULL, e.encounter_datetime,
                                  NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'encounter_date_time_for_fstg_outcome',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND
                                  latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name),
                                  NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'Outcomes for flp surgical validation',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND
                                  latest_encounter.person_id IS NOT NULL, e.encounter_datetime,
                                  NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'encounter_date_time_for_flp_outcome',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage Anaesthesia validation' AND
                                  latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name),
                                  NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'Outcomes for 1st Stage Anaesthesia validation',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date received' AND latest_encounter.person_id IS NOT NULL,
                                  DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'dateOfMedicalFileReceived',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Type of medical information needed for next submission' AND
                                  latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'surgical_assessment_medical_info',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FST, Type of medical information needed for next submission' AND
                                  latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'anaesthesia_assessment_medical_info',
        surgeon_name.name                                      AS 'nameOfSurgeon',
        doesThePatientNeedSurgicalValidation.value             AS 'doesPatientNeedSurgicalValidation',
        priority.value                                         AS 'priority',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Postpone reason' AND latest_encounter.person_id IS NOT NULL,
                                  COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'postPoneReason',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Refused Reason' AND latest_encounter.person_id IS NOT NULL,
                                  COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'refusedReason',
        GROUP_CONCAT(DISTINCT
                     (IF(obs_fscn.name = 'Stage' AND latest_encounter.person_id IS NOT NULL, o.value_numeric, NULL))
                     ORDER BY o.obs_id
                     DESC)                                     AS 'stage',
        GROUP_CONCAT(DISTINCT (IF(
            obs_fscn.name = 'FSTG, Comments about postpone reason' AND latest_encounter.person_id IS NOT NULL,
            o.value_text, NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'postPoneComments',
        GROUP_CONCAT(DISTINCT
                     (IF(obs_fscn.name = 'FSTG, Comments about refusal' AND latest_encounter.person_id IS NOT NULL,
                         o.value_text, NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'refusedComments',
        GROUP_CONCAT(DISTINCT
                     (IF(obs_fscn.name = 'FV, Expected Date of Arrival' AND latest_encounter.person_id IS NOT NULL,
                         DATE_FORMAT(o.value_datetime, '%b/%Y'), NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'finalValidationExpectedArrival',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Outcomes FV' AND latest_encounter.person_id IS NOT NULL,
                                  COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                     DESC)                                     AS 'finalValidationOutcome',
        `Name of MLO`,
        `Specialty`,
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'isCareTakerRequired', IF(pa.value = 'true', 'Yes', NULL),
                                  NULL)))                      AS 'isCareTakerRequired',
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'caretakerGender', coalesce(scn.name, fscn.name),
                                  NULL)))                      AS 'caretakerGender',
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'caretakerNameEnglish', pa.value,
                                  NULL)))                      AS 'caretakerNameEnglish',
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'statusofOfficialIDdocuments', coalesce(scn.name, fscn.name),
                                  NULL)))                      AS 'statusofOfficialIDdocuments',
        GROUP_CONCAT(DISTINCT (IF(pat.name IN ('phoneNumber1', 'phoneNumber2', 'phoneNumber3'), pa.value,
                                  NULL)))                      AS 'Phone Number',
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'expectedDateofArrival', pa.value,
                                  NULL)))                      AS 'expectedDateOfArrival',
        GROUP_CONCAT(DISTINCT (IF(pat.name = 'dateofArrival', pa.value,
                                  NULL)))                      AS 'dateOfArrival',
        latest_visit_type.name                                 AS `latest_visit_name`,
        latest_followup_form.patient_id                        AS `latestFollowupPatientID`,
        latest_followup_form.outcome                           AS `latestFollowupFormOutcome`,
        latest_final_validation_form.outcome                   AS `latestFinalValidationOutcome`,
        program_state.name                                     AS `programStateName`
      FROM person p
        JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
        JOIN person_address paddr ON paddr.person_id = p.person_id AND paddr.voided IS FALSE
        JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE
        JOIN obs o ON p.person_id = o.person_id AND o.voided IS FALSE
        JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                      obs_fscn.name IN
                                      ('FSTG, Date of presentation at 1st stage',
                                        'FSTG, Outcomes for 1st stage surgical validation',
                                        'FUP, Outcomes for follow-up surgical validation',
                                        'FSTG, Outcomes for 1st stage Anaesthesia validation',
                                        'FST, Type of medical information needed for next submission',
                                        'FSTG, Type of medical information needed for next submission',
                                        'FSTG, Date received',
                                        'Stage',
                                        'FSTG, Priority',
                                        'FUP, Priority',
                                        'FSTG, Postpone reason',
                                        'FSTG, Comments about postpone reason',
                                       'FSTG, Refused Reason',
                                       'FSTG, Comments about refusal',
                                       'FV, Expected Date of Arrival',
                                       'FV, Outcomes FV')
                                      AND obs_fscn.voided IS FALSE AND obs_fscn.concept_name_type = 'FULLY_SPECIFIED'
        INNER JOIN (
                     SELECT
                       pp.patient_id,
                       workflow_state_cn.name
                     FROM
                       patient_program pp
                       INNER JOIN patient_state ps ON ps.patient_program_id = pp.patient_program_id
                                                      AND ps.voided IS FALSE
                                                      AND ps.end_date IS NULL
                                                      AND pp.voided IS FALSE
                       INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state
                                                                AND pws.retired IS FALSE
                       INNER JOIN concept_name workflow_state_cn ON workflow_state_cn.concept_id = pws.concept_id
                                                                    AND workflow_state_cn.concept_name_type =
                                                                        'FULLY_SPECIFIED'
                                                                    AND workflow_state_cn.voided IS FALSE
                   ) program_state ON program_state.patient_id = p.person_id
        LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided IS FALSE
        LEFT OUTER JOIN person_attribute_type pat
          ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE
        LEFT OUTER JOIN concept_name scn
          ON pat.format = 'org.openmrs.Concept' AND pa.value = scn.concept_id AND scn.concept_name_type = 'SHORT' AND
             scn.voided IS FALSE
        LEFT OUTER JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND
                                             fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided IS FALSE
        JOIN encounter e ON o.encounter_id = e.encounter_id AND e.voided IS FALSE
        LEFT JOIN concept_name coded_fscn
          ON coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED' AND
             coded_fscn.voided IS FALSE
        LEFT JOIN concept_name coded_scn
          ON coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type = 'SHORT' AND
             coded_scn.voided IS FALSE
        LEFT JOIN (SELECT
                     en.visit_id,
                     person_id,
                     obs.concept_id,
                     max(en.encounter_datetime) AS max_encounter_datetime
                   FROM obs
                     JOIN encounter en
                       ON obs.encounter_id = en.encounter_id AND obs.voided IS FALSE AND en.voided IS FALSE
                   GROUP BY obs.person_id, obs.concept_id) latest_encounter
          ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id
             AND latest_encounter.max_encounter_datetime = e.encounter_datetime
        LEFT JOIN (SELECT
                     obs.person_id,
                     encounter.encounter_id,
                     c_name                            AS name,
                     GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                               COALESCE(coded_fscn.name, coded_scn.name),
                                               NULL))) AS 'Specialty',
                     GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name),
                                               NULL))) AS 'Name of MLO'
                   FROM (SELECT
                           cn.name                 AS c_name,
                           obs.person_id,
                           obs.encounter_id,
                           max(encounter_datetime) AS max_encounter_datetime,
                           obs.concept_id
                         FROM obs
                           JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND
                                             encounter.voided IS FALSE
                           JOIN concept_name cn ON cn.name IN ('MH, Name of MLO', 'FSTG, Specialty determined by MLO')
                                                   AND cn.concept_id = obs.concept_id AND cn.voided IS FALSE
                         GROUP BY person_id, concept_id) result
                     JOIN encounter
                       ON result.max_encounter_datetime = encounter.encounter_datetime AND encounter.voided IS FALSE
                     JOIN obs ON encounter.encounter_id = obs.encounter_id AND obs.concept_id = result.concept_id AND
                                 obs.voided IS FALSE
                     LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                          AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                          AND coded_fscn.voided IS FALSE
                     LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                         AND coded_fscn.concept_name_type = 'SHORT'
                                                         AND coded_scn.voided IS FALSE
                   GROUP BY obs.person_id
                  ) obs_across_visits ON p.person_id = obs_across_visits.person_id
        JOIN patient_program pp ON p.person_id = pp.patient_id AND pp.date_completed IS NULL AND pp.voided IS FALSE
        LEFT OUTER JOIN (
                          SELECT
                            v.patient_id,
                            vt.name,
                            v.visit_id
                          FROM
                            visit v
                            INNER JOIN visit_type vt ON vt.visit_type_id = v.visit_type_id
                            INNER JOIN (
                                         SELECT
                                           v.patient_id,
                                           MAX(v.date_started) AS date_started
                                         FROM
                                           visit v
                                         GROUP BY v.patient_id
                                       ) latest_visit
                              ON latest_visit.patient_id = v.patient_id AND latest_visit.date_started = v.date_started
                        ) latest_visit_type ON latest_visit_type.patient_id = p.person_id
        LEFT OUTER JOIN (
                          SELECT
                            o.person_id,
                            GROUP_CONCAT(DISTINCT (COALESCE(cv_answer.concept_short_name,
                                                            cv_answer.concept_full_name))) AS 'name'
                          FROM obs o
                            INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
                                                          AND cv.concept_full_name IN
                                                              ('FUP, Name (s) of Surgeon 1', 'FV, Name (s) of Surgeon 1')
                                                          AND cv.retired IS FALSE
                                                          AND o.voided IS FALSE
                            INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
                                                                 AND cv_answer.retired IS FALSE
                            INNER JOIN (
                                         SELECT
                                           o.person_id,
                                           MAX(o.obs_datetime) AS obs_datetime
                                         FROM
                                           obs o
                                           INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                         AND cn.name IN
                                                                             ('FUP, Name (s) of Surgeon 1', 'FV, Name (s) of Surgeon 1')
                                                                         AND cn.voided IS FALSE
                                                                         AND o.voided IS FALSE
                                         GROUP BY o.person_id
                                       ) latest_obs
                              ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
                          GROUP BY o.person_id
                        ) surgeon_name ON surgeon_name.person_id = p.person_id
        LEFT OUTER JOIN (
                          SELECT
                            o.person_id,
                            GROUP_CONCAT(DISTINCT (COALESCE(cv_answer.concept_short_name,
                                                            cv_answer.concept_full_name))) AS 'value'
                          FROM obs o
                            INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
                                                          AND
                                                          cv.concept_full_name IN ('FSTG, Priority', 'FUP, Priority')
                                                          AND cv.retired IS FALSE
                                                          AND o.voided IS FALSE
                            INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
                                                                 AND cv_answer.retired IS FALSE
                            INNER JOIN (
                                         SELECT
                                           o.person_id,
                                           MAX(o.obs_datetime) AS obs_datetime
                                         FROM
                                           obs o
                                           INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                         AND
                                                                         cn.name IN ('FSTG, Priority', 'FUP, Priority')
                                                                         AND cn.voided IS FALSE
                                                                         AND o.voided IS FALSE
                                         GROUP BY o.person_id
                                       ) latest_obs
                              ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
                          GROUP BY o.person_id
                        ) priority ON priority.person_id = p.person_id
        LEFT OUTER JOIN (
                          SELECT
                            o.person_id,
                            GROUP_CONCAT(DISTINCT (COALESCE(cv_answer.concept_short_name,
                                                            cv_answer.concept_full_name))) AS 'value'
                          FROM obs o
                            INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
                                                          AND cv.concept_full_name IN
                                                              ('FSTG, Does the Patient need Surgical Final Validation',
                                                               'FUP, Does the Patient need Surgical Final Validation')
                                                          AND cv.retired IS FALSE
                                                          AND o.voided IS FALSE
                            INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
                                                                 AND cv_answer.retired IS FALSE
                            INNER JOIN (
                                         SELECT
                                           o.person_id,
                                           MAX(o.obs_datetime) AS obs_datetime
                                         FROM
                                           obs o
                                           INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                         AND cn.name IN
                                                                             ('FSTG, Does the Patient need Surgical Final Validation',
                                                                              'FUP, Does the Patient need Surgical Final Validation')
                                                                         AND cn.voided IS FALSE
                                                                         AND o.voided IS FALSE
                                         GROUP BY o.person_id
                                       ) latest_obs
                              ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
                          GROUP BY o.person_id
                        ) doesThePatientNeedSurgicalValidation
          ON doesThePatientNeedSurgicalValidation.person_id = p.person_id
        LEFT OUTER JOIN (
                          SELECT
                            e.patient_id,
                            e.visit_id,
                            outcome_answer_cn.name AS 'outcome'
                          FROM
                            encounter e
                            INNER JOIN obs o ON o.encounter_id = e.encounter_id
                                                AND e.voided IS FALSE
                                                AND o.voided IS FALSE
                            INNER JOIN concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
                                                                  AND outcome_cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                  AND outcome_cn.name =
                                                                      'FUP, Outcomes for follow-up surgical validation'
                                                                  AND outcome_cn.voided IS FALSE
                            INNER JOIN concept_name outcome_answer_cn ON outcome_answer_cn.concept_id = o.value_coded
                                                                         AND outcome_answer_cn.concept_name_type =
                                                                             'FULLY_SPECIFIED'
                                                                         AND outcome_answer_cn.voided IS FALSE
                            INNER JOIN (
                                         SELECT
                                           o.person_id,
                                           MAX(e.encounter_datetime) AS encounter_datetime
                                         FROM
                                           obs o
                                           INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                         AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                         AND cn.voided IS FALSE
                                                                         AND o.voided IS FALSE
                                                                         AND cn.name = 'Follow-up validation'
                                           INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                                     AND e.voided IS FALSE
                                         GROUP BY o.person_id
                                       ) latest_followup_encounter
                              ON latest_followup_encounter.person_id = e.patient_id AND
                                 latest_followup_encounter.encounter_datetime =
                                 e.encounter_datetime
                        ) latest_followup_form
          ON latest_followup_form.patient_id = p.person_id AND
             latest_visit_type.visit_id = latest_followup_form.visit_id
        LEFT OUTER JOIN (
                          SELECT
                            e.patient_id,
                            e.visit_id,
                            outcome_answer_cn.name AS 'outcome'
                          FROM
                            encounter e
                            INNER JOIN obs o ON o.encounter_id = e.encounter_id
                                                AND e.voided IS FALSE
                                                AND o.voided IS FALSE
                            INNER JOIN concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
                                                                  AND outcome_cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                  AND outcome_cn.name = 'FV, Outcomes FV'
                                                                  AND outcome_cn.voided IS FALSE
                            INNER JOIN concept_name outcome_answer_cn ON outcome_answer_cn.concept_id = o.value_coded
                                                                         AND outcome_answer_cn.concept_name_type =
                                                                             'FULLY_SPECIFIED'
                                                                         AND outcome_answer_cn.voided IS FALSE
                            INNER JOIN (
                                         SELECT
                                           o.person_id,
                                           MAX(e.encounter_datetime) AS encounter_datetime
                                         FROM
                                           obs o
                                           INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                         AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                         AND cn.voided IS FALSE
                                                                         AND o.voided IS FALSE
                                                                         AND cn.name = 'FV, Final Validation'
                                           INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                                     AND e.voided IS FALSE
                                         GROUP BY o.person_id
                                       ) latest_final_validation_encounter
                              ON latest_final_validation_encounter.person_id = e.patient_id AND
                                 latest_final_validation_encounter.encounter_datetime = e.encounter_datetime
                        ) latest_final_validation_form ON latest_final_validation_form.patient_id = p.person_id AND
                                                          latest_final_validation_form.visit_id =
                                                          latest_visit_type.visit_id
      GROUP BY p.person_id) result
WHERE (
  (latest_visit_name IN ('First Stage Validation' , 'Follow-Up Validation') AND
      expectedDateOfArrival IS NULL AND
      (
        (
          (
            `Outcomes for 1st stage surgical validation` = 'Valid' AND
            `Outcomes for 1st stage Anaesthesia validation` = 'Fits anaesthesia criteria' AND
            `latestFollowupPatientID` IS NULL AND
            `programStateName` = 'Identification'
          )
          OR
          (
            `latestFollowupFormOutcome` = 'Further stage admission' AND
            `programStateName` = 'Network Follow-up' AND
            `latestFinalValidationOutcome` IS NULL
          )
        )
        OR
        (
          `latestFinalValidationOutcome` = 'Accepted'
        )
      )
  )
  OR
  ((`Date of Presentation` IS NOT NULL) AND (`Outcomes for 1st stage surgical validation` = 'More Information' OR
                                             `Outcomes for 1st stage Anaesthesia validation` =
                                             'Need complementary investigation'))
  OR
  ((`Date of Presentation` IS NOT NULL AND `Outcomes for 1st stage surgical validation` = 'Postponed') OR latestFinalValidationOutcome IS NOT NULL )
  OR
  (dateOfArrival IS NULL AND expectedDateOfArrival IS NOT NULL)
  OR
  (`Outcomes for 1st stage surgical validation` = 'Refused')
  OR
  (latestFollowupFormOutcome = 'Further stage admission')
);