SELECT
                programStDates.patient_id,
                CAST(programStDates.preOperativeDate AS DATE) AS preOperativeDate,
                CAST(programStDates.maxDate AS DATE ) AS maxDate,
                allProgramStateNames.name                    AS `currentState`,
                CAST(programStDates.secondMaxDate AS DATE ) AS secondMaxDate,
                allProgramStateNamesForPreviousState.name    AS `previousState`,

                IF(allProgramStateNames.name = 'Network Follow-up', CAST(maxDate AS DATE ), IF(allProgramStateNamesForPreviousState.name = 'Network Follow-up', CAST(secondMaxDate AS DATE ),NULL )) AS `dateMovedToNWfollowup`,
                IF(allProgramStateNames.name = 'Pre-Operative', CAST(maxDate AS DATE ), IF(allProgramStateNamesForPreviousState.name = 'Pre-Operative', CAST(secondMaxDate AS DATE ),NULL )) AS `dateMovedToPreOperative`
              FROM
                (SELECT
                   pp2.patient_id,
                   ps.start_date                 AS `maxDate`,
                   max(previousState.start_date) AS `secondMaxDate`,
                   max(previousPreOperativeState.start_date) AS `preOperativeDate`
                 FROM patient_state ps
                   INNER JOIN patient_program pp2 ON ps.patient_program_id = pp2.patient_program_id AND
                                                     pp2.voided IS FALSE AND ps.voided IS FALSE
                   LEFT JOIN (
                               SELECT
                                 pp.patient_id,
                                 pp.patient_program_id,
                                 ps2.start_date
                               FROM patient_state ps2
                                 INNER JOIN patient_program pp ON ps2.patient_program_id = pp.patient_program_id AND
                                                                  pp.voided IS FALSE AND ps2.voided IS FALSE
                             ) previousState ON previousState.start_date < ps.start_date AND
                                                previousState.patient_program_id = ps.patient_program_id AND
                                                previousState.patient_id = pp2.patient_id
                   LEFT JOIN (
                               SELECT
                                 pp.patient_id,
                                 pp.patient_program_id,
                                 ps2.start_date
                               FROM patient_state ps2
                                 INNER JOIN patient_program pp ON ps2.patient_program_id = pp.patient_program_id AND
                                                                  pp.voided IS FALSE AND ps2.voided IS FALSE
                                 INNER JOIN program_workflow_state pws ON ps2.state = pws.program_workflow_state_id
                                 INNER JOIN concept_name cn ON cn.concept_id = pws.concept_id AND cn.name = 'Pre-Operative'
                             ) previousPreOperativeState ON previousPreOperativeState.start_date < ps.start_date AND
                                                            previousPreOperativeState.patient_program_id = ps.patient_program_id AND
                                                            previousPreOperativeState.patient_id = pp2.patient_id
                 GROUP BY pp2.patient_id, ps.start_date) programStDates
                INNER JOIN (
                             SELECT
                               pp3.patient_id,
                               ps3.start_date,
                               cn.name
                             FROM patient_state ps3
                               INNER JOIN patient_program pp3 ON ps3.patient_program_id = pp3.patient_program_id AND
                                                                 pp3.voided IS FALSE AND ps3.voided IS FALSE
                               INNER JOIN program_workflow_state pws
                                 ON ps3.state = pws.program_workflow_state_id AND pws.retired IS FALSE
                               INNER JOIN concept_name cn
                                 ON cn.concept_id = pws.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
                           ) allProgramStateNames ON allProgramStateNames.patient_id = programStDates.patient_id AND
                                                     allProgramStateNames.start_date = programStDates.maxDate
                LEFT JOIN (
                            SELECT
                              pp3.patient_id,
                              ps3.start_date,
                              cn.name
                            FROM patient_state ps3
                              INNER JOIN patient_program pp3 ON ps3.patient_program_id = pp3.patient_program_id AND
                                                                pp3.voided IS FALSE AND ps3.voided IS FALSE
                              INNER JOIN program_workflow_state pws
                                ON ps3.state = pws.program_workflow_state_id AND pws.retired IS FALSE
                              INNER JOIN concept_name cn
                                ON cn.concept_id = pws.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
                          ) allProgramStateNamesForPreviousState ON allProgramStateNamesForPreviousState.patient_id = programStDates.patient_id AND
                                                                    allProgramStateNamesForPreviousState.start_date = programStDates.secondMaxDate;