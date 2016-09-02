Bahmni.ConceptSet.FormConditions.rules = {
   'PMIPA, Outcomes for 1st stage surgical validation' : function (formName, formFieldValues) {
          	var conditions = {
          		enable : [],
          		disable : []
          	};
          	var conditionConcept = formFieldValues['PMIPA, Outcomes for 1st stage surgical validation'];
          	if (conditionConcept=="Valid") {
          		conditions.enable.push("PMIPA, Priority","PMIPA, Name (s) of Surgeon 1","PMIPA, Name (s) of Surgeon 2","PMIPA, Comments:","PMIPA, Outcomes for 1st stage Aneasthesia validation")
          		conditions.disable.push("PMIPA, Postpone reason","PMIPA, Comments about postpone reason","PMIPA, Medical file to be submitted again by","PMIPA, Type of medical information needed for next submission","PMIPA, Refused Reason","PMIPA, Comments about refusal")
          		}
          	else if(conditionConcept=="Postponed") {
          	conditions.enable.push("PMIPA, Postpone reason","PMIPA, Comments about postpone reason","PMIPA, Medical file to be submitted again by","PMIPA, Outcomes for 1st stage Aneasthesia validation")
          	conditions.disable.push("PMIPA, Priority","PMIPA, Outcomes for 1st stage Aneasthesia validation","PMIPA, Name (s) of Surgeon 1","PMIPA, Name (s) of Surgeon 2","PMIPA, Comments:","PMIPA, Type of medical information needed for next submission","PMIPA, Refused Reason","PMIPA, Comments about refusal")
          	}
          	else if(conditionConcept=="More Information"){
          	conditions.enable.push("PMIPA, Type of medical information needed for next submission")
          	conditions.disable.push("PMIPA, Priority","PMIPA, Outcomes for 1st stage Aneasthesia validation","PMIPA, Name (s) of Surgeon 1","PMIPA, Name (s) of Surgeon 2","PMIPA, Comments:","PMIPA, Postpone reason","PMIPA, Comments about postpone reason","PMIPA, Medical file to be submitted again by","PMIPA, Refused Reason","PMIPA, Comments about refusal")
          	}
          	else if(conditionConcept=="Refused"){
          	conditions.enable.push("PMIPA, Refused Reason","PMIPA, Comments about refusal")
          	conditions.disable.push("PMIPA, Priority","PMIPA, Outcomes for 1st stage Aneasthesia validation","PMIPA, Name (s) of Surgeon 1","PMIPA, Name (s) of Surgeon 2","PMIPA, Comments:","PMIPA, Postpone reason","PMIPA, Comments about postpone reason","PMIPA, Medical file to be submitted again by","PMIPA, Type of medical information needed for next submission")
          	}
          	else {
          	    conditions.disable.push("PMIPA, Priority","PMIPA, Outcomes for 1st stage Aneasthesia validation","PMIPA, Name (s) of Surgeon 1","PMIPA, Name (s) of Surgeon 2","PMIPA, Comments:","PMIPA, Postpone reason","PMIPA, Comments about postpone reason","PMIPA, Medical file to be submitted again by","PMIPA, Type of medical information needed for next submission","PMIPA, Refused Reason","PMIPA, Comments about refusal")
          	}
          	return conditions;
            },
   'PMIPA, Outcomes for 1st stage Aneasthesia validation' : function (formName, formFieldValues) {
            var conditions = {
                            enable : [],
                            disable : []
                        };
            var conditionConcept = formFieldValues['PMIPA, Outcomes for 1st stage Aneasthesia validation'];
            if (conditionConcept == "Fits anaesthesia criteria"){
            conditions.enable.push("PMIPA, Name (s) of Anesthetist","Comments about Aneasthesia validation")
            conditions.disable.push("PMIPA, Type of medical information needed for next submission")
            }
            else if(conditionConcept == "Need complementary investigation"){
            conditions.enable.push("PMIPA, Type of medical information needed for next submission")
            conditions.disable.push("PMIPA, Name (s) of Anesthetist","Comments about Aneasthesia validation")
            }
            else{
            conditions.disable.push("Comments about Aneasthesia validation","PMIPA, Name (s) of Anesthetist","PMIPA, Type of medical information needed for next submission")
             }
             return conditions;
             },
   'FUP, Outcomes for follow-up surgical validation' : function (formName, formFieldValues) {
          	var conditions = {
          		enable : [],
          		disable : []
          	};
          	var conditionConcept = formFieldValues['FUP, Outcomes for follow-up surgical validation'];
          	if (conditionConcept=="To continue under Fup") {
          		conditions.enable.push("FUP, Priority","FUP, Qualitative outcome","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up")
          	    conditions.disable.push("FUP, Comments about MBA","FUP, Dismissal reason","FUP, Approval of dismissal","FUP, Comments about dismissal","FUP, Reason for re-admission","FUP, Comments about re-admission")
          	       }
          	else if(conditionConcept=="MBA") {
          	conditions.enable.push("FUP, Comments about MBA")
          	    conditions.disable.push("FUP, Priority","FUP, Qualitative outcome","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Dismissal reason","FUP, Approval of dismissal","FUP, Comments about dismissal","FUP, Reason for re-admission","FUP, Comments about re-admission")          	}
          	else if(conditionConcept=="Dismissal"){
          	conditions.enable.push("FUP, Dismissal reason","FUP, Approval of dismissal","FUP, Comments about dismissal")
          	    conditions.disable.push("FUP, Priority","FUP, Qualitative outcome","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Reason for re-admission","FUP, Comments about re-admission")          	}
          	else if(conditionConcept=="Re-admission"){
          	conditions.enable.push("FUP, Reason for re-admission","FUP, Comments about re-admission")
          	    conditions.disable.push("FUP, Priority","FUP, Qualitative outcome","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Dismissal reason","FUP, Approval of dismissal","FUP, Comments about dismissal")
          	}
          	else {
          	    conditions.disable.push("FUP, Priority","FUP, Qualitative outcome","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Dismissal reason","FUP, Approval of dismissal","FUP, Comments about dismissal","FUP, Reason for re-admission","FUP, Comments about re-admission")
          	}
          	return conditions;
            },
   'FV, Does the patient need medical final validation?': function(formName, formFieldValues) {
               var conditions ={
                   enable : [],
                   disable : []
               };
               var conditionConcept = formFieldValues['FV, Does the patient need medical final validation?'];
               if (conditionConcept == "Yes"){
                   conditions.enable.push("FV, Which medical information is needed for FV?","FV, Dead line to submit final validation","FV, Outcomes FV")
               }
               else if(conditionConcept == "No")
                  {
                   conditions.disable.push("FV, Which medical information is needed for FV?","FV, Dead line to submit final validation","FV, Outcomes FV","FV, Comments on FV")
               }
               else
               {
                   conditions.disable.push("FV, Which medical information is needed for FV?","FV, Dead line to submit final validation","FV, Outcomes FV","FV, Comments on FV")
               }
               return conditions;
               },
      'FV, Outcomes FV' : function(formName, formFieldValues){
               var conditions = {
                   enable : [],
                   disable : [],
               };
               var conditionConcept = formFieldValues['FV, Outcomes FV'];
               if (conditionConcept == "Further Evaluation"){
               conditions.enable.push("FV, Comments on FV")
               }
               else if (conditionConcept == "Rejected"){
                           conditions.enable.push("FV, Comments on FV")
                           }
               else
               {
               conditions.disable.push("FV, Comments on FV")
               }
               return conditions;
      }
};