DELETE FROM global_property where property = 'emrapi.sqlSearch.awaitingValidationFollowup';
 select uuid() into @uuid;


 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.awaitingValidationFollowup',
"SELECT name, identifier, uuid
FROM (SELECT
        concat(pn.given_name, ' ', pn.family_name) AS name,
        pi.identifier                              AS identifier,
        p.uuid                                     AS uuid,
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Date of presentation at Followup' AND latest_encounter.person_id IS NOT NULL , o.value_datetime, NULL))
                     ORDER BY o.obs_id DESC)       AS 'dateOfPresentation'
      FROM person p
        JOIN patient_identifier pi ON p.person_id = pi.patient_id
        JOIN person_name pn ON p.person_id = pn.person_id
        JOIN obs o ON p.person_id = o.person_id
        JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                      obs_fscn.name IN
                                      ('FUP, Date of presentation at Followup')
                                      AND obs_fscn.voided IS FALSE AND o.voided IS FALSE
        JOIN encounter e ON o.encounter_id = e.encounter_id AND e.voided is FALSE
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
                                 AND pws.concept_id = (SELECT concept_id FROM concept_name WHERE name = 'Validation' AND concept_name_type = 'FULLY_SPECIFIED')
      GROUP BY p.person_id) result
WHERE (dateOfPresentation IS NULL)",'awaiting Validation Followup',@uuid);