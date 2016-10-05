 DELETE FROM global_property where property = 'emrapi.sqlSearch.expectedArrival';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.expectedArrival',
'SELECT name, identifier, uuid FROM (SELECT concat(pn.given_name,\' \', pn.family_name) as name, pi.identifier as identifier, p.uuid AS uuid, GROUP_CONCAT(DISTINCT(IF(pat.name = \'expectedDateofArrival\', pa.value, NULL))) AS \'Expected Date of Arrival\', GROUP_CONCAT(DISTINCT(IF(pat.name = \'dateofArrival\', pa.value, NULL))) AS \'Date of Arrival\' FROM person p JOIN patient_identifier pi ON p.person_id = pi.patient_id JOIN person_name pn ON p.person_id = pn.person_id JOIN person_attribute pa ON p.person_id = pa.person_id JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id GROUP BY p.person_id) result WHERE (result.\`Expected Date of Arrival\` IS NOT NULL) AND (result.\`Date of Arrival\` IS NULL)', 'Expected Arrival Patient Queue', @uuid);

