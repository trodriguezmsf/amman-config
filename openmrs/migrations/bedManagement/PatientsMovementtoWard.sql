DELETE FROM global_property where property = 'emrapi.sqlSearch.PatientsMovementtoWard';
 select uuid() into @uuid;
 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.PatientsMovementtoWard',
"SELECT DISTINCT
          concat(pn.given_name, ' ', pn.family_name) AS name,
          pi.identifier AS identifier,
          concat('', p.uuid) AS uuid,
          concat('', v.uuid) AS activeVisitUuid,
            'Transfer to home'                                               AS 'Status',
          IF(va.value_reference = 'Admitted', 'true', 'false') as hasBeenAdmitted
        FROM visit v
        INNER JOIN person_name pn ON v.patient_id = pn.person_id and pn.voided is FALSE
        INNER JOIN patient_identifier pi ON v.patient_id = pi.patient_id and pi.voided is FALSE
        INNER JOIN patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id
        INNER JOIN global_property gp on gp.property='emr.primaryIdentifierType' and gp.property_value=pit.uuid
        INNER JOIN person p ON v.patient_id = p.person_id
        Inner Join (SELECT DISTINCT v.visit_id
          FROM encounter en
          LEFT JOIN visit v ON v.visit_id = en.visit_id AND en.encounter_type =
            (SELECT encounter_type_id
              FROM encounter_type
            WHERE name = 'TRANSFER')) v1 on v1.visit_id = v.visit_id
        INNER JOIN encounter e ON v.visit_id = e.visit_id
        INNER JOIN obs o ON e.encounter_id = o.encounter_id
        INNER JOIN concept_name cn ON o.value_coded = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided is FALSE
        JOIN location l on l.uuid=${visit_location_uuid} and v.location_id = l.location_id
        left outer join visit_attribute va on va.visit_id = v.visit_id and va.attribute_type_id =
          (select visit_attribute_type_id from visit_attribute_type where name='Admission Status')
        WHERE v.date_stopped IS NULL AND v.voided = 0 AND o.voided = 0 AND cn.name = 'Movement to Ward';",'Patients Movement to Ward',@uuid);