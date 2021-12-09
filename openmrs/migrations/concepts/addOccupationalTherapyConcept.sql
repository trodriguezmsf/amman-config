set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

#Add Parent Concepts
#Add Date Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Date recorded","Date recorded","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Date of referral","Date of referral","Date","Misc",false);

#Add Text Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Comments on general impression/informal observation","Comments on general impression/informal observation","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other communication management, specify","Other communication management, specify","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other home establishment and management, specify","Other home establishment and management, specify","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other meal preparation and clean up, specify","Other meal preparation and clean up, specify","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other shopping, specify","Other shopping, specify","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Long term goal","Long term goal","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Short term goal","Short term goal","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other assessments performed","Other assessments performed","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Follow-up notes","Follow-up notes","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Comments on short term goals","Comments on short term goals","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Comment on long term goals","Comment on long term goals","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Difficulty at the beginning of the treatment","Difficulty at the beginning of the treatment","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Difficulty at the end of the treatment","Difficulty at the end of the treatment","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Comments about the difficulties","Comments about the difficulties","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Written home program","Written home program","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Patient/family occupational therapy education","Patient/family occupational therapy education","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Comments","Comments","Text","Misc",false);

#Add Numeric Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Sollermann test total score","Sollermann test total score","Numeric","Computed",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, DASH test score","DASH test score","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Grip","Grip","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Lateral pinch","Lateral pinch","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, 2 point pinch","2 point pinch","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, 3 point pinch","3 point pinch","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Power pinch","Power pinch","Numeric","Misc",false);

