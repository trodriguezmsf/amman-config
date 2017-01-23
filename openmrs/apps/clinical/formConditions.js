Bahmni.ConceptSet.FormConditions.rules = {
    'FSTG, Outcomes for 1st stage surgical validation': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['FSTG, Outcomes for 1st stage surgical validation'];
        if (conditionConcept == "Valid") {
            conditions.show.push("FSTG, Priority", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Outcomes for 1st stage Anaesthesia validation", "FSTG, Does the Patient need Surgical Final Validation","FSTG, Type of medical information needed for next submission")
            conditions.hide.push("FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Refused Reason", "FSTG, Comments about postpone reason", "FSTG, Comments about refusal")
        }
        else if (conditionConcept == "Postponed") {
            conditions.show.push("FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Comments about postpone reason")
            conditions.hide.push("FSTG, Priority", "FSTG, Outcomes for 1st stage Anaesthesia validation","FSTG, Type of medical information needed for next submission", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Refused Reason", "FSTG, Comments about refusal", "FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation", "FSTG, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "More Information") {
            conditions.show.push("FSTG, Type of medical information needed for next submission")
            conditions.hide.push("FSTG, Priority", "FSTG, Outcomes for 1st stage Anaesthesia validation", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Refused Reason", "FSTG, Comments about postpone reason", "FSTG, Comments about refusal", "FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation", "FSTG, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Refused") {
            conditions.show.push("FSTG, Refused Reason", "FSTG, Comments about refusal")
            conditions.hide.push("FSTG, Priority", "FSTG, Outcomes for 1st stage Anaesthesia validation", "FSTG, Type of medical information needed for next submission","FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Comments about postpone reason",  "FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation", "FSTG, Does the Patient need Surgical Final Validation")
        }
        else {
            conditions.hide.push("FSTG, Priority", "FSTG, Outcomes for 1st stage Anaesthesia validation", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Postpone reason", "FSTG, Comments about postpone reason", "FSTG, Medical file to be submitted again by",  "FSTG, Refused Reason", "FSTG, Comments about refusal", "FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation", "FSTG, Does the Patient need Surgical Final Validation","FSTG, Type of medical information needed for next submission")
        }
        return conditions;
    },
    'FSTG, Outcomes for 1st stage Anaesthesia validation': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['FSTG, Outcomes for 1st stage Anaesthesia validation'];
        if (conditionConcept == "Fits anaesthesia criteria") {
            conditions.show.push("FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation")

        }
        else if (conditionConcept == "Need complementary investigation") {

            conditions.hide.push("FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation")
        }
        else {
            conditions.hide.push("FSTG, Comments about Anaesthesia validation", "FSTG, Name (s) of Anaesthetist")
        }
        return conditions;
    },
    'FUP, Outcomes for follow-up surgical validation': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['FUP, Outcomes for follow-up surgical validation'];
        if (conditionConcept == "Continue under follow-up") {
            conditions.show.push("FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up")
            conditions.hide.push("FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "MBA") {
            conditions.show.push("FUP, Comments about MBA");
            conditions.hide.push("FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Dismissal") {
            conditions.show.push("FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal")
            conditions.hide.push("FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission")
        }
        else if (conditionConcept == "Defaulter (D2)") {
            conditions.show.push("FUP, Comments about Defaulter");
            conditions.hide.push("FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Further stage admission") {
            conditions.show.push("FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
            conditions.hide.push("FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter")

        }
        else {
            conditions.hide.push("FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        return conditions;
    },
    'SMH, Smoking history': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
         };
         var conditionConcept = formFieldValues['SMH, Smoking history'];
        if (conditionConcept == "Yes"){
            conditions.show.push("SMH, Number of cigarettes per day","SMH, Duration of smoking (in years)")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("SMH, Number of cigarettes per day","SMH, Duration of smoking (in years)")
        }
        else {
            conditions.hide.push("SMH, Number of cigarettes per day","SMH, Duration of smoking (in years)")
        }
        return conditions;
    },
    'SMH, Currently taking medication': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SMH, Currently taking medication'];
        if (conditionConcept == "Yes"){
            conditions.show.push("SMH, Medication")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("SMH, Medication")
        }
        else {
            conditions.hide.push("SMH, Medication")
        }
        return conditions;
    },
    'SMH, Pain severity': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SMH, Pain severity'];
        if (conditionConcept >= 1){
            conditions.show.push("SMH, Side of pain","SMH, Site of pain")
        }
        else {
            conditions.hide.push("SMH, Side of pain","SMH, Site of pain")
        }
        return conditions;
    },
    'HE, External devices, present': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['HE, External devices, present'];

        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("HE, Other type of external device")
        }
        else {
            conditions.hide.push("HE, Other type of external device")
        }
        return conditions;
    }
};