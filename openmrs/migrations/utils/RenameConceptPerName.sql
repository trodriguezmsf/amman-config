CREATE PROCEDURE rename_concept_per_name (IN concept_name_proc VARCHAR(255),
                            IN new_concept_name_proc VARCHAR(255),
                            IN new_concept_full_name_proc VARCHAR(255))
BEGIN
 DECLARE concept_id_proc INT;
    SELECT concept_id INTO concept_id_proc FROM concept_name
    WHERE name = concept_name_proc and concept_name_type = "FULLY_SPECIFIED";
    # Update Name
    UPDATE concept_name
    SET name = new_concept_name_proc
    WHERE concept_id = concept_id_proc AND concept_name_type = "SHORT";
    # Update Fully Specified Name
    UPDATE concept_name
    SET name = new_concept_full_name_proc
    WHERE concept_id = concept_id_proc AND concept_name_type = "FULLY_SPECIFIED";

END;
