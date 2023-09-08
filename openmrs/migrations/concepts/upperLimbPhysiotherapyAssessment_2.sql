set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ULA, Other reason for physiotherapy referral","Other reason for physiotherapy referral","Text","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ULA, Reason for physiotherapy referral","Reason for physiotherapy referral","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Bone transportation","Bone transportation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Post-burn contracture management","Post-burn contracture management","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Peripheral nerve injury rehabilitation","Peripheral nerve injury rehabilitation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Tendon rehabilitation","Tendon rehabilitation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Post-fracture rehabilitation","Post-fracture rehabilitation","N/A","Misc",false);
