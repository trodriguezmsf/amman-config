CREATE PROCEDURE remove_answer_from_concept_set (IN concept_set_name_proc VARCHAR(255),
                                         IN concept_set_id_proc INT,
                                         IN answer_name_proc VARCHAR(255),
                                         IN answer_id_proc INT,
                                         IN concept_locale_proc VARCHAR(255))
BEGIN
 DECLARE user_id_proc INT;
 DECLARE answer_count INT;

 IF answer_id_proc IS NULL THEN
   SELECT concept_id INTO answer_id_proc FROM concept_name
   WHERE name = answer_name_proc AND concept_name_type = "FULLY_SPECIFIED" AND locale = concept_locale_proc AND voided = 0;
 END IF;

 IF concept_set_id_proc IS NULL THEN
   SELECT concept_id INTO concept_set_id_proc FROM concept_name
   WHERE name = concept_set_name_proc AND concept_name_type = "FULLY_SPECIFIED" AND locale = concept_locale_proc AND voided = 0;
 END IF;

 SELECT count(distinct answer_id_proc) INTO @answer_count FROM concept_answer WHERE concept_id = concept_set_id_proc AND answer_concept = answer_id_proc;
 IF @answer_count = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Answer Does Not Exist';
 ELSE
    DELETE FROM concept_answer
    WHERE concept_id = concept_set_id_proc AND answer_concept = answer_id_proc;
 END IF;
END;
