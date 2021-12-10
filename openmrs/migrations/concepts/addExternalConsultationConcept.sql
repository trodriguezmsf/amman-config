set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Parent Concepts
#Add Date Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"EC, Date recorded","Date recorded","Date","Misc",false);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"EC, Type of external consultation, other","Type of external consultation, other","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"EC, Notes on the external consultation","Notes on the external consultation","Text","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"EC, Type of external consultation","Type of external consultation","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Paediatric","Paediatric","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Surgical","Surgical","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ENT","ENT","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Dermatologic","Dermatologic","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Internal medicine","Internal medicine","N/A","Misc",false);

#Add Concept Sets
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"External Consultation","External Consultation","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"EC, Photo upload","Photo upload","N/A","Misc",true);
