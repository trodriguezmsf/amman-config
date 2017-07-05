DELETE FROM global_property WHERE property = 'emrapi.sqlSearch.otToBeScheduledQueue';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
VALUES ('emrapi.sqlSearch.otToBeScheduledQueue',
"SELECT
  pi.identifier                                                                                                                                        AS identifier,
  concat(pn.given_name, ' ', pn.family_name)                                                                                                           AS PATIENT_LISTING_QUEUES_HEADER_NAME,
  procedureBlock.`procedure`                                                                                                                           AS `Planned Procedure`,
  finalValidationSurgeon.name                                                                                                                          AS `Surgeon Name`,
  speciality.name                                                                                                                                      AS Speciality,
  if(appointment_block.date_created IS NOT NULL AND procedureBlock.date_created < appointment_block.date_created, appointment_block.status, NULL)      AS `Appointment Status`,
  anaesthesiaOutcome.name                                                                                                                              AS `Outcome of Anaesthesia`
FROM patient p
  INNER JOIN patient_identifier pi ON pi.patient_id = p.patient_id
                                      AND pi.voided IS FALSE
                                      AND p.voided IS FALSE
  INNER JOIN person_name pn ON pn.person_id = p.patient_id AND pn.voided IS FALSE
  INNER JOIN (
               SELECT
                 o.person_id,
                 o.date_created AS date_created,
                 CONCAT_WS(' ',
                           GROUP_CONCAT(
                               (IF(cn.name = 'SAP, Planned procedure (surgical)' ||
                                   cn.name = 'SFP, Planned procedure (surgical)' ||
                                   cn.name = 'SAP, Non-coded Planned procedure' ||
                                   cn.name = 'SFP, Non coded Planned Procedure (surgical)',
                                   COALESCE(o.value_text, coded_fscn.name), NULL)) SEPARATOR
                               ', '
                           ),
                           IF(GROUP_CONCAT(
                                  (IF(cn.name = 'SAP, Planned procedure (surgical)' ||
                                      cn.name = 'SFP, Planned procedure (surgical)' ||
                                      cn.name = 'SAP, Non-coded Planned procedure' ||
                                      cn.name = 'SFP, Non coded Planned Procedure (surgical)',
                                      COALESCE(o.value_text, coded_fscn.name), NULL)) SEPARATOR
                                  ', '
                              ) IS NOT NULL, 'on', ''),
                           GROUP_CONCAT(
                               IF(cn.name = 'SAP, Side of surgical procedure' ||
                                  cn.name = 'SFP, Side of surgical procedure',
                                  coded_fscn.name, NULL) SEPARATOR
                               ''),
                           GROUP_CONCAT(
                               IF(cn.name = 'SAP, Site of surgical procedure' ||
                                  cn.name = 'SFP, Site of surgical procedure',
                                  coded_scn.name, NULL) SEPARATOR
                               ', ')
                 )
                                AS 'procedure'
               FROM encounter e
                 INNER JOIN obs o ON o.encounter_id = e.encounter_id
                                     AND e.voided IS FALSE
                                     AND o.voided IS FALSE
                 INNER JOIN (
                              SELECT e.encounter_id
                              FROM
                                encounter e
                                INNER JOIN
                                (
                                  SELECT
                                    o.person_id,
                                    MAX(e.encounter_datetime) AS encounter_datetime
                                  FROM obs o
                                    INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                  AND o.voided IS FALSE
                                                                  AND cn.voided IS FALSE
                                                                  AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                  AND cn.name IN (
                                      'Surgeon Pre-Op Assessment and Treatment Plan',
                                      'Surgeon Follow-up Form')
                                    INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                              AND e.voided IS FALSE
                                  GROUP BY o.person_id
                                ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                      AND latest_encounter.person_id = e.patient_id
                                                      AND e.voided IS FALSE
                                INNER JOIN obs o ON o.encounter_id = e.encounter_id
                                                    AND o.voided IS FALSE
                                INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                              AND cn.voided IS FALSE
                                                              AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                              AND cn.name IN (
                                'SAP, Has Patient Consent Been Obtained?')
                                LEFT OUTER JOIN concept_name consent_answer ON consent_answer.concept_id = o.value_coded
                                                                               AND consent_answer.concept_name_type =
                                                                                   'FULLY_SPECIFIED'
                                                                               AND consent_answer.voided IS FALSE
                              WHERE consent_answer.name = 'Yes'
                            ) latest_encounter_with_consent
                   ON latest_encounter_with_consent.encounter_id = e.encounter_id
                 LEFT OUTER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                               AND cn.voided IS FALSE
                                               AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                               AND cn.name IN (
                   'SAP, Planned procedure (surgical)',
                   'SAP, Non-coded Planned procedure',
                   'SAP, Site of surgical procedure',
                   'SAP, Side of surgical procedure',
                   'SFP, Planned procedure (surgical)',
                   'SFP, Non coded Planned Procedure (surgical)'
                   'SFP, Site of surgical procedure',
                   'SFP, Side of surgical procedure')
                 LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                            AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                            AND coded_fscn.voided IS FALSE
                 LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                           AND coded_scn.concept_name_type = 'SHORT'
                                                           AND coded_scn.voided IS FALSE
               GROUP BY o.person_id
             ) procedureBlock ON procedureBlock.person_id = p.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT (COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
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
                                                                AND coded_scn.concept_name_type = 'SHORT'
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
                  ) speciality ON speciality.person_id = p.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT (COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
                    FROM
                      obs o
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                AND o.voided IS FALSE
                                                AND e.voided IS FALSE
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                    AND cn.voided IS FALSE
                                                    AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND cn.name = 'AIA, Outcome of anaesthesia initial assessment'
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                                 AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                 AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                                AND coded_scn.concept_name_type = 'SHORT'
                                                                AND coded_scn.voided IS FALSE
                      INNER JOIN (
                                   SELECT
                                     o.person_id,
                                     MAX(e.encounter_datetime) AS encounter_datetime
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                   AND cn.name =
                                                                       'AIA, Outcome of anaesthesia initial assessment'
                                                                   AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                   AND cn.voided IS FALSE
                                                                   AND o.voided IS FALSE
                                     INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                               AND e.voided IS FALSE
                                   GROUP BY person_id
                                 ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                       AND latest_encounter.person_id = o.person_id
                    GROUP BY o.person_id
                  ) anaesthesiaOutcome ON anaesthesiaOutcome.person_id = p.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT (COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
                    FROM
                      obs o
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                AND o.voided IS FALSE
                                                AND e.voided IS FALSE
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                    AND cn.voided IS FALSE
                                                    AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND cn.name = 'FV, Name (s) of Surgeon 1'
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                                 AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                 AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                                AND coded_scn.concept_name_type = 'SHORT'
                                                                AND coded_scn.voided IS FALSE
                      INNER JOIN (
                                   SELECT
                                     o.person_id,
                                     MAX(e.encounter_datetime) AS encounter_datetime
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                   AND cn.name = 'FV, Name (s) of Surgeon 1'
                                                                   AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                   AND cn.voided IS FALSE
                                                                   AND o.voided IS FALSE
                                     INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                               AND e.voided IS FALSE
                                   GROUP BY person_id
                                 ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                       AND latest_encounter.person_id = o.person_id
                    GROUP BY o.person_id
                  ) finalValidationSurgeon ON finalValidationSurgeon.person_id = p.patient_id
  LEFT OUTER JOIN
  (
    SELECT
      p.patient_id,
      appoinment.date_created,
      appoinment.status
    FROM patient p
      LEFT OUTER JOIN (
                        SELECT
                          sa.patient_id,
                          sa.date_created,
                          sa.status
                        FROM
                          surgical_appointment sa
                          INNER JOIN (SELECT
                                        sa.patient_id        AS patient_id,
                                        MAX(sa.date_created) AS date_created
                                      FROM surgical_appointment sa
                                      WHERE sa.voided IS FALSE
                                      GROUP BY sa.patient_id
                                     ) latest_appointment ON latest_appointment.patient_id = sa.patient_id
                                                             AND latest_appointment.date_created = sa.date_created
                                                             AND sa.voided IS FALSE) appoinment
        ON appoinment.patient_id = p.patient_id AND p.voided IS FALSE
  ) appointment_block ON appointment_block.patient_id = p.patient_id
WHERE
  procedureBlock.date_created > appointment_block.date_created
  OR
  appointment_block.status = 'POSTPONED'
  OR
  appointment_block.date_created IS NULL;"
   ,'SQL for to be scheduled patient listing queues for OT module',@uuid);