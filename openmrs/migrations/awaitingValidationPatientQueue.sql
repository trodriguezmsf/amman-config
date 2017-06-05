 DELETE FROM global_property where property = 'emrapi.sqlSearch.awaitingValidationFirstStage';
 select uuid() into @uuid;
 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.awaitingValidationFirstStage',
"SELECT
  `Date of File Received`, `identifier`, name AS PATIENT_LISTING_QUEUES_HEADER_NAME, uuid, `Name of MLO`, `Nationality`, `Specialty`
FROM (
  SELECT
    pi.identifier                              AS `identifier`,
    p.uuid                                     AS uuid,
    latest_obs.dateOfFileReceived              AS 'Date of File Received',
    concat(pn.given_name, ' ', pn.family_name) AS name,
    latest_obs.nameOfMLO                       AS 'Name of MLO',
    latest_obs.dateOfPresentation              AS 'dateOfPresentation',
    latest_obs.fvDateOfPresentation            AS 'FVdateOfPresentation',
    latest_obs.isMedicalFileComplete           AS 'Isthemedicalfilecomplete?',
    latest_obs.speciality                      AS 'Specialty',
    COALESCE(scn.name, fscn.name)              AS `Nationality`
  FROM patient_identifier pi
    JOIN person p ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
    JOIN person_name pn ON pn.person_id = pi.patient_id AND pn.voided IS FALSE
    JOIN patient_program pp ON pp.patient_id = pi.patient_id AND pp.voided IS FALSE
    JOIN program prog ON prog.program_id = pp.program_id AND prog.retired IS FALSE
    JOIN concept_name prog_cn ON prog_cn.concept_id = prog.concept_id AND prog_cn.name = 'Reconstructive surgery' AND
                                 prog_cn.concept_name_type = 'FULLY_SPECIFIED' AND prog_cn.voided IS FALSE
    JOIN concept_name state_cn
      ON state_cn.name = 'Identification' AND state_cn.concept_name_type = 'FULLY_SPECIFIED' AND
         state_cn.voided IS FALSE
    JOIN program_workflow_state pws ON pws.concept_id = state_cn.concept_id AND pws.retired IS FALSE
    JOIN patient_state ps ON
                            ps.patient_program_id = pp.patient_program_id AND ps.state = pws.program_workflow_state_id
                            AND
                            ps.end_date IS NULL AND ps.voided IS FALSE
    JOIN (SELECT
            v.visit_id,
            v.patient_id
          FROM
            visit v
            JOIN (SELECT
                    patient_id        AS patient_id,
                    max(date_started) AS date_started
                  FROM visit
                  WHERE visit.voided IS FALSE
                  GROUP BY patient_id) latest_visit
              ON v.date_started = latest_visit.date_started AND
                 v.patient_id = latest_visit.patient_id AND v.voided IS FALSE
            JOIN visit_type vt ON vt.visit_type_id = v.visit_type_id AND
                                  vt.name = 'First Stage Validation'
         ) latest_visit ON latest_visit.patient_id = pi.patient_id
    LEFT JOIN (
                SELECT
                  o.person_id,
                  GROUP_CONCAT(DISTINCT (IF(cn.name = 'FSTG, Date of presentation at 1st stage',
                                            DATE_FORMAT(o.value_datetime, '%d/%b/%Y'), NULL)))                     AS 'dateOfPresentation',
                  GROUP_CONCAT(DISTINCT (IF(cn.name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name),
                                            NULL)))                                                                AS 'nameOfMLO',
                  GROUP_CONCAT(DISTINCT (IF(cn.name = 'FSTG, Date received', DATE_FORMAT(o.value_datetime, '%d/%b/%Y'),
                                            NULL)))                                                                AS 'dateOfFileReceived',
                  GROUP_CONCAT(DISTINCT (IF(cn.name = 'FSTG, Is the medical file complete?',
                                            COALESCE(coded_fscn.name, coded_scn.name),
                                            NULL)))                                                                AS 'isMedicalFileComplete',
                  GROUP_CONCAT(DISTINCT
                               (IF(cn.name = 'FV, Date of Presentation', DATE_FORMAT(o.value_datetime, '%d/%b/%Y'),
                                   NULL)))                                                                         AS 'fvDateOfPresentation',
                  GROUP_CONCAT(DISTINCT (IF(cn.name = 'FSTG, Specialty determined by MLO',
                                            COALESCE(coded_fscn.name, coded_scn.name),
                                            NULL)))                                                                AS 'speciality'
                FROM
                  obs o
                  JOIN
                  (SELECT
                     MAX(e.encounter_datetime) AS encounter_datetime,
                     o.person_id,
                     cn.concept_id
                   FROM obs o
                     JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND
                                             cn.name IN ('FSTG, Date of presentation at 1st stage',
                                                         'MH, Name of MLO',
                                                         'FSTG, Date received',
                                                         'FSTG, Is the medical file complete?',
                                                         'FV, Date of Presentation',
                                                         'FSTG, Specialty determined by MLO'
                                             ) AND
                                             cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                             cn.voided IS FALSE
                     JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                   GROUP BY o.person_id, cn.concept_id) latest_encounter ON
                                                                           latest_encounter.person_id = o.person_id AND
                                                                           latest_encounter.concept_id = o.concept_id
                                                                           AND o.voided IS FALSE
                  JOIN encounter e
                    ON e.encounter_id = o.encounter_id AND e.encounter_datetime = latest_encounter.encounter_datetime
                  JOIN concept_name cn
                    ON cn.concept_id = o.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
                  LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                       AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                       AND coded_fscn.voided IS FALSE
                  LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                      AND coded_fscn.concept_name_type = 'SHORT'
                                                      AND coded_scn.voided IS FALSE
                GROUP BY o.person_id
              ) latest_obs ON latest_obs.person_id = pi.patient_id
    LEFT OUTER JOIN person_attribute_type pat
      ON pat.retired IS FALSE
         AND pat.name = 'nationality1' AND pat.format = 'org.openmrs.Concept'
    LEFT OUTER JOIN person_attribute pa ON pa.person_id = pi.patient_id AND pa.voided IS FALSE AND
                                           pat.person_attribute_type_id = pa.person_attribute_type_id
    LEFT OUTER JOIN concept_name scn
      ON scn.concept_id = pa.value AND scn.concept_name_type = 'SHORT' AND scn.voided IS FALSE
    LEFT OUTER JOIN concept_name fscn
      ON fscn.concept_id = pa.value AND fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided IS FALSE
  WHERE latest_obs.dateOfPresentation IS NULL AND latest_obs.fvDateOfPresentation IS NULL AND
        (latest_obs.isMedicalFileComplete IS NULL OR latest_obs.isMedicalFileComplete = 'Yes')) result",'awaiting Validation FirstStage',@uuid);