set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

-- coded

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Patient surgical status","Patient surgical status","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Post-op day","Post-op day","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Acute or chronic abdominal pain","Acute or chronic abdominal pain","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Surgical or nonsurgical abdominal pain","Surgical or nonsurgical abdominal pain","Coded","Misc",false);


-- text

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Past medical history","Past medical history","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Site and side of abdominal pain","Site and side of abdominal pain","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Radiation of abdominal pain","Radiation of abdominal pain","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, DVT prophylaxis medication","DVT prophylaxis medication","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Physical examination findings","Physical examination findings","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Type and frequency of IV antibiotics","Type and frequency of IV antibiotics","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Reason for isolation (microorganism)","Reason for isolation (microorganism)","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Type, frequency, regular or PRN pain medications","Type, frequency, regular or PRN pain medications","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Which antibiotics?","Which antibiotics?","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Pending labs","Pending labs","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Ordered labs","Ordered labs","Text","Misc",false);

-- Numeric

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Pain severity","Pain severity","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Diarrhoea frequency per day","Diarrhoea frequency per day","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Temperature","Temperature","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PPN, Day of IV antibiotic treatment","Day of IV antibiotic treatment","Numeric","Misc",false);

INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PPN, Pain severity" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),10,NULL,NULL,0,NULL,NULL,"",0,0);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PPN, Diarrhoea frequency per day" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),10,NULL,NULL,0,NULL,NULL,"",0,0);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PPN, Temperature" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,0,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PPN, Day of IV antibiotic treatment" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,0,NULL,NULL,"",0,0);

-- adding answer concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Pre-op","Pre-op","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Post-op","Post-op","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Waiting for a surgery","Waiting for a surgery","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 0","Day 0","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 1","Day 1","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 2","Day 2","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 3","Day 3","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 4","Day 4","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 5","Day 5","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 6","Day 6","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Day 7","Day 7","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Other post-op day","Other post-op day","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Acute","Acute","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Chronic","Chronic","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Nonsurgical ","Nonsurgical ","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"TRT","TRT","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"TRM","TRM","N/A","Misc",false);


-- Adding Description of the  concepts to the concept description table

INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PPN, Pain severity" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"For children less than 7 years, use EVENDOL scale.  For children over 7 years use visual numeric pain scale",'en',1,now(),NULL,NULL,uuid());
