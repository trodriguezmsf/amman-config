 DELETE FROM global_property where property = 'emrapi.sqlSearch.awaitingValidationFirstStage';
 select uuid() into @uuid;


 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.awaitingValidationFirstStage',
"SELECT name, identifier, uuid
FROM (SELECT
        concat(pn.given_name, ' ', pn.family_name) AS name,
        pi.identifier                              AS identifier,
        p.uuid                                     AS uuid,
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date received', o.value_datetime, NULL)) ORDER BY o.obs_id
                     DESC)                         AS 'dateReceived',
        GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date of presentation at 1st stage', o.value_datetime, NULL))
                     ORDER BY o.obs_id DESC)       AS 'dateOfPresentation'
      FROM person p
        JOIN patient_identifier pi ON p.person_id = pi.patient_id
        JOIN person_name pn ON p.person_id = pn.person_id
        JOIN obs o ON p.person_id = o.person_id
        JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                      obs_fscn.name IN
                                      ('FSTG, Date received', 'FSTG, Date of presentation at 1st stage')
                                      AND obs_fscn.voided IS FALSE AND o.voided IS FALSE
        JOIN encounter e ON o.encounter_id = e.encounter_id
        JOIN (SELECT
                person_id,
                obs.concept_id,
                max(encounter_datetime) AS max_encounter_datetime
              FROM obs
                JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided = FALSE
              GROUP BY obs.person_id, obs.concept_id) latest_encounter
          ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id AND
             e.encounter_datetime = latest_encounter.max_encounter_datetime
      GROUP BY p.person_id) result
WHERE (dateReceived IS NOT NULL) AND (dateOfPresentation IS NULL)",'awaiting Validation FirstStage',@uuid);