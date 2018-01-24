SELECT
  patient_id,
  CAST(start_date_time AS DATE ) AS `startDateTime`,
  status
FROM patient_appointment;