DELETE FROM global_property WHERE property = 'bahmni.sqlGet.otSurgicalHistory';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.otSurgicalHistory',
"SELECT
    surgical_appointment_with_stage.stage      AS Stage,
    DATE_FORMAT(sb.start_datetime, '%Y/%m/%d') AS 'Date of Surgery',
    CONCAT(pn.given_name, ' ', pn.family_name) AS Surgeon,
    surgical_appointment_procedure.value       AS Procedures,
    sa.status                                  AS `Appointment Status`,
    l.name                                     AS OT
FROM surgical_block sb
    INNER JOIN location l ON sb.location_id = l.location_id
                             AND l.retired IS FALSE
                             AND sb.voided IS FALSE
    INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                          AND sa.voided IS FALSE
    INNER JOIN person person ON person.person_id = sa.patient_id
                                AND person.uuid = ${patientUuid}
                                AND person.voided IS FALSE
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
            max(encounters_with_stage.stage)    AS stage
        FROM
            surgical_block sb
            INNER JOIN surgical_appointment sa ON sa.surgical_block_id = sb.surgical_block_id
                                                  AND sb.voided IS FALSE
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
ORDER BY sb.start_datetime DESC;"
, 'Surgical history for patient', @uuid);