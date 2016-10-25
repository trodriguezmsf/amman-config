 DELETE FROM global_property where property = 'emrapi.sqlSearch.expectedArrival';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.expectedArrival',
"SELECT  `identifier` , name , `Age`, uuid ,`Country` , `Nationality` , `Specialty` , `Stage`,`Expected Date of Arrival` ,`Does the Patient need Accommodation?`, `Type of Admission Recommended`
       FROM (SELECT
               concat(pn.given_name, ' ', pn.family_name) AS name,
               floor(DATEDIFF(CURDATE(), p.birthdate) / 365)      AS `Age`,
               pi.identifier                              AS `identifier`,
               p.uuid                                     AS uuid,
               paddress.address3 AS 'Country',
          GROUP_CONCAT(DISTINCT(IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS 'Nationality',
          GROUP_CONCAT(DISTINCT(IF(pat.name = 'expectedDateofArrival', DATE_FORMAT(pa.value, '%d/%m/%Y'), NULL))) AS 'Expected Date of Arrival',
          GROUP_CONCAT(DISTINCT(IF(pat.name = 'dateofArrival', pa.value, NULL))) AS 'Date of Arrival',
          GROUP_CONCAT(DISTINCT (IF(obs_across_visits.name = 'FSTG, Specialty determined by MLO' AND obs_across_visits.person_id IS NOT NULL, COALESCE(value_fsn, value_scn), NULL))) AS 'Specialty',
          GROUP_CONCAT(DISTINCT (IF(obs_across_visits.name = 'Stage' AND obs_across_visits.person_id IS NOT NULL, obs_across_visits.value_numeric, NULL))) AS 'Stage',
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Does the Patient need Accommodation?' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Does the Patient need Accommodation?',
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Type of Admission Recommended' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Type of Admission Recommended'
             FROM person p
               JOIN patient_identifier pi ON p.person_id = pi.patient_id
               JOIN person_name pn ON p.person_id = pn.person_id
            	 LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided is false
               LEFT OUTER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired is false
               LEFT OUTER JOIN person_address paddress ON p.person_id = paddress.person_id AND paddress.voided is false
               LEFT OUTER JOIN concept_name scn ON pat.format = 'org.openmrs.Concept' AND pa.value = scn.concept_id AND scn.concept_name_type = 'SHORT' AND scn.voided is false
               LEFT OUTER JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided is false
               LEFT JOIN obs o ON p.person_id = o.person_id
               LEFT JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                             obs_fscn.name IN
                                             ('FSTG, Date received', 'FSTG, Date of presentation at 1st stage','FSTG, Is the medical file complete?','FV, Does the Patient need Accommodation?','FV, Type of Admission Recommended')
                                             AND obs_fscn.voided IS FALSE AND o.voided IS FALSE AND obs_fscn.concept_name_type= 'FULLY_SPECIFIED'
              LEFT JOIN encounter e ON o.encounter_id = e.encounter_id
              LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'FULLY_SPECIFIED' AND coded_fscn.voided is false
              LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'SHORT' AND coded_scn.voided is false
              LEFT JOIN (SELECT
                       person_id,
                       obs.concept_id,
                       max(encounter_datetime) AS max_encounter_datetime
             FROM obs
               JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided = FALSE
                       AND encounter.visit_id IN (SELECT max(visit_id) AS latest_visit_id
                                                                FROM visit GROUP BY patient_id )
                     GROUP BY obs.person_id, obs.concept_id ) latest_encounter
                 ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id AND
                    e.encounter_datetime = latest_encounter.max_encounter_datetime
             LEFT JOIN (SELECT
                   cn.name,
                   obs.person_id,
                   coded_fscn.name AS value_fsn,
                   coded_scn.name  AS value_scn,
                   obs.value_numeric AS value_numeric
                   FROM obs
                   JOIN concept_name cn ON cn.name IN ('MH, Name of MLO', 'FSTG, Specialty determined by MLO', 'Stage') AND cn.concept_id = obs.concept_id
                   LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED' AND coded_fscn.voided IS FALSE
                   LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded AND coded_fscn.concept_name_type = 'SHORT' AND coded_scn.voided IS FALSE
                   WHERE obs_id IN (
                       SELECT max(obs.obs_id) FROM obs
                       GROUP BY obs.person_id, obs.concept_id)
                    ) obs_across_visits ON p.person_id = obs_across_visits.person_id
                    JOIN patient_program pp ON p.person_id = pp.patient_id AND  pp.date_completed is NULL and pp.voided = 0
             GROUP BY p.person_id ) result
             WHERE(result.`Expected Date of Arrival` IS NOT NULL) AND (result.`Date of Arrival` IS NULL)", 'Expected Arrival Patient Queue', @uuid);
