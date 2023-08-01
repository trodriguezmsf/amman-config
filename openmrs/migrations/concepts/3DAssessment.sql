set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Parent Concepts
#Add Date Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Date recorded","Date recorded","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Date of scan","Date of scan","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Date of delivery","Date of delivery","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Session date","Session date","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Date of follow-up session","Date of follow-up session","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Date of discharge","Date of discharge","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Hydrocolloid date of referral","Hydrocolloid date of referral","Date","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of assessment","Type of assessment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Referral source","Referral source","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of TFO activity","Type of TFO activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Referral","Referral","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of session","Type of session","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Orthosis or prosthesis delivered?","Orthosis or prosthesis delivered?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of MIDA activity","Type of MIDA activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Upper limb prosthetic side","Upper limb prosthetic side","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Upper limb prosthetic age group","Upper limb prosthetic age group","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of prosthesis","Type of prosthesis","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of adult upper limb prosthetic activity","Type of adult upper limb prosthetic activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of paediatric upper limb prosthetic activity","Type of paediatric upper limb prosthetic activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, UBET age category","UBET age category","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, CAPP-FSI age group","CAPP-FSI age group","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Splint side","Splint side","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Splint site","Splint site","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of splint","Type of splint","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, SG referral source","SG referral source","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Hydrocolloid side","Hydrocolloid side","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Type of Hydrocolloid activity","Type of Hydrocolloid activity","Coded","Misc",false);

#Add Numeric Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Pain intensity score","Pain intensity score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Itchiness score","Itchiness score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Satisfaction with appearance (Lawrence) total score","Satisfaction with appearance (Lawrence) total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Patient and observer scar assessment scale (POSAS) total score","Patient and observer scar assessment scale (POSAS) total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Vancouver scar scale (VSS) total score","Vancouver scar scale (VSS) total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Functional activities evaluation total score","Functional activities evaluation total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Other functional activities total score","Other functional activities total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Patient satisfaction total score","Patient satisfaction total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Patient social participation total score","Patient social participation total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Symptoms total score","Symptoms total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Vertical mouth opening","Vertical mouth opening","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Horizontal mouth opening","Horizontal mouth opening","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Adult individually prioritized problem assessment (IPPA) total score","Adult individually prioritized problem assessment (IPPA) total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, OPUS assessment total score","OPUS assessment total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Adult OPUS satisfaction with device total score","Adult OPUS satisfaction with device total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Daily life activities assessment total score","Daily life activities assessment total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Paediatric individually prioritized problem assessment (IPPA) total score","Paediatric individually prioritized problem assessment (IPPA) total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Paediatric OPUS satisfaction with device total score","Paediatric OPUS satisfaction with device total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, UBET assessment total score","UBET assessment total score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, CAPP-FSI assessment total score","CAPP-FSI assessment total score","Numeric","Misc",false);

#Add Numeric concepts to concept Numeric Table
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Pain intensity score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),10,NULL,10,0,NULL,0,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Itchiness score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),10,NULL,10,0,NULL,0,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Satisfaction with appearance (Lawrence) total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Patient and observer scar assessment scale (POSAS) total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Vancouver scar scale (VSS) total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Functional activities evaluation total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),64,NULL,NULL,0,NULL,NULL,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Other functional activities total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),12,NULL,NULL,0,NULL,NULL,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Patient satisfaction total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),12,NULL,NULL,0,NULL,NULL,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Patient social participation total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),4,NULL,NULL,0,NULL,NULL,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Symptoms total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),20,NULL,NULL,0,NULL,NULL,"",0,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Vertical mouth opening" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,0,NULL,NULL,"cm",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Horizontal mouth opening" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,0,NULL,NULL,"cm",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Adult individually prioritized problem assessment (IPPA) total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, OPUS assessment total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Adult OPUS satisfaction with device total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Daily life activities assessment total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Paediatric individually prioritized problem assessment (IPPA) total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, Paediatric OPUS satisfaction with device total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, UBET assessment total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "3DA, CAPP-FSI assessment total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Comments on referral","Comments on referral","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Comments on orthosis or prosthesis","Comments on orthosis or prosthesis","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, General comments about the session","General comments about the session","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, 3D treatment plan provided in Amman","3D treatment plan provided in Amman","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, 3D recommendations for future treatment plan","3D recommendations for future treatment plan","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Other SG referral source","Other SG referral source","Text","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Home visit","Home visit","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4 - 8 years","4 - 8 years","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Lower extremity (LE)","Lower extremity (LE)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 week assessment","1 week assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Individual","Individual","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Upper extremity (UE)","Upper extremity (UE)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Partial hand (PH)","Partial hand (PH)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Splints","Splints","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Mental Health","Mental Health","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 month assessment","1 month assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"15 day assessment","15 day assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"6 month assessment","6 month assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 - 4 years","2 - 4 years","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 month assessment","3 month assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Mouth impairment and disability (MIDA) assessment","Mouth impairment and disability (MIDA) assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Hydrocolloid","Hydrocolloid","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"5 - 7 years","5 - 7 years","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Surgical guide (SG)","Surgical guide (SG)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Group","Group","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"RSP patient","RSP patient","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"More than 8 years","More than 8 years","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Orthopaedic","Orthopaedic","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Initial assessment","Initial assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharge assessment","Discharge assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Follow-up session note","Follow-up session note","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Upper splint","Upper splint","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Adult","Adult","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Non-RSP patient","Non-RSP patient","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Upper limb prosthetic assessment","Upper limb prosthetic assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OPD","OPD","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"1 year assessment","1 year assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Transparent facial orthosis (TFO) assessment","Transparent facial orthosis (TFO) assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3 week assessment","3 week assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"8 - 10 years","8 - 10 years","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Lower splint","Lower splint","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"11 - 18 years","11 - 18 years","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"2 week assessment","2 week assessment","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Below elbow (BE)","Below elbow (BE)","N/A","Misc",false);

#Add Help Text to Concepts
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "3DA, Vertical mouth opening" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"In Centimetre","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "3DA, Horizontal mouth opening" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"In Centimetre","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "3DA, Daily life activities assessment total score" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"in Seconds, If the patient cannot perform the activity fill 900 second","en",1,now(),NULL,NULL,uuid());

-- adding concept sets

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, 3D Assessment","3D Assessment","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, TFO clinical assessments","TFO clinical assessments","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Image upload","Image upload","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Video upload","Video upload","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, MIDA clinical assessments","MIDA clinical assessments","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Adult upper limb prosthetic clinical assessments","Adult upper limb prosthetic clinical assessments","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3DA, Paediatric upper limb prosthetic clinical assessments","Paediatric upper limb prosthetic clinical assessments","N/A","Misc",true);
