set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"LLA, Other reason for physiotherapy referral","Other reason for physiotherapy referral","Text","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"LLA, Reason for physiotherapy referral","Reason for physiotherapy referral","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Elongation of Achelous tendon-ETA","Elongation of Achelous tendon-ETA","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Post-quadricepsplasty","Post-quadricepsplasty","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Total hip replacement rehabilitation","Total hip replacement rehabilitation","N/A","Misc",false);
