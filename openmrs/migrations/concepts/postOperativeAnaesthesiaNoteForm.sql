set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add additional answer concepts to Complication of anaesthesia
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Unanticipated Movement to ICU/HDU","Unanticipated Movement to ICU/HDU","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Unanticipated Reoperation","Unanticipated Reoperation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Unanticipated Difficult Intubation","Unanticipated Difficult Intubation","N/A","Misc",false);

#Add Text Concept
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"APN, Anaesthetic post-operative orders","Anaesthetic post-operative orders","Text","Misc",false);

#Add Help Text to Concepts
INSERT INTO concept_description (concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid)
VALUES ((select concept_id from concept_name where name = "APN, Complication of anaesthesia" and concept_name_type = "FULLY_SPECIFIED" and locale = "en" and voided = 0),
"Drug Reaction: Complications related to drug administration during anaesthesia cause changes in hemodynamics; Bronchospasm: Spasm of bronchial smooth muscle, producing narrowing of the bronchi; Cardiac dysrhythmia: Abnormal or irregular heartbeat; Hypotension: decrease in systemic blood pressure below accepted low values; Hypothermia: A temperature of less than 35° C at the time of transfer from the OT to the recovery room; Hyperthermia: A temperature of more than 39° C at the time of transfer from the OT to the recovery room; Pulmonary aspiration: The inhalation of either oropharyngeal or gastric contents into the lower airways; Unanticipated bleeding: Readmission to the OT following intervention for unanticipated bleeding; Unanticipated Difficult Intubation : More than 2 attempts at intubation; Unanticipated Movement to ICU/HDU: Admission to the ICU/HDU was not anticipated in the preoperative planning due to intraoperative complications; Unanticipated Reoperation: Readmission to the OT following primary intervention for unanticipated surgical complications","en",1,now(),NULL,NULL,uuid());
