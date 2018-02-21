SELECT
  nwFollowUpInfo.patient_id               AS `patient_id`,
  fupOutCome.fupOutCome                   AS `fupOutCome`,
  CAST(fupOutCome.obs_datetime AS DATE)   AS `fupOutComeDate`,
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
                 cna.concept_full_name AS fupOutCome,
                 o.value_coded
               FROM obs o
                 INNER JOIN concept_view cnq
                   ON o.concept_id = cnq.concept_id AND cnq.concept_full_name = 'FUP, Outcomes for follow-up surgical validation'
                      AND cnq.retired IS FALSE
                 INNER JOIN concept_view cna ON cna.concept_id = o.value_coded AND cna.retired IS FALSE
             ) fupOutCome
    ON fupOutCome.patient_id = nwFollowUpInfo.patient_id
WHERE year(fupOutCome.obs_datetime)=YEAR('#startDate#')