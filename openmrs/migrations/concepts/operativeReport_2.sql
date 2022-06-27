set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

-- text

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OR, Post-operative order","Post-operative order","Text","Misc",false);
