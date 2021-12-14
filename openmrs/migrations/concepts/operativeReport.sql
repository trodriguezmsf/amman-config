set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


-- adding answer concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Periodontal scaling and root planning","Periodontal scaling and root planning","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Periodontal scaling","Periodontal scaling","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Surgical tooth extraction","Surgical tooth extraction","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Treatment of root canal obstruction","Treatment of root canal obstruction","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Protective tooth restoration","Protective tooth restoration","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Resin-based composite","Resin-based composite","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Removal of residual tooth roots (cutting procedure)","Removal of residual tooth roots (cutting procedure)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Surgical placement of implant body: endosteal implant - Includes second stage surgery and placement of healing cap","Surgical placement of implant body: endosteal implant - Includes second stage surgery and placement of healing cap","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Clean","Clean","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Clean-contaminated","Clean-contaminated","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Contaminated","Contaminated","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Dirty - infected","Dirty - infected","N/A","Misc",false);


-- coded

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OR, Wound classification","Wound classification","Coded","Misc",false);


-- Adding Description of the  concepts to the concept description table

INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "OR, Wound classification" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Class 1 (clean) / Class 2  (clean-contaminated) / Class 3 (contaminated)/ Class 4 (dirty - Infected)",'en',1,now(),NULL,NULL,uuid());