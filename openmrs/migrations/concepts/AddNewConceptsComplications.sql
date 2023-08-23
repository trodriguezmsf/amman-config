set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Central line blood stream infection","Central line blood stream infection","N/A","Misc",false);

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Catheter associated urinary tract infection","Catheter associated urinary tract infection","N/A","Misc",false);

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Peripheral line blood stream infection","Peripheral line blood stream infection","N/A","Misc",false);