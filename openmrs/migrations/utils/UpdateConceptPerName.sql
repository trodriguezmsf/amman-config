CREATE PROCEDURE update_concept_per_name (IN concept_name_proc VARCHAR(255),
                            data_type_id_proc INT,
                            class_id_proc INT,
                            is_set_proc BOOLEAN)
BEGIN
 DECLARE concept_id_proc INT;

 SELECT concept_id INTO concept_id_proc FROM concept_name
 WHERE name = concept_name_proc and concept_name_type = "FULLY_SPECIFIED";

        UPDATE concept
        SET
        datatype_id = data_type_id_proc,
        class_id = class_id_proc,
        is_set = is_set_proc
        WHERE concept_id = concept_id_proc;

END;
