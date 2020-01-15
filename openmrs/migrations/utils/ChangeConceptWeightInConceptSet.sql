CREATE PROCEDURE change_concept_weight_in_concept_set (IN concept_id_proc INT,
                             IN sort_weight_proc INT)
BEGIN

 UPDATE concept_set
 SET sort_weight = sort_weight_proc
 WHERE concept_id = concept_id_proc;

END;