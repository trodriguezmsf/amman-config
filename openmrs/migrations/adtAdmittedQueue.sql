UPDATE global_property SET property_value = "select distinct
  pi.identifier as identifier,
  concat(pn.given_name,' ', pn.family_name) as name,
  FLOOR(DATEDIFF(CURDATE(), p.birthdate)/365) as age,
  p.gender as gender,
  l.name as department,
  bt.name as `Bed Type`,
  b.bed_number as `Bed No`,
  DATE_FORMAT(bpam.date_started, '%Y-%m-%d %H:%i') as `Admitted On`,
  concat('',p.uuid) as uuid,
  concat('',v.uuid) as activeVisitUuid
from visit v
  join person_name pn on v.patient_id = pn.person_id and pn.voided = 0
  join patient_identifier pi on v.patient_id = pi.patient_id
  join patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id
  join global_property gp on gp.property='emr.primaryIdentifierType' and gp.property_value=pit.uuid
  join person p on v.patient_id = p.person_id
  join bed_patient_assignment_map bpam on bpam.patient_id = p.person_id
  join bed b on b.bed_id = bpam.bed_id
  join bed_type bt on bt.bed_type_id = b.bed_type_id
  join visit_attribute va on v.visit_id = va.visit_id and va.value_reference = 'Admitted' and va.voided = 0
  join visit_attribute_type vat on vat.visit_attribute_type_id = va.attribute_type_id and vat.name = 'Admission Status'
  join location l on l.uuid=${visit_location_uuid} and v.location_id = l.location_id
where v.date_stopped is null AND v.voided = 0" where property = "emrapi.sqlSearch.admittedPatients"