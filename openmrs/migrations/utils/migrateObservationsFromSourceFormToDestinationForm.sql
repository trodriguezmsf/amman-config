DROP PROCEDURE IF EXISTS getObsIdForDestinationFormWithGivenEncounterAndPatient;
#
CREATE PROCEDURE getObsIdForDestinationFormWithGivenEncounterAndPatient
    (
        IN  sourceFormConceptName VARCHAR (50),
        IN  destinationFormConceptName VARCHAR (50),
        IN  encounterId INT,
        IN  patientId   INT,
        OUT obsId  INT
    )
BEGIN
    SELECT obs_id
    INTO obsId
    FROM obs
    WHERE concept_id IN (SELECT concept_id
                         FROM concept_name
                         WHERE name = destinationFormConceptName
                               AND voided IS FALSE
                               AND concept_name_type = 'FULLY_SPECIFIED')
          AND encounter_id = encounterId
          AND person_id = patientId;
    IF obsId IS NULL
    THEN
        SELECT concept_id INTO @healthEducationConceptId
        FROM concept_name
        WHERE name = destinationFormConceptName AND voided IS FALSE AND concept_name_type = 'FULLY_SPECIFIED';
        INSERT INTO obs(person_id, concept_id, encounter_id, obs_datetime, location_id, order_id, obs_group_id, accession_number, value_group_id, value_coded, value_coded_name_id, value_drug, value_datetime, value_numeric, value_modifier, value_text, value_complex, comments, creator, date_created, voided, voided_by, date_voided, void_reason, uuid, previous_version, form_namespace_and_path, status, interpretation)
            SELECT person_id, @healthEducationConceptId, encounter_id, obs_datetime, location_id, order_id, obs_group_id , accession_number, value_group_id, value_coded, value_coded_name_id, value_drug, value_datetime, value_numeric, value_modifier, value_text, value_complex, comments, creator, date_created, voided, voided_by, date_voided, void_reason, uuid(), previous_version, form_namespace_and_path, status, interpretation
            FROM obs
            WHERE encounter_id = encounterId
                  AND person_id = patientId
                  AND concept_id IN (SELECT concept_id
                                     FROM concept_name
                                     WHERE name = sourceFormConceptName
                                           AND voided IS FALSE
                                           AND concept_name_type = 'FULLY_SPECIFIED');
        SELECT obs_id INTO obsId FROM obs WHERE concept_id = @healthEducationConceptId
                                                AND encounter_id = encounterId
                                                AND person_id = patientId
                                                AND voided IS FALSE;
    END IF;
END;
#
DROP PROCEDURE IF EXISTS migrateObservationsFromSourceFormToDestinationForm;
#
CREATE PROCEDURE migrateObservationsFromSourceFormToDestinationForm(
    IN sourceFormName VARCHAR (50),
    IN destinationFormName VARCHAR (50),
    IN listOfConceptsToBeMigrated VARCHAR (256)
    )
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE obsId, personId, encounterId INT;
    DECLARE obsCursor CURSOR FOR SELECT
                                     obs_id,
                                     person_id,
                                     encounter_id
                                 FROM obs
                                 WHERE FIND_IN_SET(concept_id, listOfConceptsToBeMigrated) > 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN obsCursor;
    read_loop: LOOP
        FETCH obsCursor
        INTO obsId, personId, encounterId;
        IF done
            THEN LEAVE read_loop;
        END IF;
        SET @obsGroupdId = NULL;
        CALL getObsIdForDestinationFormWithGivenEncounterAndPatient(sourceFormName, destinationFormName, encounterId, personId, @obsGroupdId);
        SELECT @obsGroupdId;
        UPDATE obs o
            SET o.obs_group_id = @obsGroupdId
        WHERE o.obs_id = obsId;
    END LOOP;
    CLOSE obsCursor;
END;
#
