set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

-- question concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Date of consultation","Date of consultation","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Type of assessment","Type of assessment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Type of activity","Type of activity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Referral source","Referral source","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Personal situation at home","Personal situation at home","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Personal situation in hospital","Personal situation in hospital","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Previous MH treatment","Previous MH treatment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Comment on the general information","Comment on the general information","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Severity of symptoms (CGI-S scale)","Severity of symptoms (CGI-S scale)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Improvement / outcomes (CGI-I scale)","Improvement / outcomes (CGI-I scale)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, General comment about session","General comment about session","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, PSYCa 3-36 months","PSYCa 3-36 months","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, PSYCa 3-6 (child)","PSYCa 3-6 (child)","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, SDQ (7 to 14 years old)","SDQ (7 to 14 years old)","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, PHQ4 (15 and more)","PHQ4 (15 and more)","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Comment on the screening tool","Comment on the screening tool","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Syndrome","Syndrome","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Secondary Syndrome","Secondary Syndrome","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Does the patient need a follow-up?","Does the patient need a follow-up?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, General observations (main symptoms, syndrome,..)","General observations (main symptoms, syndrome,..)","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Recommendations for medical/physio team","Recommendations for medical/physio team","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Presence of patient","Presence of patient","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Reason of discharge","Reason of discharge","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Comment on the process of care and discharge","Comment on the process of care and discharge","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Comment on the referral","Comment on the referral","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Prescribers: Comment on the process of care and discharge","Prescribers: Comment on the process of care and discharge","Text","Misc",false);

-- adding answer concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Individual session","Individual session","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Family support session","Family support session","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Joint session with med/physio","Joint session with med/physio","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"First assessment by MH team","First assessment by MH team","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Medical round","Medical round","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Doctor/ nurses/physio","Doctor/ nurses/physio","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Request from family","Request from family","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Peer counselor","Peer counselor","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Adult living alone","Adult living alone","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Adult living with family","Adult living with family","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Adult single parent family","Adult single parent family","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Minor isolated","Minor isolated","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Minor living with family","Minor living with family","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Family member staying with patient","Family member staying with patient","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Regular contact with family","Regular contact with family","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Isolated patient","Isolated patient","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Patient poorly supported","Patient poorly supported","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Yes: Traditional / religious healer","Yes: Traditional / religious healer","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Yes: Clinical professional without psychotropic prescription","Yes: Clinical professional without psychotropic prescription","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Yes: Clinical professional with prescription","Yes: Clinical professional with prescription","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Borderline mentally ill","Borderline mentally ill","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Midly ill","Midly ill","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Moderately ill","Moderately ill","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Markedly ill","Markedly ill","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Severely ill","Severely ill","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Among the most extremely ill","Among the most extremely ill","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Very much improved","Very much improved","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Much improved","Much improved","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Minimally improved","Minimally improved","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"No change","No change","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Minimally worse","Minimally worse","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Much worse","Much worse","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Very much worse","Very much worse","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Trauma related","Trauma related","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Psychosis (≥15 years)","Psychosis (≥15 years)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Behavioral/substance (≥ 15yrs)","Behavioral/substance (≥ 15yrs)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Behavioral (<15yrs)","Behavioral (<15yrs)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Neurocognitive","Neurocognitive","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Psychosomatic / MUPS","Psychosomatic / MUPS","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Epilepsy / seizure","Epilepsy / seizure","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"No: Assessment without follow-up","No: Assessment without follow-up","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharge: End of MH follow-up (programs continues)","Discharge: End of MH follow-up (programs continues)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharge: End of program / End of MH follow-up","Discharge: End of program / End of MH follow-up","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharge: End of program / Patient referred to other MH services","Discharge: End of program / Patient referred to other MH services","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharge: End of program / MH needs but no referral possible","Discharge: End of program / MH needs but no referral possible","N/A","Misc",false);

-- adding concept sets

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Psycho-Social Assessment","Psycho-Social Assessment","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, General information","General information","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Clinical assessment","Clinical assessment","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Screening tool","Screening tool","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Findings","Findings","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PSA, Discharge Assessment","Discharge Assessment","N/A","Misc",true);

-- Adding Numeric concepts to the concept Numeric table

INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)VALUES ((select concept_id from concept_name where name = "PSA, PSYCa 3-36 months" and concept_name_type = 'FULLY_SPECIFIED'  and locale = 'en'  and voided = 0),NULL,NULL,40,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)VALUES ((select concept_id from concept_name where name = "PSA, PSYCa 3-6 (child)" and concept_name_type = 'FULLY_SPECIFIED'  and locale = 'en'  and voided = 0),NULL,NULL,44,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)VALUES ((select concept_id from concept_name where name = "PSA, SDQ (7 to 14 years old)" and concept_name_type = 'FULLY_SPECIFIED'  and locale = 'en'  and voided = 0),NULL,NULL,40,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)VALUES ((select concept_id from concept_name where name = "PSA, PHQ4 (15 and more)" and concept_name_type = 'FULLY_SPECIFIED'  and locale = 'en'  and voided = 0),NULL,NULL,12,NULL,NULL,NULL,"",1,1);

-- Adding Description of the  concepts to the concept description table

INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PSA, Severity of symptoms (CGI-S scale)" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Normal - not at all ill, symptoms of disorder not present past seven day, Borderline mentally ill – subtle or suspected pathology, Mildly ill -  clearly established symptoms with minimal, if any, distress or difficulty in social and occupational function, Moderately ill - overt symptoms causing noticeable, but modest, functional impairment/distress; symptom level may warrant medication, Markedly ill - intrusive symptoms that distinctly impair social/occupational function or cause intrusive levels of distress, Severely ill - disruptive pathology, behavior/function are frequently influenced by symptoms, may require assistance, Among the most extremely ill patients - pathology drastically interferes in many life functions; may be hospitalized",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PSA, Improvement / outcomes (CGI-I scale)" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Very much improved—nearly all better; good level of functioning; minimal symptoms; represents a very substantial change, Much improved—notably better with significant reduction of symptoms; increase in the level of functioning but some symptoms remain, Minimally improved—slightly better with little or no clinically meaningful reduction of symptoms. Represents very little change in basic clinical status, level of care, or functional capacity, No change—symptoms remain essentially unchanged, Minimally worse—slightly worse but may not be clinically meaningful; may represent very little change in basic clinical status or functional capacity, Much worse—clinically significant increase in symptoms and diminished functioning, Very much worse—severe exacerbation of symptoms and loss of functioning",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PSA, PSYCa 3-6 (child)" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"All scores 9 and above need to be referred to a clinical psychologist for further evaluation and care.",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PSA, SDQ (7 to 14 years old)" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Normal 0 -13, Borderline 14-16, Abnormal 17 – 40",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PSA, PHQ4 (15 and more)" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Anxiety subscale (GAD-2) = sum of items 1 and 2 - if more than 3, propose GAD7; Depression subscale (PHQ-2) = sum of items 3 and 4 - if more than 3, propose PHQ9; On each subscale, a score of 3 or greater is considered positive for screening purposes",'en',1,now(),NULL,NULL,uuid());
