set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Parent Concepts
#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Sensory Perception","Sensory Perception","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Moisture","Moisture","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Activity","Activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Mobility","Mobility","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Nutrition","Nutrition","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Friction and Shear","Friction and Shear","Coded","Misc",false);

#Add Numeric Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Total risk score","Total risk score","Numeric","Computed",false);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Total Pressure Injury Risk Level","Total Pressure Injury Risk Level","Text","Computed",false);

#Add Numeric concepts to concept Numeric Table
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "VS, Total risk score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 = Completely Limited","1 = Completely Limited","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 = Very Limited","2 = Very Limited","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 = Completely Immobile","1 = Completely Immobile","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 = Constantly Moist","1 = Constantly Moist","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4 = No Impairment","4 = No Impairment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4 = Excellent","4 = Excellent","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4 = No Limitation","4 = No Limitation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 = Bedfast","1 = Bedfast","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 = Moist","2 = Moist","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4 = Rarely Moist","4 = Rarely Moist","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4 = Walks Frequently","4 = Walks Frequently","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 = Adequate","3 = Adequate","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 = Slightly Limited","3 = Slightly Limited","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 = Walks Occasionally","3 = Walks Occasionally","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 = Chairfast","2 = Chairfast","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 = Occasionally Moist","3 = Occasionally Moist","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 = No Apparent Problem","3 = No Apparent Problem","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 = Probably Inadequate","2 = Probably Inadequate","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 = Very Poor","1 = Very Poor","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 = Problem","1 = Problem","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 = Potential Problem","2 = Potential Problem","N/A","Misc",false);

-- adding concept sets

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"VS, Pressure injury risk assessment","Pressure injury risk assessment","N/A","ConvSet",true);

#Add Help Text to Concepts
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "VS, Pressure injury risk assessment" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Total Risk Score : 19-23 Not at risk, 15-18 Mild risk, 13-14 Moderate risk, 10-12 High risk, ≤9 Severe risk","en",1,now(),NULL,NULL,uuid());


