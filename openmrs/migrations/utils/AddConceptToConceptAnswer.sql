CREATE PROCEDURE add_concept_to_concept_answer (IN parent_concept_id_proc INT,
                             IN concept_answer_name_proc VARCHAR(255),
                             is_set BOOLEAN)
BEGIN
 DECLARE is_set_val TINYINT(1);
 DECLARE user_id_proc INT;
 DECLARE concept_answer_id_proc INT;
 DECLARE max_sort_weight_proc INT;

 CASE
   WHEN is_set = TRUE THEN
      SET is_set_val = '1';
   WHEN is_set = FALSE THEN
      SET is_set_val = '0';
 END CASE;

 SELECT concept_id INTO concept_answer_id_proc FROM concept_name
 WHERE name = concept_answer_name_proc and concept_name_type = "FULLY_SPECIFIED";

 SELECT count(distinct concept_id) into @concept_count from concept_answer where concept_id = parent_concept_id_proc and answer_concept = concept_answer_id_proc;
 IF @concept_count > 0 THEN
   SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Concept Answer Already Exists';
 ELSE
   SELECT uuid() INTO @uuid;
   SELECT MAX(sort_weight)+1 INTO max_sort_weight_proc FROM concept_answer WHERE concept_id = parent_concept_id_proc;
   SELECT user_id into user_id_proc FROM users WHERE system_id = "admin";
   INSERT INTO concept_answer (uuid,concept_id,answer_concept,answer_drug,creator,date_created,sort_weight)
    VALUES (@uuid,parent_concept_id_proc,concept_answer_id_proc,NULL,user_id_proc,now(),max_sort_weight_proc);
 END IF;
END;
