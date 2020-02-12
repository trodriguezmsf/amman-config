CREATE PROCEDURE map_concept (concept_full_name VARCHAR(255),
                             locale VARCHAR(11),
                             concept_reference_term_code VARCHAR(255),
                             concept_reference_source VARCHAR(255),
                             concept_map_type VARCHAR(255))

BEGIN
 DECLARE user_id_proc INT;
 DECLARE concept_id_proc INT;
 DECLARE concept_reference_term_id_proc INT;
 DECLARE concept_reference_source_id_proc INT;
 DECLARE concept_map_type_id_proc INT;

 SELECT user_id into user_id_proc FROM users
 WHERE system_id = "admin";

 IF concept_full_name IS NOT NULL THEN
      SELECT concept_id INTO concept_id_proc FROM concept_name
      WHERE name = concept_full_name AND concept_name_type = "FULLY_SPECIFIED" AND locale = locale AND voided = 0;
 END IF;

 SELECT concept_source_id INTO concept_reference_source_id_proc FROM concept_reference_source
 WHERE name = concept_reference_source AND retired = 0;

 IF concept_reference_term_code IS NOT NULL THEN
     SELECT count(distinct concept_reference_term_id) into @concept_reference_term_count from concept_reference_term where code = concept_reference_term_code AND concept_source_id = concept_reference_source_id_proc AND retired = 0;
     IF @concept_reference_term_count = 0 THEN
         INSERT INTO concept_reference_term (concept_source_id,name,code,version,description,creator,date_created,date_changed,changed_by,retired,retired_by,date_retired,retire_reason,uuid) VALUES
         (concept_reference_source_id_proc,NULL,concept_reference_term_code,NULL,NULL,user_id_proc,now(),NULL,NULL,0,NULL,NULL,NULL,uuid());
     END IF;
     SELECT concept_reference_term_id INTO concept_reference_term_id_proc FROM concept_reference_term
     WHERE code = concept_reference_term_code AND concept_source_id = concept_reference_source_id_proc AND retired = 0;
 END IF;

 IF concept_map_type IS NOT NULL THEN
     SELECT concept_map_type_id INTO concept_map_type_id_proc FROM concept_map_type
     WHERE name = concept_map_type AND retired = 0;
 END IF;

 SELECT count(distinct concept_id) into @concept_mapping_count from concept_reference_map where concept_id = concept_id_proc AND concept_reference_term_id = concept_reference_term_id_proc AND concept_map_type_id = concept_map_type_id;
 IF @concept_mapping_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Concept Mapping Already Exists';
 ELSE
     INSERT INTO concept_reference_map (concept_reference_term_id,concept_map_type_id,creator,date_created,concept_id,changed_by,date_changed,uuid)
     VALUES (concept_reference_term_id_proc,concept_map_type_id_proc,user_id_proc,now(),concept_id_proc,NULL,NULL,uuid());
 END IF;
END;
