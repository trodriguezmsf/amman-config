CREATE PROCEDURE change_concept_shortname (IN concept_id_proc INT,
                             IN new_shortname_proc VARCHAR(255))
BEGIN

 UPDATE concept_name
 SET name = new_shortname_proc
 WHERE concept_id = concept_id_proc
 AND concept_name_type = "SHORT";

END;