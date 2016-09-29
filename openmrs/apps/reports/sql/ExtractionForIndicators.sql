SELECT
  pi.identifier                                                                                                                                        AS "Patient Identifier",
  concat(pn.given_name, " ", pn.family_name) AS "Patient Name",
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Is the medical file complete?', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Is the medical file complete?',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Specialty determined by MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Specialty',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Stage', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'First Stage Validation Stage',
  paddress.address3 AS 'Country',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS 'Nationality 1',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Type of medical information received', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Type of medical information received',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date received', DATE_FORMAT(o.value_datetime, "%d/%m/%Y"), NULL)) ORDER BY o.obs_id DESC) AS 'Medical files date received',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Stage', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'First Stage Validation Stage',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date of presentation at 1st stage', DATE_FORMAT(o.value_datetime, "%d/%m/%Y"), NULL)) ORDER BY o.obs_id DESC) AS 'First stage date of presentation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage surgical validation', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for 1st stage surgical validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage Anaesthesia validation', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for 1st stage Anaesthesia validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for follow-up surgical validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Date of presentation at Followup', DATE_FORMAT(o.value_datetime, "%d/%m/%Y"), NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up date of presentation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'Stage', o.value_numeric, NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up Validation Stage',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Time for next medical follow-up to be done', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC)                    AS 'Time for next medical follow-up to be done',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC)                    AS 'Name of MLO',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'MH, Network Area', COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC)                    AS 'Network Area',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'statusofOfficialIDdocuments', coalesce(scn.name, fscn.name), NULL))) AS 'Status of Official ID Documents',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'dateofAdmission', DATE_FORMAT(pa.value, "%d/%m/%Y"), NULL))) AS 'Date of Admission'
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
       obs_fscn.name IN (
         'FSTG, Is the medical file complete?',
         'FSTG, Specialty determined by MLO',
         'FSTG, Stage',
         'Stage',
         'FSTG, Type of medical information received',
         'FSTG, Date received',
         'FSTG, Stage',
         'FSTG, Date of presentation at 1st stage',
         'FSTG, Outcomes for 1st stage surgical validation',
         'FSTG, Outcomes for 1st stage Anaesthesia validation',
         'FUP, Outcomes for follow-up surgical validation',
         'FUP, Date of presentation at Followup',
         'Stage',
         'FUP, Time for next medical follow-up to be done',
         'MH, Name of MLO',
         'MH, Network Area'
       ) AND
       obs_fscn.voided IS FALSE
  JOIN concept_name obs_scn ON o.concept_id = obs_scn.concept_id AND obs_scn.concept_name_type = "SHORT"
  LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type="FULLY_SPECIFIED" AND coded_fscn.voided is false
  LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type="SHORT" AND coded_scn.voided is false
  JOIN (SELECT
          person_id,
          obs.concept_id,
          max(encounter_datetime) AS max_encounter_datetime
        FROM obs
          JOIN encounter ON obs.encounter_id = encounter.encounter_id
        GROUP BY obs.person_id, obs.concept_id) latest_encounter
    ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id AND
       e.encounter_datetime = latest_encounter.max_encounter_datetime
GROUP BY o.person_id;
