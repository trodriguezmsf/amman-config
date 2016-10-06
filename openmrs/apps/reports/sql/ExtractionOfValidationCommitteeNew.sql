SELECT
  `Patient Identifier`,
  `Patient Name`,
  `Age`,
  `Birthdate`,
  `Gender`,
  `Country`,
  `Specialty`,
  `Stage`,
  `Status of Official ID Documents`,
  `Expected Date of Arrival`,
  DATE_FORMAT(`Date of presentation`, "%d/%m/%Y") AS 'Date of presentation',
  `Outcomes for 1st stage surgical validation`,
  `Priority`,
  `Outcomes for 1st stage Anaesthesia validation`,
  `Postpone Reason`,
  `Comments about postpone reason`,
  `Medical file to be submitted again by`,
  `Type of medical information needed for next submission`,
  `Refused Reason`,
  `Comments about refusal`,
  `Does the patient need medical final validation?`
FROM (SELECT
  pi.identifier AS "Patient Identifier",
  concat(pn.given_name, " ", pn.family_name) AS "Patient Name",
  floor(DATEDIFF(DATE(o.obs_datetime), p.birthdate) / 365) AS "Age",
  DATE_FORMAT(p.birthdate, "%d-%b-%Y") AS "Birthdate",
  p.gender AS "Gender",
  paddress.address3 AS 'Country',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Specialty determined by MLO' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Specialty',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'Stage' AND latest_encounter.person_id IS NOT NULL, o.value_numeric, NULL)) ORDER BY o.obs_id DESC) AS 'Stage',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'statusofOfficialIDdocuments', coalesce(scn.name, fscn.name), NULL))) AS 'Status of Official ID Documents',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'expectedDateofArrival', DATE_FORMAT(pa.value, "%d/%m/%Y"), NULL))) AS 'Expected Date of Arrival',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date of presentation at 1st stage' AND latest_encounter.person_id IS NOT NULL, o.value_datetime, NULL)) ORDER BY o.obs_id DESC) AS 'Date of presentation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage surgical validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for 1st stage surgical validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Priority' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC)                    AS 'Priority',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage Anaesthesia validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for 1st stage Anaesthesia validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Postpone reason' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Postpone Reason',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Comments about postpone reason' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id DESC) AS 'Comments about postpone reason',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Medical file to be submitted again by' AND latest_encounter.person_id IS NOT NULL, DATE_FORMAT(o.value_datetime, "%d/%m/%Y"), NULL)) ORDER BY o.obs_id DESC) AS 'Medical file to be submitted again by',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Type of medical information needed for next submission' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Type of medical information needed for next submission',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Refused Reason' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Refused Reason',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Comments about refusal' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ORDER BY o.obs_id DESC) AS 'Comments about refusal',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Does the patient need medical final validation?' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Does the patient need medical final validation?'
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
       obs_fscn.name IN ('FSTG, Specialty determined by MLO',
                         'Stage',
                         'FSTG, Date of presentation at 1st stage',
                         'FSTG, Outcomes for 1st stage surgical validation',
                         'FSTG, Priority',
                         'FSTG, Outcomes for 1st stage Anaesthesia validation',
                         'FSTG, Postpone reason',
                         'FSTG, Comments about postpone reason',
                         'FSTG, Medical file to be submitted again by',
                         'FSTG, Type of medical information needed for next submission',
                         'FSTG, Refused Reason',
                         'FSTG, Comments about refusal',
                         'FV, Does the patient need medical final validation?') AND
       obs_fscn.voided IS FALSE
  JOIN concept_name obs_scn ON o.concept_id = obs_scn.concept_id AND obs_scn.concept_name_type = "SHORT"
  LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type="FULLY_SPECIFIED" AND coded_fscn.voided is false
  LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type="SHORT" AND coded_scn.voided is false
  JOIN (SELECT
          person_id,
          obs.concept_id,
          max(encounter_datetime) AS max_encounter_datetime
        FROM obs
          JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided = FALSE
                            AND encounter.visit_id IN (SELECT max(visit_id) AS latest_visit_id
                                                       FROM visit GROUP BY patient_id )
        GROUP BY obs.person_id, obs.concept_id) latest_encounter
    ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id AND
       e.encounter_datetime = latest_encounter.max_encounter_datetime
  JOIN patient_program pp ON p.person_id = pp.patient_id
  JOIN program_workflow pw ON pw.program_id = pp.program_id
  JOIN program_workflow_state pws ON pw.program_workflow_id = pws.program_workflow_id
  JOIN patient_state ps ON pws.program_workflow_state_id = ps.state AND ps.patient_program_id = pp.patient_program_id
                           AND pws.concept_id = (SELECT concept_id FROM concept_name WHERE name = 'Identification' AND concept_name_type = 'FULLY_SPECIFIED')
GROUP BY o.person_id) result WHERE (cast(result.`Date of presentation` AS DATE) BETWEEN '#startDate#' AND '#endDate#');