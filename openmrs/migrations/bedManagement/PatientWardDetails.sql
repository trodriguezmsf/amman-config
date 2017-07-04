DELETE FROM global_property WHERE property = 'emrapi.sqlGet.allWardsListDetails';
SELECT uuid() INTO @uuid;
INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
VALUES ('emrapi.sqlGet.allWardsListDetails',
"SELECT
   bed_tags.bed_tags                                                                  AS 'Bed Tags',
   bed.bed_number                                                                     AS 'Bed Number',
   patient_identifier.identifier                                                      AS 'Patient ID',
   CONCAT(pn.given_name, ' ', pn.family_name)                                         AS 'Patient Name',
   TIMESTAMPDIFF(YEAR, p.birthdate, CURDATE())                                        AS 'Age',
   address.address3                                                                   AS 'Country',
   latest_obs.Specialty                                                               AS 'Speciality',
   surgeon_name.name                                             					 AS 'Name of Surgeon',
   IF(isCaretakerRequired.required = 'true', 'Yes', '')                               AS 'Is Caretaker Required?',
   caretakerGender.gender                                                             AS 'Caretaker Gender',
   CAST(DATE_FORMAT(latestAdmissionEncounter.admission_datetime, '%Y-%m-%d') AS CHAR) AS 'Admission Date',
   DATE_FORMAT(expected_date_of_discharge.date, '%Y-%m-%d')                           AS 'Expected Date of Discharge',
   latest_obs.`Draining wound(s)?`,
   latest_obs.`IV/IM needed?`,
   latest_obs.`Twice daily Physiotherapy`,
   latest_obs.`Non-ambulatory?`,
   latest_obs.`Special needs?`,
   latest_obs.`Injection (subcutaneous)?`
 FROM
   bed
   INNER JOIN bed_location_map blm ON blm.bed_id = bed.bed_id
       INNER JOIN location l ON l.location_id = blm.location_id AND l.name = ${location_name} AND l.retired IS FALSE
   LEFT OUTER JOIN bed_patient_assignment_map bpam ON bpam.bed_id = bed.bed_id AND bpam.date_stopped IS NULL
   LEFT OUTER JOIN person p ON p.person_id = bpam.patient_id AND p.voided IS FALSE
   LEFT OUTER JOIN person_name pn ON pn.person_id = p.person_id AND pn.voided IS FALSE
   LEFT OUTER JOIN patient_identifier ON patient_identifier.patient_id = p.person_id AND patient_identifier.voided IS FALSE
   LEFT OUTER JOIN person_address address ON address.person_id = p.person_id AND address.voided IS FALSE
   LEFT OUTER JOIN (
                     SELECT
                       bed_tag_map.bed_id                                        AS 'bed_id',
                       GROUP_CONCAT(DISTINCT bed_tag.name ORDER BY bed_tag.name) AS 'bed_tags'
                     FROM
                       bed_tag_map
                       INNER JOIN bed_tag ON bed_tag.bed_tag_id = bed_tag_map.bed_tag_id AND bed_tag_map.voided IS FALSE
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
                            pat.name = 'isCaretakerRequired' AND pa.voided IS FALSE
                   ) isCaretakerRequired ON isCaretakerRequired.person_id = p.person_id
   LEFT OUTER JOIN (
                     SELECT
                       pa.person_id AS 'person_id',
                       cn.name      AS 'gender'
                     FROM
                       person_attribute pa
                       INNER JOIN person_attribute_type pat
                         ON pat.person_attribute_type_id = pa.person_attribute_type_id AND
                            pat.name = 'CaretakerGender' AND pa.voided IS FALSE
                       INNER JOIN concept_name cn ON cn.concept_id = pa.value AND cn.concept_name_type = 'FULLY_SPECIFIED'
                   ) caretakerGender ON caretakerGender.person_id = p.person_id
   LEFT OUTER JOIN (
                     SELECT
                       o.value_datetime AS 'date',
                       o.person_id
                     FROM
                       obs o
                     INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND
                                               cn.name = 'Expected Date of Discharge' AND
                                               cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                               o.voided IS FALSE
                                               INNER JOIN
                                               (SELECT
                                                  MAX(parentObs.obs_id) AS 'obs_id', parentObs.person_id
                                                FROM obs parentObs
                         INNER JOIN encounter e ON e.encounter_id = parentObs.encounter_id AND e.voided IS FALSE
                         INNER JOIN visit ON visit.visit_id = e.visit_id AND visit.voided IS FALSE
                         INNER JOIN concept_name cn
                           ON cn.concept_id = parentObs.concept_id AND cn.name = 'IPD Expected DD' AND
                              cn.concept_name_type = 'FULLY_SPECIFIED'
                              AND parentObs.voided IS FALSE
                         INNER JOIN (
                                      SELECT
                                        v.patient_id,
                                        MAX(v.date_started) AS date_started
                                      FROM
                                        visit v
                                      GROUP BY v.patient_id
                           ) latest_visit ON latest_visit.patient_id = parentObs.person_id AND latest_visit.date_started = visit.date_started
                       GROUP BY
                         parentObs.person_id
                      ) ipd_expected_dd ON ipd_expected_dd.person_id = o.person_id AND
                                            ipd_expected_dd.obs_id = o.obs_group_id
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
                       o.person_id,
                       cv.name
                     FROM
                       obs o
                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND cn.voided IS FALSE AND
                       cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name ='FV, Name (s) of Surgeon 1'
                     INNER JOIN concept_name cv ON cv.concept_id = o.value_coded AND cv.voided IS FALSE AND
                      cv.concept_name_type = 'FULLY_SPECIFIED'
                     INNER JOIN (
                       SELECT
                         o.person_id,
                         MAX(o.obs_datetime) AS 'obs_datetime'
                       FROM
                         obs o
                       INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND cn.voided IS FALSE AND
                         cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name ='FV, Name (s) of Surgeon 1'
                       GROUP BY o.person_id
                     ) latest_obs_datetime ON latest_obs_datetime.obs_datetime = o.obs_datetime AND latest_obs_datetime.person_id = o.person_id
                   ) surgeon_name ON surgeon_name.person_id = p.person_id
   LEFT OUTER JOIN (
         SELECT
         obs.person_id,
         c_name                            AS name,
         GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'Specialty',
         GROUP_CONCAT(DISTINCT (IF(c_name = 'NW, Draining wound(s)?',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'Draining wound(s)?',
         GROUP_CONCAT(DISTINCT (IF(c_name = 'NW, IV/IM needed?',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'IV/IM needed?',
         GROUP_CONCAT(DISTINCT (IF(c_name = 'NW, Twice daily Physiotherapy',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'Twice daily Physiotherapy',
         GROUP_CONCAT(DISTINCT (IF(c_name = 'NW, Non-ambulatory?',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'Non-ambulatory?',
         GROUP_CONCAT(DISTINCT (IF(c_name = 'NW, Special needs?',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'Special needs?',
         GROUP_CONCAT(DISTINCT (IF(c_name = 'NW, Injection (subcutaneous)?',
                                   COALESCE(coded_fscn.name, coded_scn.name),
                                   NULL))) AS 'Injection (subcutaneous)?'
       FROM (SELECT
               cn.name             AS c_name,
               o.person_id,
               max(e.encounter_datetime) AS latest_encounter_datetime,
               o.concept_id
             FROM obs o
               JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE AND o.voided IS FALSE
               JOIN concept_name cn ON cn.name IN
                                       ( 'FSTG, Specialty determined by MLO',
                                         'NW, Draining wound(s)?',
                                         'NW, IV/IM needed?',
                                         'NW, Twice daily Physiotherapy',
                                         'NW, Non-ambulatory?',
                                         'NW, Special needs?',
                                         'NW, Injection (subcutaneous)?')
                                       AND cn.concept_id = o.concept_id AND cn.voided IS FALSE
                                       AND cn.concept_name_type = 'FULLY_SPECIFIED'
             GROUP BY person_id, concept_id) latest_encounter
         JOIN obs ON obs.concept_id = latest_encounter.concept_id  AND obs.voided IS FALSE
         JOIN encounter e ON e.encounter_id = obs.encounter_id AND latest_encounter.latest_encounter_datetime = e.encounter_datetime AND e.voided IS FALSE
         LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                              AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                              AND coded_fscn.voided IS FALSE
         LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                             AND coded_fscn.concept_name_type = 'SHORT'
                                             AND coded_scn.voided IS FALSE
       GROUP BY obs.person_id
   )  latest_obs ON latest_obs.person_id =  p.person_id
 ORDER BY bed.bed_number;",'SQL query to get list of bed details in ward',@uuid);
