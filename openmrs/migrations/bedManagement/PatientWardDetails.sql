UPDATE
  global_property
SET
  description = 'SQL query to get list of bed details in ward',
  property_value =
"SELECT
  bed_tags.bed_tags                                                                  AS 'Bed Tags',
  bed.bed_number                                                                     AS 'Bed Number',
  patient_identifier.identifier                                                      AS 'Patient ID',
  CONCAT(pn.given_name, ' ', pn.family_name)                                         AS 'Patient Name',
  TIMESTAMPDIFF(YEAR, p.birthdate, CURDATE())                                        AS 'Age',
  address.address3                                                                   AS 'Country',
  speciality.names                                                                   AS 'Speciality',
  IF(isCaretakerRequired.required = 'true', 'Yes', '')                               AS 'Is Caretaker Required?',
  caretakerGender.gender                                                             AS 'Caretaker Gender',
  CAST(DATE_FORMAT(latestAdmissionEncounter.admission_datetime, '%Y-%m-%d') AS CHAR) AS 'Admission Date',
  DATE_FORMAT(expected_date_of_discharge.date, '%Y-%m-%d')                           AS 'Expected Date of Discharge'
FROM
  bed
  INNER JOIN bed_location_map blm ON blm.bed_id = bed.bed_id
  INNER JOIN location l ON l.location_id = blm.location_id AND l.name = ${location_name}
  LEFT OUTER JOIN bed_patient_assignment_map bpam ON bpam.bed_id = bed.bed_id AND bpam.date_stopped IS NULL
  LEFT OUTER JOIN person p ON p.person_id = bpam.patient_id
  LEFT OUTER JOIN person_name pn ON pn.person_id = p.person_id
  LEFT OUTER JOIN patient_identifier ON patient_identifier.patient_id = p.person_id
  LEFT OUTER JOIN person_address address ON address.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      bed_tag_map.bed_id                                        AS 'bed_id',
                      GROUP_CONCAT(DISTINCT bed_tag.name ORDER BY bed_tag.name) AS 'bed_tags'
                    FROM
                      bed_tag_map
                      INNER JOIN bed_tag ON bed_tag.bed_tag_id = bed_tag_map.bed_tag_id
                    GROUP BY bed_tag_map.bed_id
                  ) bed_tags ON bed_tags.bed_id = bed.bed_id
  LEFT OUTER JOIN (
                    SELECT
                      pa.person_id AS 'person_id',
                      pa.value     AS 'required'
                    FROM
                      person_attribute pa
                      INNER JOIN person_attribute_type pat
                        ON pat.person_attribute_type_id = pa.person_attribute_type_id AND
                           pat.name = 'isCaretakerRequired'
                  ) isCaretakerRequired ON isCaretakerRequired.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      pa.person_id AS 'person_id',
                      cn.name      AS 'gender'
                    FROM
                      person_attribute pa
                      INNER JOIN person_attribute_type pat
                        ON pat.person_attribute_type_id = pa.person_attribute_type_id AND
                           pat.name = 'CaretakerGender'
                      INNER JOIN concept_name cn ON cn.concept_id = pa.value
                  ) caretakerGender ON caretakerGender.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id      AS 'person_id',
                      o.value_datetime AS 'date'
                    FROM
                      obs o
                      INNER JOIN
                      (
                        SELECT
                          o.person_id,
                          o.concept_id,
                          MAX(o.date_created) AS 'date_created'
                        FROM
                          obs o
                          INNER JOIN concept_name cn
                            ON cn.concept_id = o.concept_id AND cn.name = 'Expected Date of Discharge' AND
                               cn.concept_name_type = 'FULLY_SPECIFIED'
                        GROUP BY o.person_id
                      ) most_recent_obs
                        ON most_recent_obs.person_id = o.person_id AND most_recent_obs.concept_id = o.concept_id AND
                           most_recent_obs.date_created = o.date_created
                  ) expected_date_of_discharge ON expected_date_of_discharge.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      e.patient_id,
                      MAX(e.encounter_datetime) AS admission_datetime
                    FROM
                      encounter e
                      INNER JOIN encounter_type et ON et.encounter_type_id = e.encounter_type AND et.name = 'ADMISSION'
                    GROUP BY
                      e.patient_id
                  ) latestAdmissionEncounter ON p.person_id = latestAdmissionEncounter.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      e.patient_id,
                      GROUP_CONCAT(DISTINCT scn.name ORDER BY scn.name) AS 'names'
                    FROM
                      obs o
                      INNER JOIN encounter e
                        ON e.encounter_id = o.encounter_id AND e.voided IS FALSE AND o.voided IS FALSE
                      INNER JOIN concept_name cn
                        ON cn.concept_id = o.concept_id AND cn.name = 'FSTG, Specialty determined by MLO' AND
                           cn.voided IS FALSE
                      INNER JOIN (
                                   SELECT
                                     e.patient_id,
                                     MAX(e.encounter_datetime) AS 'encounter_datetime'
                                   FROM
                                     encounter e
                                     INNER JOIN obs o ON o.encounter_id = e.encounter_id AND e.voided IS FALSE AND o.voided IS FALSE
                                     INNER JOIN concept_name cn
                                       ON cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                          cn.name = 'Medical Files'
                                   GROUP BY
                                     e.patient_id
                                 ) latest_encounter ON latest_encounter.patient_id = e.patient_id AND
                                                       latest_encounter.encounter_datetime = e.encounter_datetime
                      INNER JOIN concept_name scn
                        ON scn.concept_id = o.value_coded AND scn.concept_name_type = 'FULLY_SPECIFIED' AND
                           scn.voided IS FALSE
                    GROUP BY e.patient_id
                  ) speciality ON speciality.patient_id = p.person_id
ORDER BY bed.bed_number;"
WHERE
  property = 'emrapi.sqlGet.wardsListDetails';
