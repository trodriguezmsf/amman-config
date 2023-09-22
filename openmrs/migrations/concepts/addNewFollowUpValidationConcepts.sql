set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"FUP, Outcome for further admission anaesthesia validation","Outcome for further admission anaesthesia validation","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"FUP, Name of anaesthetist","Name of anaesthetist","Coded","Misc",false);

#Add Text Concept
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"FUP, Comments about anaesthesia validation","Comments about anaesthesia validation","Text","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Needs complementary investigation","Needs complementary investigation","N/A","Misc",false);