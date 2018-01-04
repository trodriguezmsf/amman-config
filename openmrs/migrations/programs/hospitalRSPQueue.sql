DELETE FROM global_property where property = 'emrapi.sqlSearch.hospitalRSP';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.hospitalRSP',
"SELECT
  dateOfArrival.dateOfArrival AS `Date of Arrival`,
  personData.patient_identifier AS 'identifier',
  personData.name AS 'PATIENT_LISTING_QUEUES_HEADER_NAME',
  personData.age AS `Age`,
  paddress.address3 AS `Country`,
  careTakerRequired.isCareTakerRequired AS 'Is Caretaker Required?',
  latest_obs.Specialty,
  latest_Stage.`Stage`,
  latest_obs.`Name of Surgeon`,
  latest_obs.`Date of consultation (Anaesth.)` AS 'OPD A',
  latest_obs.`Date of consultation (Surgeon)` AS 'OPD S',
  DATE_FORMAT(first_surgery.`First Surgery`,'%d/%m/%Y') AS 'First Surgery',
  first_surgery.`Procedure` AS 'Procedure (First)',
  DATE_FORMAT(last_surgery.`Last Surgery`,'%d/%m/%Y') AS 'Last Surgery',
  last_surgery.`Procedure` AS 'Procedure (Last)',
  IF(latest_future_appointment.startdate IS NULL , DATE_FORMAT(latest_past_appointment.startdate, '%d/%m/%Y'),
     DATE_FORMAT(latest_future_appointment.startdate, '%d/%m/%Y'))                                         AS 'Date of Appointment',
  IF(latest_future_appointment.startdate IS NULL , latest_past_appointment.providername, latest_future_appointment.providername) AS 'Provider name',
  `Bed allocation`,
  cn.name AS `Phase of treatment`,
  frequency_value.name AS 'No. Planned Operations',
  length_value.name AS 'Estimated LOS',
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
  JOIN concept_name cn ON cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE AND cn.name IN ('Pre-Operative','Surgical / Hospitalisation', 'Rehabilitation')
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
  LEFT JOIN (
              SELECT
                obs.person_id,
                max(obs.value_numeric)                                                       AS 'Stage'
              FROM (SELECT
                      cn.name             AS c_name,
                      o.person_id,
                      max(e.encounter_datetime) AS latest_encounter_datetime,
                      o.concept_id
                    FROM obs o
                      JOIN concept_name cn ON cn.name IN
                                              ('Stage')
                                              AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                              o.voided IS FALSE
                      JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
                    GROUP BY person_id, concept_id) result
                JOIN encounter e ON e.encounter_datetime = result.latest_encounter_datetime AND result.person_id = e.patient_id AND e.voided IS FALSE
                JOIN obs ON obs.concept_id = result.concept_id  AND result.person_id = obs.person_id AND e.encounter_id = obs.encounter_id AND
                            obs.voided IS FALSE
                LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                     AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                     AND coded_fscn.voided IS FALSE
                LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                    AND coded_fscn.concept_name_type = 'SHORT'
                                                    AND coded_scn.voided IS FALSE
              GROUP BY obs.person_id
            ) latest_Stage ON personData.person_id = latest_Stage.person_id
  LEFT JOIN (SELECT
               obs.person_id,
               c_name                                                                       AS name,
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 1',
                                         COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of Surgeon',
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
              SELECT concat(parentLocation.name,'(',b.bed_number,')') AS 'Bed allocation',
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
  LEFT JOIN (
              SELECT
                latest_appointment.patient_id,
                sb.start_datetime AS 'First Surgery',
                saa.value AS 'Procedure'
              FROM
                surgical_block sb
                INNER JOIN surgical_appointment sa
                  ON sb.surgical_block_id = sa.surgical_block_id AND sa.voided IS FALSE AND sb.voided IS FALSE
                INNER JOIN (SELECT
                              sa.patient_id,
                              MIN(sb.start_datetime) AS blockStartTime
                            FROM
                              surgical_appointment sa
                              INNER JOIN surgical_block sb
                                ON sb.surgical_block_id = sa.surgical_block_id AND sa.voided IS FALSE AND sb.voided IS FALSE
                            GROUP BY sa.patient_id) latest_appointment
                  ON latest_appointment.patient_id = sa.patient_id AND latest_appointment.blockStartTime = sb.start_datetime
                LEFT OUTER JOIN surgical_appointment_attribute saa ON saa.surgical_appointment_id = sa.surgical_appointment_id
                INNER JOIN surgical_appointment_attribute_type saat
                  ON saat.surgical_appointment_attribute_type_id = saa.surgical_appointment_attribute_type_id AND saat.name = 'procedure'
              GROUP BY latest_appointment.patient_id
            )first_surgery on first_surgery.patient_id = personData.person_id
  LEFT JOIN (
              SELECT
                latest_appointment.patient_id,
                sb.start_datetime AS 'Last Surgery',
                saa.value AS 'Procedure'
              FROM
                surgical_block sb
                INNER JOIN surgical_appointment sa
                  ON sb.surgical_block_id = sa.surgical_block_id AND sa.voided IS FALSE AND sb.voided IS FALSE
                INNER JOIN (SELECT
                              sa.patient_id,
                              MAX(sb.start_datetime) AS blockStartTime
                            FROM
                              surgical_appointment sa
                              INNER JOIN surgical_block sb
                                ON sb.surgical_block_id = sa.surgical_block_id AND sa.voided IS FALSE AND sb.voided IS FALSE
                            GROUP BY sa.patient_id) latest_appointment
                  ON latest_appointment.patient_id = sa.patient_id AND latest_appointment.blockStartTime = sb.start_datetime
                LEFT OUTER JOIN surgical_appointment_attribute saa ON saa.surgical_appointment_id = sa.surgical_appointment_id
                INNER JOIN surgical_appointment_attribute_type saat
                  ON saat.surgical_appointment_attribute_type_id = saa.surgical_appointment_attribute_type_id AND saat.name = 'procedure'
              GROUP BY latest_appointment.patient_id
            )last_surgery on last_surgery.patient_id = personData.person_id
  LEFT OUTER JOIN (
                    SELECT
                      patappoint.patient_id,
                      patappoint.start_date_time                 AS startdate,
                      patappoint.end_date_time                   AS enddate,
                      patappoint.provider_id                     AS appointmentprovider,
                      CONCAT(pn.given_name, ' ', pn.family_name) AS providername
                    FROM
                      patient_appointment patappoint
                      INNER JOIN (
                                   SELECT
                                     pa.patient_id           AS patient_id,
                                     MIN(pa.start_date_time) AS appointment_date
                                   FROM
                                     patient_appointment pa
                                   WHERE
                                     pa.start_date_time > NOW() AND pa.status NOT IN ('Cancelled')
                                   GROUP BY
                                     pa.patient_id
                                 ) next_appointment
                        ON patappoint.start_date_time = next_appointment.appointment_date AND patappoint.start_date_time = next_appointment.appointment_date
                      LEFT OUTER JOIN provider prov ON prov.provider_id = patappoint.provider_id AND prov.retired IS FALSE
                      LEFT OUTER JOIN person_name pn ON pn.person_id = prov.person_id AND pn.voided IS FALSE
                    GROUP BY patappoint.patient_id
                  ) latest_future_appointment ON latest_future_appointment.patient_id = personData.person_id
  LEFT OUTER JOIN (
                    SELECT
                      patappoint.patient_id,
                      patappoint.start_date_time                 AS startdate,
                      patappoint.end_date_time                   AS enddate,
                      patappoint.provider_id                     AS appointmentprovider,
                      CONCAT(pn.given_name, ' ', pn.family_name) AS providername
                    FROM
                      patient_appointment patappoint
                      INNER JOIN (
                                   SELECT
                                     pa.patient_id           AS patient_id,
                                     MAX(pa.start_date_time) AS appointment_date
                                   FROM
                                     patient_appointment pa
                                   WHERE
                                     pa.start_date_time < NOW() AND pa.status NOT IN ('Cancelled')
                                   GROUP BY
                                     pa.patient_id
                                 ) next_appointment ON patappoint.patient_id = next_appointment.patient_id AND patappoint.start_date_time = next_appointment.appointment_date
                      LEFT OUTER JOIN provider prov ON prov.provider_id = patappoint.provider_id AND prov.retired IS FALSE
                      LEFT OUTER JOIN person_name pn ON pn.person_id = prov.person_id AND pn.voided IS FALSE
                    GROUP BY patappoint.patient_id
                  ) latest_past_appointment ON latest_past_appointment.patient_id = personData.person_id
      LEFT JOIN (
                      SELECT value_coded.person_id, cn.name from concept_name cn
                        JOIN (select
                                o.person_id,o.value_coded
                              from
                                concept_name cn
                                join obs o ON cn.concept_id=o.concept_id and o.voided is FALSE
                                              and cn.name = 'SAP, Frequency of Operations' and cn.concept_name_type= 'FULLY_SPECIFIED') value_coded on value_coded.value_coded = cn.concept_id
                        GROUP BY value_coded.person_id
                    )frequency_value ON frequency_value.person_id = personData.person_id
      LEFT JOIN (
                      SELECT value_coded.person_id, cn.name from concept_name cn
                        JOIN (select
                                o.person_id,o.value_coded
                              from
                                concept_name cn
                                join obs o ON cn.concept_id=o.concept_id and o.voided is FALSE
                                              and cn.name = 'SAP, Estimated length of stay' and cn.concept_name_type= 'FULLY_SPECIFIED') value_coded on value_coded.value_coded = cn.concept_id
                        GROUP BY value_coded.person_id
                    )length_value on length_value.person_id = personData.person_id
ORDER BY dateOfArrival.date_of_arrival", 'Hospital RSP Queue', @uuid);