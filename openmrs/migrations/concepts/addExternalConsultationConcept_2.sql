set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;

#Add coded concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Cardiology","Cardiology","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Pulmonology","Pulmonology","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Nephrology","Nephrology","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Neurology","Neurology","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Admission to other hospital","Admission to other hospital","N/A","Misc",false);

#Add text concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"EC, Reason and details of admission","Reason and details of admission","Text","Misc",false);

