set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Date Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"LR, Date of sample","Date of sample","DateTime","Misc",false);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"LR, Laboratory results, comments","Laboratory results, comments","Text","Misc",false);

#Add Image concept
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"LR, Image upload","Image upload","N/A","Misc",true);

#Add Concept sets
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"LR, Laboratory Results","Laboratory Results","N/A","ConvSet",true);