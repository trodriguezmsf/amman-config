UPDATE
    global_property
SET property_value = "SELECT DISTINCT
    concat(pn.given_name,' ', pn.family_name)       AS PATIENT_LISTING_QUEUES_HEADER_NAME,
    pi.identifier                                   AS identifier,
    concat('', p.uuid)                              AS uuid
FROM patient_program ppr
    INNER JOIN person_name pn ON ppr.patient_id = pn.person_id AND ppr.voided IS FALSE
    INNER JOIN person p ON ppr.patient_id = p.person_id
    INNER JOIN patient_identifier pi ON ppr.patient_id = pi.patient_id
WHERE date_completed IS NULL;"
WHERE property = "emrapi.sqlSearch.activePatients";
