SELECT
  nwAndPreOpStateInfo.patient_id,
  CAST(nwAndPreOpStateInfo.preOperativeStartDate AS DATE) AS `preOperativeStartDate`,
  CAST(nwAndPreOpStateInfo.nwFollowUpStartDate AS DATE) AS `nwFollowUpStartDate`,
  CAST(sb.start_datetime AS DATE) AS surgeryStartDate,
  sa.status
FROM
  (SELECT
     nwFollowUpInfo.patient_id,
     MAX(preOperativeInfo.start_date) AS `preOperativeStartDate`,
     nwFollowUpInfo.start_date        AS `nwFollowUpStartDate`
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
     INNER JOIN
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
      WHERE cn.name IN ('Pre-Operative')) preOperativeInfo
       ON nwFollowUpInfo.patient_id = preOperativeInfo.patient_id AND
          nwFollowUpInfo.start_date >= preOperativeInfo.start_date
   GROUP BY nwFollowUpInfo.patient_id, nwFollowUpInfo.start_date) nwAndPreOpStateInfo
  INNER JOIN surgical_appointment sa ON sa.patient_id = nwAndPreOpStateInfo.patient_id AND sa.voided IS FALSE
  INNER JOIN surgical_block sb ON sa.surgical_block_id = sb.surgical_block_id AND sb.voided IS FALSE AND
                                  sb.start_datetime BETWEEN nwAndPreOpStateInfo.preOperativeStartDate AND nwAndPreOpStateInfo.nwFollowUpStartDate
ORDER BY patient_id, surgeryStartDate;
