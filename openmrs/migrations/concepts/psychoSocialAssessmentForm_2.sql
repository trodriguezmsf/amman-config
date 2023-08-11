set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Referrals ordered","Referrals ordered","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Sanaa MLO","Sanaa MLO","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Gaza MLO","Gaza MLO","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Aden MLO","Aden MLO","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"BMRC MLO","BMRC MLO","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Self-referral","Self-referral","N/A","Misc",false);
