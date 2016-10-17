 DELETE FROM global_property where property = 'emrapi.sqlSearch.expectedArrival';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.expectedArrival',
"SELECT  `identifier` , Name , uuid ,`Country` , `Nationality` , `Specialty` , `Stage`,`Expected Date of Arrival` ,`Does the Patient need Accommodation?`, `Type of Admission Recommended`
      FROM (SELECT
              concat(pn.given_name, ' ', pn.family_name) AS Name,
              pi.identifier                              AS `identifier`,
              p.uuid                                     AS uuid,
              paddress.address3 AS 'Country',
         GROUP_CONCAT(DISTINCT(IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS 'Nationality',
         GROUP_CONCAT(DISTINCT(IF(pat.name = 'expectedDateofArrival', DATE_FORMAT(pa.value, '%d/%m/%Y'), NULL))) AS 'Expected Date of Arrival',
         GROUP_CONCAT(DISTINCT(IF(pat.name = 'dateofArrival', pa.value, NULL))) AS 'Date of Arrival',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date received' AND latest_encounter.person_id IS NOT NULL, DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL)) ORDER BY o.obs_id DESC) AS 'Date of File Received',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date of presentation at 1st stage' AND latest_encounter.person_id IS NOT NULL , o.value_datetime, NULL)) ORDER BY o.obs_id DESC)  AS 'dateOfPresentation',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'MH, Name of MLO' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Name of MLO',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Specialty determined by MLO' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Specialty',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Is the medical file complete?' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Isthemedicalfilecomplete?',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'Stage' AND latest_encounter.person_id IS NOT NULL, o.value_numeric, NULL)) ORDER BY o.obs_id DESC) AS 'Stage',
                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Does the Patient need Accommodation?' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Does the Patient need Accommodation?',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Type of Admission Recommended' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Type of Admission Recommended'
            FROM person p
              JOIN patient_identifier pi ON p.person_id = pi.patient_id
              JOIN person_name pn ON p.person_id = pn.person_id
              JOIN obs o ON p.person_id = o.person_id
              JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                            obs_fscn.name IN
                                            ('FSTG, Date received', 'FSTG, Date of presentation at 1st stage','MH, Name of MLO', 'FSTG, Specialty determined by MLO','FSTG, Is the medical file complete?','Stage','FV, Does the Patient need Accommodation?','FV, Type of Admission Recommended')
                                            AND obs_fscn.voided IS FALSE AND o.voided IS FALSE AND obs_fscn.concept_name_type= 'FULLY_SPECIFIED'
      	  LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided is false
         LEFT OUTER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired is false
           LEFT OUTER JOIN person_address paddress ON p.person_id = paddress.person_id AND paddress.voided is false
         LEFT OUTER JOIN concept_name scn ON pat.format = 'org.openmrs.Concept' AND pa.value = scn.concept_id AND scn.concept_name_type = 'SHORT' AND scn.voided is false
         LEFT OUTER JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided is false
         JOIN encounter e ON o.encounter_id = e.encounter_id
         LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'FULLY_SPECIFIED' AND coded_fscn.voided is false
         LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'SHORT' AND coded_scn.voided is false
         JOIN (SELECT
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
            GROUP BY p.person_id ) result
            WHERE(`Expected Date of Arrival` IS NOT NULL) AND (`Date of Arrival` IS NULL)", 'Expected Arrival Patient Queue', @uuid);

