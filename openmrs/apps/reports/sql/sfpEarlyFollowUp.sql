SELECT
  patientNWFollowUpState.patient_id,
  patientNWFollowUpState.nwFolloUpStartDate,
  CAST(sfpEarlyObsDate.obs_datetime AS DATE ) AS `sfpDateStarted`
FROM
  (SELECT
     p.patient_id,
     CAST(ps.start_date AS DATE) AS nwFolloUpStartDate
   FROM patient p
     INNER JOIN patient_program pp ON p.patient_id = pp.patient_id AND p.voided IS FALSE AND pp.voided IS FALSE
     INNER JOIN patient_state ps ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE
     INNER JOIN program_workflow_state pws
       ON ps.state = pws.program_workflow_state_id AND ps.voided IS FALSE AND pws.retired IS FALSE
     INNER JOIN concept_name cn
       ON pws.concept_id = cn.concept_id AND cn.voided IS FALSE AND cn.concept_name_type = 'FULLY_SPECIFIED' AND
          cn.name = 'Network Follow-up'
   ORDER BY patient_id, start_date) patientNWFollowUpState
  LEFT JOIN (SELECT
               o.person_id,
               o.obs_datetime
             FROM obs o
               INNER JOIN concept_view qcv
                 ON qcv.concept_id = o.concept_id AND
                    qcv.concept_full_name IN ('SFP, Early Follow-up'
                    ) AND qcv.retired IS FALSE AND o.voided IS FALSE
               INNER JOIN concept_view acv ON acv.concept_id = o.value_coded
                                              AND acv.concept_full_name IN
                                                  ('As per planned surgical objectives'
                                                  ) AND acv.retired IS FALSE
            ) sfpEarlyObsDate ON patientNWFollowUpState.patient_id = sfpEarlyObsDate.person_id
WHERE YEAR(patientNWFollowUpState.nwFolloUpStartDate) = YEAR('#startDate#');