SELECT patient_id,
  CAST(actual_start_datetime AS DATE ) AS surgeryStartDate,
  status
FROM surgical_appointment
WHERE status = 'COMPLETED' AND YEAR(actual_start_datetime) = YEAR('#startDate#')
ORDER BY patient_id