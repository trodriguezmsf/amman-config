CREATE PROCEDURE update_concept (concept_fully_specified_name VARCHAR(255),
                             concept_locale VARCHAR(50),
                             updated_concept_fully_specified_name VARCHAR(255),
                             updated_concept_short_name VARCHAR(255),
                             updated_concept_description VARCHAR(510),
                             updated_concept_form_text VARCHAR(255),
                             updated_concept_datatype_id INT(11),
                             updated_concept_class_id INT(11),
                             updated_concept_units VARCHAR(50),
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
        SELECT COUNT(DISTINCT concept_id) INTO @concept_count FROM concept_name WHERE concept_id = concept_id_proc AND concept_name_type='SHORT' AND voided = 0 AND locale = concept_locale;
        IF @concept_count = 0 THEN
            INSERT INTO concept_name (concept_id,name,locale,locale_preferred,creator,date_created,concept_name_type,voided,voided_by,date_voided,void_reason,uuid,date_changed,changed_by) VALUES
            (concept_id_proc,updated_concept_short_name,concept_locale,1,user_id_proc,now(),'SHORT',0,NULL,NULL,NULL,uuid(),NULL,NULL);
        ELSE
            UPDATE concept_name
            SET name = updated_concept_short_name
            WHERE concept_id = concept_id_proc AND concept_name_type='SHORT' AND voided = 0 AND locale = concept_locale;
        END IF;
    END IF;

    # Update concept_description
    IF updated_concept_description IS NOT NULL THEN
         SELECT COUNT(DISTINCT concept_id) INTO @concept_count FROM concept_description WHERE concept_id = concept_id_proc;
         IF @concept_count = 0 THEN
            INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES
            (concept_id_proc,updated_concept_description,concept_locale,user_id_proc,now(),user_id_proc,now(),uuid());
         ELSE
            UPDATE concept_description
            SET description = updated_concept_description
            WHERE concept_id = concept_id_proc AND locale = concept_locale;
         END IF;
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

    # Update concept_units
    IF updated_concept_units IS NOT NULL THEN
        SELECT COUNT(DISTINCT concept_id) INTO @concept_count FROM concept_numeric WHERE concept_id = concept_id_proc;
         IF @concept_count = 0 THEN
            INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES
            (concept_id_proc,NULL,NULL,NULL,NULL,NULL,NULL,updated_concept_units,1,NULL);
         ELSE
            UPDATE concept_numeric
            SET units = updated_concept_units
            WHERE concept_id = concept_id_proc;
         END IF;
    END IF;

    # Update concept_is_set
    IF updated_concept_is_set IS NOT NULL THEN
        UPDATE concept
        SET is_set = updated_concept_is_set
        WHERE concept_id = concept_id_proc AND retired = 0;
    END IF;

 END IF;
END;
