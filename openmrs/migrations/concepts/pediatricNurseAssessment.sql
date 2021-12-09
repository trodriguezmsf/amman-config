set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

-- date

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Date recorded","Date recorded","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Date of insertion, peripheral line","Date of insertion, peripheral line","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Date of removal, peripheral line","Date of removal, peripheral line","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Date of insertion, PICC line","Date of insertion, PICC line","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Date of dressing","Date of dressing","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Date of removal, PICC line","Date of removal, PICC line","Date","Misc",false);

-- text

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Therapeutic food","Therapeutic food","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, History of medical illness","History of medical illness","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Type of medication","Type of medication","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Comments about allergy","Comments about allergy","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Type of pain","Type of pain","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, When does the pain occur","When does the pain occur","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Description of wound, other","Description of wound, other","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Dressing, comments","Dressing, comments","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Comments, peripheral line","Comments, peripheral line","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Comments, dressing PICC line","Comments, dressing PICC line","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Condition of tissue expander","Condition of tissue expander","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Comments on Foley catheter","Comments on Foley catheter","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Nursing consultation notes","Nursing consultation notes","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, The most significant issue to follow","The most significant issue to follow","Text","Misc",false);

-- coded

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Type of assessment","Type of assessment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Nutritional status","Nutritional status","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Infectious disease","Infectious disease","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Currently taking medication","Currently taking medication","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Previous blood transfusion","Previous blood transfusion","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Caretaker relationship to the child","Caretaker relationship to the child","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, General appearance","General appearance","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Respiratory","Respiratory","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Cardiac","Cardiac","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Gastrointestinal","Gastrointestinal","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Genitourinary","Genitourinary","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Nervous system","Nervous system","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, HEENT","HEENT","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Skin","Skin","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Immunization","Immunization","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, History of allergy","History of allergy","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Side of pain","Side of pain","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Site of pain","Site of pain","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Does the patient have a dressing?","Does the patient have a dressing?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Was the dressing changed","Was the dressing changed","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Side of dressing","Side of dressing","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Site of dressing","Site of dressing","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Description of wound","Description of wound","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Does the patient have a peripheral line?","Does the patient have a peripheral line?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Site of peripheral line","Site of peripheral line","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Does the patient have a PICC line?","Does the patient have a PICC line?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Does the patient have a tissue expander?","Does the patient have a tissue expander?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Site of tissue expander","Site of tissue expander","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Does the patient have a Foley catheter?","Does the patient have a Foley catheter?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Blood sugar","Blood sugar","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Insulin given","Insulin given","Coded","Misc",false);

-- Numeric

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Pain severity","Pain severity","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Quantity injected","Quantity injected","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Quantity withdrawn","Quantity withdrawn","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Total volume in tissue expander","Total volume in tissue expander","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, RBS before meal","RBS before meal","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, RBS after meal","RBS after meal","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, FBS","FBS","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, How much insulin given?","How much insulin given?","Numeric","Misc",false);



INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, Pain severity" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",0,0);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, Quantity injected" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, Quantity withdrawn" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, Total volume in tissue expander" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, RBS before meal" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, RBS after meal" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, FBS" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "PNA, How much insulin given?" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);


-- adding answer concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Overweight or obese","Overweight or obese","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Normal nutritional status","Normal nutritional status","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Lice","Lice","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Father","Father","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Mother","Mother","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Sibling","Sibling","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Grandfather","Grandfather","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Grandmother","Grandmother","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Unwell","Unwell","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Diminished or absent breath sounds","Diminished or absent breath sounds","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Crackles","Crackles","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Wheezes","Wheezes","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Negative, Arrhythmia","Negative, Arrhythmia","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Heart murmur","Heart murmur","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Capillary refill time > 3 sec","Capillary refill time > 3 sec","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Weak, slow, or irregular peripheral pulse","Weak, slow, or irregular peripheral pulse","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Cold extremities","Cold extremities","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Feeding difficulties","Feeding difficulties","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Abdominal distension","Abdominal distension","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Absent bowel sounds","Absent bowel sounds","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Hepatomegaly","Hepatomegaly","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Splenomegaly","Splenomegaly","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Focal neurological deficit","Focal neurological deficit","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Missing parts of the ear","Missing parts of the ear","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Pale","Pale","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Cyanotic","Cyanotic","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Bruises","Bruises","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Child up-to-date","Child up-to-date","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Vaccinated to measles","Vaccinated to measles","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Delayed","Delayed","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Record unavailable","Record unavailable","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Eyelid","Eyelid","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Lip","Lip","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Lower jaw","Lower jaw","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Arrhythmia","Arrhythmia","N/A","Misc",false);


-- adding concept sets

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Pediatric Nurse Assessment","Pediatric Nurse Assessment","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Medical history","Medical history","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Review of systems and physical examination","Review of systems and physical examination","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Pain assessment","Pain assessment","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Dressing","Dressing","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Peripheral line","Peripheral line","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, PICC line","PICC line","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Tissue expander","Tissue expander","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"PNA, Diabetes monitoring","Diabetes monitoring","N/A","Misc",true);


-- Adding Description of the  concepts to the concept description table

INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "PNA, Pain severity" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"For children less or equal to 7 years, use EVENDOL. For children over 7 years use visual numeric pain scale. EVENDOL is a 5-item pain scale (vocal or verbal expression, facial expression, movements, postures, and interaction with the environment) for each item 0 = 'sign absent', 1 = 'sign weak or transient', 2 = 'sign moderate or present about half the time', and 3 = 'sign strong or present almost all the time'",'en',1,now(),NULL,NULL,uuid());