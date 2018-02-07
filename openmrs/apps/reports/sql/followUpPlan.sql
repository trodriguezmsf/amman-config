SELECT
  nwFollowUpInfo.patient_id               AS `patient_id`,
  followUpPlan.followUpPlan               AS `followUpPlan`,
  CAST(followUpPlan.obs_datetime AS DATE) AS `followUpPlanDate`,
  CAST(nwFollowUpInfo.start_date AS DATE) AS `nwFollowUpStartDate`
FROM
  (SELECT
     patient_id,
     name,
     start_date
   FROM patient_state ps
     INNER JOIN patient_program pp
       ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
     INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
     LEFT JOIN concept_name cn
       ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
   WHERE cn.name IN ('Network Follow-up')) nwFollowUpInfo
  INNER JOIN (
               SELECT
                 person_id             AS patient_id,
                 o.obs_datetime,
                 cna.concept_full_name AS followUpPlan,
                 o.value_coded
               FROM obs o
                 INNER JOIN concept_view cnq
                   ON o.concept_id = cnq.concept_id AND cnq.concept_full_name = 'SFP, follow-up plan'
                      AND cnq.retired IS FALSE
                 INNER JOIN concept_view cna ON cna.concept_id = o.value_coded AND cna.retired IS FALSE
             ) followUpPlan
    ON followUpPlan.patient_id = nwFollowUpInfo.patient_id
WHERE YEAR(followUpPlan.obs_datetime) = YEAR('#startDate#') AND YEAR(nwFollowUpInfo.start_date) = YEAR('#startDate#')
