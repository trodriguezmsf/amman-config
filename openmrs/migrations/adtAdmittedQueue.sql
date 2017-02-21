UPDATE global_property SET property_value = "SELECT DISTINCT
  pi.identifier                                    AS identifier,
  concat(pn.given_name, ' ', pn.family_name)       AS name,
  FLOOR(DATEDIFF(CURDATE(), p.birthdate) / 365)    AS age,
  p.gender                                         AS gender,
  parentLocation.name                              AS department,
  b.bed_number                                     AS `Bed No`,
  DATE_FORMAT(bpam.date_started, '%Y-%m-%d %H:%i') AS `Admitted On`,
  'Transfer/Discharge'                             AS 'Action',
  concat('', p.uuid)                               AS uuid,
  concat('', v.uuid)                               AS activeVisitUuid
FROM visit v
  JOIN person_name pn ON v.patient_id = pn.person_id AND pn.voided IS FALSE
  JOIN patient_identifier pi ON v.patient_id = pi.patient_id AND pi.voided IS FALSE
  JOIN patient_identifier_type pit ON pi.identifier_type = pit.patient_identifier_type_id AND pit.retired IS FALSE
  JOIN global_property gp ON gp.property = 'emr.primaryIdentifierType' AND gp.property_value = pit.uuid
  JOIN person p ON v.patient_id = p.person_id AND p.voided IS FALSE
  JOIN bed_patient_assignment_map bpam ON bpam.patient_id = p.person_id AND bpam.date_stopped IS NULL AND bpam.voided IS FALSE
  JOIN bed b ON b.bed_id = bpam.bed_id AND b.voided IS FALSE
  JOIN visit_attribute va ON v.visit_id = va.visit_id AND va.value_reference = 'Admitted' AND va.voided IS FALSE
  JOIN visit_attribute_type vat ON vat.visit_attribute_type_id = va.attribute_type_id AND vat.name = 'Admission Status' AND vat.retired IS FALSE
  JOIN bed_location_map blm ON b.bed_id = blm.bed_id
  JOIN location childLocation on blm.location_id = childLocation.location_id AND childLocation.retired IS FALSE
  JOIN location parentLocation ON parentLocation.location_id = childLocation.parent_location AND parentLocation.retired IS FALSE
WHERE v.date_stopped IS NULL AND v.voided IS FALSE" where property = "emrapi.sqlSearch.admittedPatients"
