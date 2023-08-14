set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Parent Concepts
#Add Date Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Date recorded","Date recorded","Date","Misc",false);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Allergy","Allergy","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Pre-existing disease","Pre-existing disease","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Pre-existing medication","Pre-existing medication","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Targeted medication name and details","Targeted medication name and details","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on change in treatment plan","Comments on change in treatment plan","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on inappropriate drug regimen (dose modification)","Comments on inappropriate drug regimen (dose modification)","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on drug-drug interaction","Comments on drug-drug interaction","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on adverse drug reaction","Comments on adverse drug reaction","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on contraindications","Comments on contraindications","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on untreated condition","Comments on untreated condition","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on therapeutic duplication","Comments on therapeutic duplication","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on drug without indication","Comments on drug without indication","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on therapeutic drug monitoring","Comments on therapeutic drug monitoring","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on alternative recommended medications from MSF standard list","Comments on alternative recommended medications from MSF standard list","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on laboratory investigation required","Comments on laboratory investigation required","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Comments on the accepted intervention","Comments on the accepted intervention","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Why intervention not accepted by the prescriber?","Why intervention not accepted by the prescriber?","Text","Misc",false);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Reason for intervention","Reason for intervention","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Change in treatment plan","Change in treatment plan","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Type of drug-drug interaction","Type of drug-drug interaction","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Type of adverse drug reaction (ADR)","Type of adverse drug reaction (ADR)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Therapeutic drug monitoring for","Therapeutic drug monitoring for","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Intervention accepted by the prescriber?","Intervention accepted by the prescriber?","Coded","Misc",false);

#Add Numeric Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Weight","Weight","Numeric","Finding",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Height","Height","Numeric","Finding",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"BMI Computed","BMI Computed","Numeric","Computed",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ABW Computed","ABW Computed","Numeric","Computed",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Ideal body weight (IBW)","Ideal body weight (IBW)","Numeric","Finding",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Creatinine clearance","Creatinine clearance","Numeric","Misc",false);

#Add Numeric concepts to concept Numeric Table
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "CPA, Weight" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"Kg",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "CPA, Height" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"cm",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "CPA, Ideal body weight (IBW)" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "CPA, Creatinine clearance" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "BMI Computed" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"Kg/m2",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "ABW Computed" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"Kg/m2",1,1);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Drug without indication","Drug without indication","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Contraindications","Contraindications","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"To be taken into account","To be taken into account","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Drug-drug interaction","Drug-drug interaction","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Aminophylline","Aminophylline","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Intervention follow-up by physician","Intervention follow-up by physician","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Therapeutic duplication","Therapeutic duplication","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Phenytoin","Phenytoin","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Therapeutic drug monitoring","Therapeutic drug monitoring","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Untreated condition","Untreated condition","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Phenobarbital","Phenobarbital","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Treatment plan","Treatment plan","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Combination to be avoided","Combination to be avoided","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Use with caution","Use with caution","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Vancomycin","Vancomycin","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Contraindicated combination","Contraindicated combination","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Sensitivity reaction","Sensitivity reaction","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Gentamicin","Gentamicin","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Electrolyte (Ca, Mg, K)","Electrolyte (Ca, Mg, K)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Laboratory investigation required","Laboratory investigation required","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Digoxin","Digoxin","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Amikacin","Amikacin","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Antifungal triazoles","Antifungal triazoles","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Inappropriate drug regimen","Inappropriate drug regimen","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Adverse drug reaction (ADR)","Adverse drug reaction (ADR)","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Valproic acid","Valproic acid","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Step up","Step up","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Carbamazepine","Carbamazepine","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Step down","Step down","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Alternative recommended medications from MSF standard list","Alternative recommended medications from MSF standard list","N/A","Misc",false);

#Add Help Text to Concepts
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "CPA, Pre-existing medication" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Medication taken at home","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "CPA, Reason for intervention" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Treatment plan (Step up: addition of new medication, Step down remove of prescribed medication), Inappropriate drug regimen (Dose (supra/sub), route of administration, frequency, duration), Drug-drug interaction (Occur when two or more drugs react with each other), Adverse drug reaction (A response to a drug that is noxious and unintended and occurs at doses normally used in man for the prophylaxis, diagnosis or therapy of disease, or for modification of physiological function), Untreated condition (Not given medical treatment, case left untreated, the condition may become chronic, eg. Lab result high HbA1C without modification in diet or medication), Therapeutic duplication (The practice of prescribing multiple medications for the same indication or purpose without a clear distinction of when one agent should be administered over another), Drug without indication (The patient is taking a medication for no medically valid condition or reason), Therapeutic drug monitoring (Testing that measures the amount of certain medicines in the patient blood to make sure the amount of medicine the patient is taking is safe and effective), Alternative recommended from MSF standard list (Priority for valid medication MSF standard list and pharmacy stock), Laboratory investigation required (A medical procedure that involves testing a sample of blood, urine, or other substance from the body to confirm if treatment is working and/or monitor the treatment over time)","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "CPA, Type of drug-drug interaction" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Use with caution: Close follow-up and attention needed, To be taken into account: Need follow-up with less attention","en",1,now(),NULL,NULL,uuid());
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "CPA, Type of adverse drug reaction (ADR)" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Sensitivity reactions: (Itching, Red Man syndrome,...)","en",1,now(),NULL,NULL,uuid());


call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, BMI","BMI","N/A","Concept Details",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Adjusted body weight (ABW)","Adjusted body weight (ABW)","N/A","Concept Details",true);

#Add Concept sets
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Clinical Pharmacy Assessment","Clinical Pharmacy Assessment","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Patient related medical information","Patient related medical information","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPA, Clinical pharmacy interventions","Clinical pharmacy interventions","N/A","ConvSet",true);