SELECT
  patient_id,
  patientComplication,
  patientComplicationDate,
  cmpltdSurgeryStartDate
FROM
(SELECT
  o.person_id,
  GROUP_CONCAT( DISTINCT if(qcvn.concept_full_name = 'CC, Patient complication',acvn.concept_full_name, NULL))                              AS `patientComplication`,
  GROUP_CONCAT(DISTINCT if(qcvn.concept_full_name = 'CC, Start date of complication',
                          CAST(o.value_datetime AS DATE), NULL))                                                                             AS `patientComplicationDate`
  FROM obs o
  INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                  qcvn.concept_full_name IN (
                                                             'CC, Start date of complication',
                                                             'CC, Patient complication') AND qcvn.retired IS FALSE AND o.voided IS FALSE
  LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
GROUP BY o.encounter_id
HAVING patientComplication = 'Surgical Site Infection')InfectionInfo
  INNER JOIN
(SELECT patient_id,
  CAST(actual_start_datetime AS DATE ) AS cmpltdSurgeryStartDate,
  status
FROM surgical_appointment
WHERE status = 'COMPLETED') surgeryInfo
ON InfectionInfo.person_id = surgeryInfo.patient_id
WHERE patientComplicationDate IS NOT NULL AND YEAR(cmpltdSurgeryStartDate) = YEAR('#startDate#')

