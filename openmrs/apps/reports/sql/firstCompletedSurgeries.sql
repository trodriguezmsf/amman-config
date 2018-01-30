SELECT
  firstSurgeryDetails.patient_id                 AS patient_id,
  MAX(CAST(preOperativeDate.start_date AS DATE)) AS recentPreOperativeDate,
  CAST(surgeryStartDate AS DATE)                 AS surgeryStartDate
FROM
  (SELECT
     patient_id,
     MIN(CAST(sb.start_datetime AS DATE)) AS surgeryStartDate,
     CAST(sa.date_changed AS DATE)        AS dateChanged,
     sa.status
   FROM
     surgical_appointment sa
     INNER JOIN surgical_block sb ON sa.surgical_block_id = sb.surgical_block_id AND
                                     sb.voided IS FALSE AND sa.voided IS FALSE AND status = 'Completed'
   GROUP BY patient_id) firstSurgeryDetails
  INNER JOIN
  (SELECT
     pp3.patient_id,
     ps3.start_date,
     cn.name
   FROM patient_state ps3
     INNER JOIN patient_program pp3 ON ps3.patient_program_id = pp3.patient_program_id AND
                                       pp3.voided IS FALSE AND ps3.voided IS FALSE
     INNER JOIN program_workflow_state pws
       ON ps3.state = pws.program_workflow_state_id AND pws.retired IS FALSE
     INNER JOIN concept_name cn
       ON cn.concept_id = pws.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED'
          AND cn.voided IS FALSE AND cn.name = 'Pre-Operative') preOperativeDate ON
                                                                                   preOperativeDate.patient_id =
                                                                                   firstSurgeryDetails.patient_id AND
                                                                                   preOperativeDate.start_date <=
                                                                                   firstSurgeryDetails.surgeryStartDate
GROUP BY preOperativeDate.patient_id, firstSurgeryDetails.surgeryStartDate

