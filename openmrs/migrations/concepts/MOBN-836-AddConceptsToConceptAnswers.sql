# Add Eyelid to Site wounds
set @concept_id = 0;
DECLARE eyelid_concept_id INT;
SELECT concept_id INTO eyelid_concept_id FROM concept_name
WHERE name = "Site, Eyelid" and concept_name_type = "FULLY_SPECIFIED";
call add_concept_to_concept_answer(2158,eyelid_concept_id, True);