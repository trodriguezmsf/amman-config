set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

-- question concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Date of consultation","Date of consultation","Datetime","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Does the patient need a follow-up?","Does the patient need a follow-up?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Improvement / outcomes (CGI-I scale)","Improvement / outcomes (CGI-I scale)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Secondary Syndrome","Secondary Syndrome","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Severity of symptoms (CGI-S scale)","Severity of symptoms (CGI-S scale)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Syndrome","Syndrome","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Type of activity","Type of activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Type of assessment","Type of assessment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Comment on the screening tool","Comment on the screening tool","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, General comment about session","General comment about session","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Summary of MSE (mental state examination)","Summary of MSE (mental state examination)","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Treatment plan","Treatment plan","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, GAD 7","GAD 7 (if anxiolytic prescribed)","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, PHQ9","PHQ9 (if antidepressant prescribed)","Numeric","Misc",false);

-- adding concept sets

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PA, Psychiatrist-mhGAP Assessment","Psychiatrist-mhGAP Assessment","N/A","ConvSet",true);

-- Adding Numeric concepts to the concept Numeric table

INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)VALUES ((select concept_id from concept_name where name = "PA, GAD 7" and concept_name_type = 'FULLY_SPECIFIED'  and locale = 'en'  and voided = 0),NULL,NULL,21,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)VALUES ((select concept_id from concept_name where name = "PA, PHQ9" and concept_name_type = 'FULLY_SPECIFIED'  and locale = 'en'  and voided = 0),NULL,NULL,27,NULL,NULL,NULL,"",1,1);

-- Adding Description of the  concepts to the concept description table

INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PA, Severity of symptoms (CGI-S scale)" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Normal - not at all ill, symptoms of disorder not present past seven day, Borderline mentally ill – subtle or suspected pathology, Mildly ill -  clearly established symptoms with minimal, if any, distress or difficulty in social and occupational function, Moderately ill - overt symptoms causing noticeable, but modest, functional impairment/distress; symptom level may warrant medication, Markedly ill - intrusive symptoms that distinctly impair social/occupational function or cause intrusive levels of distress, Severely ill - disruptive pathology, behavior/function are frequently influenced by symptoms, may require assistance, Among the most extremely ill patients - pathology drastically interferes in many life functions; may be hospitalized",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PA, PHQ9" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"0-4: no intervention needed, 5 to 14: Refer to counsellor/psychologist for talking therapy, 15 to 19: Refer to counsellor/psychologist for talking therapy, antidepressant can be considered if patient not responding, Greater than 20: considered immediate initiation of AD, refer to psychologist/counsellor for co-therapy",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PA, GAD 7" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Score 1- 14: Counseling & relaxation approaches are the first line treatment, Score >=15: Short term anxiolytic can be considered. Always prescribed alongside counseling & relaxation approaches, Antidepressant treatment can be considered for anxiety not responding to counselling & relaxation.",'en',1,now(),NULL,NULL,uuid());
