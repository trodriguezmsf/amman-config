SELECT
  pi.identifier                                                                                                                                        AS "Patient Identifier",
  concat(pn.given_name, " ", pn.family_name) AS "Patient Name",
  floor(DATEDIFF(CURDATE(), p.birthdate) / 365)      AS "Age",
  p.gender                                                      AS "Gender",
  `Specialty`,
  paddress.address3 AS 'Country',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'phoneNumber1', pa.value, NULL))) AS 'Patient contact number 1',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'phoneNumber2', pa.value, NULL))) AS 'Patient contact number 2',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'phoneNumber3', pa.value, NULL))) AS 'Patient contact number 3',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS 'Nationality 1',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'statusofOfficialIDdocuments', coalesce(scn.name, fscn.name), NULL))) AS 'Status of Official ID Documents',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'id1Document', coalesce(scn.name, fscn.name), NULL))) AS 'Patient ID document type',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'id1DocNumber', pa.value, NULL))) AS 'Patient ID document number',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'isCareTakerRequired', if(pa.value = 'true', 'true', NULL), NULL))) AS 'Need for a caretaker?',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'caretakerNameEnglish', pa.value, NULL))) AS 'Caretaker name',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'caretakerDob', floor(DATEDIFF(DATE(now()), pa.value) / 365), NULL))) AS 'Caretaker age',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'caretakerGender', coalesce(scn.name, fscn.name), NULL))) AS 'Caretaker Gender',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'id3Document', coalesce(scn.name, fscn.name), NULL))) AS 'Caretaker ID document type',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'id3DocNumber', pa.value, NULL))) AS 'Caretaker ID document number',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'expectedDateofArrival', DATE_FORMAT(pa.value, "%d/%m/%Y"), NULL))) AS 'Expected Date of Arrival',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'dateofArrival', DATE_FORMAT(pa.value, "%d/%m/%Y"), NULL))) AS 'Date of Arrival',
  `MLO`,
  `Network Area`,
  `Referred by`,
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage surgical validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for 1st stage surgical validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Priority' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC)                    AS 'First Stage, Priority',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage Anaesthesia validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for 1st stage Anaesthesia validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Name (s) of Surgeon 1' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'First Stage, Surgeon 1',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Name (s) of Surgeon 2' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'First Stage, Surgeon 2',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Does the Patient need Surgical Final Validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'First Stage, Does the Patient need Surgical Final Validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'Stage' AND latest_encounter.person_id IS NOT NULL, o.value_numeric, NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up Validation Stage',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Outcomes for follow-up surgical validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Priority' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up, Priority',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Name (s) of Surgeon 1' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up, Surgeon 1',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Name (s) of Surgeon 2' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up, Surgeon 2',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Does the Patient need Surgical Final Validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Follow-Up, Does the Patient need Surgical Final Validation',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Expected Date of Arrival' AND latest_encounter.person_id IS NOT NULL, DATE_FORMAT(o.value_datetime, "%m/%Y"), NULL)) ORDER BY o.obs_id DESC) AS 'Final Validation, Expected Date of Arrival',
  GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Does the Patient need Accommodation?' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Does the Patient need Accommodation?'
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
         'FSTG, Does the Patient need Surgical Final Validation',
         'FSTG, Outcomes for 1st stage surgical validation',
         'FSTG, Priority',
         'FSTG, Outcomes for 1st stage Anaesthesia validation',
         'FSTG, Name (s) of Surgeon 1',
         'FSTG, Name (s) of Surgeon 2',
         'Stage',
         'FUP, Outcomes for follow-up surgical validation',
         'FUP, Priority',
         'FUP, Name (s) of Surgeon 1',
         'FUP, Name (s) of Surgeon 2',
         'FUP, Does the Patient need Surgical Final Validation',
         'FV, Expected Date of Arrival',
         'FV, Does the Patient need Accommodation?'
       ) AND
       obs_fscn.voided IS FALSE
  JOIN concept_name obs_scn ON o.concept_id = obs_scn.concept_id AND obs_scn.concept_name_type = "SHORT" AND obs_scn.voided IS FALSE
  LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type="FULLY_SPECIFIED" AND coded_fscn.voided is false
  LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type="SHORT" AND coded_scn.voided is false
  JOIN (SELECT
          person_id,
          obs.concept_id,
          max(encounter_datetime) AS max_encounter_datetime
        FROM obs
          JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided = FALSE
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
               c_name AS name,
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Specialty',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'MLO',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Network Area', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Network Area',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Referred by', obs.value_text, NULL))) AS 'Referred by'
             FROM (SELECT
                     cn.name                 AS c_name,
                     obs.person_id,
                     obs.encounter_id,
                     max(encounter_datetime) AS max_encounter_datetime,
                     obs.concept_id
                   FROM obs
                     JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND encounter.voided IS FALSE
                     JOIN concept_name cn ON cn.name IN ('MH, Name of MLO', 'FSTG, Specialty determined by MLO', 'MH, Network Area', 'MH, Referred by')
                                             AND cn.concept_id = obs.concept_id
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
GROUP BY o.person_id;
