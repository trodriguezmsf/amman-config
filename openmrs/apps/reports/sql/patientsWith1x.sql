SELECT
  patient_id,
  CAST(start_date_time AS DATE) appointmentStartDate
FROM patient_appointment pa
  INNER JOIN appointment_service asr ON asr.appointment_service_id = pa.appointment_service_id AND
                                        asr.name IN ('Physiotherapy OPD', 'Physiotherapy Ward') AND
                                        asr.voided IS FALSE
  INNER JOIN appointment_service_type ast ON ast.appointment_service_type_id = pa.appointment_service_type_id
                                             AND ast.voided IS FALSE
WHERE status != 'Cancelled' AND YEAR(start_date_time) = YEAR('#startDate#')
GROUP BY patient_id, MONTH(start_date_time)
HAVING (
  MIN(
      CASE ast.name
      WHEN '1x session'
        THEN 1
      WHEN 'POP'
        THEN 1
      WHEN 'POP2'
        THEN 1
      WHEN '1x2 session'
        THEN 1
      ELSE
        0
      END
  ) != 0
);