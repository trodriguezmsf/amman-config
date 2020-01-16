CREATE PROCEDURE change_concept_weight_in_concept_answers (IN parent_concept_id_proc INT,
                             IN concept_answer_id_proc INT,
                             IN answer_sort_weight_proc INT)
BEGIN

 UPDATE concept_answer
 SET sort_weight = answer_sort_weight_proc
 WHERE answer_concept = concept_answer_id_proc
 AND concept_id = parent_concept_id_proc;

END;