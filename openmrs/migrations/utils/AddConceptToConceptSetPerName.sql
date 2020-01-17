CREATE PROCEDURE add_concept_to_concept_set_per_name (IN concept_set_id_proc INT,
                             IN concept_name_proc VARCHAR(255),
                             is_set BOOLEAN)
BEGIN
 DECLARE is_set_val TINYINT(1);
 DECLARE user_id_proc INT;
 DECLARE concept_id_proc INT;
 DECLARE max_sort_weight_proc INT;

 CASE
   WHEN is_set = TRUE THEN
      SET is_set_val = '1';
   WHEN is_set = FALSE THEN
      SET is_set_val = '0';
 END CASE;

 SELECT concept_id INTO concept_id_proc FROM concept_name
 WHERE name = concept_name_proc and concept_name_type = "FULLY_SPECIFIED";

 SELECT count(distinct concept_id) into @concept_count from concept_set where concept_set = concept_set_id_proc and concept_id = concept_id_proc;
 IF @concept_count > 0 THEN
   SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Concept Answer Already Exists';
 ELSE
   SELECT uuid() INTO @uuid;
   SELECT MAX(sort_weight)+1 INTO max_sort_weight_proc FROM concept_set WHERE concept_set = concept_set_id_proc;
   SELECT user_id into user_id_proc FROM users WHERE system_id = "admin";
   INSERT INTO concept_set (concept_id,concept_set,sort_weight,creator,date_created,uuid) VALUES
    (concept_id_proc,concept_set_id_proc,max_sort_weight_proc,user_id_proc,now(),@uuid);
 END IF;
END;
