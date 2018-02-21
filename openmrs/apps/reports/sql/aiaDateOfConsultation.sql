SELECT
  specifiYearData.patient_id,
  MIN(dateOfConsultation.aiaDateOfConsultation) AS aiaDateOfConsultation,
  specifiYearData.preOperativeStartDate
FROM
(SELECT
  preAndNwFlpDateInfo.patient_id,
  CAST(preAndNwFlpDateInfo.preOperativeStartDate AS DATE) AS preOperativeStartDate,
  CAST(IF(YEAR(preAndNwFlpDateInfo.nwFollowUpStartDate)=YEAR('#startDate#'), preAndNwFlpDateInfo.nwFollowUpStartDate, CONCAT(YEAR('#startDate#'),'-12-31')) AS DATE) AS nwFollowUpStartDate
FROM
(SELECT
  preOperativeInfo.patient_id,
  preOperativeInfo.start_date AS `preOperativeStartDate`,
  IF(MIN(nwFollowUpInfo.start_date) IS NULL ,CURDATE(), MIN(nwFollowUpInfo.start_date))        AS `nwFollowUpStartDate`
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
   WHERE cn.name IN ('Pre-Operative') AND YEAR(start_date)<=YEAR('#startDate#')) preOperativeInfo
  LEFT JOIN
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
    ON nwFollowUpInfo.patient_id = preOperativeInfo.patient_id AND
       nwFollowUpInfo.start_date >= preOperativeInfo.start_date
GROUP BY nwFollowUpInfo.patient_id, preOperativeInfo.start_date) preAndNwFlpDateInfo) specifiYearData
INNER JOIN (
  SELECT
    o.person_id,
    CAST(o.obs_datetime AS DATE) AS `aiaDateOfConsultation`
  FROM obs o
    INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                    qcvn.concept_full_name IN (
                                      'AIA, Date of consultation'
                                    ) AND qcvn.retired IS FALSE AND o.voided IS FALSE
  ) dateOfConsultation ON specifiYearData.patient_id = dateOfConsultation.person_id AND
                          dateOfConsultation.aiaDateOfConsultation BETWEEN specifiYearData.preOperativeStartDate AND specifiYearData.nwFollowUpStartDate
GROUP BY dateOfConsultation.person_id, specifiYearData.preOperativeStartDate, specifiYearData.nwFollowUpStartDate;