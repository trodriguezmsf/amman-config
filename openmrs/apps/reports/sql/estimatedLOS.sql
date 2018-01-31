SELECT
  patient_id,
  estimatedLOSValue,
  estimatedFrequency,
  CAST(preOperativeStartDate AS DATE ) AS preOperativeStartDate,
  CAST(nwFollowUpStartDate AS DATE) AS nwFollowUpStartDateAS,
  CAST(surgeryStartDate AS DATE) AS surgeryStartDateAS,
  CASE WHEN estimatedLOSValue = '61-90 days' AND dateDifference BETWEEN 61 AND 90 THEN 1
  WHEN estimatedLOSValue = '30-60 days' AND dateDifference BETWEEN 30 AND 60 THEN 1
  WHEN estimatedLOSValue = '91-120 days' AND dateDifference BETWEEN 91 AND 120 THEN 1
  WHEN estimatedLOSValue = 'Less than 30 days' AND dateDifference < 30 THEN 1
  WHEN estimatedLOSValue = 'More than 120 days' AND dateDifference > 120 THEN 1
  ELSE 0
  END AS considerDateDiff,
  CASE WHEN numberOfSurgeries = estimatedFrequency THEN 1
    ELSE 0 END AS considerFreq
FROM (SELECT estimatedLOS.patient_id,
  estimatedLOS.estimatedLOSValue,
  CASE WHEN frequencyOfOperations.estimatedFrequency = 'One Operation' THEN '1'
  WHEN frequencyOfOperations.estimatedFrequency = 'Two Operations' THEN '2'
    ELSE frequencyOfOperations.estimatedFrequency END AS estimatedFrequency,
  surgeryDetails.preOperativeStartDate,
  surgeryDetails.nwFollowUpStartDate,
  surgeryDetails.surgeryStartDate,
  actualData.dateDifference,
  actualData.numberOfSurgeries
FROM
  (SELECT
     o.person_id           AS patient_id,
     cna.concept_full_name AS estimatedLOSValue
   FROM obs o
     INNER JOIN concept_view cnq
       ON cnq.concept_id = o.concept_id AND cnq.concept_full_name = 'SAP, Estimated length of stay'
          AND cnq.retired IS FALSE
     LEFT JOIN concept_view cna ON cna.concept_id = o.value_coded AND cna.retired IS FALSE) estimatedLOS
  LEFT JOIN (
              SELECT
                operationFrequency.patient_id,
                if(operationFrequency.frequency = 'Multiple Operations (+2)', multipleOperations.estimatedSurgeries,
                   frequency) AS estimatedFrequency
              FROM (
                     SELECT
                       o.person_id           AS patient_id,
                       obs_datetime,
                       cna.concept_full_name AS frequency
                     FROM obs o
                       INNER JOIN concept_view cnq
                         ON cnq.concept_id = o.concept_id AND cnq.concept_full_name = 'SAP, Frequency of Operations'
                            AND cnq.retired IS FALSE
                       INNER JOIN concept_view cna ON cna.concept_id = o.value_coded AND cna.retired IS FALSE
                   ) operationFrequency
                LEFT  JOIN
                (
                  SELECT
                    o.person_id     AS patient_id,
                    obs_datetime,
                    o.value_numeric AS estimatedSurgeries
                  FROM obs o
                    INNER JOIN concept_view cn
                      ON cn.concept_id = o.concept_id AND cn.concept_full_name = 'SAP, Estimated number of surgeries'
                ) multipleOperations
                  ON multipleOperations.patient_id = operationFrequency.patient_id
                     AND operationFrequency.obs_datetime = multipleOperations.obs_datetime
            ) frequencyOfOperations ON frequencyOfOperations.patient_id = estimatedLOS.patient_id
  INNER JOIN
  (SELECT
     nwAndPreOpStateInfo.patient_id,
     CAST(nwAndPreOpStateInfo.preOperativeStartDate AS DATE) AS `preOperativeStartDate`,
     CAST(nwAndPreOpStateInfo.nwFollowUpStartDate AS DATE)   AS `nwFollowUpStartDate`,
     CAST(sb.start_datetime AS DATE)                         AS surgeryStartDate
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
     INNER JOIN surgical_block sb
       ON sa.surgical_block_id = sb.surgical_block_id AND sb.voided IS FALSE AND sa.status = 'COMPLETED'
          AND
          sb.start_datetime BETWEEN nwAndPreOpStateInfo.preOperativeStartDate AND nwAndPreOpStateInfo.nwFollowUpStartDate
  ) surgeryDetails
    ON surgeryDetails.patient_id = estimatedLOS.patient_id
INNER JOIN (
    SELECT
     nwAndPreOpStateInfo.patient_id,
     DATEDIFF(nwFollowUpStartDate,preOperativeStartDate) AS dateDifference,
     count(*) AS numberOfSurgeries
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
     INNER JOIN surgical_block sb
     ON sa.surgical_block_id = sb.surgical_block_id AND sb.voided IS FALSE AND sa.status = 'COMPLETED'
     AND
     sb.start_datetime BETWEEN nwAndPreOpStateInfo.preOperativeStartDate AND nwAndPreOpStateInfo.nwFollowUpStartDate
GROUP  BY patient_id,preOperativeStartDate,nwFollowUpStartDate ) actualData
ON actualData.patient_id = estimatedLOS.patient_id
WHERE frequencyOfOperations.estimatedFrequency IS NOT NULL) allDetails
