CREATE PROCEDURE reorder_concept_set (
                            IN concept_set_name_proc VARCHAR(255),
                            IN concept_name_proc VARCHAR(255),
                            IN sort_weight_proc INT)
BEGIN

 DECLARE concept_set_id_proc INT;
 DECLARE concept_id_proc INT;

 SELECT concept_id INTO concept_set_id_proc FROM concept_name
 WHERE name = concept_set_name_proc and concept_name_type = "FULLY_SPECIFIED";

 SELECT concept_id INTO concept_id_proc FROM concept_name
 WHERE name = concept_name_proc and concept_name_type = "FULLY_SPECIFIED";

 UPDATE concept_set
 SET sort_weight = sort_weight_proc
 WHERE concept_set = concept_set_id_proc AND concept_id = concept_id_proc;

END;