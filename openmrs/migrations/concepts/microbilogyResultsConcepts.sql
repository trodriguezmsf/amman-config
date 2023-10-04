set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ES, Linezolid","Linezolid","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SA, Doxycycline", "Doxycycline","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SA, Linezolid", "Linezolid","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CNS, Doxycycline","Doxycycline","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CNS, Linezolid","Linezolid","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SP, Doxycycline","Doxycycline","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SP, Linezolid","Linezolid","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SS, Doxycycline","Doxycycline","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SS, Linezolid","Linezolid","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"AXD, Piperacillin/Tazobactam", "Piperacillin/Tazobactam","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"AXD, Trimethoprim/Sulfamethoxazole", "Trimethoprim/Sulfamethoxazole","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SAM, Cefoxitin", "Cefoxitin","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"SAM, Mupirocin", "Mupirocin","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ASP, Cefepime", "Cefepime","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ASP, Ceftazidime", "Ceftazidime","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ASP, Aztreonam", "Aztreonam","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ASP, Ciprofloxacin", "Ciprofloxacin","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ASP, Levofloxacin", "Levofloxacin","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ASP, Trimethoprim/Sulfamethoxazole", "Trimethoprim/Sulfamethoxazole","Coded","Misc",false);

#Add Child concept
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Staphylococcus aureus. MRSA", "Staphylococcus aureus. MRSA","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Providencia sp.", "Providencia sp.","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Providencia rettregrei", "Providencia rettregrei","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Shewanella sp.", "Shewanella sp.","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Shewanella algae", "Shewanella algae","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Staphylococcus chromogenes", "Staphylococcus chromogenes","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Staphylococcus intermedius", "Staphylococcus intermedius","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Streptococcus constellatus", "Streptococcus constellatus","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Streptococcus oralis", "Streptococcus oralis","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Streptococcus milleri", "Streptococcus milleri","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Streptococcus mitis", "Streptococcus mitis","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Streptococcus salivarius", "Streptococcus salivarius","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Aeromonas Sp.", "Aeromonas Sp.","N/A","Misc",false);

