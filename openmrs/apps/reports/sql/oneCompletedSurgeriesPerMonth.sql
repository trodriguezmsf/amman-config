SELECT
  patient_id,
  CAST(actual_start_datetime AS DATE) AS actualStartDate,
  status
FROM surgical_appointment
WHERE status = 'COMPLETED'
GROUP BY patient_id, MONTH(actual_start_datetime)
ORDER BY patient_id