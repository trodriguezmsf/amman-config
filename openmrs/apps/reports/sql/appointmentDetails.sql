select patient_id,
  CAST(start_date_time AS DATE) AS `startDate`,
  l.name AS `location`,
  status,
  appSer.name as `appointment_service`,
  ast.name    as `appointment_service_sub`,
  provider.name,
  pa.status
from patient_appointment pa
  LEFT JOIN location l ON l.location_id = pa.location_id AND l.retired IS FALSE AND pa.voided IS FALSE
  INNER JOIN appointment_service appSer ON appSer.appointment_service_id = pa.appointment_service_id
                                          AND appSer.voided IS FALSE
  LEFT JOIN appointment_service_type ast ON pa.appointment_service_type_id = ast.appointment_service_type_id AND ast.voided IS FALSE
  LEFT JOIN (
      SELECT
        p.provider_id,
        CONCAT(pn.given_name , ' ', pn.family_name) as `name`
      from provider p
        INNER JOIN person_name pn ON pn.person_id = p.person_id AND pn.voided IS FALSE AND p.retired IS FALSE
    ) provider ON pa.provider_id = provider.provider_id
WHERE year(start_date_time)=YEAR('#startDate#')

