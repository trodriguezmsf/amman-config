CREATE PROCEDURE add_answer_to_concept_set (IN concept_set_name_proc VARCHAR(255),
                                         IN concept_set_id_proc INT,
                                         IN answer_name_proc VARCHAR(255),
                                         IN answer_id_proc INT,
                                         IN concept_locale_proc VARCHAR(255),
                                         is_set BOOLEAN)
BEGIN
 DECLARE is_set_val TINYINT(1);
 DECLARE user_id_proc INT;
 DECLARE max_sort_weight_proc INT;
 DECLARE answer_count INT;

 CASE
   WHEN is_set = TRUE THEN
      SET is_set_val = '1';
   WHEN is_set = FALSE THEN
      SET is_set_val = '0';
 END CASE;

 IF answer_id_proc IS NULL THEN
   SELECT concept_id INTO answer_id_proc FROM concept_name
   WHERE name = answer_name_proc AND concept_name_type = "FULLY_SPECIFIED" AND locale = concept_locale_proc AND voided = 0;
 END IF;

 IF concept_set_id_proc IS NULL THEN
   SELECT concept_id INTO concept_set_id_proc FROM concept_name
   WHERE name = concept_set_name_proc AND concept_name_type = "FULLY_SPECIFIED" AND locale = concept_locale_proc AND voided = 0;
 END IF;

 SELECT count(distinct answer_id_proc) INTO @answer_count FROM concept_answer WHERE concept_id = concept_set_id_proc AND answer_concept = answer_id_proc;
 IF @concept_count > 0 THEN
   SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Concept Answer Already Exists';
 ELSE
  SELECT uuid() INTO @uuid;
  SELECT MAX(sort_weight)+1 INTO max_sort_weight_proc FROM concept_answer WHERE concept_id = concept_set_id_proc;
  SELECT user_id into user_id_proc FROM users WHERE system_id = "admin";
  INSERT INTO concept_answer (uuid,concept_id,answer_concept,answer_drug,creator,date_created,sort_weight)
   VALUES (@uuid,concept_set_id_proc,answer_id_proc,NULL,user_id_proc,now(),max_sort_weight_proc);
 END IF;
END;
