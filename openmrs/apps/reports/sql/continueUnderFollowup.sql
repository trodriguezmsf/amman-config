SELECT
          IF(`Date Created at DCSF` IS NULL, `Date Of Presentation at Followup`,IF((`Date Created at DOPF` > `Date Created at DCSF`),`Date Of Presentation at Followup` ,`Date Of Presentation at Surgeon Followup`)) AS `Date Of Presentation`,
          pi.identifier AS `Identifier`,
          concat(pn.given_name, ' ', pn.family_name)                  AS Name,
          `Specialty`,
          `Name of MLO`,
          IF(`Date Created at MLOV` IS NULL, `Time for next medical follow-up`, IF((`Date Created at TFNMF` > `Date Created at MLOV`),`Time for next medical follow-up`, `Time for next medical follow-up at Surgeon Followup`)) AS `Time for next medical follow-up`,
          `Date of next medical follow-up`,
          IF(surgeontypevalue.SFP_DC IS NULL, `Type of medical investigations requested`, IF(followuptypevalue.FUP_DC > surgeontypevalue.SFP_DC, `Type of medical investigations requested`, `Type of medical investigations requested at Surgeon Followup`)) AS `Type of medical investigations requested`,
          IF(`Date Created at NOSFP` IS NULL, `Comments`, IF((`Date Created at CANF` > `Date Created at NOSFP`), `Comments`, `Comments at Surgeon Followup`)) AS `Comments`
        FROM person p
          JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
          JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE
          JOIN patient_program pp ON p.person_id = pp.patient_id AND pp.date_completed IS NULL AND pp.voided IS FALSE
          LEFT JOIN (SELECT
                       o.person_id                          AS person_id,
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('FUP, Date of presentation at Followup') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Of Presentation at Followup',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('FUP, Date of presentation at Followup') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.date_created, '%d-%m-%Y %T'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Created at DOPF',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('SFP, Date recorded') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Of Presentation at Surgeon Followup',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('SFP, Date recorded') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.date_created, '%d-%m-%Y %T'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Created at DCSF',
                       GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FUP, Outcomes for follow-up surgical validation' AND
                                                 latest_encounter.person_id IS NOT NULL,
                                                 COALESCE(coded_fscn.name, coded_scn.name),
                                                 NULL)) ORDER BY o.obs_id
                                    DESC)                   AS 'outcomeFollowupSurgicalValidation',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('FUP, Time for next medical follow-up') AND
                           latest_encounter.person_id IS NOT NULL,
                           COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                                    DESC)                   AS 'Time for next medical follow-up',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('FUP, Time for next medical follow-up') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.date_created, '%d-%m-%Y %T'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Created at TFNMF',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('SFP,  MLO visit at:') AND
                           latest_encounter.person_id IS NOT NULL,
                           COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                                    DESC)                   AS 'Time for next medical follow-up at Surgeon Followup',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('SFP,  MLO visit at:') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.date_created, '%d-%m-%Y %T'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Created at MLOV',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name = 'FUP, Date of next medical follow-up' AND latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL))
                                    ORDER BY o.obs_id
                                    DESC)                   AS 'Date of next medical follow-up',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('FUP, Comments about next follow-up') AND latest_encounter.person_id IS NOT NULL,
                           o.value_text, NULL))
                                    ORDER BY o.obs_id DESC) AS 'Comments',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('FUP, Comments about next follow-up') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.date_created, '%d-%m-%Y %T'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Created at CANF',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('SFP, Notes, other') AND latest_encounter.person_id IS NOT NULL,
                           o.value_text, NULL))
                                    ORDER BY o.obs_id DESC) AS 'Comments at Surgeon Followup',
                       GROUP_CONCAT(DISTINCT (IF(
                           obs_fscn.name IN ('SFP, Notes, other') AND
                           latest_encounter.person_id IS NOT NULL,
                           DATE_FORMAT(o.date_created, '%d-%m-%Y %T'), NULL))
                                    ORDER BY o.obs_id DESC) AS 'Date Created at NOSFP'
                     FROM encounter e
                       INNER JOIN obs o ON o.encounter_id = e.encounter_id AND o.voided IS FALSE AND e.voided IS FALSE
                       INNER JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                                           obs_fscn.name IN
                                                           ('FUP, Date of presentation at Followup',
                                                            'SFP, Date recorded',
                                                            'FUP, Outcomes for follow-up surgical validation',
                                                            'FUP, Time for next medical follow-up',
                                                            'SFP,  MLO visit at:',
                                                            'FUP, Date of next medical follow-up',
                                                            'FUP, Comments about next follow-up',
                                                            'SFP, Notes, other')
                                                           AND obs_fscn.voided IS FALSE AND
                                                           obs_fscn.concept_name_type = 'FULLY_SPECIFIED'
                       LEFT JOIN concept_name coded_fscn
                         ON coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED' AND
                            coded_fscn.voided IS FALSE
                       LEFT JOIN concept_name coded_scn
                         ON coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type = 'SHORT' AND
                            coded_scn.voided IS FALSE
                       LEFT JOIN (SELECT
                                    en.visit_id,
                                    person_id,
                                    obs.concept_id,
                                    max(en.encounter_datetime) AS max_encounter_datetime
                                  FROM obs
                                    JOIN encounter en
                                      ON obs.encounter_id = en.encounter_id AND obs.voided IS FALSE AND
                                         en.voided IS FALSE
                                         AND en.visit_id IN (SELECT v.visit_id
                                                             FROM
                                                               visit v
                                                               JOIN (SELECT
                                                                       patient_id        AS patient_id,
                                                                       max(date_started) AS date_started
                                                                     FROM visit
                                                                     WHERE visit.voided IS FALSE
                                                                     GROUP BY patient_id) latest_visit
                                                                 ON v.date_started = latest_visit.date_started AND
                                                                    v.patient_id = latest_visit.patient_id AND
                                                                    v.voided IS FALSE)
                                  GROUP BY obs.person_id, obs.concept_id) latest_encounter
                         ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id
                            AND latest_encounter.max_encounter_datetime = e.encounter_datetime
                     GROUP BY o.person_id) followupInfo ON followupInfo.person_id = p.person_id
          LEFT JOIN (SELECT
                       pp.patient_id,
                       SUBSTRING_INDEX(
                           GROUP_CONCAT(IF(ps.end_date IS NOT NULL, cn.name, NULL) ORDER BY ps.end_date DESC, ps.start_date DESC),
                           ',', 1)                                                     AS 'previousProgramState',
                       GROUP_CONCAT(IF(ps.end_date IS NULL, cn.name, NULL))            AS 'currentProgramState'
                     FROM patient_program pp
                       INNER JOIN patient_state ps
                         ON pp.patient_program_id = ps.patient_program_id AND pp.voided IS FALSE AND ps.voided IS FALSE
                       INNER JOIN program_workflow_state pws
                         ON ps.state = pws.program_workflow_state_id AND pws.retired IS FALSE
                       INNER JOIN concept_name cn
                         ON pws.concept_id = cn.concept_id AND concept_name_type = 'FULLY_SPECIFIED' AND
                            cn.voided IS FALSE
                     GROUP BY pp.patient_id) program_state ON p.person_id = program_state.patient_id
          LEFT JOIN (
                      SELECT
                        o.person_id,
                        encounter.encounter_id,
                        c_name                            AS name,
                        GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                                  COALESCE(coded_fscn.name, coded_scn.name),
                                                  NULL))) AS 'Specialty',
                        GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name),
                                                  NULL))) AS 'Name of MLO',
                        GROUP_CONCAT(DISTINCT (IF(c_name IN ('FUP, Type of medical investigations requested'),
                                                  COALESCE(COALESCE(coded_fscn.name, coded_scn.name),o.value_text),
                                                  NULL))) AS 'Type of medical investigations requested',
                        CONCAT_WS(', ', GROUP_CONCAT(DISTINCT (IF(c_name = 'SFP, X-ray of:',
                                          CONCAT('X-ray of: ', COALESCE(COALESCE(coded_fscn.name, coded_scn.name), o.value_text)),
                                          NULL))),
                                        GROUP_CONCAT(DISTINCT (IF(c_name = 'SFP, Video of:',
                                          CONCAT('Video of: ', COALESCE(COALESCE(coded_fscn.name, coded_scn.name), o.value_text)),
                                          NULL))),
                                        GROUP_CONCAT(DISTINCT (IF(c_name = 'SFP, Photo of:',
                                          CONCAT('Photo of: ', COALESCE(COALESCE(coded_fscn.name, coded_scn.name), o.value_text)),
                                          NULL)))) AS 'Type of medical investigations requested at Surgeon Followup'
                      FROM (SELECT
                              cn.name                 AS c_name,
                              obs.person_id,
                              obs.encounter_id,
                              max(encounter_datetime) AS max_encounter_datetime,
                              obs.concept_id
                            FROM obs
                              JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND
                                                encounter.voided IS FALSE
                              JOIN concept_name cn ON cn.name IN
                                                      ('MH, Name of MLO',
                                                       'FSTG, Specialty determined by MLO',
                                                       'FUP, Type of medical investigations requested',
                                                       'SFP, X-ray of:',
                                                       'SFP, Video of:',
                                                       'SFP, Photo of:')
                                                      AND cn.concept_id = obs.concept_id AND cn.voided IS FALSE
                                                      AND cn.concept_name_type = 'FULLY_SPECIFIED'
                            GROUP BY person_id, concept_id) latestEncounterWithMedicalHistory
                        INNER JOIN encounter
                          ON latestEncounterWithMedicalHistory.max_encounter_datetime = encounter.encounter_datetime
                             AND latestEncounterWithMedicalHistory.person_id = encounter.patient_id
                             AND encounter.voided IS FALSE
                        INNER JOIN obs o ON encounter.encounter_id = o.encounter_id AND
                                            o.concept_id = latestEncounterWithMedicalHistory.concept_id AND
                                            o.voided IS FALSE
                        INNER JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                                            obs_fscn.name IN
                                                            ('MH, Name of MLO',
                                                             'FSTG, Specialty determined by MLO',
                                                             'FUP, Type of medical investigations requested',
                                                             'SFP, X-ray of:',
                                                             'SFP, Video of:',
                                                             'SFP, Photo of:')
                                                            AND obs_fscn.voided IS FALSE AND
                                                            obs_fscn.concept_name_type = 'FULLY_SPECIFIED'
                        LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                             AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                             AND coded_fscn.voided IS FALSE
                        LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                            AND coded_fscn.concept_name_type = 'SHORT'
                                                            AND coded_scn.voided IS FALSE
                      GROUP BY o.person_id
                    ) obs_across_visits ON p.person_id = obs_across_visits.person_id
          LEFT JOIN (SELECT
                       v.visit_id     AS visit_id,
                       v.patient_id   AS patient_id,
                       v.date_stopped AS date_stopped,
                       vt.name        AS visit_type
                     FROM visit v
                       INNER JOIN visit_type vt ON v.visit_type_id = vt.visit_type_id AND vt.retired IS FALSE
                       INNER JOIN (SELECT
                                     patient_id        AS patient_id,
                                     max(date_started) AS max_date_started
                                   FROM visit
                                   WHERE voided IS FALSE
                                   GROUP BY patient_id) visit_info ON visit_info.patient_id = v.patient_id
                                                                      AND visit_info.max_date_started = v.date_started
                                                                      AND v.voided IS FALSE
                    ) latest_visit
            ON latest_visit.patient_id = p.person_id
          LEFT JOIN (select
                       o.person_id,
                       o.value_coded AS 'FUP_VALUE',
                       o.date_created AS 'FUP_DC'
                     FROM obs o
                       INNER JOIN(
                                   SELECT
                                     o.person_id,
                                     MAX(o.date_created) AS 'obs_datecreated',
                                     o.concept_id
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND cn.voided IS FALSE AND
                                                                   cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name ='FUP, Type of medical investigations requested'
                                   GROUP BY o.person_id)latest_obsdatetime ON latest_obsdatetime.obs_datecreated = o.date_created AND latest_obsdatetime.person_id = o.person_id
                                                                              AND latest_obsdatetime.concept_id = o.concept_id GROUP BY latest_obsdatetime.person_id

                    )followuptypevalue ON followuptypevalue.person_id = p.person_id
          LEFT JOIN (select
                       o.person_id,
                       o.value_text AS 'SFP_VALUE',
                       o.date_created AS 'SFP_DC'
                     FROM obs o
                       INNER JOIN(
                                   SELECT
                                     o.person_id,
                                     MAX(o.date_created) AS 'obs_datecreated',
                                     o.concept_id
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND cn.voided IS FALSE AND
                                                                   cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name IN ('SFP, X-ray of:', 'SFP, Video of:', 'SFP, Photo of:')
                                   GROUP BY o.person_id)latest_obsdatetime ON latest_obsdatetime.obs_datecreated = o.date_created AND latest_obsdatetime.person_id = o.person_id
                                                                              AND latest_obsdatetime.concept_id = o.concept_id GROUP BY latest_obsdatetime.person_id

                    )surgeontypevalue ON surgeontypevalue.person_id = p.person_id
        WHERE (
          followupInfo.outcomeFollowupSurgicalValidation = 'Continue under follow-up'
          OR
          (
            currentProgramState = 'Network Follow-up'
            AND
            previousProgramState IN ('Pre-Operative', 'Surgical / Hospitalisation', 'Rehabilitation')
            AND
            latest_visit.date_stopped IS NOT NULL
            AND
            latest_visit.visit_type = 'Hospital'
          )
        )