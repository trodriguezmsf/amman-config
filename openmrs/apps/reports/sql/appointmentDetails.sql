SELECT
  patient_id,
  DATE_FORMAT(start_date_time,'%c/%e/%y') AS `startDateTime`,
  status
FROM patient_appointment;