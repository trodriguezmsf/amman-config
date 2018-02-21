SELECT
  pa.patient_id,
  aps.name                         AS service_type,
  ast.name                         AS sub_service_type,
  CAST(pa.start_date_time AS DATE) AS start_date,
  ast.duration_mins                AS duration_time,
  pa.status                        AS status
FROM
  (SELECT
     aps.appointment_service_id,
     aps.name
   FROM appointment_service aps
   WHERE aps.name IN ('Physiotherapy OPD', 'Physiotherapy Ward')) aps
  INNER JOIN
  (SELECT
     pa.patient_id,
     pa.start_date_time,
     pa.status,
     pa.appointment_service_id,
     pa.appointment_service_type_id
   FROM patient_appointment pa
   WHERE pa.status NOT IN ('Cancelled')) pa ON pa.appointment_service_id = aps.appointment_service_id
  LEFT JOIN
  (SELECT
     ast.name,
     ast.duration_mins,
     appointment_service_type_id
   FROM appointment_service_type ast) ast ON pa.appointment_service_type_id = ast.appointment_service_type_id
  WHERE ast.name NOT IN ('IA1','IA2', 'TRM1') OR ast.name IS NULL
      AND YEAR(pa.start_date_time) = YEAR('#startDate#');
