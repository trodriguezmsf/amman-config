Bahmni.ConceptSet.FormConditions.rules = {
    'PMIPA, Is the medical file complete?' : function (formName, formFieldValues) {
    	var conditions = {
    		enable : [],
    		disable : []
    	};
    	var conditionConcept = formFieldValues['PMIPA, Is the medical file complete?'];
    	if (conditionConcept=="No") {
    		conditions.enable.push("PMIPA, Document(s) needed to be complete")
    		conditions.disable.push("Date of injury","PMIPA, Cause of injury","PMIPA, Specialty determined by MLO","PMIPA, Stage")
        } else if (conditionConcept=="Yes") {
    		conditions.enable.push("Date of injury","PMIPA, Cause of injury","PMIPA, Specialty determined by MLO","PMIPA, Stage")
    		conditions.disable.push("PMIPA, Document(s) needed to be complete")
    	}
    	else {
    	    conditions.disable.push("Date of injury","PMIPA, Cause of injury","PMIPA, Document(s) needed to be complete","PMIPA, Specialty determined by MLO","PMIPA, Stage")
    	}
    	return conditions;
      },
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
            "PMIPA, Outcomes for 1st stage Aneasthesia validation": function (formName, formFieldValues) {
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
            'PMIPA, Outcomes for follow-up surgical validation' : function (formName, formFieldValues) {
          	var conditions = {
          		enable : [],
          		disable : []
          	};
          	var conditionConcept = formFieldValues['PMIPA, Outcomes for follow-up surgical validation'];
          	if (conditionConcept=="To continue under Fup") {
          		conditions.enable.push("PMIPA, Priority","PMIPA, Qualitative outcome","PMIPA, Time for next medical follow-up to be done","PMIPA, Comments about next follow-up")
          	    conditions.disable.push("PMIPA, Comments about MBA","PMIPA, Dismissal reason","PMIPA, Approval of dismissal","PMIPA, Comments about dismissal","PMIPA, Reason for re-admission","PMIPA, Comments about re-admission")          		}
          	else if(conditionConcept=="MBA") {
          	conditions.enable.push("PMIPA, Comments about MBA")
          	    conditions.disable.push("PMIPA, Priority","PMIPA, Qualitative outcome","PMIPA, Time for next medical follow-up to be done","PMIPA, Comments about next follow-up","PMIPA, Dismissal reason","PMIPA, Approval of dismissal","PMIPA, Comments about dismissal","PMIPA, Reason for re-admission","PMIPA, Comments about re-admission")          	}
          	else if(conditionConcept=="Dismissal"){
          	conditions.enable.push("PMIPA, Dismissal reason","PMIPA, Approval of dismissal","PMIPA, Comments about dismissal")
          	    conditions.disable.push("PMIPA, Priority","PMIPA, Qualitative outcome","PMIPA, Time for next medical follow-up to be done","PMIPA, Comments about next follow-up","PMIPA, Comments about MBA","PMIPA, Reason for re-admission","PMIPA, Comments about re-admission")          	}
          	else if(conditionConcept=="Re-admission"){
          	conditions.enable.push("PMIPA, Reason for re-admission","PMIPA, Comments about re-admission")
          	    conditions.disable.push("PMIPA, Priority","PMIPA, Qualitative outcome","PMIPA, Time for next medical follow-up to be done","PMIPA, Comments about next follow-up","PMIPA, Comments about MBA","PMIPA, Dismissal reason","PMIPA, Approval of dismissal","PMIPA, Comments about dismissal")
          	}
          	else {
          	    conditions.disable.push("PMIPA, Priority","PMIPA, Qualitative outcome","PMIPA, Time for next medical follow-up to be done","PMIPA, Comments about next follow-up","PMIPA, Comments about MBA","PMIPA, Dismissal reason","PMIPA, Approval of dismissal","PMIPA, Comments about dismissal","PMIPA, Reason for re-admission","PMIPA, Comments about re-admission")
          	}
          	return conditions;
            },
      'PMIPA, Does the patient need medical final validation?' : function (formName, formFieldValues) {
    	    var conditions = {
    		enable : [],
    		disable : []
    	    };
    	    var conditionConcept = formFieldValues['PMIPA, Does the patient need medical final validation?'];
    	    if (conditionConcept=="No") {
    		//conditions.enable.push("PMIPA, Document(s) needed to be complete")
    		conditions.disable.push("PMIPA, Which medical information is needed for FV?","PMIPA, Dead line to submit final validation","PMIPA, Outcomes FV")
            } else if (conditionConcept=="Yes") {
    		conditions.enable.push("PMIPA, Which medical information is needed for FV?","PMIPA, Dead line to submit final validation","PMIPA, Outcomes FV")
    		//conditions.disable.push("PMIPA, Which medical information is needed for FV?","PMIPA, Dead line to submit final validation","PMIPA, Outcomes FV")
    	    }
    	    else {
    	    conditions.disable.push("PMIPA, Which medical information is needed for FV?","PMIPA, Dead line to submit final validation","PMIPA, Outcomes FV")
    	    }
    	    return conditions;
            },
};