select patient_id,
  CAST(start_date_time AS DATE) AS startDate,
  l.name AS location,
  status
from patient_appointment pa
  LEFT JOIN location l ON l.location_id = pa.location_id AND l.retired IS FALSE
WHERE pa.voided IS FALSE