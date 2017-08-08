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
            conditions.hide.push("Stage","FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "MBA") {
            conditions.show.push("FUP, Comments about MBA");
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Dismissal") {
            conditions.show.push("FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal")
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission")
        }
        else if (conditionConcept == "Defaulter (D2)") {
            conditions.show.push("FUP, Comments about Defaulter");
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Further stage admission") {
            conditions.show.push("Stage","FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
            conditions.hide.push("FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter")

        }
        else {
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up to be done", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        return conditions;
    },
    'HE, Current smoker': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
         };
         var conditionConcept = formFieldValues['HE, Current smoker'];
        if (conditionConcept == "Yes"){
            conditions.show.push("HE, Number of cigarettes per day","HE, Duration of smoking (in years)")
        }
        else if(conditionConcept == "No" || conditionConcept == "Unknown") {
            conditions.hide.push("HE, Number of cigarettes per day","HE, Duration of smoking (in years)")
        }
        else {
            conditions.hide.push("HE, Number of cigarettes per day","HE, Duration of smoking (in years)")
        }
        return conditions;
    },
    'MD, Currently taking medication': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Currently taking medication'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MD, Medication")
        }
        else {
            conditions.hide.push("MD, Medication")
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
        var conditionConcept = formFieldValues['PIA, History of psychotropic drugs'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PIA, Drug")
        }
        else {
            conditions.hide.push("PIA, Drug")
        }
        return conditions;
    },

    'PHIA, Does the patient use an assistive device or orthosis?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Does the patient use an assistive device or orthosis?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PHIA, Type of assistive device or orthosis","PHIA, Comments about assistive device or orthosis")
            conditions.hide.push("PHIA, Other type of assistive device")
        }
        else {
            conditions.hide.push("PHIA, Type of assistive device or orthosis","PHIA, Other type of assistive device","PHIA, Comments about assistive device or orthosis")
        }
        return conditions;
    },
    'PHIA, Type of assistive device or orthosis': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PHIA, Type of assistive device or orthosis'];

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
            conditions.show.push("PHIA, Level of Amputation")
            conditions.hide.push("PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification","PHIA, Comment about new prosthesis or modification")

        }
        else {
            conditions.hide.push("PHIA, Level of Amputation")
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
            conditions.show.push("PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification")
            conditions.hide.push("PHIA, Comment about new prosthesis or modification")
        }
        else {
            conditions.hide.push("PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification","PHIA, Comment about new prosthesis or modification")
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
            conditions.show.push("PHIA, Lower extremity functional index (>18 years)","PHIA, Lower extremity functional index (>18 years)","PHIA, Neuro QOL lower limb (<18 years)","PHIA, Tinetti","PHIA, Muscle power test (MMT)")
            conditions.hide.push("PHIA, Upper extremity functional index (>18 years)","PHIA, Social / Well-being Score (FDI)","PHIA, Neuro QOL upper limb (<18 years)","PHIA, Basic grip test","PHIA, Physical Functional Score (FDI)","PHIA, Mouth opening test")
        }
        else if (conditionConcept == "Upper limb"){
            conditions.show.push("PHIA, Upper extremity functional index (>18 years)","PHIA, Neuro QOL upper limb (<18 years)","PHIA, Basic grip test","PHIA, Muscle power test (MMT)")
            conditions.hide.push("PHIA, Lower extremity functional index (>18 years)","PHIA, Social / Well-being Score (FDI)","PHIA, Neuro QOL lower limb (<18 years)","PHIA, Tinetti","PHIA, Physical Functional Score (FDI)","PHIA, Mouth opening test")
        }
        else if (conditionConcept == "Maxillo-facial"){
            conditions.show.push("PHIA, Physical Functional Score (FDI)","PHIA, Social / Well-being Score (FDI)","PHIA, Mouth opening test")
            conditions.hide.push("PHIA, Upper extremity functional index (>18 years)","PHIA, Neuro QOL upper limb (<18 years)","PHIA, Basic grip test","PHIA, Muscle power test (MMT)","PHIA, Lower extremity functional index (>18 years)","PHIA, Neuro QOL lower limb (<18 years)","PHIA, Tinetti")
        }
        else {
            conditions.hide.push("PHIA, Upper extremity functional index (>18 years)","PHIA, Social / Well-being Score (FDI)","PHIA, Neuro QOL upper limb (<18 years)","PHIA, Basic grip test","PHIA, Muscle power test (MMT)","PHIA, Lower extremity functional index (>18 years)","PHIA, Neuro QOL lower limb (<18 years)","PHIA, Tinetti","PHIA, Physical Functional Score (FDI)","PHIA, Mouth opening test");
        }
        return conditions;
    },
    'AIA, Personal history of blood transfusion': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['AIA, Personal history of blood transfusion'];
        if (conditionConcept == "Yes"){
            conditions.show.push("AIA, Did an incident occur during previous blood transfusion")
            conditions.hide.push("AIA, Describe")
        }
        else {
            conditions.hide.push("AIA, Did an incident occur during previous blood transfusion","AIA, Describe")
        }
        return conditions;
    },
    'AIA, Did an incident occur during previous blood transfusion': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['AIA, Did an incident occur during previous blood transfusion'];
        if (conditionConcept == "Yes"){
            conditions.show.push("AIA, Describe")
        }
        else {
            conditions.hide.push("AIA, Describe")
        }
        return conditions;
    },
    'AIA, Pre-anaesthesia orders': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['AIA, Pre-anaesthesia orders'];

        if (conditionConcept.indexOf("Other lab orders")>=0){
            conditions.show.push("AIA, Comments about other lab orders")
        }
        else {
            conditions.hide.push("AIA, Comments about other lab orders")
        }
        return conditions;
    },
    'MD, History of previous surgery': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, History of previous surgery'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MD, Surgical Procedures Outside AMH")
        }
        else {
            conditions.hide.push("MD, Surgical Procedures Outside AMH")
        }
        return conditions;
    },
    'MD, Type of previous fixation': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Type of previous fixation'];
        if(conditionConcept.indexOf("Internal")>=0 && conditionConcept.indexOf("External")>=0 && conditionConcept.indexOf("Other")>=0) {
            conditions.show.push("MD, Type of internal fixation","MD, Duration of External fixation","MD, Other type of fixation")
        }
        else if(conditionConcept.indexOf("Internal")>=0 && conditionConcept.indexOf("External")>=0){
             conditions.show.push("MD, Type of internal fixation","MD, Duration of External fixation")
             conditions.hide.push("MD, Other type of fixation")
        }
        else if(conditionConcept.indexOf("Internal")>=0 && conditionConcept.indexOf("Other")>=0){
             conditions.show.push("MD, Type of internal fixation","MD, Other type of fixation")
             conditions.hide.push("MD, Duration of External fixation")
        }
        else if(conditionConcept.indexOf("External")>=0 && conditionConcept.indexOf("Other")>=0){
         conditions.show.push("MD, Duration of External fixation","MD, Other type of fixation")
         conditions.hide.push("MD, Type of internal fixation")
        }
        else if (conditionConcept.indexOf("Internal")>=0){
            conditions.hide.push("MD, Duration of External fixation","MD, Other type of fixation")
            conditions.show.push("MD, Type of internal fixation")
        }
        else if(conditionConcept.indexOf("External")>=0){
            conditions.hide.push("MD, Type of internal fixation","MD, Other type of fixation")
            conditions.show.push("MD, Duration of External fixation")
        }
        else if(conditionConcept.indexOf("Other")>=0){
            conditions.hide.push("MD, Type of internal fixation","MD, Duration of External fixation")
            conditions.show.push("MD, Other type of fixation")
        }
        else {
            conditions.hide.push("MD, Type of internal fixation","MD, Duration of External fixation","MD, Other type of fixation")
        }
        return conditions;
    },
    'MD, HIstory of infection': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, HIstory of infection'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MD, Comments about previous infection")
        }
        else {
            conditions.hide.push("MD, Comments about previous infection")
        }
        return conditions;
    },
    'MD, Discharging sinus': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Discharging sinus'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MD, Duration of discharging sinus")
        }
        else {
            conditions.hide.push("MD, Duration of discharging sinus")
        }
        return conditions;
    },
    'MD, Bone Loss': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Bone Loss'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MD, Cm of bone loss")
        }
        else {
            conditions.hide.push("MD, Cm of bone loss")
        }
        return conditions;
    },
    'MD, Shortening': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Shortening'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MD, Cm of shortening")
        }
        else {
            conditions.hide.push("MD, Cm of shortening")
        }
        return conditions;
    },
    'SAP, Initial general plan': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Initial general plan'];
        if (conditionConcept == "Needs Physio / Other consultation"){
            conditions.show.push("SAP, Objectives of physiotherapy")
            conditions.hide.push("SAP, Anatomical site")
        }
        else if (conditionConcept == "Improve function"){
            conditions.show.push("SAP, Anatomical site")
            conditions.hide.push("SAP, Objectives of physiotherapy")
        }
        else {
            conditions.hide.push("SAP, Objectives of physiotherapy","SAP, Anatomical site")
        }
        return conditions;
    },
    'SAP, Surgical objective': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Surgical objective'];
        if (conditionConcept.length == 1 && conditionConcept.indexOf("Uncertain") >= 0){
              conditions.show.push("SAP, Comments of uncertainty")
              conditions.hide.push("SAP, Side of surgical objective","SAP, Site of surgical objective");
                              }
        else  if(conditionConcept.length > 1 && conditionConcept.indexOf("Uncertain")<0){
        conditions.show.push("SAP, Side of surgical objective","SAP, Site of surgical objective");
        conditions.hide.push("SAP, Comments of uncertainty")
                }
        else if(conditionConcept.length > 1 && conditionConcept.indexOf("Repair anatomy")>=0 ){
                conditions.show.push("SAP, Side of surgical objective","SAP, Site of surgical objective","SAP, Comments of uncertainty");
                }

        else {
            conditions.hide.push("SAP, Side of surgical objective","SAP, Site of surgical objective","SAP, Comments of uncertainty")
        }
        return conditions;
    },
    'SAP, Frequency of Operations': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Frequency of Operations'];
        if (conditionConcept == "Multiple Operations (+2)"){
            conditions.show.push("SAP, Estimated number of surgeries")
        }
        else {
            conditions.hide.push("SAP, Estimated number of surgeries")
        }
        return conditions;
    },
    'SAP, Sites (donor areas excluded)': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Sites (donor areas excluded)'];
        if (conditionConcept == "Multi-site, different surgery"){
            conditions.show.push("SAP, Spacing between surgeries")
        }
        else {
            conditions.hide.push("SAP, Spacing between surgeries")
        }
        return conditions;
    },
    'SAP, Need consultations': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Need consultations'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("SAP, Other consultation needed")
        }
        else {
            conditions.hide.push("SAP, Other consultation needed")
        }
        return conditions;
    },
    'MD, Review of systems, general': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, general'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (general)","MD, Other ROS general symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS general symptoms")
                conditions.hide.push("MD, Description and duration of symptom (general)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (general)","MD, Other ROS general symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS general symptoms")
                conditions.show.push("MD, Description and duration of symptom (general)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (general)","MD, Other ROS general symptoms")
            }
        }
        return conditions;
    },
    'MD, Review of systems, cardiopulmonary': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, cardiopulmonary'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (cardiopulmonary)","MD, Other ROS cardiopulmonary symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS cardiopulmonary symptoms")
                conditions.hide.push("MD, Description and duration of symptom (cardiopulmonary)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (cardiopulmonary)","MD, Other ROS cardiopulmonary symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS cardiopulmonary symptoms")
                conditions.show.push("MD, Description and duration of symptom (cardiopulmonary)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (cardiopulmonary)","MD, Other ROS cardiopulmonary symptoms")
            }
        }
        return conditions;
    },
    'MD, Review of systems, gastrointestinal': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, gastrointestinal'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (gastrointestinal)","MD, Other ROS gastrointestinal symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS gastrointestinal symptoms")
                conditions.hide.push("MD, Description and duration of symptom (gastrointestinal)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (gastrointestinal)","MD, Other ROS gastrointestinal symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS gastrointestinal symptoms")
                conditions.show.push("MD, Description and duration of symptom (gastrointestinal)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (gastrointestinal)","MD, Other ROS gastrointestinal symptoms")
            }
        }
        return conditions;
    },
    'MD, Review of systems, genitourinary': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, genitourinary'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (genitourinary)","MD, Other ROS genitourinary symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS genitourinary symptoms")
                conditions.hide.push("MD, Description and duration of symptom (genitourinary)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (genitourinary)","MD, Other ROS genitourinary symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS genitourinary symptoms")
                conditions.show.push("MD, Description and duration of symptom (genitourinary)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (genitourinary)","MD, Other ROS genitourinary symptoms")
            }
        }
        return conditions;
    },
    'MD, Review of systems, central nervous system': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, central nervous system'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (central nervous system)","MD, Other ROS central nervous system symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS central nervous system symptoms")
                conditions.hide.push("MD, Description and duration of symptom (central nervous system)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (central nervous system)","MD, Other ROS central nervous system symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS central nervous system symptoms")
                conditions.show.push("MD, Description and duration of symptom (central nervous system)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (central nervous system)","MD, Other ROS central nervous system symptoms")
            }
        }
        return conditions;
    },
    'MD, Review of systems, HEENT': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, HEENT'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (HEENT)","MD, Other ROS HEENT symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS HEENT symptoms")
                conditions.hide.push("MD, Description and duration of symptom (HEENT)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (HEENT)","MD, Other ROS HEENT symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS HEENT symptoms")
                conditions.show.push("MD, Description and duration of symptom (HEENT)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (HEENT)","MD, Other ROS HEENT symptoms")
            }
        }
        return conditions;
    },
    'MD, Review of systems, musculoskeletal': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Review of systems, musculoskeletal'];
        if (conditionConcept.length >= 2 && conditionConcept.indexOf("Negative") >= 0) {
            conditions.hide.push("MD, Description and duration of symptom (musculoskeletal)","MD, Other ROS musculoskeletal symptoms")
        } else {
            if (conditionConcept.length == 2 && conditionConcept.indexOf("Other") == 0) {
                conditions.show.push("MD, Other ROS musculoskeletal symptoms")
                conditions.hide.push("MD, Description and duration of symptom (musculoskeletal)")
            }
            else if (conditionConcept.length >= 2 && conditionConcept.indexOf("Other") >= 0){
                conditions.show.push("MD, Description and duration of symptom (musculoskeletal)","MD, Other ROS musculoskeletal symptoms")
            }
            else if(conditionConcept.length >= 2 && conditionConcept.indexOf("Other") < 0){
                conditions.hide.push("MD, Other ROS musculoskeletal symptoms")
                conditions.show.push("MD, Description and duration of symptom (musculoskeletal)")
            }
            else {
                conditions.hide.push("MD, Description and duration of symptom (musculoskeletal)","MD, Other ROS musculoskeletal symptoms")
            }
        }
        return conditions;
    },
    'SAP, Site of injury': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Site of injury'];
        if (conditionConcept == undefined || conditionConcept.length == 0){
            conditions.hide.push("SAP, Side of injury","SAP, Condition of soft tissue at presentation")
        }
        else {
            conditions.show.push("SAP, Side of injury","SAP, Condition of soft tissue at presentation")
        }
        return conditions;
    },
    'ANA, Pain Severity': function (formName, formFieldValues) {
             var conditions = {
                 show: [],
                 hide: []
             };
             var conditionConcept = formFieldValues['ANA, Pain Severity'];
             if (conditionConcept >= 1){
                 conditions.show.push("ANA, Side of pain","ANA, Site of pain","ANA, Type of pain","ANA, When does the pain occur")
             }
             else {
                 conditions.hide.push("ANA, Side of pain","ANA, Site of pain","ANA, Type of pain","ANA, When does the pain occur")
             }
             return conditions;
         },
    'ANA, Patient mood': function (formName, formFieldValues) {
            var conditions = {
                show: [],
                hide: []
            };
            var conditionConcept = formFieldValues['ANA, Patient mood'];
            if (conditionConcept == "Other"){
            conditions.show.push("ANA, Patient mood, other")
            }
            else {
            conditions.hide.push("ANA, Patient mood, other")
            }
            return conditions;
        },
    'ANA, Nutritional Assessment': function (formName, formFieldValues) {
             var conditions = {
                 show: [],
                 hide: []
             };
             var conditionConcept = formFieldValues['ANA, Nutritional Assessment'];
             if (conditionConcept.indexOf("Other")>=0){
                 conditions.show.push("ANA, Nutritional Assessment, other")
             }
             else {
                 conditions.hide.push("ANA, Nutritional Assessment, other")
             }
             return conditions;
         },
    'ONN, Pain Severity': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['ONN, Pain Severity'];
              if (conditionConcept >= 1){
                  conditions.show.push("ONN, Side of pain","ONN, Site of pain","ONN, Type of pain","ONN, When does the pain occur")
              }
              else {
                   conditions.hide.push("ONN, Side of pain","ONN, Site of pain","ONN, Type of pain","ONN, When does the pain occur")
               }
              return conditions;
          },
    'ONN, Description of wound': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['ONN, Description of wound'];
              if (conditionConcept == "Other"){
                 conditions.show.push("ONN, Description of wound, other")
              }
              else {
              conditions.hide.push("ONN, Description of wound, other")
              }
              return conditions;
         },
    'ONN, Does the patient have a tissue expander?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['ONN, Does the patient have a tissue expander?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("ONN, Tissue Expander")
              }
              else {
              conditions.hide.push("ONN, Tissue Expander")
              }
              return conditions;
         },
    'ONN, Does the patient have a dressing?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['ONN, Does the patient have a dressing?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("ONN, Dressing")
                 conditions.hide.push("ONN, Description of wound, other")
              }
              else {
              conditions.hide.push("ONN, Dressing")
              }
              return conditions;
         },
    'POW, Pain Severity': function (formName, formFieldValues) {
             var conditions = {
                 show: [],
                 hide: []
             };
             var conditionConcept = formFieldValues['POW, Pain Severity'];
             if (conditionConcept >= 1){
                 conditions.show.push("POW, Side of pain","POW, Site of pain","POW, Type of pain","POW, When does the pain occur")
             }
             else {
                 conditions.hide.push("POW, Side of pain","POW, Site of pain","POW, Type of pain","POW, When does the pain occur")
             }
             return conditions;
         },
    'POW, Description of wound': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['POW, Description of wound'];
              if (conditionConcept == "Other"){
                 conditions.show.push("POW, Description of wound, other")
              }
              else {
              conditions.hide.push("POW, Description of wound, other")
              }
              return conditions;
         },
    'POW, Does the patient have a drain?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['POW, Does the patient have a drain?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("POW, Drainage Set")
              }
              else {
              conditions.hide.push("POW, Drainage Set")
              }
              return conditions;
         },
    'WWN, Pain Severity': function (formName, formFieldValues) {
             var conditions = {
                 show: [],
                 hide: []
             };
             var conditionConcept = formFieldValues['WWN, Pain Severity'];
             if (conditionConcept >= 1){
                 conditions.show.push("WWN, Side of pain","WWN, Site of pain","WWN, Type of pain","WWN, When does the pain occur")
             }
             else {
                 conditions.hide.push("WWN, Side of pain","WWN, Site of pain","WWN, Type of pain","WWN, When does the pain occur")
             }
             return conditions;
         },
    'WWN, Does the patient have a drain?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Does the patient have a drain?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, Drainage Set")
              }
              else {
              conditions.hide.push("WWN, Drainage Set")
              }
              return conditions;
         },
    'WWN, Does the patient have a dressing?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Does the patient have a dressing?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, Dressing")
                 conditions.hide.push("WWN, Description of wound, other")

              }
              else {
              conditions.hide.push("WWN, Dressing")
              }
              return conditions;
         },
    'WWN, Does the patient have a tissue expander?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Does the patient have a tissue expander?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, Tissue Expander")
              }
              else {
              conditions.hide.push("WWN, Tissue Expander")
              }
              return conditions;
         },
    'WWN, Description of wound': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Description of wound'];
              if (conditionConcept == "Other"){
                 conditions.show.push("WWN, Description of wound, other")
              }
              else {
              conditions.hide.push("WWN, Description of wound, other")
              }
              return conditions;
         },
    'WWN, Does the patient have a peripheral line?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Does the patient have a peripheral line?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, Site of peripheral line","WWN, Date of insertion, peripheral line","WWN, Date of removal, peripheral line","WWN, Comments, peripheral line")
              }
              else {
              conditions.hide.push("WWN, Site of peripheral line","WWN, Date of insertion, peripheral line","WWN, Date of removal, peripheral line","WWN, Comments, peripheral line")
              }
              return conditions;
         },
    'WWN, Does the patient have a PICC line?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Does the patient have a PICC line?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, Date of insertion, PICC line","WWN, Date of dressing","WWN, Comments, dressing PICC line","WWN, Date of removal, PICC line")
              }
              else {
              conditions.hide.push("WWN, Date of insertion, PICC line","WWN, Date of dressing","WWN, Comments, dressing PICC line","WWN, Date of removal, PICC line")
              }
              return conditions;
         },
    'PPN, Patient complaints': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Patient complaints'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("PPN, Patient complaints, other")
        }
        else {
            conditions.hide.push("PPN, Patient complaints, other")
        }
        return conditions;
    },
    'PPN, Wound assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Wound assessment'];
        if (conditionConcept == "Wound seen") {
            conditions.show.push("PPN, Description of wound","PPN, Description of wound, other")
            var conditionConcept2 = formFieldValues['PPN, Description of wound'];
            if (conditionConcept2 == "Other") {
                conditions.show.push("PPN, Description of wound, other")
            }
            else {
                conditions.hide.push("PPN, Description of wound, other")
            }
        } else {
            conditions.hide.push("PPN, Description of wound")
        }
        return conditions;
    },
    'PPN, Description of wound': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Description of wound'];
        if (conditionConcept == "Other"){
            conditions.show.push("PPN, Description of wound, other")
        }
        else {
            conditions.hide.push("PPN, Description of wound, other")
        }
        return conditions;
    },
    'PPN, Drainage': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Drainage'];
        if (conditionConcept == "Other"){
            conditions.show.push("PPN, Drainage, other")
        }
        else {
            conditions.hide.push("PPN, Drainage, other")
        }
        return conditions;
    },
    'PPN, Assessment of patient': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Assessment of patient'];
        if (conditionConcept == "Other"){
            conditions.show.push("PPN, Assessment of patient, other")
        }
        else {
            conditions.hide.push("PPN, Assessment of patient, other")
        }
        return conditions;
    },
    'PPN, Surgical ward patient care plan': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Surgical ward patient care plan'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("PPN, Surgical ward patient care plan, other")
        }
        else {
            conditions.hide.push("PPN, Surgical ward patient care plan, other")
        }
        if (conditionConcept.indexOf("Removal of drain")>=0){
            conditions.show.push("PPN, Removal of Drain")
        }
        else {
            conditions.hide.push("PPN, Removal of Drain")
        }
        return conditions;
    },
    'CC, Patient complication': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CC, Patient complication'];
        if (conditionConcept){
            conditions.show.push("CC, Start date of complication","CC, Outcome of complication","CC, Description of complication")
            if(conditionConcept.indexOf("Anemia due to acute blood loss")>=0){
                conditions.show.push("CC, Anemia due to acute blood loss, description")
                conditions.hide.push("CC, Description of complication")
            } else {
                conditions.hide.push("CC, Anemia due to acute blood loss, description")
            }
            if(conditionConcept.indexOf("Anaesthetic complication in OT")>=0){
                conditions.show.push("CC, Anaesthetic complication in OT, description")
                conditions.hide.push("CC, Description of complication")
            } else {
                conditions.hide.push("CC, Anaesthetic complication in OT, description")
            }
        if(conditionConcept.indexOf("Antibiotic Adverse Reaction")>=0){
                conditions.show.push("CC, Antibiotic adverse reaction, description")
                conditions.hide.push("CC, Description of complication")
            } else {
                conditions.hide.push("CC, Antibiotic adverse reaction, description")
            }
            if(conditionConcept.indexOf("Cardiac Arrhythmia")>=0){
                conditions.show.push("CC, Cardiac arrhythmia, description")
                conditions.hide.push("CC, Description of complication")
            } else {
                conditions.hide.push("CC, Cardiac arrhythmia, description")
            }
            if(conditionConcept.indexOf("Flap Necrosis")>=0){
                conditions.show.push("CC, Flap necrosis, description")
                conditions.hide.push("CC, Description of complication")
            } else {
                conditions.hide.push("CC, Flap necrosis, description")
            }
            if(conditionConcept.indexOf("Pressure Ulcer")>=0){
                conditions.show.push("CC, Pressure ulcer, description")
                conditions.hide.push("CC, Description of complication")
            } else {
                conditions.hide.push("CC, Pressure ulcer, description")
            }
            var conditionConcept = formFieldValues['CC, Outcome of complication'];
            if (conditionConcept == "Resolved"){
                conditions.show.push("CC, End date of complication")
            } else {
                conditions.hide.push("CC, End date of complication")
            }
            }
        else {
                    conditions.hide.push("CC, Start date of complication","CC, Outcome of complication","CC, End date of complication","CC, Anemia due to acute blood loss, description","CC, Anaesthetic complication in OT, description","CC, Cardiac arrhythmia, description","CC, Antibiotic adverse reaction, description","CC, Flap necrosis, description","CC, Pressure ulcer, description","CC, Description of complication")
             }
                return conditions;
            },
         'CC, Outcome of complication': function (formName, formFieldValues) {
                var conditions = {
                    show: [],
                    hide: []
                };
                var conditionConcept = formFieldValues['CC, Outcome of complication'];
                if (conditionConcept == "Resolved"){
                    conditions.show.push("CC, End date of complication")
                }
                else {
                    conditions.hide.push("CC, End date of complication")
                }
                return conditions;
            },
    'ANA, Reason for admission': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['ANA, Reason for admission'];
        if (conditionConcept == "Other"){
            conditions.show.push("ANA, Reason for admission, other")
        }
        else {
            conditions.hide.push("ANA, Reason for admission, other")
        }
        return conditions;
    },
    'WWN, Blood sugar': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Blood sugar'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, RBS before meal","WWN, RBS after meal","WWN, FBS","WWN, Insulin given")
              }
              else {
              conditions.hide.push("WWN, RBS before meal","WWN, RBS after meal","WWN, FBS","WWN, Insulin given")
              }
              return conditions;
         },
    'WWN, Insulin given': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['WWN, Insulin given'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("WWN, How much insulin given")
              }
              else {
              conditions.hide.push("WWN, How much insulin given")
              }
              return conditions;
         },
        'OMF, Chief complaint': function (formName, formFieldValues) {
                 var conditions = {
                     show: [],
                     hide: []
                 };
                 var conditionConcept = formFieldValues['OMF, Chief complaint'];

                 if (conditionConcept.indexOf("Other")>=0){
                     conditions.show.push("OMF, Other chief complaint")
                 }
                 else {
                     conditions.hide.push("OMF, Other chief complaint")
                 }
                 return conditions;
             },
        'OMF, Current treatment': function (formName, formFieldValues) {
                 var conditions = {
                     show: [],
                     hide: []
                 };
                 var conditionConcept = formFieldValues['OMF, Current treatment'];

                 if (conditionConcept.indexOf("Other")>=0){
                     conditions.show.push("OMF, Other current treatment")
                 }
                 else {
                     conditions.hide.push("OMF, Other current treatment")
                 }
                 return conditions;
             },
    'SFP, Early Follow-up': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SFP, Early Follow-up'];
        if (conditionConcept == "Paritial achievement of objectives without complications"){
            conditions.show.push("SFP, Partial achievement of objective")
            conditions.hide.push("SFP, Type of complication","SFP, Impact of complication")
        }
        else if(conditionConcept == "Complications developed") {
            conditions.show.push("SFP, Type of complication","SFP, Impact of complication")
            conditions.hide.push("SFP, Partial achievement of objective")
        }
        else {
            conditions.hide.push("SFP, Partial achievement of objective","SFP, Type of complication","SFP, Impact of complication" )
        }
        return conditions;
    },
    'OR, Does the patient have a drain?': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['OR, Does the patient have a drain?'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("OR , Drainage Section")
              }
              else {
              conditions.hide.push("OR , Drainage Section")
              }
              return conditions;
         },
    'OR, Blood transfusion': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['OR, Blood transfusion'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("OR, Number of units")
              }
              else {
              conditions.hide.push("OR, Number of units")
              }
              return conditions;
         },
    'SAP, Is patient for surgery': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['SAP, Is patient for surgery'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("SAP, Has Patient Consent Been Obtained?","SAP, Surgical summary","SAP, Planned Surgical Procedures for next OT","SAP, Estimated duration")
              }
              else {
              conditions.hide.push("SAP, Has Patient Consent Been Obtained?","SAP, Surgical summary","SAP, Planned Surgical Procedures for next OT","SAP, Estimated duration")
              }
              return conditions;
         },
     'SFP, Is patient for surgery': function (formName, formFieldValues) {
         var conditions = {
             show: [],
             hide: []
         };
         var conditionConcept = formFieldValues['SFP, Is patient for surgery'];
         if (conditionConcept == "Yes"){
             conditions.show.push("SFP, Has patient consent been obtained?","FP, Planned Surgical Procedures for next OT","SFP, Estimated duration","SFP, Surgical summary")
         }
         else {
             conditions.hide.push("SFP, Has patient consent been obtained?","FP, Planned Surgical Procedures for next OT","SFP, Estimated duration","SFP, Surgical summary")
         }
         return conditions;
     },
    'SAP, Associated neural injury': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['SAP, Associated neural injury'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("SAP, Comments (neural injury)")
              }
              else {
              conditions.hide.push("SAP, Comments (neural injury)")
              }
              return conditions;
       },
    'SAP, Associated vascular injury': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['SAP, Associated vascular injury'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("SAP, Comments (vascular injury)")
              }
              else {
              conditions.hide.push("SAP, Comments (vascular injury)")
              }
              return conditions;
         },
      'OMF, Current plan': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['OMF, Current plan'];

          if (conditionConcept.indexOf("Other")>=0){
              conditions.show.push("OMF, Other current plan")
          }
          else {
              conditions.hide.push("OMF, Other current plan")
          }
          return conditions;
      }
}