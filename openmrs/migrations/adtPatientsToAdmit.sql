UPDATE global_property
  SET property_value = "SELECT DISTINCT
                pi.identifier as identifier,
                concat(pn.given_name,' ', pn.family_name) as name,
                p.gender as Gender,
                floor(DATEDIFF(CURDATE(), p.birthdate) / 365) AS 'Age',
                DATE_FORMAT(o.obs_datetime,'%d %b %Y %h:%i %p') as 'Disposition Date',
                'Admit' as 'Status',
                concat('',p.uuid) as uuid,
                concat('',v.uuid) as activeVisitUuid
        FROM person p
        JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided = 0
        JOIN patient_identifier pi ON p.person_id = pi.patient_id
        JOIN patient_identifier_type pit ON pi.identifier_type = pit.patient_identifier_type_id
        JOIN visit v ON p.person_id = v.patient_id AND v.voided = 0
        JOIN encounter e ON v.visit_id = e.visit_id
        JOIN obs o ON e.encounter_id = o.encounter_id AND o.voided = 0
        JOIN concept c ON o.value_coded = c.concept_id
        JOIN concept_name cn ON c.concept_id = cn.concept_id
        JOIN location l ON l.uuid=${visit_location_uuid} AND v.location_id = l.location_id
        WHERE v.date_stopped IS NULL AND cn.name = 'Admit Patient' AND v.visit_id NOT IN (SELECT visit_id
                                                                                  FROM encounter ie
                                                                                  join encounter_type iet
                                                                                      ON iet.encounter_type_id = ie.encounter_type
                                                                                  WHERE iet.name = 'ADMISSION')"
  WHERE property = "emrapi.sqlSearch.patientsToAdmit";