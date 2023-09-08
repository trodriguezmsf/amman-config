set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"MPA, Other reason for physiotherapy referral","Other reason for physiotherapy referral","Text","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"MPA, Reason for physiotherapy referral","Reason for physiotherapy referral","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Post-burn contracture rehabilitation","Post-burn contracture rehabilitation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Temporomandibular Mobilization-TMJ","Temporomandibular Mobilization-TMJ","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Neck mobilization","Neck mobilization","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Scar management for TFO patients","Scar management for TFO patients","N/A","Misc",false);
 