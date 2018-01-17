SELECT
  DATE_FORMAT(dateOfArraival.value, '%d-%m-%Y') AS date_of_arrival,
  DATE_FORMAT(bpam.date_created, '%d-%m-%Y')    AS `admissionDate`,
  bpam.patient_id,
  CONCAT(bpam.patient_id, b.bed_id ,DATE_FORMAT(bpam.date_created, '%d%m%Y') ) AS `patient_bed_admission_date`,
  b.bed_id,
  b.bed_number,
  l.name               AS `location`,
  bedTagsInfo.name          AS `bedTag`,
  bedTagsInfo.`Date Started`         AS `Bed Tag Start time`,
  bedTagsInfo.`Date Stopped`         AS `Bed Tag End time`,
  dischargeDetails.bed_discharge_date AS `Discharge Time`,
  programStateDetails.currentState,
  programStateDetails.previousState,
  DATE_FORMAT(programStateDetails.dateMovedToNWfollowup, '%d-%m-%Y')          AS `Date moved to network followup state`,
  DATE_FORMAT(programStateDetails.dateMovedToPreOperative, '%d-%m-%Y')               AS `Date moved to preOperative state`,
  TIMESTAMPDIFF(DAY, programStateDetails.preOperativeDate,programStateDetails.dateMovedToNWfollowup) as `Difference`
FROM bed b
  INNER JOIN bed_location_map blm ON blm.bed_id = b.bed_id AND b.voided IS FALSE
  INNER JOIN bed_patient_assignment_map bpam ON b.bed_id = bpam.bed_id AND bpam.voided IS FALSE
  INNER JOIN
  (
    SELECT
      bpam.patient_id,
      MAX(bpam.date_stopped) AS `bed_discharge_date`,
      dischargeTimes.date_created
    FROM bed_patient_assignment_map bpam
      INNER JOIN (
                   SELECT e.patient_id, e.date_created FROM encounter e
                     INNER JOIN encounter_type et ON e.encounter_type = et.encounter_type_id and et.name = 'DISCHARGE'
                 ) dischargeTimes ON bpam.patient_id = dischargeTimes.patient_id AND bpam.date_stopped <= dischargeTimes.date_created
    GROUP BY bpam.patient_id,dischargeTimes.date_created
  ) dischargeDetails ON bpam.patient_id = dischargeDetails.patient_id AND bpam.date_stopped = dischargeDetails.bed_discharge_date
  INNER JOIN location l ON blm.location_id = l.location_id AND l.retired IS FALSE
  LEFT JOIN (
              SELECT
                pa.person_id,
                pa.value
              FROM
                person_attribute pa
                INNER JOIN person_attribute_type pat
                  ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.name = 'dateofArrival'
                     AND pat.retired IS FALSE
                     AND pa.voided IS FALSE
            ) dateOfArraival
    ON dateOfArraival.person_id = bpam.patient_id
  LEFT JOIN (
              SELECT
                programStDates.patient_id,
                programStDates.preOperativeDate,
                programStDates.maxDate,
                allProgramStateNames.name                    AS `currentState`,
                programStDates.secondMaxDate,
                allProgramStateNamesForPreviousState.name    AS `previousState`,

                IF(allProgramStateNames.name = 'Network Follow-up', maxDate, IF(allProgramStateNamesForPreviousState.name = 'Network Follow-up', secondMaxDate,NULL )) AS `dateMovedToNWfollowup`,
                IF(allProgramStateNames.name = 'Pre-Operative', maxDate, IF(allProgramStateNamesForPreviousState.name = 'Pre-Operative', secondMaxDate,NULL )) AS `dateMovedToPreOperative`
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
                                                                    allProgramStateNamesForPreviousState.start_date = programStDates.secondMaxDate
            ) programStateDetails ON bpam.patient_id = programStateDetails.patient_id
  LEFT OUTER JOIN (SELECT
                     btm.bed_id,
                     bpam.bed_patient_assignment_map_id,
                     bt.name,
                     GREATEST(btm.date_created, bpam.date_started) AS `Date Started`,
                     IF(btm.date_voided IS NULL AND
                        bpam.date_stopped IS NULL,
                        NULL,
                        LEAST(IFNULL(btm.date_voided, now()),
                              IFNULL(bpam.date_stopped,
                                     now())))                      AS `Date Stopped`
                   FROM bed_tag_map btm
                     INNER JOIN bed_tag bt
                       ON btm.bed_tag_id = bt.bed_tag_id AND bt.voided IS FALSE
                     INNER JOIN bed_patient_assignment_map bpam
                       ON bpam.bed_id = btm.bed_id AND bpam.voided IS FALSE
                     INNER JOIN person p
                       ON p.person_id = bpam.patient_id AND p.voided IS FALSE
                          AND NOT
                          (
                            btm.date_voided IS NOT NULL &&
                            btm.date_voided < bpam.date_started
                            OR
                            bpam.date_stopped IS NOT NULL &&
                            btm.date_created > bpam.date_stopped
                          )
                  ) bedTagsInfo
    ON bedTagsInfo.bed_patient_assignment_map_id = bpam.bed_patient_assignment_map_id AND bedTagsInfo.bed_id = bpam.bed_id
ORDER BY bpam.patient_id;
