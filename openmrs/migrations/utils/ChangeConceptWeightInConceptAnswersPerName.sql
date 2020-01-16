CREATE PROCEDURE change_concept_weight_in_concept_answers_per_name (IN parent_concept_id_proc INT,
                             IN concept_answer_name_proc VARCHAR(255),
                             IN answer_sort_weight_proc INT)
BEGIN
 DECLARE concept_answer_id_proc INT;

 SELECT concept_id INTO concept_answer_id_proc FROM concept_name
 WHERE name = concept_answer_name_proc and concept_name_type = "FULLY_SPECIFIED";

 UPDATE concept_answer
 SET sort_weight = answer_sort_weight_proc
 WHERE answer_concept = concept_answer_id_proc
 AND concept_id = parent_concept_id_proc;

END;