CREATE PROCEDURE reorder_concept_answer (
                            IN concept_name_proc VARCHAR(255),
                            IN answer_name_proc VARCHAR(255),
                            IN answer_sort_weight_proc INT)
BEGIN

 DECLARE concept_id_proc INT;
 DECLARE answer_id_proc INT;

 SELECT concept_id INTO concept_id_proc FROM concept_name
 WHERE name = concept_name_proc and concept_name_type = "FULLY_SPECIFIED" AND voided = 0;

 SELECT concept_id INTO answer_id_proc FROM concept_name
 WHERE name = answer_name_proc and concept_name_type = "FULLY_SPECIFIED" AND voided = 0;

 UPDATE concept_answer
 SET sort_weight = answer_sort_weight_proc
 WHERE answer_concept = answer_id_proc
 AND concept_id = concept_id_proc;

END;