#Add Numeric concepts to concept Numeric Table
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, Sollermann test total score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, DASH test score" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, Grip" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, Lateral pinch" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, 2 point pinch" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, 3 point pinch" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision)
VALUES ((select concept_id from concept_name where name = "OTA, Power pinch" and concept_name_type = "FULLY_SPECIFIED"  and locale = "en"  and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);

#Add Coded Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Type of assessment","Type of assessment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Dominant hand","Dominant hand","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Affected hand","Affected hand","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Is the patient motivated to therapy?","Is the patient motivated to therapy?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Is the patient cooperative in the session?","Is the patient cooperative in the session?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Does the patient has a neat appearance?","Does the patient has a neat appearance?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Is the patient groomed well?","Is the patient groomed well?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Is the patient over protective to the injured part?","Is the patient over protective to the injured part?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Obtaining and using bathing supplies","Obtaining and using bathing supplies","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Soaping","Soaping","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Rinsing","Rinsing","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Drying body parts","Drying body parts","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Maintain bathing position","Maintain bathing position","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Transfer to and from bathing position","Transfer to and from bathing position","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Obtaining and using toilet supplies","Obtaining and using toilet supplies","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Managing clothes","Managing clothes","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Maintain toilet position","Maintain toilet position","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Transfer to and from toilet position","Transfer to and from toilet position","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Cleaning body","Cleaning body","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Obtain clothes from storage area","Obtain clothes from storage area","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Fastening buttons","Fastening buttons","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Fastening zipper","Fastening zipper","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Fastening belt","Fastening belt","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Put on and remove pants","Put on and remove pants","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Put on and remove shirt","Put on and remove shirt","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Tie shoelaces","Tie shoelaces","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Tie headscarf","Tie headscarf","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Remove body hair (use razors)","Remove body hair (use razors)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Use tweezers","Use tweezers","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Use nail clipper","Use nail clipper","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Use scissors","Use scissors","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Combing","Combing","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Tooth brushing","Tooth brushing","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Washing and drying","Washing and drying","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Apply deodorant","Apply deodorant","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Cleaning nose","Cleaning nose","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Hold a spoon","Hold a spoon","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Hold a knife","Hold a knife","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Hold a fork","Hold a fork","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Bring food from plate to mouth","Bring food from plate to mouth","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Bed mobility - rolling","Bed mobility - rolling","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Bed mobility - get in and out of the bed","Bed mobility - get in and out of the bed","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Bed mobility - lying - sitting","Bed mobility - lying - sitting","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Wheelchair mobility","Wheelchair mobility","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Transfer from and to a car","Transfer from and to a car","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Personal and device care","Personal and device care","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Care of others","Care of others","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Child rearing","Child rearing","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Using mobile phone","Using mobile phone","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Using writing tools","Using writing tools","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Using keyboards","Using keyboards","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other communication management","Other communication management","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Driving","Driving","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Walking","Walking","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Bicycling","Bicycling","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Ride in buses-taxis","Ride in buses-taxis","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Cleaning windows-floor-etc.","Cleaning windows-floor-etc.","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Make bed","Make bed","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Laundry","Laundry","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Washing dishes","Washing dishes","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Gardening","Gardening","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other home establishment and management","Other home establishment and management","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Carrying pans","Carrying pans","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Opening cans","Opening cans","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Holding cooking utensil","Holding cooking utensil","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other meal preparation and clean up","Other meal preparation and clean up","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Religious activities","Religious activities","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Carrying grocery bags","Carrying grocery bags","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Other shopping","Other shopping","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Education","Education","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Work","Work","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Leisure","Leisure","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Play","Play","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Social participation","Social participation","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Sollermann test administered","Sollermann test administered","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Put key into Yale lock, turn 90 degrees","Put key into Yale lock, turn 90 degrees","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Pick up coins up from flat surface, put into purses mounted on wall","Pick up coins up from flat surface, put into purses mounted on wall","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Pick up coins from purses","Pick up coins from purses","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Lift telephone receiver, put to ear","Lift telephone receiver, put to ear","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Turn door-handle 30 degrees","Turn door-handle 30 degrees","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Lift wooden cubes over edge 5 cm in height","Lift wooden cubes over edge 5 cm in height","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Lift iron over edge 5 cm in height","Lift iron over edge 5 cm in height","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Turn screw with screwdriver","Turn screw with screwdriver","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Pick up nuts","Pick up nuts","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Open/close zip","Open/close zip","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Put on tub grip stocking on the other hand","Put on tub grip stocking on the other hand","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Write with pen","Write with pen","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Do up buttons","Do up buttons","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Unscrew lid of jars","Unscrew lid of jars","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Put paper-clip on envelope","Put paper-clip on envelope","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Cut play-doh with knife and fork","Cut play-doh with knife and fork","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Fold paper, put into envelope","Fold paper, put into envelope","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Pour water from pure-pak","Pour water from pure-pak","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Pour water from jug","Pour water from jug","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Pour water from cup","Pour water from cup","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Short term goals status","Short term goals status","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Did the patient receive a written home program?","Did the patient receive a written home program?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Did the patient/family receive an occupational therapy education?","Did the patient/family receive an occupational therapy education?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Did the patient receive an adaptive device?","Did the patient receive an adaptive device?","Coded","Misc",false);

#Add Child Concepts
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"None of the short term goals were achieved","None of the short term goals were achieved","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"3","3","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"4","4","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"No problem","No problem","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Partial achievement of short term goals","Partial achievement of short term goals","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Full achievement of all short term goals","Full achievement of all short term goals","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Unable","Unable","N/A","Misc",false);

#Add Concept Sets
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Occupational Therapy Assessment","Occupational Therapy Assessment","N/A","ConvSet",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Initial assessment","Initial assessment","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL bathing/showering","ADL bathing/showering","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL toileting/toilet hygiene","ADL toileting/toilet hygiene","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL dressing","ADL dressing","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL grooming","ADL grooming","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL self-feeding","ADL self-feeding","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL functional mobility","ADL functional mobility","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, ADL personal and device care","ADL personal and device care","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, IADL","IADL","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, IADL communication management","IADL communication management","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, IADL driving and community mobility","IADL driving and community mobility","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, IADL home establishment and management","IADL home establishment and management","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, IADL meal preparation and clean up","IADL meal preparation and clean up","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, IADL shopping","IADL shopping","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Sollermann test","Sollermann test","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Assessment scores","Assessment scores","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Follow-up","Follow-up","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Discharge","Discharge","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Photo upload","Photo upload","N/A","Misc",true);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"OTA, Video upload","Video upload","N/A","Misc",true);
