set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"AIA, Type of assessment","Type of assessment","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Follow-up assessment","Follow-up assessment","N/A","Misc",false);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"AIA, Proposed investigation or consultation","Proposed investigation or consultation","Text","Misc",false);

#Add Date Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"AIA, Date of next follow-up","Date of next follow-up","Date","Misc",false);