SELECT
  patientsUnderNwFlp.patient_id,
  patientsUnderNwFlp.start_date,
  CAST(IF(pp2.date_completed IS NULL OR pp2.date_completed > patientsUnderNwFlp.end_date, patientsUnderNwFlp.end_date, pp2.date_completed) AS DATE) AS end_date
FROM
(SELECT
  patientsEnteredNwFlpInHospitalVisit.patient_id,
  patientsEnteredNwFlpInHospitalVisit.start_date,
  CAST(IF(MIN(v2.date_started) IS NULL, DATE_ADD(CURDATE(), INTERVAL 31 DAY), MIN(v2.date_started)) AS DATE) AS end_date
FROM
  (SELECT
     nwStateWithVisit.patient_id,
     nwStateWithVisit.start_date,
     nwStateWithVisit.end_date,
     visitInfo.date_stopped AS visit_date_stopped
   FROM
     (SELECT
        nwStateInfo.patient_id,
        nwStateInfo.start_date,
        nwStateInfo.end_date,
        MAX(prevVisit.date_stopped) AS `visit_date_stopped`
      FROM
        (SELECT
           nwFlpInfo.patient_id,
           nwFlpInfo.start_date,
           nwFlpInfo.end_date
         FROM
           (SELECT
              patient_id,
              cn.name,
              start_date,
              IF(name = 'Network Follow-up' AND end_date IS NULL, DATE_ADD(CURDATE(), INTERVAL 31 DAY),
                 end_date) AS end_date
            FROM patient_state ps
              INNER JOIN patient_program pp
                ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
              INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
              INNER JOIN concept_name cn
                ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
                   AND cn.name = 'Network Follow-up'
            ORDER BY patient_id, start_date) nwFlpInfo
           LEFT JOIN (
                       SELECT
                         patient_id,
                         cn.name,
                         start_date,
                         end_date
                       FROM patient_state ps
                         INNER JOIN patient_program pp
                           ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND
                              pp.voided IS FALSE
                         INNER JOIN program_workflow_state pws
                           ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
                         INNER JOIN concept_name cn
                           ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND
                              cn.voided IS FALSE
                       ORDER BY patient_id, start_date
                     ) allStates
             ON allStates.end_date = nwFlpInfo.start_date AND allStates.patient_id = nwFlpInfo.patient_id
         WHERE allStates.name IN ('Pre-Operative', 'Surgical / Hospitalisation', 'Rehabilitation')) nwStateInfo
        LEFT JOIN visit prevVisit
          ON prevVisit.patient_id = nwStateInfo.patient_id AND prevVisit.date_started < nwStateInfo.start_date AND
             prevVisit.voided IS FALSE
      GROUP BY nwStateInfo.patient_id, nwStateInfo.start_date, nwStateInfo.end_date) nwStateWithVisit
     LEFT JOIN (SELECT
                  v.date_stopped,
                  vt.name,
                  v.patient_id
                FROM visit v
                  INNER JOIN visit_type vt
                    ON v.visit_type_id = vt.visit_type_id AND v.voided IS FALSE AND vt.retired IS FALSE AND
                       vt.name = 'Hospital'
               ) visitInfo ON nwStateWithVisit.visit_date_stopped = visitInfo.date_stopped AND
                              visitInfo.patient_id = nwStateWithVisit.patient_id
   WHERE visitInfo.name = 'Hospital') patientsEnteredNwFlpInHospitalVisit
  LEFT JOIN visit v2 ON v2.date_started > patientsEnteredNwFlpInHospitalVisit.visit_date_stopped AND
                        v2.patient_id = patientsEnteredNwFlpInHospitalVisit.patient_id AND
                        v2.voided IS FALSE
GROUP BY patientsEnteredNwFlpInHospitalVisit.patient_id,
  patientsEnteredNwFlpInHospitalVisit.start_date,
  patientsEnteredNwFlpInHospitalVisit.end_date,
  patientsEnteredNwFlpInHospitalVisit.visit_date_stopped

UNION

SELECT
  flpOutcomeAndNextRecentVisit.patient_id,
  flpOutcomeObsDate                                                                                AS start_date,
  CAST(IF(v2.date_started IS NULL, DATE_ADD(CURDATE(), INTERVAL 31 DAY), v2.date_started) AS DATE) AS end_date
FROM
  (SELECT
     continueUndrFlpInfo.patient_id,
     continueUndrFlpInfo.flpOutcomeObsDate,
     continueUndrFlpInfo.visit_id,
     MIN(visitInfo.date_started) AS nextRecentVisit,
     vt.name
   FROM
     (SELECT
        person_id                    AS patient_id,
        CAST(o.obs_datetime AS DATE) AS flpOutcomeObsDate,
        cna.concept_full_name        AS fupOutCome,
        e.visit_id
      FROM obs o
        INNER JOIN concept_view cnq
          ON o.concept_id = cnq.concept_id AND cnq.concept_full_name = 'FUP, Outcomes for follow-up surgical validation'
             AND cnq.retired IS FALSE AND o.voided IS FALSE AND cnq.retired IS FALSE
        INNER JOIN concept_view cna ON cna.concept_id = o.value_coded AND
                                       cna.concept_full_name = 'Continue under follow-up' AND cna.retired IS FALSE
        INNER JOIN encounter e ON o.encounter_id = e.encounter_id AND e.voided IS FALSE) continueUndrFlpInfo
     INNER JOIN visit vst ON vst.visit_id = continueUndrFlpInfo.visit_id
     INNER JOIN visit_type vt ON vst.visit_type_id = vt.visit_type_id
     LEFT JOIN (
                 SELECT
                   patient_id,
                   visit_id,
                   date_started
                 FROM visit v
               ) visitInfo
       ON visitInfo.date_started > vst.date_stopped AND visitInfo.patient_id = continueUndrFlpInfo.patient_id
   GROUP BY continueUndrFlpInfo.visit_id, continueUndrFlpInfo.flpOutcomeObsDate) flpOutcomeAndNextRecentVisit
  LEFT JOIN visit v2 ON v2.date_started = flpOutcomeAndNextRecentVisit.nextRecentVisit AND
                        v2.patient_id = flpOutcomeAndNextRecentVisit.patient_id) patientsUnderNwFlp
LEFT JOIN patient_program pp2 ON pp2.patient_id = patientsUnderNwFlp.patient_id AND pp2.voided IS FALSE
ORDER BY patient_id;