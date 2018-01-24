SELECT patient_id,
  CAST(actual_start_datetime AS DATE ),
  status
FROM surgical_appointment
WHERE status = 'COMPLETED'
ORDER BY patient_id