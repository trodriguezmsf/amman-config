 DELETE FROM global_property where property = 'emrapi.sqlSearch.continueUnderFollowup';
 select uuid() into @uuid;
 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.continueUnderFollowup',
"SELECT  `Date Of Presentation`,`identifier`, name AS PATIENT_LISTING_QUEUES_HEADER_NAME, uuid , `Specialty` , `Name of MLO`, `Time for next medical follow-up`,`Date of next medical follow-up`,`Type of medical investigations requested`, `Comments`
  FROM (SELECT
          concat(pn.given_name, ' ', pn.family_name) AS name,
          pi.identifier                              AS `identifier`,
          p.uuid                                     AS uuid,
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Date of presentation at Followup' AND latest_encounter.person_id IS NOT NULL , DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL))
                       ORDER BY o.obs_id DESC)       AS 'Date Of Presentation',
          `Name of MLO`,
          `Specialty`,
          program_state.previousProgramState AS 'Previous state',
          program_state.currentProgramState AS 'Current state',
           `Type of medical investigations requested`,
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'outcomeFollowupSurgicalValidation',
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Time for next medical follow-up' AND latest_encounter.person_id IS NOT NULL,COALESCE(coded_fscn.name, coded_scn.name) , NULL)) ORDER BY o.obs_id DESC) AS 'Time for next medical follow-up',
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Date of next medical follow-up' AND latest_encounter.person_id IS NOT NULL , DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL))
                       ORDER BY o.obs_id DESC)       AS 'Date of next medical follow-up',
          GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Comments about next follow-up' AND latest_encounter.person_id IS NOT NULL , o.value_text, NULL))
                       ORDER BY o.obs_id DESC)       AS 'Comments'
        FROM person p
        JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
        JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE
        LEFT JOIN obs o ON p.person_id = o.person_id AND o.voided IS FALSE
        LEFT JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                           obs_fscn.name IN
                                           ('FUP, Date of presentation at Followup','FUP, Outcomes for follow-up surgical validation','FUP, Time for next medical follow-up','FUP, Date of next medical follow-up','FUP, Comments about next follow-up')
                                           AND obs_fscn.voided IS FALSE AND obs_fscn.concept_name_type= 'FULLY_SPECIFIED'
        JOIN encounter e ON o.encounter_id = e.encounter_id AND e.voided is FALSE
        LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'FULLY_SPECIFIED' AND coded_fscn.voided is false
        LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'SHORT' AND coded_scn.voided is false
        LEFT JOIN (SELECT
                     en.visit_id,
                     person_id,
                     obs.concept_id,
                     max(en.encounter_datetime) AS max_encounter_datetime
                   FROM obs
                   JOIN encounter en ON obs.encounter_id = en.encounter_id AND obs.voided is FALSE AND en.voided IS FALSE
                                        AND en.visit_id IN (SELECT v.visit_id FROM
                   visit v
                   JOIN  (SELECT patient_id AS patient_id, max(date_started) AS date_started
                          FROM visit WHERE visit.voided IS FALSE GROUP BY patient_id) latest_visit
                   ON v.date_started = latest_visit.date_started AND v.patient_id = latest_visit.patient_id AND v.voided IS FALSE )
                   GROUP BY obs.person_id, obs.concept_id) latest_encounter
        ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id
           AND latest_encounter.max_encounter_datetime = e.encounter_datetime
 	   LEFT JOIN ( SELECT
     pp.patient_id,
     SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT (IF(ps.end_date IS NOT NULL, cn.name, NULL)) ORDER BY ps.end_date DESC), ',', 1)       AS 'previousProgramState',
     GROUP_CONCAT(DISTINCT (IF(ps.end_date IS NULL, cn.name, NULL)))       AS 'currentProgramState'
 FROM patient_program pp
     INNER JOIN patient_state ps ON pp.patient_program_id = ps.patient_program_id AND pp.voided IS FALSE AND ps.voided IS FALSE
     INNER JOIN program_workflow_state pws ON ps.state = pws.program_workflow_state_id AND pws.retired IS FALSE
     INNER JOIN concept_name cn ON pws.concept_id = cn.concept_id AND concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
 GROUP BY pp.patient_id) program_state on p.person_id =program_state.patient_id
        LEFT JOIN (SELECT
                     obs.person_id,
                     encounter.encounter_id,
                     c_name AS name,
                     GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Specialty',
                     GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of MLO',
  				GROUP_CONCAT(DISTINCT (IF(c_name = 'FUP, Type of medical investigations requested', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Type of medical investigations requested'

                   FROM (SELECT
                           cn.name                 AS c_name,
                           obs.person_id,
                           obs.encounter_id,
                           max(encounter_datetime) AS max_encounter_datetime,
                           obs.concept_id
                         FROM obs
                         JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND encounter.voided IS FALSE
                         JOIN concept_name cn ON cn.name IN ('MH, Name of MLO', 'FSTG, Specialty determined by MLO','FUP, Type of medical investigations requested')
                                                 AND cn.concept_id = obs.concept_id AND cn.voided IS FALSE
                         GROUP BY person_id, concept_id) result
                   JOIN encounter ON result.max_encounter_datetime = encounter.encounter_datetime AND encounter.voided IS FALSE
                   JOIN obs ON encounter.encounter_id = obs.encounter_id AND obs.concept_id = result.concept_id AND obs.voided IS FALSE
                   LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                        AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                        AND coded_fscn.voided IS FALSE
                   LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                       AND coded_fscn.concept_name_type = 'SHORT'
                                                       AND coded_scn.voided IS FALSE
                   GROUP BY obs.person_id
                  ) obs_across_visits ON p.person_id = obs_across_visits.person_id
        JOIN patient_program pp ON p.person_id = pp.patient_id AND  pp.date_completed is NULL and pp.voided IS FALSE
        GROUP BY p.person_id) result
  WHERE (`outcomeFollowupSurgicalValidation` = 'Continue under follow-up' OR (`Current state` = 'Network Follow-up' and `Previous state` IN ('Pre-Operative','Surgical / Hospitalisation','Rehabilitation'))) ",'Patients under follow up',@uuid);