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
            conditions.show.push("Allergy medication")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("Allergy medication")
        }
        else {
            conditions.hide.push("Allergy medication")
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
    },
    'AIA, Adverse reaction to anaesthesia': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['AIA, Adverse reaction to anaesthesia'];
        if (conditionConcept == "Yes"){
            conditions.show.push("AIA, Comments about adverse reaction")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("AIA, Comments about adverse reaction")
        }
        else {
            conditions.hide.push("AIA, Comments about adverse reaction")
        }
        return conditions;
    },
    'PIA, Future expectations about care plan': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PIA, Future expectations about care plan'];
        if (conditionConcept == "Different from medical plan"){
            conditions.show.push("PIA, Comments about expectations")
        }
        else {
            conditions.hide.push("PIA, Comments about expectations")
        }
        return conditions;
    },
    'PIA, Past history of psychological or counselling care for patient': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PIA, Past history of psychological or counselling care for patient'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PIA, By who (NGO / private) ccp")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("PIA, By who (NGO / private) ccp")
        }
        else {
            conditions.hide.push("PIA, By who (NGO / private) ccp")
        }
        return conditions;
    },
    'PIA, Past history of psychological or counselling care of family member': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PIA, Past history of psychological or counselling care of family member'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PIA, By who (NGO / private) ccf")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("PIA, By who (NGO / private) ccf")
        }
        else {
            conditions.hide.push("PIA, By who (NGO / private) ccf")
        }
        return conditions;
    },
    'PIA, Past history of psychiatric care for patient': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PIA, Past history of psychiatric care for patient'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PIA, By who (NGO / private) pcp")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("PIA, By who (NGO / private) pcp")
        }
        else {
            conditions.hide.push("PIA, By who (NGO / private) pcp")
        }
        return conditions;
    },
    'PIA, Past history of psychiatric care of family member': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PIA, Past history of psychiatric care of family member'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PIA, By who (NGO / private) pcf")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("PIA, By who (NGO / private) pcf")
        }
        else {
            conditions.hide.push("PIA, By who (NGO / private) pcf")
        }
        return conditions;
    },
    'PIA, History of psychotropic drugs': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PIA, Past history of psychiatric care of family member'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PIA, Drug")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("PIA, Drug")
        }
        else {
            conditions.hide.push("PIA, Drug")
        }
        return conditions;
    },

    'PHIA, Does the patient use an assistive decive?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Does the patient use an assistive decive?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PHIA, Type of assistive decive")
        }
        else if (conditionConcept == "No"){
            conditions.hide.push("PHIA, Type of assistive decive")
        }
        else {
            conditions.hide.push("PHIA, Type of assistive decive")
        }
        return conditions;
    },
    'PHIA, Type of assistive decive': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Type of assistive decive'];

        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("PHIA, Other type of assistive device")
        }
        else {
            conditions.hide.push("PHIA, Other type of assistive device")
        }
        return conditions;
    },
    'PHIA, Amputee patient?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Amputee patient?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PHIA, Type of amputation")
        }
        else if (conditionConcept == "No"){
            conditions.hide.push("PHIA, Type of amputation")
        }
        else {
            conditions.hide.push("PHIA, Type of amputation")
        }
        return conditions;
    },
    'PHIA, Is the patient coming with a prostheses?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Is the patient coming with a prostheses?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PHIA, Is the patient using the prostheses?","PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification")
        }
        else if (conditionConcept == "No"){
            conditions.hide.push("PHIA, Is the patient using the prostheses?","PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification")
        }
        else {
            conditions.hide.push("PHIA, Is the patient using the prostheses?","PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification")
        }
        return conditions;
    },
    'PHIA, Is there a need of new prosthesis or modification': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Is there a need of new prosthesis or modification'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PHIA, Comment about new prosthesis or modification")
        }
        else if (conditionConcept == "No"){
            conditions.hide.push("PHIA, Comment about new prosthesis or modification")
        }
        else {
            conditions.hide.push("PHIA, Comment about new prosthesis or modification")
        }
        return conditions;
    },
    'PHIA, Location of assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Location of assessment'];
        if (conditionConcept == "Lower limb"){
            conditions.show.push("PHIA, FIM Score","PHIA, Tinnetti Score","PHIA, MMT Score")
            conditions.hide.push("PHIA, 20 Function Test Score","PHIA, Basic Grip Test Score","PHIA, Kapandji Score","PHIA, Functional Evaluation Mouth Score","PHIA, Mouth Opening Score")
        }
        else if (conditionConcept == "Upper limb"){
            conditions.show.push("PHIA, FIM Score","PHIA, MMT Score","PHIA, 20 Function Test Score","PHIA, Basic Grip Test Score","PHIA, Kapandji Score")
            conditions.hide.push("PHIA, Tinnetti Score","PHIA, Functional Evaluation Mouth Score","PHIA, Mouth Opening Score")
        }
        else if (conditionConcept == "Maxillo-facial"){
            conditions.show.push("PHIA, FIM Score","PHIA, Functional Evaluation Mouth Score","PHIA, Mouth Opening Score")
            conditions.hide.push("PHIA, Tinnetti Score","PHIA, MMT Score","PHIA, 20 Function Test Score","PHIA, Basic Grip Test Score","PHIA, Kapandji Score")
        }
        else {
            conditions.hide.push("PHIA, FIM Score","PHIA, Tinnetti Score","PHIA, MMT Score","PHIA, 20 Function Test Score","PHIA, Basic Grip Test Score","PHIA, Kapandji Score","PHIA, Functional Evaluation Mouth Score","PHIA, Mouth Opening Score")
        }
        return conditions;
    }

}