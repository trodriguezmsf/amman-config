DELETE FROM global_property where property = 'emrapi.sqlSearch.hospitalRSP';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.hospitalRSP',
"SELECT
  dateOfArrival.dateOfArrival AS 'Date of Arrival',
  personData.patient_identifier AS 'identifier',
  personData.name AS 'PATIENT_LISTING_QUEUES_HEADER_NAME',
  personData.age AS 'Age',
  paddress.address3 AS 'Country',
  careTakerRequired.isCareTakerRequired AS 'Is Caretaker Required?',
  latest_obs.Specialty,
  latest_obs.`Name of Surgeon 1`,
  latest_obs.`Name of Surgeon 2`,
  latest_obs.`Date of consultation (Anaesth.)`,
  latest_obs.`Date of consultation (Surgeon)`,
  bed_allocation.name AS 'Bed allocation',
  personData.uuid
FROM
  (SELECT
     concat(pn.given_name, ' ', pn.family_name)                                                                 AS name,
     floor(DATEDIFF(CURDATE(), p.birthdate) / 365)                                                              AS age,
     pi.identifier                                                                                              AS patient_identifier,
     p.person_id                                                                                                AS person_id,
     p.uuid                                                                                                     AS uuid
   FROM person p
     JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
     JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE
  ) personData
  JOIN patient_program pp
    ON personData.person_id = pp.patient_id AND pp.date_completed IS NULL AND pp.voided IS FALSE
  JOIN concept_name cn ON cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE AND cn.name IN ('Pre-Operative', 'Surgical', 'Rehabilitation')
  JOIN program_workflow_state pws ON pws.concept_id = cn.concept_id AND pws.retired IS FALSE
  JOIN patient_state ps
    ON ps.patient_program_id = pp.patient_program_id AND  ps.state = pws.program_workflow_state_id AND ps.end_date IS NULL AND ps.voided IS FALSE
  LEFT JOIN person_address paddress ON personData.person_id = paddress.person_id AND paddress.voided IS FALSE
  LEFT JOIN (SELECT if(pa.value = 'true', 'Yes', NULL) AS isCareTakerRequired, pa.person_id
             FROM person_attribute pa
               JOIN person_attribute_type pat
                 ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND pat.name = 'isCareTakerRequired' AND pa.voided IS FALSE
             GROUP BY  pa.person_id
            )  careTakerRequired ON careTakerRequired.person_id = personData.person_id
  LEFT JOIN (SELECT DATE_FORMAT(pa.value, '%d/%m/%Y') AS dateOfArrival,
                    pa.value AS date_of_arrival,
               pa.person_id
             FROM person_attribute pa
               JOIN person_attribute_type pat
                 ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND pat.name = 'dateofArrival' AND pa.voided IS FALSE
             GROUP BY  pa.person_id
            )  dateOfArrival ON dateOfArrival.person_id = personData.person_id
  LEFT JOIN (SELECT
               obs.person_id,
               c_name                                                                       AS name,
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 1',
                                         COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of Surgeon 1',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 2',
                                         COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of Surgeon 2',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'AIA, Date of consultation',
                                         DATE_FORMAT(obs.value_datetime, '%d/%m/%Y'),
                                         NULL)))                                            AS 'Date of consultation (Anaesth.)',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'SAP, Date of consultation',
                                         DATE_FORMAT(obs.value_datetime, '%d/%m/%Y'),
                                         NULL)))                                            AS 'Date of consultation (Surgeon)',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                         COALESCE(coded_fscn.name, coded_scn.name),
                                         NULL)))                                            AS 'Specialty'
             FROM (SELECT
                     cn.name             AS c_name,
                     o.person_id,
                     max(e.encounter_datetime) AS latest_encounter_datetime,
                     o.concept_id
                   FROM obs o
                     JOIN concept_name cn ON cn.name IN
                                             ('FV, Name (s) of Surgeon 1',
                                              'FV, Name (s) of Surgeon 2',
                                              'AIA, Date of consultation',
                                              'SAP, Date of consultation',
                                              'FSTG, Specialty determined by MLO' )
                                             AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                             o.voided IS FALSE
                     JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                   GROUP BY person_id, concept_id) result
               JOIN obs ON obs.concept_id = result.concept_id AND obs.person_id = result.person_id AND obs.voided IS FALSE
               JOIN encounter e ON e.encounter_datetime = result.latest_encounter_datetime  AND e.encounter_id = obs.encounter_id AND e.voided IS FALSE
               LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                    AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND coded_fscn.voided IS FALSE
               LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                   AND coded_fscn.concept_name_type = 'SHORT'
                                                   AND coded_scn.voided IS FALSE
             GROUP BY obs.person_id
            ) latest_obs ON personData.person_id = latest_obs.person_id
  LEFT JOIN (
              SELECT
                parentLocation.name,
                bpam.patient_id
              FROM
                bed_patient_assignment_map bpam
                INNER JOIN bed b
                  ON b.bed_id = bpam.bed_id AND b.voided IS FALSE AND bpam.date_stopped IS NULL AND bpam.voided IS FALSE
                INNER JOIN bed_location_map blm ON b.bed_id = blm.bed_id
                INNER JOIN location childLocation ON blm.location_id = childLocation.location_id AND childLocation.retired IS FALSE
                INNER JOIN location parentLocation
                  ON parentLocation.location_id = childLocation.parent_location AND parentLocation.retired IS FALSE
              GROUP BY bpam.patient_id
            ) bed_allocation ON bed_allocation.patient_id = personData.person_id
ORDER BY dateOfArrival.date_of_arrival", 'Hospital RSP Queue', @uuid);