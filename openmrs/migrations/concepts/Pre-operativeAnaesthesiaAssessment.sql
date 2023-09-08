set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Parent Concepts
#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Chest status","Chest status","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Chronic diseases","Chronic diseases","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Recent medical problems","Recent medical problems","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Investigations needed","Investigations needed","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Current medications","Current medications","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Nausea and vomiting prevention plan","Nausea and vomiting prevention plan","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Pre-operative medications details","Pre-operative medications details","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Blood product preparation","Blood product preparation","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Anaesthesia remarks and notes","Anaesthesia remarks and notes","Text","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, ASA score","ASA score","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Blood group","Blood group","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Rh","Rh","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Risk of post-operative nausea and vomiting","Risk of post-operative nausea and vomiting","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Patient ready for surgery?","Patient ready for surgery?","Coded","Misc",false);

#Add Numeric Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Hemoglobin (Hb)","Hemoglobin (Hb)","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Fasting duration before surgery (hours)","Fasting duration before surgery (hours)","Numeric","Misc",false);

#Add Numeric concepts to concept Numeric Table
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "PREOPAA, Hemoglobin (Hb)" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "PREOPAA, Fasting duration before surgery (hours)" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),24,NULL,NULL,NULL,NULL,NULL,"",1,1);

#Add Datetime Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Date recorded","Date recorded","Datetime","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Group AB","Group AB","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Group A","Group A","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Group O","Group O","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Group B","Group B","N/A","Misc",false);


#Add Concept sets
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PREOPAA, Pre-Operative Anaesthesia Assessment","Pre-Operative Anaesthesia Assessment","N/A","ConvSet",true);

#Add Help Text to Concepts
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "PREOPAA, Hemoglobin (Hb)" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"g/dl","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "PREOPAA, Rh" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Rhesus (Rh)","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "PREOPAA, Fasting duration before surgery (hours)" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Number of fasting hours (maximum 24h)","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "PREOPAA, Pre-Operative Anaesthesia Assessment" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"The assessment should be filled by the anaesthetist one day before surgery day","en",1,now(),NULL,NULL,uuid());
