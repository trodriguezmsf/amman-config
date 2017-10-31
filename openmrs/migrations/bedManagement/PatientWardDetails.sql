DELETE FROM global_property WHERE property = 'emrapi.sqlGet.allWardsListDetails';
SELECT uuid() INTO @uuid;
INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
VALUES ('emrapi.sqlGet.allWardsListDetails',
"SELECT
            bed_tags.bed_tags                                                                  											 AS 'Bed Tags',
            bed.bed_number                                                                     											 AS 'Bed Number',
            patient_identifier.identifier                                                      											 AS 'Patient ID',
            CONCAT(pn.given_name, ' ', pn.family_name)                                         											 AS 'Patient Name',
            TIMESTAMPDIFF(YEAR, p.birthdate, CURDATE())                                        											 AS 'Age',
            CAST(DATE_FORMAT(latestAdmissionEncounter.admission_datetime, '%Y-%m-%d') AS CHAR) 											 AS 'Admission Date',
            DATE_FORMAT(expected_date_of_discharge.date, '%Y-%m-%d')                           											 AS 'Expected Date of Discharge',
            latest_obs.Specialty                                                               											 AS 'Speciality',
            surgeon_name.name                                             					  											         AS 'Name of Surgeon',
            CAST(DATE_FORMAT(COALESCE(nearestFutureAppointment.blockStartTime,latestPastAppointment.blockStartTime), '%Y-%m-%d') AS CHAR) AS 'Date of Surgery',
            procedureBlock.name                                                                                                                           AS `Surgery`,
            medications.name as 'Medications',
            medical_issues.value_text   AS 'Medical Issues',
            latest_obs.Dressing_Frequency AS 'Dressing Frequency',
            recent_lab_result.value_text AS 'Recent Lab Results',



            IF(isCaretakerRequired.required = 'true', 'Yes', '')                               											 AS 'Is Caretaker Required?',
            caretakerGender.gender                                                             											 AS 'Caretaker Gender',

            IF(latest_future_appointment.startdate IS NULL , DATE_FORMAT(latest_past_appointment.startdate, '%d/%m/%Y'),
               DATE_FORMAT(latest_future_appointment.startdate, '%d/%m/%Y'))                                                              AS 'Date of Appointment',
            IF(latest_future_appointment.startdate IS NULL,
               CONCAT(DATE_FORMAT(latest_past_appointment.startdate, '%l:%i %p'), ' - ', DATE_FORMAT(latest_past_appointment.enddate, '%l:%i %p')),
               CONCAT(DATE_FORMAT(latest_future_appointment.startdate, '%l:%i %p'), ' - ', DATE_FORMAT(latest_future_appointment.enddate, '%l:%i %p'))) AS 'Slot',
            IF(latest_future_appointment.startdate IS NULL , latest_past_appointment.providername, latest_future_appointment.providername) AS 'Provider name'
          FROM
            bed
            INNER JOIN bed_location_map blm ON blm.bed_id = bed.bed_id
              INNER JOIN location l ON l.location_id = blm.location_id AND l.name = ${location_name} AND l.retired IS FALSE
            LEFT OUTER JOIN bed_patient_assignment_map bpam ON bpam.bed_id = bed.bed_id AND bpam.date_stopped IS NULL
            LEFT OUTER JOIN person p ON p.person_id = bpam.patient_id AND p.voided IS FALSE
            LEFT OUTER JOIN person_name pn ON pn.person_id = p.person_id AND pn.voided IS FALSE
            LEFT OUTER JOIN patient_identifier ON patient_identifier.patient_id = p.person_id AND patient_identifier.voided IS FALSE
            LEFT OUTER JOIN person_address address ON address.person_id = p.person_id AND address.voided IS FALSE
            LEFT OUTER JOIN (
                              SELECT
                                bed_tag_map.bed_id                                        AS 'bed_id',
                                GROUP_CONCAT(DISTINCT bed_tag.name ORDER BY bed_tag.name) AS 'bed_tags'
                              FROM
                                bed_tag_map
                                INNER JOIN bed_tag ON bed_tag.bed_tag_id = bed_tag_map.bed_tag_id AND bed_tag_map.voided IS FALSE
                              GROUP BY bed_tag_map.bed_id
                            ) bed_tags ON bed_tags.bed_id = bed.bed_id
            LEFT OUTER JOIN (
                              SELECT
                                pa.person_id AS 'person_id',
                                pa.value     AS 'required'
                              FROM
                                person_attribute pa
                                INNER JOIN person_attribute_type pat
                                  ON pat.person_attribute_type_id = pa.person_attribute_type_id AND
                                     pat.name = 'isCaretakerRequired' AND pa.voided IS FALSE
                            ) isCaretakerRequired ON isCaretakerRequired.person_id = p.person_id
            LEFT OUTER JOIN (
                              SELECT
                                pa.person_id AS 'person_id',
                                cn.name      AS 'gender'
                              FROM
                                person_attribute pa
                                INNER JOIN person_attribute_type pat
                                  ON pat.person_attribute_type_id = pa.person_attribute_type_id AND
                                     pat.name = 'CaretakerGender' AND pa.voided IS FALSE
                                INNER JOIN concept_name cn ON cn.concept_id = pa.value AND cn.concept_name_type = 'FULLY_SPECIFIED'
                            ) caretakerGender ON caretakerGender.person_id = p.person_id
            LEFT OUTER JOIN (
                              SELECT
                                o.value_datetime AS 'date',
                                o.person_id
                              FROM
                                obs o
                              INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND
                                                        cn.name = 'Expected Date of Discharge' AND
                                                        cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                                        o.voided IS FALSE
                                                        INNER JOIN
                                                        (SELECT
                                                           MAX(parentObs.obs_id) AS 'obs_id', parentObs.person_id
                                                         FROM obs parentObs
                                  INNER JOIN encounter e ON e.encounter_id = parentObs.encounter_id AND e.voided IS FALSE
                                  INNER JOIN visit ON visit.visit_id = e.visit_id AND visit.voided IS FALSE
                                  INNER JOIN concept_name cn
                                    ON cn.concept_id = parentObs.concept_id AND cn.name = 'IPD Expected DD' AND
                                       cn.concept_name_type = 'FULLY_SPECIFIED'
                                       AND parentObs.voided IS FALSE
                                  INNER JOIN (
                                               SELECT
                                                 v.patient_id,
                                                 MAX(v.date_started) AS date_started
                                               FROM
                                                 visit v
                                               GROUP BY v.patient_id
                                    ) latest_visit ON latest_visit.patient_id = parentObs.person_id AND latest_visit.date_started = visit.date_started
                                GROUP BY
                                  parentObs.person_id
                               ) ipd_expected_dd ON ipd_expected_dd.person_id = o.person_id AND
                                                     ipd_expected_dd.obs_id = o.obs_group_id
                           ) expected_date_of_discharge ON expected_date_of_discharge.person_id = p.person_id
            LEFT OUTER JOIN (
                              SELECT
                                e.patient_id,
                                MAX(e.encounter_datetime) AS admission_datetime
                              FROM
                                encounter e
                                INNER JOIN encounter_type et ON et.encounter_type_id = e.encounter_type AND et.name = 'ADMISSION'
                              GROUP BY
                                e.patient_id
                            ) latestAdmissionEncounter ON p.person_id = latestAdmissionEncounter.patient_id
            LEFT OUTER JOIN (
                              SELECT
                                o.person_id,
                                cv.name
                              FROM
                                obs o
                              INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND cn.voided IS FALSE AND
                                cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name ='FV, Name (s) of Surgeon 1'
                              INNER JOIN concept_name cv ON cv.concept_id = o.value_coded AND cv.voided IS FALSE AND
                               cv.concept_name_type = 'FULLY_SPECIFIED'
                              INNER JOIN (
                                SELECT
                                  o.person_id,
                                  MAX(o.obs_datetime) AS 'obs_datetime'
                                FROM
                                  obs o
                                INNER JOIN concept_name cn ON cn.concept_id = o.concept_id AND o.voided IS FALSE AND cn.voided IS FALSE AND
                                  cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name ='FV, Name (s) of Surgeon 1'
                                GROUP BY o.person_id
                              ) latest_obs_datetime ON latest_obs_datetime.obs_datetime = o.obs_datetime AND latest_obs_datetime.person_id = o.person_id
                            ) surgeon_name ON surgeon_name.person_id = p.person_id

              LEFT OUTER JOIN (
              SELECT
                surgical_appointment_with_stage.patient_id,
                surgical_appointment_with_stage.stage      AS Stage,
                DATE_FORMAT(sb.start_datetime, '%d/%m/%Y') AS 'Date of Surgery',
                CONCAT(pn.given_name, ' ', pn.family_name) AS Surgeon,
                surgical_appointment_procedure.value       AS 'name',
                sa.status                                  AS `Status`,
                l.name                                     AS OT
              FROM surgical_block sb
                INNER JOIN location l ON sb.location_id = l.location_id
                                         AND l.retired IS FALSE
                INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                                      AND sa.voided IS FALSE
                INNER JOIN provider p ON p.provider_id = sb.primary_provider_id
                                         AND p.retired IS FALSE
                INNER JOIN person_name pn ON pn.person_id = p.person_id
                                             AND pn.voided IS FALSE
                LEFT OUTER JOIN (
                                  SELECT
                                    surgical_appointment_id     AS surgical_appointment_id,
                                    value                       AS value
                                  FROM surgical_appointment_attribute saa
                                    INNER JOIN surgical_appointment_attribute_type saat
                                      ON saat.surgical_appointment_attribute_type_id =
                                         saa.surgical_appointment_attribute_type_id AND saat.name = 'procedure'
                                         AND saat.retired IS FALSE AND saa.voided IS FALSE
                                ) surgical_appointment_procedure ON surgical_appointment_procedure.surgical_appointment_id = sa.surgical_appointment_id
                LEFT OUTER JOIN
                (
                  SELECT
                    sa.surgical_appointment_id          AS surgical_appointment_id,
                    max(encounters_with_stage.stage)    AS stage,
                    encounters_with_stage.patient_id

                  FROM
                    surgical_block sb
                    INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                                          AND sa.voided IS FALSE
                    LEFT OUTER JOIN (
                                      SELECT
                                        e.patient_id         AS patient_id,
                                        e.encounter_id       AS encounter_id,
                                        e.encounter_datetime AS encounter_datetime,
                                        o.value_numeric      AS stage
                                      FROM
                                        encounter e
                                        INNER JOIN obs o ON o.encounter_id = e.encounter_id
                                                            AND e.voided IS FALSE
                                                            AND o.voided IS FALSE
                                        INNER JOIN concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
                                                                              AND outcome_cn.concept_name_type =
                                                                                  'FULLY_SPECIFIED'
                                                                              AND outcome_cn.name = 'Stage'
                                                                              AND outcome_cn.voided IS FALSE
                                    ) encounters_with_stage ON encounters_with_stage.patient_id = sa.patient_id AND
                                                               encounters_with_stage.encounter_datetime <= sb.end_datetime
                  GROUP BY surgical_appointment_id
                ) surgical_appointment_with_stage ON surgical_appointment_with_stage.surgical_appointment_id = sa.surgical_appointment_id
              ORDER BY sb.start_datetime DESC
                         ) procedureBlock ON procedureBlock.patient_id = p.person_id
            LEFT OUTER JOIN (SELECT
                             sa.patient_id,
                             min(sb.start_datetime) AS blockStartTime
                           FROM
                             surgical_appointment sa
                             INNER JOIN surgical_block sb
                               ON sb.surgical_block_id = sa.surgical_block_id AND sa.voided IS FALSE AND sb.voided IS FALSE
                           WHERE sb.start_datetime >= now() AND sa.status != 'CANCELLED' AND sa.status != 'POSTPONED'
                           GROUP BY sa.patient_id
                          ) nearestFutureAppointment   ON nearestFutureAppointment.patient_id = p.person_id
          LEFT OUTER JOIN (SELECT
                             sa.patient_id,
                             max(sb.start_datetime) AS blockStartTime
                           FROM
                             surgical_appointment sa
                             INNER JOIN surgical_block sb
                               ON sb.surgical_block_id = sa.surgical_block_id AND sa.voided IS FALSE AND sb.voided IS FALSE
                           WHERE sb.start_datetime < now() AND sa.status != 'CANCELLED' AND sa.status != 'POSTPONED'
                           GROUP BY sa.patient_id
                          ) latestPastAppointment ON latestPastAppointment.patient_id = p.person_id

            LEFT OUTER JOIN (
                  SELECT
                  obs.person_id,
                  c_name                            AS name,
                  GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                            COALESCE(coded_fscn.name, coded_scn.name),
                                            NULL))) AS 'Specialty',
                    GROUP_CONCAT(DISTINCT (IF(c_name = 'PPN, Frequency of dressing',
                                              COALESCE(coded_fscn.name, coded_scn.name),
                                              NULL))) AS 'Dressing_Frequency'

                  FROM (SELECT
                        cn.name             AS c_name,
                        o.person_id,
                        max(e.encounter_datetime) AS latest_encounter_datetime,
                        o.concept_id
                      FROM obs o
                        JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE AND o.voided IS FALSE
                        JOIN concept_name cn ON cn.name IN
                                                ( 'FSTG, Specialty determined by MLO' , 'PPN, Frequency of dressing'
                                                )
                                                AND cn.concept_id = o.concept_id AND cn.voided IS FALSE
                                                AND cn.concept_name_type = 'FULLY_SPECIFIED'
                      GROUP BY person_id, concept_id) latest_encounter
                  JOIN obs ON obs.concept_id = latest_encounter.concept_id  AND obs.voided IS FALSE
                  JOIN encounter e ON e.encounter_id = obs.encounter_id AND latest_encounter.latest_encounter_datetime = e.encounter_datetime AND e.voided IS FALSE
                  LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                       AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                       AND coded_fscn.voided IS FALSE
                  LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                      AND coded_fscn.concept_name_type = 'SHORT'
                                                      AND coded_scn.voided IS FALSE
                GROUP BY obs.person_id
             )latest_obs ON latest_obs.person_id =  p.person_id

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
                                ) latest_future_appointment ON latest_future_appointment.patient_id = p.person_id



                LEFT OUTER JOIN (
                                   select
                                     o.person_id,
                                     group_concat(o.value_text SEPARATOR ', ') AS value_text
                                   from
                                     concept_name cn
                                    join obs o ON cn.concept_id=o.concept_id and o.voided is FALSE
                                      and cn.name IN ('PPN, Subjective (any new complaint)') and cn.concept_name_type= 'FULLY_SPECIFIED'
                                   GROUP BY o.person_id
              ) medical_issues ON medical_issues.person_id = p.person_id


              LEFT OUTER JOIN (
                                select
                                  o.person_id,
                                  group_concat(o.value_text SEPARATOR ', ') AS value_text
                                from
                                  concept_name cn
                                  join obs o ON cn.concept_id=o.concept_id and o.voided is FALSE
                                                and cn.name IN ('PPN, Abnormal lab values') and cn.concept_name_type= 'FULLY_SPECIFIED'
                                  GROUP BY o.person_id
                              ) recent_lab_result ON recent_lab_result.person_id = p.person_id


              LEFT OUTER JOIN (

                                SELECT
                                  o.patient_id,
                                  group_concat(o.drugName SEPARATOR ', ') AS 'name'
                                FROM
                                  (
                                    SELECT
                                      p.patient_id,
                                      IF(drug_code.code IS NOT NULL, drug.name, drug_order.drug_non_coded)                         AS 'drugName'
                                    FROM patient p
                                      JOIN patient_program pp ON pp.patient_id = p.patient_id AND pp.voided IS FALSE
                                      JOIN encounter e ON e.patient_id = p.patient_id AND e.voided IS FALSE
                                      JOIN orders ON orders.patient_id = pp.patient_id AND orders.encounter_id = e.encounter_id AND
                                                     orders.voided IS FALSE AND orders.order_action != "DISCONTINUE"
                                      LEFT JOIN obs ON obs.order_id = orders.order_id AND obs.voided IS FALSE AND obs.concept_id = (SELECT concept_id FROM concept_name WHERE name = "Dispensed" )
                                      LEFT JOIN orders stopped_order ON stopped_order.patient_id = pp.patient_id AND stopped_order.voided = 0 AND
                                                                        stopped_order.order_action = "DISCONTINUE" AND
                                                                        stopped_order.previous_order_id = orders.order_id
                                      JOIN concept c on c.concept_id = orders.concept_id AND c.retired IS FALSE
                                      LEFT JOIN drug_order drug_order ON drug_order.order_id = orders.order_id
                                      LEFT JOIN concept_name durationUnitscn ON durationUnitscn.concept_id = drug_order.duration_units AND durationUnitscn.concept_name_type = "FULLY_SPECIFIED" AND durationUnitscn.voided = 0
                                      LEFT JOIN drug ON drug.concept_id = orders.concept_id
                                      LEFT JOIN concept_reference_term_map_view drug_code ON drug_code.concept_id = drug.concept_id and drug_code.concept_reference_source_name='MSF-INTERNAL' and drug_code.concept_map_type_name= 'SAME-AS'
                                  ) o
                                GROUP BY o.patient_id

              ) medications ON medications.patient_id = p.person_id


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

                                ) latest_past_appointment ON latest_past_appointment.patient_id = p.person_id
           GROUP BY bed.bed_number;",'SQL query to get list of bed details in ward',@uuid);
