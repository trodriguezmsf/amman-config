set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"WWN, Peripheral line status at removal","Peripheral line status at removal","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"WWN, PICC line status at removal","PICC line status at removal","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Infected","Infected","N/A","Misc",false);