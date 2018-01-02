 DELETE FROM global_property where property = 'emrapi.sqlSearch.openPrescription';
 select uuid() into @uuid;
 INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
 VALUES ('emrapi.sqlSearch.openPrescription',
"SELECT
  pi.identifier,
  CONCAT(pn.given_name, ' ', pn.family_name) AS 'Patient Name',
  FLOOR(DATEDIFF(CURDATE(), p.birthdate) / 365) AS 'Age',
  speciality.name AS 'Speciality',
  surgeon_name.name AS 'Name of Surgeon',
  bed.bed_allocation AS 'Bed Allocation',
  medications.prescriber AS 'Prescriber',
  medications.drugName AS 'Medications',
  DATE_FORMAT(medications.date_activated,'%d/%m/%Y') AS 'Start Date',
  DATE_FORMAT(medications.date_created, '%d/%m/%Y %r') AS 'Prescribed/Updated Time',
  medications.durartion_units AS 'Duration & Units',
  p.uuid AS uuid
FROM
  person p
  INNER JOIN patient_identifier pi ON pi.patient_id = p.person_id
                                      AND p.voided IS FALSE
                                      AND pi.voided IS FALSE
  INNER JOIN person_name pn ON pn.person_id = p.person_id
                               AND pn.voided IS FALSE
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT(COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
                    FROM
                      obs o
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                  AND o.voided IS FALSE
                                                  AND e.voided IS FALSE
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                      AND cn.voided IS FALSE
                                                      AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                      AND cn.name = 'FSTG, Specialty determined by MLO'
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                                   AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                   AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                                  AND coded_fscn.concept_name_type = 'SHORT'
                                                                  AND coded_scn.voided IS FALSE
                      INNER JOIN (
                                    SELECT
                                      o.person_id,
                                      MAX(e.encounter_datetime) AS encounter_datetime
                                    FROM
                                      obs o
                                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                     AND cn.name = 'FSTG, Specialty determined by MLO'
                                                                     AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                     AND cn.voided IS FALSE
                                                                     AND o.voided IS FALSE
                                       INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                                 AND e.voided IS FALSE
                                     GROUP BY person_id
                                   ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                         AND latest_encounter.person_id = o.person_id
                      GROUP BY o.person_id
                    ) speciality ON speciality.person_id = p.person_id
  LEFT OUTER JOIN (
                      SELECT
                        o.person_id,
                        GROUP_CONCAT(DISTINCT(COALESCE(cv_answer.concept_short_name, cv_answer.concept_full_name))) AS 'name'
                      FROM obs o
                        INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
                                                      AND cv.concept_full_name IN ('FUP, Name (s) of Surgeon 1' , 'FV, Name (s) of Surgeon 1')
                                                      AND cv.retired IS FALSE
                                                      AND o.voided IS FALSE
                        INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
                                                             AND cv_answer.retired IS FALSE
                        INNER JOIN (
                                     SELECT
                                       o.person_id,
                                       MAX(o.obs_datetime) AS obs_datetime
                                     FROM
                                       obs o
                                       INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                     AND cn.name IN ('FUP, Name (s) of Surgeon 1' , 'FV, Name (s) of Surgeon 1')
                                                                     AND cn.voided IS FALSE
                                                                     AND o.voided IS FALSE
                                     GROUP BY o.person_id
                                   ) latest_obs ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
                      GROUP BY o.person_id
                    ) surgeon_name ON surgeon_name.person_id = p.person_id
  INNER JOIN (
                    SELECT
                      p.patient_id,
                      CONCAT(pn.given_name, ' ', pn.family_name) AS 'prescriber',
                      IF(drug_code.code IS NOT NULL, drug.name, drug_order.drug_non_coded)                         AS 'drugName',
                      orders.date_created,
                      orders.date_activated,
                      CONCAT(drug_order.duration,' ',durationUnitscn.name) AS 'durartion_units'
                    FROM patient p
                      JOIN patient_program pp ON pp.patient_id = p.patient_id AND pp.voided IS FALSE
                      JOIN encounter e ON e.patient_id = p.patient_id AND e.voided IS FALSE
                      JOIN orders ON orders.patient_id = pp.patient_id AND orders.encounter_id = e.encounter_id AND
                                     orders.voided IS FALSE AND orders.order_action != 'DISCONTINUE' AND (orders.auto_expire_date IS NULL or orders.auto_expire_date> now())
                                     AND orders.date_stopped IS NULL
                      JOIN users on users.user_id = orders.creator
                      JOIN person on person.person_id = users.person_id
                      JOIN person_name pn on pn.person_id = person.person_id
                      LEFT JOIN obs ON obs.order_id = orders.order_id AND obs.voided IS FALSE AND obs.concept_id = (SELECT concept_id FROM concept_name WHERE name = 'Dispensed' )
                      LEFT JOIN orders stopped_order ON stopped_order.patient_id = pp.patient_id AND stopped_order.voided = 0 AND
                                                        stopped_order.order_action = 'DISCONTINUE' AND
                                                        stopped_order.previous_order_id = orders.order_id
                      JOIN concept c on c.concept_id = orders.concept_id AND c.retired IS FALSE
                      LEFT JOIN drug_order drug_order ON drug_order.order_id = orders.order_id
                      LEFT JOIN concept_name durationUnitscn ON durationUnitscn.concept_id = drug_order.duration_units AND durationUnitscn.concept_name_type = 'FULLY_SPECIFIED' AND durationUnitscn.voided = 0
                      LEFT JOIN drug ON drug.concept_id = orders.concept_id
                      LEFT JOIN concept_reference_term_map_view drug_code ON drug_code.concept_id = drug.concept_id and drug_code.concept_reference_source_name='MSF-INTERNAL' and drug_code.concept_map_type_name= 'SAME-AS'
                  ) medications on medications.patient_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      p.patient_id,
                      concat(location.name,'(',bed.bed_number,')') AS bed_allocation,
                      bed.bed_number,
                      location.name,
                      bpam.date_created
                    FROM patient p
                      LEFT JOIN bed_patient_assignment_map bpam on bpam.patient_id = p.patient_id AND
                                                                   bpam.date_stopped IS NULL
                      INNER JOIN bed on bed.bed_id = bpam.bed_id
                      INNER JOIN bed_location_map blm on blm.bed_id = bed.bed_id
                      INNER JOIN location on location.location_id = blm.location_id
                    GROUP BY bpam.patient_id
            ) bed on bed.patient_id = p.person_id", 'Open Prescriptions',@uuid);