DELETE FROM global_property where property = 'emrapi.sqlSearch.patientsAdmittoWard';
 select uuid() into @uuid;
 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.patientsAdmittoWard',
"SELECT DISTINCT
  pi.identifier                                         AS identifier,
  concat(pn.given_name, ' ', pn.family_name)            AS name,
  p.gender                                              AS gender,
  floor(DATEDIFF(CURDATE(), p.birthdate) / 365)         AS age,
  MAX(DATE_FORMAT(o.obs_datetime,'%d %b %Y %h:%i %p'))  AS 'Disposition Date',
  'Admit To Ward'                                       AS status,
  concat('', p.uuid)                                    AS uuid,
  concat('', v.uuid)                                    AS activeVisitUuid
FROM person p
  JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE AND p.voided IS FALSE
  JOIN patient_identifier pi ON p.person_id = pi.patient_id AND pi.voided IS FALSE
  JOIN patient_identifier_type pit ON pi.identifier_type = pit.patient_identifier_type_id AND pit.retired IS FALSE
  JOIN visit v ON p.person_id = v.patient_id AND v.voided IS FALSE
  JOIN encounter e ON v.visit_id = e.visit_id AND e.voided IS FALSE
  JOIN obs o ON e.encounter_id = o.encounter_id AND o.voided IS FALSE
  JOIN concept c ON o.value_coded = c.concept_id AND c.retired IS FALSE
  JOIN concept_name cn ON c.concept_id = cn.concept_id AND cn.voided IS FALSE
  JOIN location l ON l.uuid = ${visit_location_uuid} AND v.location_id = l.location_id AND l.retired IS FALSE
WHERE v.date_stopped IS NULL AND cn.name = 'Admit to Ward' AND v.visit_id NOT IN (SELECT visit_id
                                                                                  FROM encounter ie
                                                                                    JOIN encounter_type iet
                                                                                      ON iet.encounter_type_id =
                                                                                         ie.encounter_type
                                                                                         AND ie.voided IS FALSE
                                                                                         AND iet.retired IS FALSE
                                                                                  WHERE iet.name = 'ADMISSION')
GROUP BY pi.identifier;",'Patients Admit to Ward',@uuid);