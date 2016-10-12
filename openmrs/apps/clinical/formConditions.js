Bahmni.ConceptSet.FormConditions.rules = {
   'FSTG, Outcomes for 1st stage surgical validation' : function (formName, formFieldValues) {
          	var conditions = {
          		enable : [],
          		disable : []
          	};
          	var conditionConcept = formFieldValues['FSTG, Outcomes for 1st stage surgical validation'];
          	if (conditionConcept=="Valid") {
          		conditions.enable.push("FSTG, Priority","FSTG, Name (s) of Surgeon 1","FSTG, Name (s) of Surgeon 2","FSTG, Comments","FSTG, Outcomes for 1st stage Anaesthesia validation","FSTG, Does the Patient need Surgical Final Validation")
          		conditions.disable.push("FSTG, Postpone reason","FSTG, Medical file to be submitted again by","FSTG, Type of medical information needed for next submission","FSTG, Refused Reason","FSTG, Comments about postpone reason","FSTG, Comments about refusal")
          		}
          	else if(conditionConcept=="Postponed") {
          	conditions.enable.push("FSTG, Postpone reason","FSTG, Medical file to be submitted again by","FSTG, Comments about postpone reason","FSTG, Outcomes for 1st stage Anaesthesia validation")
          	conditions.disable.push("FSTG, Priority","FSTG, Outcomes for 1st stage Anaesthesia validation","FSTG, Name (s) of Surgeon 1","FSTG, Name (s) of Surgeon 2","FSTG, Comments","FSTG, Type of medical information needed for next submission","FSTG, Refused Reason","FSTG, Comments about refusal","FSTG, Name (s) of Anaesthetist","FSTG, Comments about Anaesthesia validation","FSTG, Does the Patient need Surgical Final Validation")
          	}
          	else if(conditionConcept=="More Information"){
          	conditions.enable.push("FSTG, Type of medical information needed for next submission")
          	conditions.disable.push("FSTG, Priority","FSTG, Outcomes for 1st stage Anaesthesia validation","FSTG, Name (s) of Surgeon 1","FSTG, Name (s) of Surgeon 2","FSTG, Comments","FSTG, Postpone reason","FSTG, Medical file to be submitted again by","FSTG, Refused Reason","FSTG, Comments about postpone reason","FSTG, Comments about refusal","FSTG, Name (s) of Anaesthetist","FSTG, Comments about Anaesthesia validation","FSTG, Does the Patient need Surgical Final Validation")
          	}
          	else if(conditionConcept=="Refused"){
          	conditions.enable.push("FSTG, Refused Reason","FSTG, Comments about refusal")
          	conditions.disable.push("FSTG, Priority","FSTG, Outcomes for 1st stage Anaesthesia validation","FSTG, Name (s) of Surgeon 1","FSTG, Name (s) of Surgeon 2","FSTG, Comments","FSTG, Postpone reason","FSTG, Medical file to be submitted again by","FSTG, Comments about postpone reason","FSTG, Type of medical information needed for next submission","FSTG, Name (s) of Anaesthetist","FSTG, Comments about Anaesthesia validation","FSTG, Does the Patient need Surgical Final Validation")
          	}
          	else {
          	    conditions.disable.push("FSTG, Priority","FSTG, Outcomes for 1st stage Anaesthesia validation","FSTG, Name (s) of Surgeon 1","FSTG, Name (s) of Surgeon 2","FSTG, Comments","FSTG, Postpone reason","FSTG, Comments about postpone reason","FSTG, Medical file to be submitted again by","FSTG, Type of medical information needed for next submission","FSTG, Refused Reason","FSTG, Comments about refusal","FSTG, Name (s) of Anaesthetist","FSTG, Comments about Anaesthesia validation","FSTG, Does the Patient need Surgical Final Validation")
          	}
          	return conditions;
            },
   'FSTG, Outcomes for 1st stage Anaesthesia validation' : function (formName, formFieldValues) {
            var conditions = {
                            enable : [],
                            disable : []
                        };
            var conditionConcept = formFieldValues['FSTG, Outcomes for 1st stage Anaesthesia validation'];
            if (conditionConcept == "Fits anaesthesia criteria"){
            conditions.enable.push("FSTG, Name (s) of Anaesthetist","FSTG, Comments about Anaesthesia validation")
            conditions.disable.push("FSTG, Type of medical information needed for next submission")
            }
            else if(conditionConcept == "Need complementary investigation"){
            conditions.enable.push("FSTG, Type of medical information needed for next submission")
            conditions.disable.push("FSTG, Name (s) of Anaesthetist","FSTG, Comments about Anaesthesia validation")
            }
            else{
            conditions.disable.push("FSTG, Comments about Anaesthesia validation","FSTG, Name (s) of Anaesthetist","FSTG, Type of medical information needed for next submission")
             }
             return conditions;
             },
   'FUP, Outcomes for follow-up surgical validation' : function (formName, formFieldValues) {
          	var conditions = {
          		enable : [],
          		disable : []
          	};
          	var conditionConcept = formFieldValues['FUP, Outcomes for follow-up surgical validation'];
          	if (conditionConcept=="Continue under follow-up") {
          		conditions.enable.push("FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up")
          	    conditions.disable.push("FUP, Comments about MBA","FUP, Dismissal reason","FUP, Dismissal confirmed","FUP, Comments about dismissal","FUP, Comments about Defaulter","FUP, Reason for re-admission","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission","FUP, Reason for re-admission","FUP, Priority","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission","FUP, Does the Patient need Surgical Final Validation")
          	       }
          	else if(conditionConcept=="MBA") {
          	conditions.enable.push("FUP, Comments about MBA")
          	    conditions.disable.push("FUP, Priority","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Dismissal reason","FUP, Dismissal confirmed","FUP, Comments about dismissal","FUP, Comments about Defaulter","FUP, Reason for re-admission","FUP, Priority","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission","FUP, Does the Patient need Surgical Final Validation")          	}
          	else if(conditionConcept=="Dismissal"){
          	conditions.enable.push("FUP, Dismissal reason","FUP, Dismissal confirmed","FUP, Comments about dismissal")
          	    conditions.disable.push("FUP, Priority","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Comments about Defaulter","FUP, Reason for re-admission","FUP, Priority","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission")          	}
          	else if(conditionConcept=="Defaulter (D2)"){
          	conditions.enable.push("FUP, Comments about Defaulter")
          	    conditions.disable.push("FUP, Priority","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Dismissal reason","FUP, Dismissal confirmed","FUP, Comments about dismissal","FUP, Reason for re-admission","FUP, Priority","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission","FUP, Does the Patient need Surgical Final Validation")
          	}
          	else if(conditionConcept=="Further stage admission"){
          	    conditions.enable.push("FUP, Reason for re-admission","FUP, Priority","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission","FUP, Does the Patient need Surgical Final Validation")
          	    conditions.disable.push("FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Dismissal reason","FUP, Dismissal confirmed","FUP, Comments about dismissal","FUP, Comments about Defaulter")

          	}
          	else {
          	    conditions.disable.push("FUP, Priority","FUP, Time for next medical follow-up to be done","FUP, Comments about next follow-up","FUP, Comments about MBA","FUP, Dismissal reason","FUP, Dismissal confirmed","FUP, Comments about dismissal","FUP, Comments about Defaulter","FUP, Reason for re-admission","FUP, Priority","FUP, Name (s) of Surgeon 1","FUP, Name (s) of Surgeon 2","FUP, Comments about further stage admission","FUP, Does the Patient need Surgical Final Validation")
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