SELECT
  patient_id,
  CAST(MIN(pa.start_date_time) AS DATE) AS first_non_IA_appointment
FROM patient_appointment pa
  INNER JOIN appointment_service asr ON asr.appointment_service_id = pa.appointment_service_id AND
                                        asr.name IN ('Physiotherapy OPD', 'Physiotherapy Ward') AND
                                        asr.voided IS FALSE
  INNER JOIN appointment_service_type ast ON ast.appointment_service_type_id = pa.appointment_service_type_id
                                             AND ast.name NOT IN ('IA1', 'IA2')
                                            AND ast.voided IS FALSE
WHERE status NOT IN ('Canceled', 'Missed') AND pa.voided IS FALSE AND YEAR(pa.start_date_time) = YEAR('#startDate#')
GROUP BY patient_id