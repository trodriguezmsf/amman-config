CREATE PROCEDURE update_concept (concept_fully_specified_name VARCHAR(255),
                             concept_locale VARCHAR(50),
                             updated_concept_fully_specified_name VARCHAR(255),
                             updated_concept_short_name VARCHAR(255),
                             updated_concept_description VARCHAR(510),
                             updated_concept_form_text VARCHAR(255),
                             updated_concept_datatype_id INT(11),
                             updated_concept_class_id INT(11),
                             updated_concept_is_set INT(11))

BEGIN
 DECLARE user_id_proc INT;
 DECLARE concept_id_proc INT;

 # Check if concept name exists
 SELECT COUNT(DISTINCT concept_id) INTO @concept_count FROM concept_name WHERE name = concept_fully_specified_name AND concept_name_type='FULLY_SPECIFIED' AND voided = 0 AND locale = concept_locale;

 IF @concept_count = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Concept Name Not Found';

 ELSE

    # Retrieve concept_id from concept concept_fully_specified_name
    SELECT concept_id INTO concept_id_proc FROM concept_name WHERE name = concept_fully_specified_name AND concept_name_type='FULLY_SPECIFIED' AND voided = 0 AND locale = concept_locale;

    # Retrieve user_id from "admin" username
    SELECT user_id into user_id_proc FROM users WHERE system_id = "admin";

    # Update concept_fully_specified_name
    IF updated_concept_fully_specified_name IS NOT NULL THEN
        UPDATE concept_name
        SET name = updated_concept_fully_specified_name
        WHERE concept_id = concept_id_proc AND concept_name_type='FULLY_SPECIFIED' AND voided = 0 AND locale = concept_locale;
    END IF;

    # Update concept_short_name
    IF updated_concept_short_name IS NOT NULL THEN
        UPDATE concept_name
        SET name = updated_concept_short_name
        WHERE concept_id = concept_id_proc AND concept_name_type='SHORT' AND voided = 0 AND locale = concept_locale;
    END IF;

    # Update concept_description
    IF updated_concept_description IS NOT NULL THEN
        UPDATE concept
        SET description = updated_concept_description
        WHERE concept_id = concept_id_proc AND retired = 0;
    END IF;

    # Update concept_form_text
    IF updated_concept_form_text IS NOT NULL THEN
        UPDATE concept
        SET form_text = updated_concept_form_text
        WHERE concept_id = concept_id_proc AND retired = 0;
    END IF;

    # Update concept_datatype_id
    IF updated_concept_datatype_id IS NOT NULL THEN
        UPDATE concept
        SET datatype_id = updated_concept_datatype_id
        WHERE concept_id = concept_id_proc AND retired = 0;
    END IF;

    # Update concept_class_id
    IF updated_concept_class_id IS NOT NULL THEN
        UPDATE concept
        SET class_id = updated_concept_class_id
        WHERE concept_id = concept_id_proc AND retired = 0;
    END IF;

    # Update concept_is_set
    IF updated_concept_is_set IS NOT NULL THEN
        UPDATE concept
        SET is_set = updated_concept_is_set
        WHERE concept_id = concept_id_proc AND retired = 0;
    END IF;

 END IF;
END;
