SELECT nwFollowUpInfo.patient_id,
  CAST(MAX(preOperativeInfo.start_date) AS DATE ) AS `preOperativeStartDate`,
  CAST(nwFollowUpInfo.start_date AS DATE ) AS `nwFollowUpStartDate`
FROM
  (SELECT
     patient_id,
     name,
     start_date
   FROM patient_state ps
     INNER JOIN patient_program pp ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
     INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
     LEFT JOIN concept_name cn ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
   WHERE cn.name IN ('Network Follow-up')) nwFollowUpInfo
  INNER JOIN
  (SELECT
     patient_id,
     name,
     start_date
   FROM patient_state ps
     INNER JOIN patient_program pp ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
     INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
     LEFT JOIN concept_name cn ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
   WHERE cn.name IN ('Pre-Operative')) preOperativeInfo
    ON nwFollowUpInfo.patient_id = preOperativeInfo.patient_id AND
     nwFollowUpInfo.start_date >= preOperativeInfo.start_date
GROUP BY nwFollowUpInfo.patient_id,nwFollowUpInfo.start_date