SELECT patient_id,
  actual_start_datetime,
  status
FROM surgical_appointment
WHERE status = 'COMPLETED'
ORDER BY patient_id