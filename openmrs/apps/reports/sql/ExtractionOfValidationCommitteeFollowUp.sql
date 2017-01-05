SELECT
  `Patient Identifier`,
  `Patient Name`,
  `Age`,
  `Birthdate`,
  `Gender`,
  `Country`,
  `MLO`,
  `Specialty`,
  `Stage`,
  `Status of Official ID Documents`,
  DATE_FORMAT(`Date of presentation`, "%d/%m/%Y") AS 'Date of presentation',
  `Outcomes for follow-up surgical validation`,
  `Time for next medical follow-up to be done`,
  `Comments about next follow-up`,
  `Comments about MBA`,
  `Dismissal reason`,
  `Comments about dismissal`,
  `Reason for further stage admission`,
  `Priority`,
  `Does the Patient need Surgical Final Validation?`,
  `Comments about further stage admission`,
  `Expected Date of Arrival`
FROM (SELECT
        pi.identifier AS "Patient Identifier",
        concat(pn.given_name, " ", pn.family_name) AS "Patient Name",
        floor(DATEDIFF(CURDATE(), p.birthdate) / 365) AS "Age",
        DATE_FORMAT(p.birthdate, "%d-%b-%Y") AS "Birthdate",
        p.gender AS "Gender",
        paddress.address3 AS 'Country',
        `MLO`,
        `Specialty`,
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'Stage' AND latest_encounter.person_id IS NOT NULL, o.value_numeric, NULL)) ORDER BY o.obs_id DESC) AS 'Stage',
        GROUP_CONCAT(DISTINCT(IF(pat.name = 'statusofOfficialIDdocuments', coalesce(scn.name, fscn.name), NULL))) AS 'Status of Official ID Documents',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Expected Date of Arrival' AND latest_encounter.person_id IS NOT NULL, DATE_FORMAT(o.value_datetime, "%m/%Y"), NULL)) ORDER BY o.obs_id DESC) AS 'Expected Date of Arrival',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Date of presentation at Followup' AND latest_encounter.person_id IS NOT NULL, o.value_datetime, NULL)) ORDER BY o.obs_id DESC) AS 'Date of presentation',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for follow-up surgical validation',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Time for next medical follow-up to be done' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC)                    AS 'Time for next medical follow-up to be done',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Comments about next follow-up' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id DESC) AS 'Comments about next follow-up',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Comments about MBA' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id DESC) AS 'Comments about MBA',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Dismissal reason' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Dismissal reason',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Comments about dismissal' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id DESC) AS 'Comments about dismissal',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Reason for re-admission' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Reason for further stage admission',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Priority' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Priority',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Comments about further stage admission' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id DESC) AS 'Comments about further stage admission',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Does the Patient need Surgical Final Validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Does the Patient need Surgical Final Validation?'
      FROM obs o
        JOIN person p ON p.person_id = o.person_id AND p.voided is false
        JOIN patient_identifier pi ON p.person_id = pi.patient_id AND pi.voided is false
        JOIN patient_identifier_type pit ON pi.identifier_type = pit.patient_identifier_type_id AND pit.retired is false
        JOIN person_name pn ON pn.person_id = p.person_id AND pn.voided is false
        LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided is false
        LEFT OUTER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired is false
        LEFT OUTER JOIN concept_name scn ON pat.format = "org.openmrs.Concept" AND pa.value = scn.concept_id AND scn.concept_name_type = "SHORT" AND scn.voided is false
        LEFT OUTER JOIN concept_name fscn ON pat.format = "org.openmrs.Concept" AND pa.value = fscn.concept_id AND fscn.concept_name_type = "FULLY_SPECIFIED" AND fscn.voided is false
        LEFT OUTER JOIN person_address paddress ON p.person_id = paddress.person_id AND paddress.voided is false
        JOIN encounter e ON o.encounter_id = e.encounter_id AND o.voided IS FALSE AND e.voided IS FALSE
        JOIN concept c ON o.concept_id = c.concept_id AND c.retired IS FALSE
        JOIN concept_name obs_fscn
          ON c.concept_id = obs_fscn.concept_id AND
             obs_fscn.name IN ('Stage',
               'FUP, Date of presentation at Followup',
               'FUP, Outcomes for follow-up surgical validation',
               'FUP, Time for next medical follow-up to be done',
               'FUP, Comments about next follow-up',
               'FUP, Comments about MBA',
               'FUP, Dismissal reason',
               'FUP, Comments about dismissal',
               'FUP, Reason for re-admission',
               'FUP, Priority',
               'FUP, Comments about further stage admission',
                               'FV, Expected Date of Arrival',
                               'FUP, Does the Patient need Surgical Final Validation')
             AND obs_fscn.voided IS FALSE
        JOIN concept_name obs_scn ON o.concept_id = obs_scn.concept_id AND obs_scn.concept_name_type = "SHORT" AND obs_scn.voided IS FALSE
        LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type="FULLY_SPECIFIED" AND coded_fscn.voided is false
        LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type="SHORT" AND coded_scn.voided is false
        JOIN (SELECT
                person_id,
                obs.concept_id,
                max(encounter_datetime) AS max_encounter_datetime
              FROM obs
                JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided = FALSE AND encounter.voided IS FALSE
                                  AND encounter.visit_id IN (SELECT v.visit_id FROM
                  visit v
                  JOIN  (SELECT patient_id AS patient_id, max(date_started) AS date_started
                         FROM visit WHERE visit.voided IS FALSE GROUP BY patient_id) latest_visit
                    ON v.date_started = latest_visit.date_started AND v.patient_id = latest_visit.patient_id AND v.voided IS FALSE )
              GROUP BY obs.person_id, obs.concept_id) latest_encounter
          ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id AND
             e.encounter_datetime = latest_encounter.max_encounter_datetime
        LEFT JOIN (SELECT
                     obs.person_id,
                     encounter.encounter_id,
                     GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Specialty',
                     GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'MLO'
                   FROM (SELECT
                           cn.name                 AS c_name,
                           obs.person_id,
                           obs.encounter_id,
                           max(encounter_datetime) AS max_encounter_datetime,
                           obs.concept_id
                         FROM obs
                           JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND encounter.voided IS FALSE
                           JOIN concept_name cn ON cn.name IN ('MH, Name of MLO', 'FSTG, Specialty determined by MLO')
                                                   AND cn.concept_id = obs.concept_id AND cn.voided IS FALSE
                         GROUP BY person_id, concept_id) result
                     JOIN encounter ON result.max_encounter_datetime = encounter.encounter_datetime AND encounter.voided IS FALSE
                     JOIN obs ON encounter.encounter_id = obs.encounter_id AND obs.concept_id = result.concept_id AND obs.voided IS FALSE
                     LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                          AND coded_fscn.concept_name_type = "FULLY_SPECIFIED"
                                                          AND coded_fscn.voided IS FALSE
                     LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                         AND coded_fscn.concept_name_type = "SHORT"
                                                         AND coded_scn.voided IS FALSE
                   GROUP BY obs.person_id
                  ) obs_across_visits ON p.person_id = obs_across_visits.person_id
        JOIN patient_program pp ON p.person_id = pp.patient_id AND pp.voided IS FALSE
        JOIN program_workflow pw ON pw.program_id = pp.program_id AND pw.retired IS FALSE
        JOIN program_workflow_state pws ON pw.program_workflow_id = pws.program_workflow_id AND pws.retired IS FALSE
        JOIN patient_state ps ON pws.program_workflow_state_id = ps.state AND ps.patient_program_id = pp.patient_program_id AND ps.voided IS FALSE
                                 AND pws.concept_id = (SELECT concept_id FROM concept_name WHERE name = 'Network Follow-up' AND concept_name_type = 'FULLY_SPECIFIED' AND voided IS FALSE )
      GROUP BY o.person_id) result where (cast(result.`Date of presentation` AS DATE) BETWEEN '#startDate#' AND '#endDate#');