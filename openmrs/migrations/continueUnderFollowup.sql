 DELETE FROM global_property where property = 'emrapi.sqlSearch.continueUnderFollowup';
 select uuid() into @uuid;
 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.continueUnderFollowup',
"SELECT  `Date Of Presentation`,`identifier`, Name , uuid , `Specialty` , `Name of MLO`, `Time for next medical follow-up`, `Commments`
   FROM (SELECT
           concat(pn.given_name, ' ', pn.family_name) AS Name,
           pi.identifier                              AS `identifier`,
           p.uuid                                     AS uuid,
         GROUP_CONCAT(DISTINCT(IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS 'Nationality',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Date of presentation at Followup' AND latest_encounter.person_id IS NOT NULL , DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL))
                        ORDER BY o.obs_id DESC)       AS 'Date Of Presentation',
 		GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Specialty determined by MLO' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Specialty',
   		GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'MH, Name of MLO' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Name of MLO',
  		GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'outcomeFollowupSurgicalValidation',
 		GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Time for next medical follow-up to be done' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Time for next medical follow-up',
         GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Comments about next follow-up' AND latest_encounter.person_id IS NOT NULL , o.value_text, NULL))
                        ORDER BY o.obs_id DESC)       AS 'Commments'

         FROM person p
           JOIN patient_identifier pi ON p.person_id = pi.patient_id
           JOIN person_name pn ON p.person_id = pn.person_id
           JOIN obs o ON p.person_id = o.person_id
           JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                         obs_fscn.name IN
                                         ('FUP, Date of presentation at Followup','FSTG, Specialty determined by MLO','MH, Name of MLO','FUP, Outcomes for follow-up surgical validation','FUP, Time for next medical follow-up to be done','FUP, Comments about next follow-up')
                                         AND obs_fscn.voided IS FALSE AND o.voided IS FALSE  AND obs_fscn.concept_name_type= 'FULLY_SPECIFIED'
   		LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided is false
      LEFT OUTER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired is false
      LEFT OUTER JOIN concept_name scn ON pat.format = 'org.openmrs.Concept' AND pa.value = scn.concept_id AND scn.concept_name_type = 'SHORT' AND scn.voided is false
      LEFT OUTER JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided is false
           JOIN encounter e ON o.encounter_id = e.encounter_id AND e.voided is FALSE
             LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'FULLY_SPECIFIED' AND coded_fscn.voided is false
      LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'SHORT' AND coded_scn.voided is false
           LEFT JOIN (SELECT
                        en.visit_id,
                          person_id,
                        obs.concept_id,
                        max(en.encounter_datetime) AS max_encounter_datetime
                      FROM obs
                        JOIN encounter en ON obs.encounter_id = en.encounter_id
                      AND en.visit_id IN (SELECT max(visit_id) AS latest_visit_id
                                            FROM visit GROUP BY patient_id )
                      GROUP BY obs.person_id, obs.concept_id) latest_encounter
             ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id
                AND latest_encounter.max_encounter_datetime = e.encounter_datetime
           JOIN patient_program pp ON p.person_id = pp.patient_id
           JOIN program_workflow pw ON pw.program_id = pp.program_id
           JOIN program_workflow_state pws ON pw.program_workflow_id = pws.program_workflow_id
           JOIN patient_state ps ON pws.program_workflow_state_id = ps.state AND ps.patient_program_id = pp.patient_program_id

         GROUP BY p.person_id) result
   WHERE  (`outcomeFollowupSurgicalValidation` = 'Continue under follow-up')",'Patients under follow up',@uuid);