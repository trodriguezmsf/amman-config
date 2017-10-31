SELECT
  pi.identifier  AS `identifier`,
  p.uuid  AS uuid,
  concat(pn.given_name, ' ', pn.family_name)  AS  PATIENT_LISTING_QUEUES_HEADER_NAME,
  `Name of MLO`,
  COALESCE(scn.name, fscn.name) AS `Nationality`,
  `Specialty`,
  `Name of Surgeon 1`,
  `Name of Surgeon 2`
FROM patient_identifier pi
  JOIN person p ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
  JOIN person_name pn ON pn.person_id = pi.patient_id AND pn.voided IS FALSE
  JOIN patient_program pp ON pp.patient_id = pi.patient_id AND pp.voided IS FALSE
  JOIN program prog ON prog.program_id = pp.program_id AND prog.retired IS FALSE
  JOIN concept_name prog_cn ON prog_cn.concept_id = prog.concept_id AND prog_cn.name = 'Reconstructive surgery' AND
                               prog_cn.concept_name_type = 'FULLY_SPECIFIED' AND prog_cn.voided IS FALSE
  JOIN concept_name state_cn
    ON state_cn.name = 'Network Follow-up' AND state_cn.concept_name_type = 'FULLY_SPECIFIED' AND
       state_cn.voided IS FALSE
  JOIN program_workflow_state pws ON pws.concept_id = state_cn.concept_id AND pws.retired IS FALSE
  JOIN patient_state ps ON
                          ps.patient_program_id = pp.patient_program_id AND ps.state = pws.program_workflow_state_id AND
                          ps.end_date IS NULL AND ps.voided IS FALSE
  JOIN (
         SELECT
           v.patient_id,
           v.visit_id,
           vt.name
         FROM
           visit v
           INNER JOIN visit_type vt ON vt.visit_type_id = v.visit_type_id AND vt.retired IS FALSE AND v.voided IS FALSE
           INNER JOIN (
                        SELECT
                          patient_id        AS patient_id,
                          MAX(date_started) AS date_started
                        FROM visit
                        WHERE visit.voided IS FALSE
                        GROUP BY patient_id
                      ) latest_visit ON latest_visit.date_started = v.date_started AND
                                        latest_visit.patient_id = v.patient_id
       ) latest_visit ON latest_visit.patient_id = pi.patient_id AND
                         latest_visit.name IN ('First Stage Validation', 'Follow-Up Validation')
  LEFT OUTER JOIN person_attribute_type pat
    ON  pat.retired IS FALSE
        AND pat.name = 'nationality1' AND pat.format = 'org.openmrs.Concept'
  LEFT OUTER JOIN person_attribute pa ON pa.person_id = pi.patient_id AND pa.voided IS FALSE AND
                                         pat.person_attribute_type_id = pa.person_attribute_type_id
  LEFT OUTER JOIN concept_name scn
    ON scn.concept_id = pa.value AND scn.concept_name_type = 'SHORT' AND scn.voided IS FALSE
  LEFT OUTER JOIN concept_name fscn
    ON fscn.concept_id = pa.value AND fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided IS FALSE
  LEFT OUTER JOIN (
                    SELECT
                      obs.person_id,
                      c_name                                                                       AS name,
                      GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 1',
                                                COALESCE(coded_fscn.name, coded_scn.name),
                                                NULL)))                                            AS 'Name of Surgeon 1',
                      GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 2',
                                                COALESCE(coded_fscn.name, coded_scn.name),
                                                NULL)))                                            AS 'Name of Surgeon 2',
                      GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO',
                                                COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of MLO',
                      GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                                COALESCE(coded_fscn.name, coded_scn.name),
                                                NULL)))                                            AS 'Specialty'
                    FROM (SELECT
                            cn.name                   AS c_name,
                            o.person_id,
                            max(e.encounter_datetime) AS latest_encounter_datetime,
                            o.concept_id
                          FROM obs o
                            JOIN concept_name cn ON cn.name IN
                                                    ('FV, Name (s) of Surgeon 1',
                                                     'FV, Name (s) of Surgeon 2',
                                                     'MH, Name of MLO',
                                                     'FSTG, Specialty determined by MLO')
                                                    AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                                    o.voided IS FALSE
                            JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                          GROUP BY person_id, concept_id) result
                      JOIN obs ON obs.concept_id = result.concept_id AND obs.person_id = result.person_id AND
                                  obs.voided IS FALSE
                      JOIN encounter e
                        ON e.encounter_datetime = result.latest_encounter_datetime AND e.encounter_id = obs.encounter_id
                           AND e.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                                 AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                 AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                                AND coded_fscn.concept_name_type = 'SHORT'
                                                                AND coded_scn.voided IS FALSE
                    GROUP BY obs.person_id
                  ) latest_obs ON latest_obs.person_id = pi.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      e.patient_id,
                      e.visit_id,
                      MAX(o.value_datetime) AS 'obs_datetime'
                    FROM
                      obs o
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                                    cn.voided IS FALSE AND
                                                    o.voided IS FALSE AND
                                                    cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                                    cn.name IN
                                                    ('FV, Date of Presentation', 'FUP, Date of presentation at Followup')
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                    GROUP BY e.visit_id
                  ) visits_with_dop
    ON visits_with_dop.visit_id = latest_visit.visit_id AND visits_with_dop.patient_id = pi.patient_id
WHERE visits_with_dop.obs_datetime IS NULL
GROUP BY pi.patient_id;