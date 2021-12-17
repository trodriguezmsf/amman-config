Bahmni.ConceptSet.FormConditions.rules = {
    'CV, Type of Assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Type of Assessment' +
        ''];
        if (conditionConcept == "Initial"){
            conditions.hide.push("CV, Discharge Assessment")
            conditions.hide.push("CV, Laboratory Tests During Hospitalization")
            conditions.show.push("CV, Initial Assessment")
            conditions.show.push("CV, Patient Vitals at Arrival")
            conditions.show.push("CV, Physical Examination")
            conditions.show.push("CV, COVID-19 Testing")
            conditions.show.push("CV, Initial Lab and Radiology Examinations")
            conditions.show.push("CV, Disposition")
            conditions.hide.push("CV, Other Specimen Type")
            conditions.hide.push("CV, Referral From")
            conditions.hide.push("CV, Other Mode of Arrival")
            conditions.hide.push("CV, Traveled to Which Country")
            conditions.hide.push("CV, Date of Return from Travel")
            conditions.hide.push("CV, Name of the Healthcare Facility")
            conditions.hide.push("CV, Date of Return from Travel")
            conditions.hide.push("CV, In or Outpatient Care in the Healthcare Facility?")
            conditions.hide.push("CV, Other Signs and Symptoms")
            conditions.hide.push("CV, Pregnant")
            conditions.hide.push("CV, Breastfeeding")
            conditions.hide.push("CV, Post-Partum (less than 6 Weeks)")
            conditions.hide.push("CV, Gestational Age")
            conditions.hide.push("CV, Other Current/Recent Medications")
            conditions.hide.push("CV, Other Co-Morbidities")

        }
        else if (conditionConcept == "Discharge"){
            conditions.hide.push("CV, Initial Assessment")
            conditions.hide.push("CV, Patient Vitals at Arrival")
            conditions.hide.push("CV, Physical Examination")
            conditions.hide.push("CV, COVID-19 Testing")
            conditions.hide.push("CV, Initial Lab and Radiology Examinations")
            conditions.hide.push("CV, Disposition")
            conditions.show.push("CV, Discharge Assessment")
            conditions.show.push("CV, Laboratory Tests During Hospitalization")
            conditions.hide.push("CV, Other Complications")
            conditions.hide.push("CV, Other ICU Complications")
            conditions.hide.push("CV, Other Symptoms at Discharge")
            conditions.hide.push("CV, Other Newly Introduced Treatment During Hospitalization")
            conditions.hide.push("CV, ICU Respiratory Support")
            conditions.hide.push("CV, Number of Days in ICU")
            conditions.hide.push("CV, Procedures During ICU Stay")
            conditions.hide.push("CV, Other Procedures During ICU Stay")
            conditions.hide.push("CV, Referral to Another Hospital")
            conditions.hide.push("CV, Death")
            conditions.hide.push("CV, Was the Death in the ICU?")
            conditions.hide.push("CV, Cause of Death")
            conditions.hide.push("CV, ICU Death")
            conditions.hide.push("CV, Other Cause of Death")


        }
        else {
            conditions.hide.push("CV, Initial Assessment")
            conditions.hide.push("CV, Patient Vitals at Arrival")
            conditions.hide.push("CV, Physical Examination")
            conditions.hide.push("CV, COVID-19 Testing")
            conditions.hide.push("CV, Initial Lab and Radiology Examinations")
            conditions.hide.push("CV, Disposition")
            conditions.hide.push("CV, Discharge Assessment")
            conditions.hide.push("CV, Laboratory Tests During Hospitalization")
        }
        return conditions;
    },
    'CV, Disposition': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Disposition' +
        ''];
        if (conditionConcept == "Discharged Home for Self-Isolation"){
            conditions.show.push("CV, Exit Date and Time")
            conditions.show.push("CV, Discharged Home")
            conditions.hide.push("CV, Referral to")
            conditions.hide.push("CV, Admission Date and Time")
            conditions.hide.push("CV, Admitted to")
        }
        else if (conditionConcept == "Left against medical advice" || conditionConcept == "Died"){
            conditions.show.push("CV, Exit Date and Time")
            conditions.hide.push("CV, Discharged Home")
            conditions.hide.push("CV, Referral to")
            conditions.hide.push("CV, Admission Date and Time")
            conditions.hide.push("CV, Admitted to")
        }
        else if (conditionConcept == "Referred to Other Facility"){
            conditions.show.push("CV, Exit Date and Time")
            conditions.show.push("CV, Referral to")
            conditions.hide.push("CV, Discharged Home")
            conditions.hide.push("CV, Admission Date and Time")
            conditions.hide.push("CV, Admitted to")
        }
        else if (conditionConcept == "Admitted to Hospital"){
            conditions.show.push("CV, Admission Date and Time")
            conditions.show.push("CV, Admitted to")
            conditions.hide.push("CV, Exit Date and Time")
            conditions.hide.push("CV, Discharged Home")
            conditions.hide.push("CV, Referral to")
        }
        else {
            conditions.hide.push("CV, Exit Date and Time")
            conditions.hide.push("CV, Discharged Home")
            conditions.hide.push("CV, Referral to")
            conditions.hide.push("CV, Admission Date and Time")
            conditions.hide.push("CV, Admitted to")
        }
        return conditions;
    },
    'CV, ICU During Hospitalization?': function (formName, formFieldValues)     {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, ICU During Hospitalization?' +
        ''];
        if (conditionConcept == "Yes"){
            conditions.show.push("CV, ICU Respiratory Support")
            conditions.show.push("CV, Number of Days in ICU")
            conditions.show.push("CV, Procedures During ICU Stay")
        }
        else {
            conditions.hide.push("CV, ICU Respiratory Support")
            conditions.hide.push("CV, Number of Days in ICU")
            conditions.hide.push("CV, Procedures During ICU Stay")
        }
        return conditions;
    },
    'CV, ICU Respiratory Support': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, ICU Respiratory Support' +
        ''];
        if(conditionConcept) {
        if (conditionConcept.indexOf("CPAP")>=0 || conditionConcept.indexOf("BiPAP")>=0 )
            conditions.show.push("CV, Number of Days Under Non Invasive Mechanical Ventilation")
        else
            conditions.hide.push("CV, Number of Days Under Non Invasive Mechanical Ventilation")

        if (conditionConcept.indexOf("Invasive Mechanical Ventilation")>=0)
            conditions.show.push("CV, Number of Days Under Invasive Mechanical Ventilation")
            else
            conditions.hide.push("CV, Number of Days Under Invasive Mechanical Ventilation")
        } else {
            conditions.hide.push("CV, Number of Days Under Invasive Mechanical Ventilation")
            conditions.hide.push("CV, Number of Days Under Non Invasive Mechanical Ventilation")
        }
        return conditions;
    },
    'CV, Hospital Discharge Status': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Hospital Discharge Status' +
        ''];
        if (conditionConcept == "Referral to Another Hospital"){
            conditions.show.push("CV, Referral to Another Hospital")
            conditions.hide.push("CV, Death")
            conditions.hide.push("CV, Was the Death in the ICU?")
            conditions.hide.push("CV, Cause of Death")
        }
        else if(conditionConcept == "Death"){
            conditions.hide.push("CV, Referral to Another Hospital")
            conditions.show.push("CV, Death")
            conditions.show.push("CV, Was the Death in the ICU?")
            conditions.show.push("CV, Cause of Death")
        } else {
            conditions.hide.push("CV, Referral to Another Hospital")
            conditions.hide.push("CV, Death")
            conditions.hide.push("CV, Was the Death in the ICU?")
            conditions.hide.push("CV, Cause of Death")
        }
        return conditions;
    },
    'CV, Procedures During ICU Stay': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Procedures During ICU Stay'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Procedures During ICU Stay")
        }
        else {
            conditions.hide.push("CV, Other Procedures During ICU Stay")
        }
        return conditions;
    },
    'CV, Newly Introduced Treatment During Hospitalization': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Newly Introduced Treatment During Hospitalization' +
        ''];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Newly Introduced Treatment During Hospitalization")
        }
        else {
            conditions.hide.push("CV, Other Newly Introduced Treatment During Hospitalization")
        }
        return conditions;
    },
    'CV, COVID-19 Persistent Symptoms at Discharge': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, COVID-19 Persistent Symptoms at Discharge'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Symptoms at Discharge")
        }
        else {
            conditions.hide.push("CV, Other Symptoms at Discharge")
        }
        return conditions;
    },
    'CV, ICU Complications': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, ICU Complications'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other ICU Complications")
        }
        else {
            conditions.hide.push("CV, Other ICU Complications")
        }
        return conditions;
    },
    'CV, Complications': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Complications'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Complications")
        }
        else {
            conditions.hide.push("CV, Other Complications")
        }
        return conditions;
    },
    'CV, Co-Morbidities': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Co-Morbidities'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Co-Morbidities")
        }
        else {
            conditions.hide.push("CV, Other Co-Morbidities")
        }
        return conditions;
    },
    'CV, Current/Recent COVID-19 Medications (Past 14 Days)': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Current/Recent COVID-19 Medications (Past 14 Days)'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Current/Recent Medications")
        }
        else {
            conditions.hide.push("CV, Other Current/Recent Medications")
        }
        return conditions;
    },
    'CV, Pregnant': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Pregnant'];
        if (conditionConcept == "Yes"){
            conditions.show.push("CV, Gestational Age")
        }
        else {
            conditions.hide.push("CV, Gestational Age")
        }
        return conditions;
    },
    'CV, Is the Patient a Woman of Reproductive Age Group (15 - 51)?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Is the Patient a Woman of Reproductive Age Group (15 - 51)?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("CV, Pregnant")
            conditions.show.push("CV, Breastfeeding")
            conditions.show.push("CV, Post-Partum (less than 6 Weeks)")
        }
        else {
            conditions.hide.push("CV, Pregnant")
            conditions.hide.push("CV, Breastfeeding")
            conditions.hide.push("CV, Post-Partum (less than 6 Weeks)")
        }
        return conditions;
    },
    'CV, Signs and Symptoms at Admission': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Signs and Symptoms at Admission'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("CV, Other Signs and Symptoms")
        }
        else {
            conditions.hide.push("CV, Other Signs and Symptoms")
        }
        return conditions;
    },
    'CV, Has Patient Been in a Healthcare Facility in the Last 14 Days?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Has Patient Been in a Healthcare Facility in the Last 14 Days?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("CV, Name of the Healthcare Facility")
            conditions.show.push("CV, In or Outpatient Care in the Healthcare Facility?")
        }
        else {
            conditions.hide.push("CV, Name of the Healthcare Facility")
            conditions.hide.push("CV, In or Outpatient Care in the Healthcare Facility?")
        }
        return conditions;
    },
    'CV, Has Patient Traveled in the Past 14 Days?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Has Patient Traveled in the Past 14 Days?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("CV, Traveled to Which Country")
            conditions.show.push("CV, Date of Return from Travel")
        }
        else {
            conditions.hide.push("CV, Traveled to Which Country")
            conditions.hide.push("CV, Date of Return from Travel")
        }
        return conditions;
    },
    'CV, Mode of Arrival': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Mode of Arrival'];
        if (conditionConcept == "Referral"){
            conditions.show.push("CV, Referral From")
            conditions.hide.push("CV, Other Mode of Arrival")
        }
        else if (conditionConcept == "Other") {
            conditions.show.push("CV, Other Mode of Arrival")
            conditions.hide.push("CV, Referral From")
        }
        else {
            conditions.hide.push("CV, Other Mode of Arrival")
            conditions.hide.push("CV, Referral From")
        }
        return conditions;
    },
    'CV, Type of Specimen COVID-19': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Type of Specimen COVID-19'];
        if (conditionConcept == "Other"){
            conditions.show.push("CV, Other Specimen Type")
        }
        else {
            conditions.hide.push("CV, Other Specimen Type")
        }
        return conditions;
    },
    'CV, Type of Specimen COVID-19': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Type of Specimen COVID-19'];
        if (conditionConcept == "Other"){
            conditions.show.push("CV, Other Specimen Type")
        }
        else {
            conditions.hide.push("CV, Other Specimen Type")
        }
        return conditions;
    },
    'CV, Cause of Death': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Cause of Death'];
        if (conditionConcept == "Other"){
            conditions.show.push("CV, Other Cause of Death")
        }
        else {
            conditions.hide.push("CV, Other Cause of Death")
        }
        return conditions;
    },
    'CV, Was the Death in the ICU?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['CV, Was the Death in the ICU?'];
        if (conditionConcept == "Yes"){
            conditions.show.push("CV, ICU Death")
        }
        else {
            conditions.hide.push("CV, ICU Death")
        }
        return conditions;
    },
    'OR, Peripheral Nerve Block': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OR, Peripheral Nerve Block'];
        if (conditionConcept == "Yes"){
            conditions.show.push("OR, Peripheral Nerve Block Section")
        }
        else {
            conditions.hide.push("OR, Peripheral Nerve Block Section")
        }
        return conditions;
    },
    'PNF, Quality:': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNF, Quality:'];
        if (conditionConcept == "Other"){
            conditions.show.push("PNF, Other Quality:")
        }
        else {
            conditions.hide.push("PNF, Other Quality:")
        }
        return conditions;
    },
    'OR, Local anesthetic given': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OR, Local anesthetic given'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("OR, Other local anesthetic given")
        }
        else {
            conditions.hide.push("OR, Other local anesthetic given")
        }
        return conditions;
    },
    'HE, Educational station': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['HE, Educational station'];
        if (conditionConcept == "First station") {
            conditions.show.push("HE, Covered topic at the first station")
            conditions.hide.push("HE, Covered topics at the second station", "HE, Covered topics at the third station", "HE, Covered topics at the fourth station")
        }
        else if (conditionConcept == "Second station") {
            conditions.show.push("HE, Covered topics at the second station")
            conditions.hide.push("HE, Covered topic at the first station", "HE, Covered topics at the third station", "HE, Covered topics at the fourth station")
        }
        else if (conditionConcept == "Third station") {
            conditions.show.push("HE, Covered topics at the third station")
            conditions.hide.push("HE, Covered topic at the first station", "HE, Covered topics at the second station", "HE, Covered topics at the fourth station")
        }
        else if (conditionConcept == "Fourth station") {
            conditions.show.push("HE, Covered topics at the fourth station")
            conditions.hide.push("HE, Covered topic at the first station", "HE, Covered topics at the second station", "HE, Covered topics at the third station")
        }
        return conditions;
    },
    'HE, Initial medical and nonmedical educational needs': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['HE, Initial medical and nonmedical educational needs'];
        if (conditionConcept.indexOf("Other educational needs")>=0){
            conditions.show.push("HE, Education learning needs")
        }
        else {
            conditions.hide.push("HE, Education learning needs")
        }
        return conditions;
    },
    'FSTG, Outcomes for 1st stage surgical validation': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['FSTG, Outcomes for 1st stage surgical validation'];
        if (conditionConcept == "Valid") {
            conditions.show.push("FSTG, Priority", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Does the Patient need Surgical Final Validation")
            conditions.hide.push("FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Refused Reason", "FSTG, Comments about postpone reason", "FSTG, Comments about refusal","FSTG, Type of medical information needed for next submission")
        }
        else if (conditionConcept == "Postponed") {
            conditions.show.push("FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Comments about postpone reason")
            conditions.hide.push("FSTG, Priority", "FSTG, Type of medical information needed for next submission", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Refused Reason", "FSTG, Comments about refusal", "FSTG, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "More Information") {
            conditions.show.push("FSTG, Type of medical information needed for next submission")
            conditions.hide.push("FSTG, Priority", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Refused Reason", "FSTG, Comments about postpone reason", "FSTG, Comments about refusal", "FSTG, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Refused") {
            conditions.show.push("FSTG, Refused Reason", "FSTG, Comments about refusal")
            conditions.hide.push("FSTG, Priority","FSTG, Type of medical information needed for next submission","FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Postpone reason", "FSTG, Medical file to be submitted again by", "FSTG, Comments about postpone reason", "FSTG, Does the Patient need Surgical Final Validation")
        }
        else {
            conditions.hide.push("FSTG, Priority", "FSTG, Name (s) of Surgeon 1", "FSTG, Name (s) of Surgeon 2", "FSTG, Comments", "FSTG, Postpone reason", "FSTG, Comments about postpone reason", "FSTG, Medical file to be submitted again by",  "FSTG, Refused Reason", "FSTG, Comments about refusal", "FSTG, Does the Patient need Surgical Final Validation","FSTG, Type of medical information needed for next submission")
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
            conditions.hide.push("FST, Type of medical information needed for next submission")

        }
        else if (conditionConcept == "Need complementary investigation") {
            conditions.show.push("FST, Type of medical information needed for next submission");
            conditions.hide.push("FSTG, Name (s) of Anaesthetist", "FSTG, Comments about Anaesthesia validation")
        }
        else {
            conditions.hide.push("FSTG, Comments about Anaesthesia validation", "FSTG, Name (s) of Anaesthetist","FST, Type of medical information needed for next submission")
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
            conditions.show.push("FUP, Time for next medical follow-up","FUP, Date of next medical follow-up","FUP, Type of medical investigations requested", "FUP, Comments about next follow-up")
            conditions.hide.push("Stage","FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "MBA") {
            conditions.show.push("FUP, Comments about MBA");
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up","FUP, Date of next medical follow-up","FUP, Type of medical investigations requested", "FUP, Comments about next follow-up", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Dismissal") {
            conditions.show.push("FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal")
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up","FUP, Date of next medical follow-up","FUP, Type of medical investigations requested", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission")
        }
        else if (conditionConcept == "Defaulter (D2)") {
            conditions.show.push("FUP, Comments about Defaulter");
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up","FUP, Date of next medical follow-up","FUP, Type of medical investigations requested", "FUP, Comments about next follow-up", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
        }
        else if (conditionConcept == "Further stage admission") {
            conditions.show.push("Stage","FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
            conditions.hide.push("FUP, Time for next medical follow-up", "FUP, Comments about next follow-up","FUP, Date of next medical follow-up","FUP, Type of medical investigations requested", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter")

        }
        else {
            conditions.hide.push("Stage","FUP, Priority", "FUP, Time for next medical follow-up", "FUP, Comments about next follow-up","FUP, Date of next medical follow-up","FUP, Type of medical investigations requested", "FUP, Comments about MBA", "FUP, Dismissal reason", "FUP, Dismissal confirmed", "FUP, Comments about dismissal", "FUP, Comments about Defaulter", "FUP, Reason for re-admission", "FUP, Priority", "FUP, Name (s) of Surgeon 1", "FUP, Name (s) of Surgeon 2", "FUP, Comments about further stage admission", "FUP, Does the Patient need Surgical Final Validation")
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
    'SMH, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SMH, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("SMH, Site, Other")
        }
        else {
            conditions.hide.push("SMH, Site, Other")
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
        }
        else {
            conditions.hide.push("PHIA, Type of assistive device or orthosis","PHIA, Comments about assistive device or orthosis")
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
        }
        else {
            conditions.hide.push("PHIA, Comment about prostheses usage","PHIA, Is there a need of new prosthesis or modification")
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
        }
        else if (conditionConcept == "Improve function"){
            conditions.hide.push("SAP, Objectives of physiotherapy")
        }
        else {
            conditions.hide.push("SAP, Objectives of physiotherapy")
        }
        return conditions;
    },
    'SAP, Surgical objective': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['SAP, Surgical objective'];
        if (conditionConcept.indexOf("Uncertain") >= 0){
              conditions.show.push("SAP, Comments of uncertainty")
         }
        else {
            conditions.hide.push("SAP, Comments of uncertainty")
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
         'ANA, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['ANA, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("ANA, Site, Other")
        }
        else {
            conditions.hide.push("ANA, Site, Other")
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
	  'ONN, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['ONN, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("ONN, Site, Other")
        }
        else {
            conditions.hide.push("ONN, Site, Other")
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
         'POW, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['POW, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("POW, Site, Other")
        }
        else {
            conditions.hide.push("POW, Site, Other")
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
         'WWN, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['WWN, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("WWN, Site, Other")
        }
        else {
            conditions.hide.push("WWN, Site, Other")
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
        if (conditionConcept.indexOf("Pain")>=0){
            conditions.show.push("PPN, Pain severity")
        }
        else {
            conditions.hide.push("PPN, Pain severity")
        }
        if (conditionConcept.indexOf("Diarrhoea")>=0){
            conditions.show.push("PPN, Diarrhoea frequency per day")
        }
        else {
            conditions.hide.push("PPN, Diarrhoea frequency per day")
        }
        if (conditionConcept.indexOf("Abdominal Pain")>=0){
            conditions.show.push("PPN, Site and side of abdominal pain", "PPN, Surgical or nonsurgical abdominal pain", "PPN, Acute or chronic abdominal pain", "PPN, Radiation of abdominal pain")
        }
        else {
            conditions.hide.push("PPN, Site and side of abdominal pain", "PPN, Surgical or nonsurgical abdominal pain", "PPN, Acute or chronic abdominal pain", "PPN, Radiation of abdominal pain")
        }
        if (conditionConcept.indexOf("Fever")>=0){
            conditions.show.push("PPN, Temperature")
        }
        else {
            conditions.hide.push("PPN, Temperature")
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
        if (conditionConcept.indexOf("Start antibiotics")>=0){
            conditions.show.push("PPN, Which antibiotics?")
        }
        else {
            conditions.hide.push("PPN, Which antibiotics?")
        }
        if (conditionConcept.indexOf("Review labs")>=0){
            conditions.show.push("PPN, Ordered labs", "PPN, Pending labs")
        }
        else {
            conditions.hide.push("PPN, Ordered labs", "PPN, Pending labs")
        }
        return conditions;
    },
    'PPN, Assessment of vital signs': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Assessment of vital signs'];
        if (conditionConcept == "Abnormal"){
            conditions.show.push("PPN, Description of abnormal vital signs")
        }
        else {
            conditions.hide.push("PPN, Description of abnormal vital signs")
        }
        return conditions;
    },
    'PPN, DVT prophylaxis': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, DVT prophylaxis'];
        if (conditionConcept == "Yes"){
            conditions.show.push("PPN, Duration", "PPN, Dose", "PPN, DVT prophylaxis medication")
        }
        else {
            conditions.hide.push("PPN, Duration", "PPN, Dose", "PPN, DVT prophylaxis medication")
        }
        return conditions;
    },
    'PPN, Frequency of dressing': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Frequency of dressing'];
        if (conditionConcept == "Other"){
            conditions.show.push("PPN, Frequency of dressing, other")
        }
        else {
            conditions.hide.push("PPN, Frequency of dressing, other")
        }
        return conditions;
    },
    'PPN, Active issues of patient': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Active issues of patient'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("PPN, Active issues of patient, other")
        }
        else {
            conditions.hide.push("PPN, Active issues of patient, other")
        }
        if (conditionConcept.indexOf("IV antibiotics")>=0){
            conditions.show.push("PPN, Day of IV antibiotic treatment", "PPN, Type and frequency of IV antibiotics")
        }
        else {
            conditions.hide.push("PPN, Day of IV antibiotic treatment", "PPN, Type and frequency of IV antibiotics")
        }
        if (conditionConcept.indexOf("Isolation")>=0){
            conditions.show.push("PPN, Reason for isolation (microorganism)")
        }
        else {
            conditions.hide.push("PPN, Reason for isolation (microorganism)")
        }
        if (conditionConcept.indexOf("Pain control")>=0){
            conditions.show.push("PPN, Type, frequency, regular or PRN pain medications")
        }
        else {
            conditions.hide.push("PPN, Type, frequency, regular or PRN pain medications")
        }
        return conditions;
    },
    'PE, Wound assessment': function (formName, formFieldValues) {
            var conditions = {
                show: [],
                hide: []
            };
            var conditionConcept = formFieldValues['PE, Wound assessment'];
            if (conditionConcept == "Wound seen") {
                conditions.show.push("PE, Description of wound","PE, Description of wound, other")
                var conditionConcept2 = formFieldValues['PE, Description of wound'];
                if (conditionConcept2 == "Other") {
                    conditions.show.push("PE, Description of wound, other")
                }
                else {
                    conditions.hide.push("PE, Description of wound, other")
                }
            } else {
                conditions.hide.push("PE, Description of wound")
            }
            return conditions;
        },
        'PE, Description of wound': function (formName, formFieldValues) {
            var conditions = {
                show: [],
                hide: []
            };
            var conditionConcept = formFieldValues['PE, Description of wound'];
            if (conditionConcept == "Other"){
                conditions.show.push("PE, Description of wound, other")
            }
            else {
                conditions.hide.push("PE, Description of wound, other")
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
        if (conditionConcept == "Partial achievement of objectives without complications"){
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
                 conditions.hide.push("SAP, Comments, pre-op assessment");
              }
              else if (conditionConcept == "No" || conditionConcept =="No Surgery Planned"){
              conditions.show.push("SAP, Comments, pre-op assessment");
              conditions.hide.push("SAP, Has Patient Consent Been Obtained?","SAP, Surgical summary","SAP, Planned Surgical Procedures for next OT","SAP, Estimated duration")
              }
              else {
              conditions.hide.push("SAP, Comments, pre-op assessment","SAP, Has Patient Consent Been Obtained?","SAP, Surgical summary","SAP, Planned Surgical Procedures for next OT","SAP, Estimated duration")
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
             conditions.hide.push("SFP, Follow-up consultation notes", "SFP, Is patient ready to be discharged (TRM)?");
         }
         else if(conditionConcept=="No"){
             conditions.show.push("SFP, Follow-up consultation notes");
             conditions.hide.push("SFP, Has patient consent been obtained?","FP, Planned Surgical Procedures for next OT","SFP, Estimated duration","SFP, Surgical summary", "SFP, Is patient ready to be discharged (TRM)?")
        }
        else if(conditionConcept=="No Surgery Planned"){
             conditions.show.push("SFP, Is patient ready to be discharged (TRM)?");
             conditions.hide.push("SFP, Has patient consent been obtained?","FP, Planned Surgical Procedures for next OT","SFP, Estimated duration","SFP, Surgical summary", "SFP, Follow-up consultation notes")
        }
         else {
             conditions.hide.push("SFP, Has patient consent been obtained?","FP, Planned Surgical Procedures for next OT","SFP, Estimated duration","SFP, Surgical summary","SFP, Follow-up consultation notes", "SFP, Is patient ready to be discharged (TRM)?")
         }
         return conditions;
     },
     'SFP, Is patient ready to be discharged (TRM)?': function (formName, formFieldValues) {
         var conditions = {
             show: [],
             hide: []
         };
         var conditionConcept = formFieldValues['SFP, Is patient ready to be discharged (TRM)?'];
         if (conditionConcept == "Yes"){
             conditions.show.push("SFP, Has patient been informed about TRM", "SFP, Follow-up plan", "FP, Follow-up needs")
             conditions.hide.push("SFP, Consultation notes");
         }
         else if(conditionConcept=="No"){
             conditions.show.push("SFP, Consultation notes");
             conditions.hide.push("SFP, Has patient been informed about TRM", "SFP, Follow-up plan", "FP, Follow-up needs")
	 }
	 else {
	     conditions.hide.push("SFP, Has patient been informed about TRM", "SFP, Follow-up plan", "FP, Follow-up needs", "SFP, Consultation notes")
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
      },
    'APN, Blood transfusion': function (formName, formFieldValues) {
              var conditions = {
                  show: [],
                  hide: []
               };
              var conditionConcept = formFieldValues['APN, Blood transfusion'];
              if (conditionConcept == "Yes"){
                 conditions.show.push("Intra-operative blood products","APN, Intra-operative transfusion related reaction","APN, Intra-operative transfusion related reaction, comments")
              }
              else {
              conditions.hide.push("Intra-operative blood products","APN, Intra-operative transfusion related reaction","APN, Intra-operative transfusion related reaction, comments")
              }
              return conditions;
       },
    'AIA, Past medical history': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['AIA, Past medical history'];
        if (conditionConcept.indexOf("Other")>=0){
            conditions.show.push("AIA, Past medical history, other")
        }
        else {
            conditions.hide.push("AIA, Past medical history, other")
        }
        return conditions;
    },
    'AIA, Adverse reaction to anaesthesia': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['AIA, Adverse reaction to anaesthesia'];

       if (conditionConcept.length >= 1 && conditionConcept.indexOf("Delayed recovery")>=0 ) {
            conditions.show.push("AIA, Comments about adverse reaction")
        }
        else if (conditionConcept.length >= 1 && conditionConcept.indexOf("Admission to ICU")>=0 ) {
            conditions.show.push("AIA, Comments about adverse reaction")
        }
        else if (conditionConcept.length >= 1 && conditionConcept.indexOf("Suffocation or cyanosis")>=0 ) {
            conditions.show.push("AIA, Comments about adverse reaction")
        }
        else if (conditionConcept.length >= 1 && conditionConcept.indexOf("Difficult intubation")>=0 ) {
            conditions.show.push("AIA, Comments about adverse reaction")
        }
        else if (conditionConcept.length >= 1 && conditionConcept.indexOf("Other")>=0 ) {
             conditions.show.push("AIA, Comments about adverse reaction")
        }
        else {
            conditions.hide.push("AIA, Comments about adverse reaction")
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
          }
          else {
              conditions.hide.push("AIA, Did an incident occur during previous blood transfusion")
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
      'LLA, Type of assessment': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Type of assessment'];
          if (conditionConcept == "Initial"){
              conditions.hide.push("LLA, Follow-up Plan")
              conditions.show.push("LLA, Previous history of physiotherapy","LLA, Chief complaint of patient","LLA, Problem List",  "LLA, Affected side", "LLA, Does the patient use an assistive device or orthosis?", "LLA, Amputee patient?", "LLA, Independence of Patient", "LLA, Leg Length Discrepancy (LLD)", "LLA, Pain Assessment", "LLA, R.O.M Test for Lower Limbs", "LLA, Neurological exam of lower limb", "LLA, Muscle Test for Lower Limbs", "LLA, Tinetti Balance Assessment Tool", "LLA, How old is the patient", "LLA, Additional comments")
          }
          else if (conditionConcept == "Post-operative"){
	         conditions.hide.push("LLA, Previous history of physiotherapy","LLA, Chief complaint of patient","LLA, Problem List","LLA, Follow-up Plan")
             conditions.show.push("LLA, Affected side", "LLA, Independence of Patient", "LLA, Leg Length Discrepancy (LLD)", "LLA, Pain Assessment", "LLA, R.O.M Test for Lower Limbs", "LLA, Neurological exam of lower limb", "LLA, Muscle Test for Lower Limbs", "LLA, Tinetti Balance Assessment Tool", "LLA, Does the patient use an assistive device or orthosis?", "LLA, Amputee patient?", "LLA, How old is the patient", "LLA, Additional comments")
         }
         else if (conditionConcept == "Final"){
	         conditions.hide.push("LLA, Previous history of physiotherapy","LLA, Chief complaint of patient","LLA, Problem List")
             conditions.show.push("LLA, Follow-up Plan", "LLA, Affected side", "LLA, Independence of Patient", "LLA, Leg Length Discrepancy (LLD)", "LLA, Pain Assessment", "LLA, R.O.M Test for Lower Limbs", "LLA, Neurological exam of lower limb", "LLA, Muscle Test for Lower Limbs", "LLA, Tinetti Balance Assessment Tool", "LLA, Does the patient use an assistive device or orthosis?", "LLA, Amputee patient?", "LLA, How old is the patient", "LLA, Additional comments")
         }
         else {
             conditions.hide.push("LLA, Pediatric Lower Extremity Function(Mobility)", "LLA, Lower Extremity Functional Index (LEFI)", "LLA, Independence of Patient", "LLA, Leg Length Discrepancy (LLD)", "LLA, Pain Assessment", "LLA, R.O.M Test for Lower Limbs", "LLA, Neurological exam of lower limb", "LLA, Muscle Test for Lower Limbs", "LLA, Tinetti Balance Assessment Tool", "LLA, Follow-up Plan", "LLA, Previous history of physiotherapy", "LLA, Chief complaint of patient", "LLA, Problem List", "LLA, Affected side", "LLA, Does the patient use an assistive device or orthosis?", "LLA, Amputee patient?", "LLA, How old is the patient", "LLA, Additional comments")
         }
          return conditions;
      },
      'ULA, Type of assessment': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Type of assessment'];
          if (conditionConcept == "Initial"){
              conditions.hide.push("ULA, Followup Plan")
              conditions.show.push("ULA, Previous history of physiotherapy","ULA, Chief complaint of patient","ULA, Problem List","ULA, Dominant side", "ULA, Affected side", "ULA, Independence of Patient", "ULA, Does the patient use an assistive device or orthosis?", "ULA, Amputee patient?", "ULA, Pain Assessment", "ULA, Objective examination", "ULA, R.O.M Test for Upper Limbs", "ULA, Neurological exam of upper limb", "ULA, Muscle Test for Upper Limbs", "ULA, Hand and Finger", "ULA, hand and finger R.O.M", "ULA, Basic Grip Test", "ULA, How old is the patient", "ULA, Additional comments", "ULA, Site of pain", "ULA, Summary neurological examination (sensation)")
          }
          else if (conditionConcept == "Post-operative"){
              conditions.hide.push("ULA, Previous history of physiotherapy","ULA, Chief complaint of patient","ULA, Problem List","ULA, Followup Plan")
              conditions.show.push("ULA, Dominant side", "ULA, Affected side", "ULA, Independence of Patient", "ULA, Does the patient use an assistive device or orthosis?", "ULA, Amputee patient?", "ULA, Pain Assessment", "ULA, Objective examination", "ULA, R.O.M Test for Upper Limbs", "ULA, Neurological exam of upper limb", "ULA, Muscle Test for Upper Limbs", "ULA, Hand and Finger", "ULA, hand and finger R.O.M", "ULA, Basic Grip Test", "ULA, How old is the patient", "ULA, Additional comments", "ULA, Site of pain", "ULA, Summary neurological examination (sensation)")
         }
         else if (conditionConcept == "Final"){
	          conditions.hide.push("ULA, Previous history of physiotherapy","ULA, Chief complaint of patient","ULA, Problem List")
              conditions.show.push("ULA, Followup Plan", "ULA, Dominant side", "ULA, Affected side", "ULA, Independence of Patient", "ULA, Does the patient use an assistive device or orthosis?", "ULA, Amputee patient?", "ULA, Pain Assessment", "ULA, Objective examination", "ULA, R.O.M Test for Upper Limbs", "ULA, Neurological exam of upper limb", "ULA, Muscle Test for Upper Limbs", "ULA, Hand and Finger", "ULA, hand and finger R.O.M", "ULA, Basic Grip Test", "ULA, How old is the patient", "ULA, Additional comments", "ULA, Site of pain", "ULA, Summary neurological examination (sensation)")
         }
         else {
             conditions.hide.push("ULA, Previous history of physiotherapy","ULA, Level of amputation", "ULA, Pediatric Upper Extremity Function ( Fine Motor, ADL)", "ULA, (UEFI) Upper Extremity Functional Index", "ULA, Chief complaint of patient", "ULA, Problem List", "ULA, Dominant side", "ULA, Affected side", "ULA, Independence of Patient", "ULA, Does the patient use an assistive device or orthosis?", "ULA, Amputee patient?", "ULA, Pain Assessment", "ULA, Objective examination", "ULA, R.O.M Test for Upper Limbs", "ULA, Neurological exam of upper limb", "ULA, Muscle Test for Upper Limbs","ULA, Hand and Finger", "ULA, hand and finger R.O.M", "ULA, Basic Grip Test", "ULA, How old is the patient", "ULA, Additional comments", "ULA, Followup Plan")
         }
          return conditions;
      },
      'MPA, Type of assessment': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Type of assessment'];
          if (conditionConcept == "Initial"){
              conditions.hide.push("MPA, Followup Plan")
              conditions.show.push("MPA, Previous history of physiotherapy","MPA, Chief complaint of patient","MPA, Problem List", "MPA, Independence of Patient", "MPA, Functional status of the patient", "MPA, Pain Assessment", "MPA, Summary neurological examination (sensation)", "MPA, Objective examination", "MPA, Functional examination", "MPA, Facial Disability Index", "MPA, Additional comments")
          }
          else if (conditionConcept == "Post-operative"){
              conditions.hide.push("MPA, Previous history of physiotherapy", "MPA, Chief complaint of patient","MPA, Problem List","MPA, Followup Plan")
              conditions.show.push("MPA, Independence of Patient", "MPA, Functional status of the patient", "MPA, Pain Assessment", "MPA, Summary neurological examination (sensation)", "MPA, Objective examination", "MPA, Functional examination", "MPA, Facial Disability Index", "MPA, Additional comments")
         }
         else if (conditionConcept == "Final"){
             conditions.hide.push("MPA, Previous history of physiotherapy",  "MPA, Chief complaint of patient","MPA, Problem List")
             conditions.show.push("MPA, Followup Plan", "MPA, Independence of Patient", "MPA, Functional status of the patient", "MPA, Pain Assessment", "MPA, Summary neurological examination (sensation)", "MPA, Objective examination", "MPA, Functional examination", "MPA, Facial Disability Index", "MPA, Additional comments")
         }
         else {
             conditions.show.push("MPA, Date recorded")
             conditions.hide.push("MPA, Previous history of physiotherapy", "MPA, Chief complaint of patient", "MPA, Problem List", "MPA, Independence of Patient", "MPA, Functional status of the patient", "MPA, Pain Assessment", "MPA, Summary neurological examination (sensation)", "MPA, Objective examination", "MPA, Functional examination", "MPA, Facial Disability Index", "MPA, Additional comments", "MPA, Followup Plan")
          }
          return conditions;
      },
    'MPA, Movement difficulty of facial muscles': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Movement difficulty of facial muscles'];
          if (conditionConcept == "Yes"){
              conditions.show.push("MPA, Describe difficulty of movement for facial muscles")
          }
          else {
              conditions.hide.push("MPA, Describe difficulty of movement for facial muscles")
         }
          return conditions;
      },

	'MPA, Movement difficulty of eyes': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Movement difficulty of eyes'];
          if (conditionConcept == "Yes"){
              conditions.show.push("MPA, Describe difficulty of movement for eyes")
          }
          else {
              conditions.hide.push("MPA, Describe difficulty of movement for eyes")
         }
          return conditions;
      },

	'MPA, Movement difficulty of mouth': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Movement difficulty of mouth'];
          if (conditionConcept == "Yes"){
              conditions.show.push("MPA, Describe difficulty of movement for mouth")
          }
          else {
              conditions.hide.push("MPA, Describe difficulty of movement for mouth")
         }
          return conditions;
      },

	'MPA, Movement difficulty of tongue': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Movement difficulty of tongue'];
          if (conditionConcept == "Yes"){
              conditions.show.push("MPA, Describe difficulty of movement for tongue")
          }
          else {
              conditions.hide.push("MPA, Describe difficulty of movement for tongue")
         }
          return conditions;
      },


      'LLA, Previous history of physiotherapy': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Previous history of physiotherapy'];
          if (conditionConcept == "Yes"){
              conditions.show.push("LLA, Details of previous physiotherapy")
          }
          else {
              conditions.hide.push("LLA, Details of previous physiotherapy")
         }
          return conditions;
      },

	'ULA, Previous history of physiotherapy': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Previous history of physiotherapy'];
          if (conditionConcept == "Yes"){
              conditions.show.push("ULA, Details of previous physiotherapy")
          }
          else {
              conditions.hide.push("ULA, Details of previous physiotherapy")
         }
          return conditions;
      },
	'MPA, Previous history of physiotherapy': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Previous history of physiotherapy'];
          if (conditionConcept == "Yes"){
              conditions.show.push("MPA, Details of previous physiotherapy")
          }
          else {
              conditions.hide.push("MPA, Details of previous physiotherapy")
         }
          return conditions;
      },
    'LLA, Does the patient use an assistive device or orthosis?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Does the patient use an assistive device or orthosis?'];
          if (conditionConcept == "Yes"){
              conditions.show.push("LLA, Type of assistive device or orthosis","LLA, Comments about assistive device or orthosis")
          }
          else {
              conditions.hide.push("LLA, Type of assistive device or orthosis","LLA, Comments about assistive device or orthosis")
         }
          return conditions;
      },
	'ULA, Does the patient use an assistive device or orthosis?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Does the patient use an assistive device or orthosis?'];
          if (conditionConcept == "Yes"){
              conditions.show.push("ULA, Type of assistive device or orthosis","ULA, Comments about assistive device or orthosis")
          }
          else {
              conditions.hide.push("ULA, Type of assistive device or orthosis","ULA, Comments about assistive device or orthosis")
         }
          return conditions;
      },
	'LLA, Type of assistive device or orthosis': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Type of assistive device or orthosis'];
	  if (conditionConcept.indexOf("Other")>=0){
	      conditions.show.push("LLA, Other type of assistive device")
          }
          else {
              conditions.hide.push("LLA, Other type of assistive device")
         }
          return conditions;
      },
	'ULA, Type of assistive device or orthosis': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Type of assistive device or orthosis'];
	  if (conditionConcept.indexOf("Other")>=0){
	      conditions.show.push("ULA, Other type of assistive device")
          }
          else {
           conditions.hide.push("ULA, Other type of assistive device")
         }
          return conditions;
      },
      'LLA, Amputee patient?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Amputee patient?'];
          if (conditionConcept =="Yes"){
              conditions.show.push("LLA, Level of amputation")
          }
          else {
              conditions.hide.push("LLA, Level of amputation")
         }
          return conditions;
      },
	'ULA, Amputee patient?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Amputee patient?'];
          if (conditionConcept =="Yes"){
              conditions.show.push("ULA, Level of amputation", "ULA, Type of amputation", "ULA, Is the patient using a prostheses?")
          }
          else {
              conditions.hide.push("ULA, Level of amputation")
         }
          return conditions;
      },
    'LLA, Type of amputation': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Type of amputation'];
          if (conditionConcept =="Other"){
              conditions.show.push("LLA, Other type of amputation")
          }
          else {
              conditions.hide.push("LLA, Other type of amputation")
         }
          return conditions;
      },
	'ULA, Type of amputation': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Type of amputation'];
          if (conditionConcept =="Other"){
              conditions.show.push("ULA, Other type of amputation")
          }
          else {
              conditions.hide.push("ULA, Other type of amputation")
         }
          return conditions;
      },
    'LLA, Is the patient using a prostheses?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Is the patient using a prostheses?'];
          if (conditionConcept =="Yes"){
              conditions.show.push("LLA, Comments about prostheses usage")
          }
          else {
              conditions.hide.push("LLA, Comments about prostheses usage")
         }
          return conditions;
      },
	'ULA, Is the patient using a prostheses?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Is the patient using a prostheses?'];
          if (conditionConcept =="Yes"){
              conditions.show.push("ULA, Comments about prostheses usage")
          }
          else {
              conditions.hide.push("ULA, Comments about prostheses usage")
         }
          return conditions;
      },

    'LLA, Pain Severity': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['LLA, Pain Severity'];
        if (conditionConcept >= 1){
            conditions.show.push("LLA, Side of pain","LLA, Site of pain","LLA, Type of pain","LLA, When does the pain occur")
        }
        else {
            conditions.hide.push("LLA, Side of pain","LLA, Site of pain","LLA, Site, Other","LLA, Type of pain","LLA, When does the pain occur")
        }
        return conditions;
    },
    'LLA, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['LLA, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("LLA, Site, Other")
        }
        else {
            conditions.hide.push("LLA, Site, Other")
        }
        return conditions;
    },

	'ULA, Pain Severity': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['ULA, Pain Severity'];
        if (conditionConcept >= 1){
            conditions.show.push("ULA, Side of pain","ULA, Site of pain","ULA, Type of pain","ULA, When does the pain occur")
        }
        else {
            conditions.hide.push("ULA, Side of pain","ULA, Site of pain","ULA, Type of pain","ULA, When does the pain occur")
        }
        return conditions;
    },
	'ULA, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['ULA, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("ULA, Site, Other")
        }
        else {
            conditions.hide.push("ULA, Site, Other")
        }
        return conditions;
    },
	'MPA, Pain Severity': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MPA, Pain Severity'];
        if (conditionConcept >= 1){
            conditions.show.push("MPA, Side of pain","MPA, Site of pain","MPA, Type of pain","MPA, When does the pain occur")
        }
        else {
            conditions.hide.push("MPA, Side of pain","MPA, Site of pain", "MPA, Type of pain","MPA, When does the pain occur")
        }
        return conditions;
    },
	'MPA, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MPA, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("MPA, Site, Other")
        }
        else {
            conditions.hide.push("MPA, Site, Other")
        }
        return conditions;
    },
	'LLA, Summary neurological examination (sensation)': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['LLA, Summary neurological examination (sensation)'];
        if (conditionConcept.indexOf("Hypo-sensation")>=0){
            conditions.show.push("LLA, Summary neurological examination (sensation), comments")
        }

        else if (conditionConcept.indexOf("Hyper-sensation")>=0){
             conditions.show.push("LLA, Summary neurological examination (sensation), comments")
        }

        else {
            conditions.hide.push("LLA, Summary neurological examination (sensation), comments")
        }
        return conditions;
        },
	'ULA, Summary neurological examination (sensation)': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['ULA, Summary neurological examination (sensation)'];
        if (conditionConcept.indexOf("Hypo-sensation")>=0){
            conditions.show.push("ULA, Summary neurological examination (sensation), comments")
        }

        else if (conditionConcept.indexOf("Hyper-sensation")>=0){
             conditions.show.push("ULA, Summary neurological examination (sensation), comments")
        }

        else {
            conditions.hide.push("ULA, Summary neurological examination (sensation), comments")
        }
        return conditions;
        },
    'MPA, Summary neurological examination (sensation)': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MPA, Summary neurological examination (sensation)'];
        if (conditionConcept.indexOf("Hypo-sensation")>=0){
            conditions.show.push("MPA, Summary neurological examination (sensation), comments")
        }

        else if (conditionConcept.indexOf("Hyper-sensation")>=0){
             conditions.show.push("MPA, Summary neurological examination (sensation), comments")
        }

        else {
            conditions.hide.push("MPA, Summary neurological examination (sensation), comments")
        }
        return conditions;
     },
    'LLA, Does the patient have a nerve injury?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Does the patient have a nerve injury?'];
          if (conditionConcept =="Yes"){
              conditions.show.push("LLA, Motor")
          }
          else {
              conditions.hide.push("LLA, Motor")
         }
          return conditions;
      },
	'ULA, Does the patient have a nerve injury?': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Does the patient have a nerve injury?'];
          if (conditionConcept =="Yes"){
              conditions.show.push("ULA, Motor")
          }
          else {
              conditions.hide.push("ULA, Motor")
         }
          return conditions;
      },
    'LLA, How old is the patient': function (formName, formFieldValues) {
           var conditions = {
               show: [],
               hide: []
           };
           var conditionConcept = formFieldValues['LLA, How old is the patient'];
           if (conditionConcept =="< 18 years"){
               conditions.show.push("LLA, Pediatric Lower Extremity Function(Mobility)")
               conditions.hide.push("LLA, Lower Extremity Functional Index (LEFI)")

           }
           else if (conditionConcept =="18+ years") {
               conditions.show.push("LLA, Lower Extremity Functional Index (LEFI)")
               conditions.hide.push("LLA, Pediatric Lower Extremity Function(Mobility)")
          }
          else {
               conditions.hide.push("LLA, Pediatric Lower Extremity Function(Mobility)","LLA, Lower Extremity Functional Index (LEFI)")
          }
           return conditions;
       },

	'ULA, How old is the patient': function (formName, formFieldValues) {
           var conditions = {
               show: [],
               hide: []
           };
           var conditionConcept = formFieldValues['ULA, How old is the patient'];
           if (conditionConcept =="< 18 years"){
               conditions.show.push("ULA, Pediatric Upper Extremity Function ( Fine Motor, ADL)")
               conditions.hide.push("ULA, (UEFI) Upper Extremity Functional Index")

           }
           else if (conditionConcept =="18+ years") {
               conditions.show.push("ULA, (UEFI) Upper Extremity Functional Index")
               conditions.hide.push("ULA, Pediatric Upper Extremity Function ( Fine Motor, ADL)")
          }
          else {
               conditions.hide.push("ULA, Pediatric Upper Extremity Function ( Fine Motor, ADL)","ULA, (UEFI) Upper Extremity Functional Index")
          }
           return conditions;
       },
	'ULA, Referral suggested': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['ULA, Referral suggested'];
          if (conditionConcept =="Yes"){
              conditions.show.push("ULA, Prosthetic and orthotic center","ULA, Physiotherapy center")
          }
          else {
              conditions.hide.push("ULA, Prosthetic and orthotic center","ULA, Physiotherapy center")
         }
          return conditions;
      },
	'MPA, Referral suggested': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MPA, Referral suggested'];
          if (conditionConcept =="Yes"){
              conditions.show.push("MPA, Referral suggested, comments")
          }
          else {
              conditions.hide.push("MPA, Referral suggested, comments")
         }
          return conditions;
      },
	'LLA, Referral suggested': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['LLA, Referral suggested'];
          if (conditionConcept =="Yes"){
              conditions.show.push("LLA, Prosthetic and orthotic center","LLA, Physiotherapy center")
          }
          else {
              conditions.hide.push("LLA, Prosthetic and orthotic center","LLA, Physiotherapy center")
         }
          return conditions;
      },
      'PNF, Type of pain experienced by the patient': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['PNF, Type of pain experienced by the patient'];
     if (conditionConcept) {

          if (conditionConcept.indexOf("Nociceptive")>=0){
              conditions.show.push("PNF, Nociceptive pain")
	  }
          else {
	      conditions.hide.push("PNF, Nociceptive pain")
	  }
          if (conditionConcept.indexOf("Neuropathic")>=0){
	      conditions.show.push("PNF, Questionnaire DN4")
	  }
	  else {
	      conditions.hide.push("PNF, Questionnaire DN4")
	  }
      }
          else {
               conditions.hide.push("PNF, Nociceptive pain", "PNF, Questionnaire DN4")
          }
          return conditions;
      },
      'PNF, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNF, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("PNF, Site of pain, other")
        }
        else {
            conditions.hide.push("PNF, Site of pain, other")
        }
        return conditions;
    },
    'PNF, Pain usually occurs with:': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNF, Pain usually occurs with:'];
	if (conditionConcept) {
	        if (conditionConcept.indexOf("Physiotherapy")>=0){
        	conditions.show.push("PNF, Comments about physiotherapy")
        	}
		else {
		conditions.hide.push("PNF, Comments about physiotherapy")
		}
        	if (conditionConcept.indexOf("Other")>=0){
            	conditions.show.push("PNF, Other times pain is occurring")
        	}
		else {
            	conditions.hide.push("PNF, Other times pain is occurring")
		}
        	if (conditionConcept.indexOf("Dressing change")>=0){
            	conditions.show.push("PNF, Dressing")
        	}
		else {
		conditions.hide.push("PNF, Dressing")
		}
	}
	else {
            conditions.hide.push("PNF, Comments about physiotherapy", "PNF, Dressing", "PNF, Other times pain is occurring")
        }
        return conditions;
    },
    'MDOF, Reason for visit': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MDOF, Reason for visit'];

  if (conditionConcept) {

	  if (conditionConcept.indexOf("Medication renewal")>=0){
              conditions.show.push("MDOF, Medication renewal, comments")
          }
          else {
              conditions.hide.push("MDOF, Medication renewal, comments")
          }
	  if (conditionConcept.indexOf("New complaint")>=0){
              conditions.show.push("MDOF, New complaint of patient")
	  }
          else {
              conditions.hide.push("MDOF, New complaint of patient")
          }
          if (conditionConcept.indexOf("Antibiotic Clinic")>=0){
             conditions.show.push("MDOF, Complaint of patient (ABx clinic)", "MDOF, Status of wound", "MDOF, Kidney function", "MDOF, Liver function", "MDOF, Plan", "MDOF, Consultation notes, ABx clinic")
	  }
	  else {
             conditions.hide.push("MDOF, Complaint of patient (ABx clinic)", "MDOF, Status of wound", "MDOF, Kidney function", "MDOF, Liver function", "MDOF, Plan", "MDOF, Consultation notes, ABx clinic")
          }
          if (conditionConcept.indexOf("TRM visit")>=0){
             conditions.show.push("MDOF, Medical course of patient in RSP", "MDOF, Condition of patient at discharge (TRM)", "MDOF, Discharge medication", "MDOF, Medical follow-up needs")
	  }
	  else {
             conditions.hide.push("MDOF, Medical course of patient in RSP", "MDOF, Condition of patient at discharge (TRM)", "MDOF, Discharge medication", "MDOF, Medical follow-up needs")
          }
	  if (conditionConcept.indexOf("Other")>=0){
             conditions.show.push("MDOF, Reason for visit, other")
	  }
          else {
             conditions.hide.push("MDOF, Reason for visit, other")
          }
  }
  else {
             conditions.hide.push("MDOF, Medication renewal, comments", "MDOF, New complaint of patient", "MDOF, Complaint of patient (ABx clinic)", "MDOF, Status of wound", "MDOF, Kidney function", "MDOF, Liver function", "MDOF, Plan", "MDOF, Consultation notes, ABx clinic", "MDOF, Medical course of patient in RSP", "MDOF, Condition of patient at discharge (TRM)", "MDOF, Discharge medication", "MDOF, Medical follow-up needs", "MDOF, Reason for visit, other")
          }
          return conditions;
      },
      'MDOF, New complaint of patient': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['MDOF, New complaint of patient'];

  if (conditionConcept) {

	  if (conditionConcept.indexOf("Pain")>=0){
              conditions.show.push("MDOF, Comments about pain")
          }
          else {
              conditions.hide.push("MDOF, Comments about pain")
          }
	  if (conditionConcept.indexOf("Medical Complaint")>=0){
              conditions.show.push("MDOF, Comments about patient's medical complaints")
	  }
          else {
              conditions.hide.push("MDOF, Comments about patient's medical complaints")
          }
  }
  else {
       conditions.hide.push("MDOF, Comments about pain", "MDOF, Comments about patient's medical complaints")
}
          return conditions;
      },
      'MDOF, Plan': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MDOF, Plan'];
        if (conditionConcept == "Other"){
            conditions.show.push("MDOF, Plan, other")
        }
        else {
            conditions.hide.push("MDOF, Plan, other")
        }
        return conditions;
    },
    'MDOF, Condition of patient at discharge (TRM)': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MDOF, Condition of patient at discharge (TRM)'];
        if (conditionConcept == "Other"){
            conditions.show.push("MDOF, Condition at discharge, other")
        }
        else {
            conditions.hide.push("MDOF, Condition at discharge, other")
        }
        return conditions;
    },
    'MDOF, Discharge medication': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MDOF, Discharge medication'];
        if (conditionConcept == "Yes"){
            conditions.show.push("MDOF, Discharge medication section")
        }
        else {
            conditions.hide.push("MDOF, Discharge medication section")
        }
        return conditions;
    },
    'Microbiology, Growth': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['Microbiology, Growth'];
          if (conditionConcept =="Growth"){
              conditions.show.push("Microbiology, Comments","Microbiology, Type of identification")
          }
          else if (conditionConcept =="No Growth"){
             conditions.show.push("Microbiology, Comments")
             conditions.hide.push("Microbiology, Type of identification")
          }
          else {
              conditions.hide.push("Microbiology, Comments","Microbiology, Type of identification")
         }
          return conditions;
      },
	'Microbiology, Type of identification': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['Microbiology, Type of identification'];
          if (conditionConcept =="Answer, Intermediate Identification"){
              conditions.show.push("Microbiology, Intermediate Identification","Microbiology, Comments for Intermediate Identification")
              conditions.hide.push("Bacteriology, Final Identification")
          }
          else if(conditionConcept =="Answer, Final Identification") {
               conditions.show.push("Bacteriology, Final Identification")
               conditions.hide.push("Microbiology, Intermediate Identification","Microbiology, Comments for Intermediate Identification")
          }
          else {
              conditions.hide.push("Bacteriology, Final Identification","Microbiology, Intermediate Identification","Microbiology, Comments for Intermediate Identification")
          }
          return conditions;
      },
	'Microbiology, Final Identification': function (formName, formFieldValues) {
          var conditions = {
              show: [],
              hide: []
          };
          var conditionConcept = formFieldValues['Microbiology, Final Identification'];
          if (conditionConcept == "Pseudomonas aeruginosa") {
              conditions.show.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
              conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
              conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
              conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
              conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
              conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
              conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
              conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
              conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
              conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
              conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
              conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
              conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
              conditions.show.push("Microbiology, Are there any alerts?")
              conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

          }
          else if (conditionConcept == "Staphylococcus aureus ss. aureus"){
               conditions.show.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
               conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
               conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
               conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
               conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
               conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
               conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
               conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
               conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
               conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
               conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
               conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
               conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
               conditions.show.push("Microbiology, Are there any alerts?")
               conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

          }
           else if (conditionConcept == "Streptococcus, beta-haem. Group A" || conditionConcept =="Streptococcus, beta-haem. Group B"){
                conditions.show.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept =="Enterococcus avium" || conditionConcept == "Enterococcus faecalis" || conditionConcept == "Enterococcus faecium" || conditionConcept == "Enterococcus sp."){
                conditions.show.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept == "Streptococcus pneumoniae"){
                conditions.show.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept == "Streptococcus viridans, alpha-hem"){
                conditions.show.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept == "Citrobacter freundii" || conditionConcept =="Enterobacter aerogenes" || conditionConcept =="Enterobacter cloacae" || conditionConcept =="Escherichia coli" || conditionConcept == "Escherichia coli O157:H7" || conditionConcept == "Klebsiella pneumoniae ss. pneumoniae" || conditionConcept =="Morganella morganii ss. morganii" || conditionConcept =="Proteus mirabilis" || conditionConcept =="Salmonella enteritidis" || conditionConcept =="Salmonella sp." || conditionConcept =="Salmonella typhi" || conditionConcept =="Salmonella typhimurium" || conditionConcept == "Serratia marcescens" || conditionConcept =="Shigella boydii" || conditionConcept =="Shigella boydii serotype 1"){
                conditions.show.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept =="Neisseria meningitidis") {
                conditions.show.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept =="Haemophilus influenzae" || conditionConcept =="Haemophilus influenzae (non type b)" || conditionConcept =="Haemophilus influenzae (type b)"){
                conditions.show.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept =="Listeria monocytogenes"){
                conditions.show.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept =="Staphylococcus epidermidis" || conditionConcept =="Staphylococcus saprophyticus ss. saprophyticus"  ){
                conditions.show.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept == "Staphylococcus, coagulase negative"){
                conditions.show.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?","Microbiology, Latex Agglutination")
                conditions.hide.push("Microbiology, Comments")

           }
           else if (conditionConcept =="Acinetobacter baumannii"){
                conditions.show.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept =="Corynebacterium sp. (diphtheroids)"){
                conditions.show.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")

           }
           else if (conditionConcept == "Bacteroides fragilis" || conditionConcept == "Burkholderia cepacia" || conditionConcept == "Campylobacter coli" || conditionConcept == "Campylobacter jejuni ss. jejuni" || conditionConcept == "Candida albicans" || conditionConcept == "Cytomegalovirus" || conditionConcept == "Epstein-Barr virus" || conditionConcept == "Hepatitis A virus" || conditionConcept == "Hepatitis B virus" || conditionConcept == "Hepatitis C virus" || conditionConcept == "Herpes simplex virus" || conditionConcept == "Herpes simplex virus 1" || conditionConcept == "Herpes simplex virus 2" || conditionConcept == "Human herpesvirus" || conditionConcept == "Human papillomavirus" || conditionConcept == "Influenza A virus" || conditionConcept == "Influenza B virus" || conditionConcept == "Mixed bacterial species present" || conditionConcept == "Moraxella (Branh.) catarrhalis" || conditionConcept == "Mycobacterium avium-intracellulare complex" || conditionConcept == "Mycobacterium tuberculosis" || conditionConcept == "Neisseria gonorrhoeae" || conditionConcept == "Normal flora" || conditionConcept == "Oral flora" || conditionConcept == "Respiratory syncytial virus" || conditionConcept == "Stenotrophomonas maltophilia" || conditionConcept == "Vibrio cholerae" ) {
                conditions.show.push("Microbiology, Comments")
                conditions.show.push("Microbiology, Are there any alerts?")
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.hide.push("Microbiology, Latex Agglutination")
           }
          else {
                conditions.hide.push("PS, Piperacillin","PS, Ticarcillin","PS, Aztreonam","PS, Tobramycine","PS, Amikacin","PS, Ticar-clav ac","PS, Cefepime","PS, Imipenem","PS, Ceftazidime","PS, Gentamicine","PS, Ciprofloxacin","PS, Meropenem")
                conditions.hide.push("SA, Penicillin","SA, Penicillin sensitive zone:","SA, Cefoxitin","SA, PBP2a (20 to 25):","SA, Ciprofloxacin","SA, Norfloxacin","SA, Amikacin","SA, Gentamicin","SA, Tobramycin","SA, Erythromycin","SA, Clindamycin","SA, D-zone:","SA, Chloramphenicol","SA, Trimeth-Sulfa","SA, Fusidic acid","SA, Rifampicin","SA, Vanc MIC")
                conditions.hide.push("SS, Penicillin","SS, Chloramphenicol","SS, Erythromycin","SS, Clindamycin","SS, D-zone:","SS, Norfloxacin","SS, Tetracycline")
                conditions.hide.push("ES, Ampicillin","ES, Gentamicin","ES, Vancomycin")
                conditions.hide.push("SP, Oxacillin","SP, Trimeth-Sulfa","SP, Chloramphenicol","SP, Erythromycin","SP, Tetracycline","SP, Norfloxacin")
                conditions.hide.push("SV, Penicillin","SV, Ampicillin","SV, Erythromycin","SV, Clindamycin","SV, D-zone:","SV, Vancomycin","SV, Ceftriaxone")
                conditions.hide.push("EB, Ampicillin","EB, Amikacin","EB, amoxicillin-clav ac","EB, Aztreonam","EB, Cefotaxime","EB, Cefoxitin","EB, Ciprofloxacin","EB, Gentamicin","EB, Ticarcillin","EB, Tobramycin","EB, Trimeto-sulfamet","EB, Cefepime","EB, Ertapenem","EB, Pip-tazobactam","EB, Ceftriaxone","EB, Ceftazidime","EB, ESBL screening:","EB, Meropenem","EB, Imipenem")
                conditions.hide.push("NM, Penicillin G","NM, Ampicillin","NM, Ceftriaxone","NM, Ciprofloxacin","NM, Beta-Lactamase test performed")
                conditions.hide.push("HI, Penicillin","HI, Augmentin","HI, Ampicillin","HI, Trimeth-Sulfa","HI, Chloramphenicol","HI, Nalidixic acid")
                conditions.hide.push("LM, Penicillin","LM, Trimeth-Sulfa","LM, Erythromycin","LM, Ampicillin")
                conditions.hide.push("CNS, Cefoxitin","CNS, Ciprofloxacin","CNS, Norfloxacin","CNS, Amikacin","CNS, Gentamicin","CNS, Tobramycin","CNS, Erythromycin","CNS, Clindamycin","CNS, D-zone:","CNS, Chloramphenicol","CNS, Trimeth-Sulfa","CNS, Fusidic acid","CNS, Rifampicin","CNS, Vancomycin MIC")
                conditions.hide.push("AS, Imipenem","AS, Meropenem","AS, Ciprofloxacin","AS, Amikacin","AS, Gentamicin","AS, Tobramycin")
                conditions.hide.push("CS, Penicillin","CS, Ciprofloxacin","CS, Gentamicin","CS, Vancomycin","CS, Clindamycin","CS, Tetracycine","CS, Rifampicin")
                conditions.hide.push("Microbiology, Are there any alerts?")
                conditions.hide.push("Microbiology, Comments","Microbiology, Latex Agglutination")
          }
          return conditions;
      },
      'Microbiology, Are there any alerts?': function (formName, formFieldValues) {
           var conditions = {
               show: [],
               hide: []
           };
           var conditionConcept = formFieldValues['Microbiology, Are there any alerts?'];
           if (conditionConcept =="Yes"){
               conditions.show.push("Microbiology, Alerts Set")
           }
           else {
               conditions.hide.push("Microbiology, Alerts Set")
          }
           return conditions;
       },
      'NM, Beta-Lactamase test performed': function (formName, formFieldValues) {
           var conditions = {
               show: [],
               hide: []
           };
           var conditionConcept = formFieldValues['NM, Beta-Lactamase test performed'];
           if (conditionConcept =="Yes"){
               conditions.show.push("NM, Beta-Lactamase test Result")
           }
           else {
               conditions.hide.push("NM, Beta-Lactamase test Result")
          }
           return conditions;
       },
    'OS, Pain Severity': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OS, Pain Severity'];
        if (conditionConcept >= 1){
            conditions.show.push("OS, Side of pain","OS, Site of pain","OS, Type of pain","OS, When does the pain occur")
        }
        else {
            conditions.hide.push("OS, Side of pain","OS, Site of pain","OS, Type of pain","OS, When does the pain occur")
        }
        return conditions;
    },
      'OS, Site of pain': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OS, Site of pain'];
        if (conditionConcept.indexOf("Site, Other")>=0){
            conditions.show.push("OS, Site of pain, other")
        }
        else {
            conditions.hide.push("OS, Site of pain, other")
        }
        return conditions;
    },
 	'OS, Does the patient have a drain?': function (formName, formFieldValues) {
           var conditions = {
               show: [],
               hide: []
           };
           var conditionConcept = formFieldValues['OS, Does the patient have a drain?'];
           if (conditionConcept =="Yes"){
               conditions.show.push("OS, Drainage Set")
           }
           else {
               conditions.hide.push("OS, Drainage Set")
          }
           return conditions;
    },
    'MD, Severity of Covid-19 case': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['MD, Severity of Covid-19 case'];
        if (conditionConcept){
            conditions.show.push("MD, Date of first positive PCR test")
        }
        else {
            conditions.hide.push("MD, Date of first positive PCR test")
        }
        return conditions;
    },
    'NP, Type of assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['NP, Type of assessment'];
        if (conditionConcept == "Follow-up") {
            conditions.hide.push("NP, Functional score", "NP, Initial Assessment", "NP, Discharge", "NP, Network physio treatment goals");
        }
        else if (conditionConcept == "Discharge") {
            conditions.hide.push("NP, Initial Assessment", "NP, Network physio treatment goals");
            conditions.show.push("NP, Functional score", "NP, Discharge");
            var conditionConcept = formFieldValues['NP, Discharge reason, network physio'];
            if (conditionConcept == "Other") {
                conditions.show.push("NP, Other discharge reason, network physio");
            }
            else {
                conditions.hide.push("NP, Other discharge reason, network physio");
            }
        }
        else if (conditionConcept == "Initial") {
            conditions.hide.push("NP, Discharge");
            conditions.show.push("NP, Functional score", "NP, Initial Assessment", "NP, Network physio treatment goals");
            var conditionConcept = formFieldValues['NP, Special case'];
            if (conditionConcept) {
                conditions.show.push("NP, Notes about network physio special cases");
                if (conditionConcept == "Other") {
                    conditions.show.push("NP, Special case, other");
                }
            }
            else {
                conditions.hide.push("NP, Notes about network physio special cases");
                conditions.hide.push("NP, Special case, other");
            }
        }
        else {
            conditions.hide.push("NP, Functional score", "NP, Initial Assessment", "NP, Discharge", "NP, Network physio treatment goals");
        }
        return conditions;
    },
    'NP, Special case': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['NP, Special case'];
        if (conditionConcept) {
            conditions.show.push("NP, Notes about network physio special cases");
            if (conditionConcept == "Other") {
                conditions.show.push("NP, Special case, other");
            }
        }
        else {
            conditions.hide.push("NP, Notes about network physio special cases");
            conditions.hide.push("NP, Special case, other");
        }
        return conditions;
    },
    'NP, Was the patient refered by network physio to other MSF or non-MSF project?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['NP, Was the patient refered by network physio to other MSF or non-MSF project?'];
        if (conditionConcept == "Yes to other MSF project" || conditionConcept == "Yes to non-MSF project") {
            conditions.show.push("NP, Referred by network physio to");
        }
        else {
            conditions.hide.push("NP, Referred by network physio to");
        }
        return conditions;
    },
    'NP, Discharge reason, network physio': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['NP, Discharge reason, network physio'];
        if (conditionConcept == "Other") {
            conditions.show.push("NP, Other discharge reason, network physio");
        }
        else {
            conditions.hide.push("NP, Other discharge reason, network physio");
        }
        return conditions;
    },
    'NP, Physiotherapy prescription': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['NP, Physiotherapy prescription'];
        if (conditionConcept && conditionConcept.indexOf("Other") >=0) {
            conditions.show.push("NP, Other physiotherapy prescription");
        }
        else {
            conditions.hide.push("NP, Other physiotherapy prescription");
        }
        return conditions;
    },
    'PSA, Type of assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PSA, Type of assessment'];
        if (conditionConcept == "Initial") {
            conditions.hide.push("PSA, Type of activity", "PSA, Improvement / outcomes (CGI-I scale)", "PSA, General comment about session", "PSA, Discharge Assessment");
            conditions.show.push("PSA, General information", "PSA, Clinical assessment", "PSA, Screening tool", "PSA, Findings");
            var conditionConcept = formFieldValues['PSA, Does the patient need a follow-up?'];
            if (conditionConcept == "Yes") {
                conditions.show.push("PSA, Referral to");
            }
            else {
                conditions.hide.push("PSA, Referral to");

            }
        }
        else if (conditionConcept == "Follow-up") {
            conditions.hide.push("PSA, General information", "PSA, Screening tool", "PSA, Findings", "PSA, Discharge Assessment");
            conditions.show.push("PSA, Type of activity", "PSA, Clinical assessment");
        }
        else if (conditionConcept == "Discharge") {
            conditions.hide.push("PSA, Type of activity", "PSA, General information", "PSA, Findings");
            conditions.show.push("PSA, Clinical assessment", "PSA, Screening tool", "PSA, Discharge Assessment");
        }
        else {
            conditions.hide.push("PSA, Type of activity", "PSA, General information", "PSA, Clinical assessment", "PSA, Screening tool", "PSA, Findings", "PSA, Discharge Assessment");
        }
        return conditions;
    },
    'PA, Type of assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PA, Type of assessment'];
        if (conditionConcept == "Follow-up") {
            conditions.show.push("PA, Type of activity", "PA, Severity of symptoms (CGI-S scale)","PA, General comment about session", "PA, Improvement / outcomes (CGI-I scale)","PA, Syndrome","PA, Secondary Syndrome","PA, Summary of MSE (mental state examination)","PA, Treatment plan");
            conditions.hide.push("PA, PHQ9", "PA, GAD 7", "PA, Comment on the screening tool","PA, Does the patient need a follow-up?");
        }
        else if (conditionConcept == "Discharge") {
            conditions.show.push("PA, Severity of symptoms (CGI-S scale)","PA, Improvement / outcomes (CGI-I scale)","PA, PHQ9","PA, GAD 7","PA, Comment on the screening tool","PA, Syndrome","PA, Secondary Syndrome","PA, Summary of MSE (mental state examination)","PA, Treatment plan");
            conditions.hide.push("PA, Type of activity","PA, General comment about session","PA, Does the patient need a follow-up?");
        }
        else if (conditionConcept == "Initial") {
            conditions.show.push("PA, Severity of symptoms (CGI-S scale)","PA, PHQ9", "PA, GAD 7","PA, Comment on the screening tool","PA, Does the patient need a follow-up?","PA, Syndrome","PA, Secondary Syndrome","PA, Summary of MSE (mental state examination)","PA, Treatment plan");
            conditions.hide.push("PA, Type of activity","PA, Improvement / outcomes (CGI-I scale)", "PA, General comment about session");
        }
        else {
            conditions.hide.push("PA, Type of activity","PA, Severity of symptoms (CGI-S scale)","PA, Improvement / outcomes (CGI-I scale)","PA, General comment about session","PA, PHQ9","PA, GAD 7","PA, Comment on the screening tool","PA, Syndrome","PA, Secondary Syndrome","PA, Does the patient need a follow-up?","PA, Summary of MSE (mental state examination)","PA, Treatment plan");

        }
        return conditions;
    },
    'PSA, Does the patient need a follow-up?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PSA, Does the patient need a follow-up?'];
        if (conditionConcept == "Yes") {
            conditions.show.push("PSA, Referral to");
        }
        else {
            conditions.hide.push("PSA, Referral to");
        }
        return conditions;
    },
    'PNA, Type of assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Type of assessment'];
        if (conditionConcept == "Initial") {
            conditions.show.push("PNA, Medical history", "PNA, Review of systems and physical examination");
            if (formFieldValues['PNA, Currently taking medication'] == "Yes") {
                conditions.show.push("PNA, Type of medication");
            }
            else {
                conditions.hide.push("PNA, Type of medication");
            }
        }
        else {
            conditions.hide.push("PNA, Medical history", "PNA, Review of systems and physical examination");
        }
        if (conditionConcept == "Ward follow-up") {
            conditions.show.push("PNA, PICC line", "PNA, Peripheral line");
            if (formFieldValues['PNA, Does the patient have a peripheral line?'] == "Yes") {
                conditions.show.push(
                    "PNA, Comments, peripheral line",
                    "PNA, Date of removal, peripheral line",
                    "PNA, Date of insertion, peripheral line",
                    "PNA, Site of peripheral line"
                );
            }
            else {
                conditions.hide.push(
                    "PNA, Comments, peripheral line",
                    "PNA, Date of removal, peripheral line",
                    "PNA, Date of insertion, peripheral line",
                    "PNA, Site of peripheral line"
                );
            }
            if (formFieldValues['PNA, Does the patient have a PICC line?'] == "Yes") {
                conditions.show.push(
                    "PNA, Date of insertion, PICC line",
                    "PNA, Date of dressing",
                    "PNA, Comments, dressing PICC line",
                    "PNA, Date of removal, PICC line"
                );
            }
            else {
                conditions.hide.push(
                    "PNA, Date of insertion, PICC line",
                    "PNA, Date of dressing",
                    "PNA, Comments, dressing PICC line",
                    "PNA, Date of removal, PICC line"
                );
            }
        }
        else {
            conditions.hide.push("PNA, PICC line", "PNA, Peripheral line");
        }
        if (["Initial", "OPD follow-up", "Ward follow-up"].includes(conditionConcept)) {
            conditions.show.push("PNA, Pain assessment");
            if (formFieldValues['PNA, Pain severity'] >1 ) {
                conditions.show.push("PNA, Type of pain","PNA, Site of pain","PNA, Side of pain");
            }
            else {
                conditions.hide.push("PNA, Type of pain","PNA, Site of pain","PNA, Side of pain");
            }
        }
        else {
            conditions.hide.push("PNA, Pain assessment");
        }
        if (["OPD follow-up", "Ward follow-up"].includes(conditionConcept)) {
            conditions.show.push("PNA, Tissue expander");
            if (formFieldValues['PNA, Does the patient have a tissue expander?'] == "Yes") {
                conditions.show.push(
                    "PNA, Site of tissue expander",
                    "PNA, Quantity injected",
                    "PNA, Quantity withdrawn",
                    "PNA, Total volume in tissue expander",
                    "PNA, Condition of tissue expander"
                );
            }
            else {
                conditions.hide.push(
                    "PNA, Site of tissue expander",
                    "PNA, Quantity injected",
                    "PNA, Quantity withdrawn",
                    "PNA, Total volume in tissue expander",
                    "PNA, Condition of tissue expander"
                );
            }
        }
        else {
            conditions.hide.push("PNA, Tissue expander");
        }
        return conditions;
    },
    'PNA, Currently taking medication': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Currently taking medication'];
        if (conditionConcept == "Yes") {
            conditions.show.push("PNA, Type of medication");
        }
        else {
            conditions.hide.push("PNA, Type of medication");
        }
        return conditions;
    },
    'PNA, Pain severity': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Pain severity'];
        if (conditionConcept >1 ) {
            conditions.show.push("PNA, Type of pain","PNA, Site of pain","PNA, Side of pain");
        }
        else {
            conditions.hide.push("PNA, Type of pain","PNA, Site of pain","PNA, Side of pain");
        }
        return conditions;
    },
    'PNA, Does the patient have a dressing?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Does the patient have a dressing?'];
        if (conditionConcept == "Yes" ) {
            conditions.show.push("PNA, Dressing");
            if (formFieldValues['PNA, Description of wound']) {
                conditions.show.push("PNA, Description of wound, other");
            }
            else {
                conditions.hide.push("PNA, Description of wound, other");
            }
        }
        else {
            conditions.hide.push("PNA, Dressing");
        }
        return conditions;
    },
    'PNA, Description of wound': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Description of wound'];
        if (conditionConcept == "Other") {
            conditions.show.push("PNA, Description of wound, other");
        }
        else {
            conditions.hide.push("PNA, Description of wound, other");
        }
        return conditions;
    },
    'PNA, Does the patient have a peripheral line?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Does the patient have a peripheral line?'];
        if (conditionConcept == "Yes") {
            conditions.show.push(
                "PNA, Comments, peripheral line",
                "PNA, Date of removal, peripheral line",
                "PNA, Date of insertion, peripheral line",
                "PNA, Site of peripheral line"
            );
        }
        else {
            conditions.hide.push(
                "PNA, Comments, peripheral line",
                "PNA, Date of removal, peripheral line",
                "PNA, Date of insertion, peripheral line",
                "PNA, Site of peripheral line"
            );
        }
        return conditions;
    },
    'PNA, Does the patient have a PICC line?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Does the patient have a PICC line?'];
        if (conditionConcept == "Yes") {
            conditions.show.push(
                "PNA, Date of insertion, PICC line",
                "PNA, Date of dressing",
                "PNA, Comments, dressing PICC line",
                "PNA, Date of removal, PICC line"
            );
        }
        else {
            conditions.hide.push(
                "PNA, Date of insertion, PICC line",
                "PNA, Date of dressing",
                "PNA, Comments, dressing PICC line",
                "PNA, Date of removal, PICC line"
            );
        }
        return conditions;
    },
    'PNA, Does the patient have a tissue expander?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Does the patient have a tissue expander?'];
        if (conditionConcept == "Yes") {
            conditions.show.push(
                "PNA, Site of tissue expander",
                "PNA, Quantity injected",
                "PNA, Quantity withdrawn",
                "PNA, Total volume in tissue expander",
                "PNA, Condition of tissue expander"
            );
        }
        else {
            conditions.hide.push(
                "PNA, Site of tissue expander",
                "PNA, Quantity injected",
                "PNA, Quantity withdrawn",
                "PNA, Total volume in tissue expander",
                "PNA, Condition of tissue expander"
            );
        }
        return conditions;
    },
    'PNA, Does the patient have a Foley catheter?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Does the patient have a Foley catheter?'];
        if (conditionConcept == "Yes") {
            conditions.show.push("PNA, Comments on Foley catheter");
        }
        else {
            conditions.hide.push("PNA, Comments on Foley catheter");
        }
        return conditions;
    },
    'PNA, Blood sugar': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Blood sugar'];
        if (conditionConcept == "Yes") {
            conditions.show.push( "PNA, Diabetes monitoring" );
                if (formFieldValues['PNA, Insulin given'] == "Yes") {
                    conditions.show.push("PNA, How much insulin given?");
                }
                else {
                    conditions.hide.push("PNA, How much insulin given?");
                }
        }
        else {
            conditions.hide.push( "PNA, Diabetes monitoring" );
        }
        return conditions;
    },
    'PNA, Insulin given': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PNA, Insulin given'];
        if (conditionConcept == "Yes") {
            conditions.show.push("PNA, How much insulin given?");
        }
        else {
            conditions.hide.push("PNA, How much insulin given?");
        }
        return conditions;
    },
    'OTA, Type of assessment': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OTA, Type of assessment'];
        if (conditionConcept == "Initial") {
            conditions.show.push("OTA, Initial assessment");
            conditions.show.push("OTA, Sollermann test");
            conditions.show.push("OTA, Assessment scores");
            conditions.hide.push("OTA, Follow-up");
            conditions.hide.push("OTA, Discharge");
            if (formFieldValues['OTA, Sollermann test administered'] == "Yes") {
                conditions.show.push("OTA, Put key into Yale lock, turn 90 degrees");
                conditions.show.push("OTA, Pick up coins up from flat surface, put into purses mounted on wall");
                conditions.show.push("OTA, Pick up coins from purses");
                conditions.show.push("OTA, Lift telephone receiver, put to ear");
                conditions.show.push("OTA, Turn door-handle 30 degrees");
                conditions.show.push("OTA, Lift wooden cubes over edge 5 cm in height");
                conditions.show.push("OTA, Lift iron over edge 5 cm in height");
                conditions.show.push("OTA, Turn screw with screwdriver");
                conditions.show.push("OTA, Pick up nuts");
                conditions.show.push("OTA, Open/close zip");
                conditions.show.push("OTA, Put on tub grip stocking on the other hand");
                conditions.show.push("OTA, Write with pen");
                conditions.show.push("OTA, Do up buttons");
                conditions.show.push("OTA, Unscrew lid of jars");
                conditions.show.push("OTA, Put paper-clip on envelope");
                conditions.show.push("OTA, Cut play-doh with knife and fork");
                conditions.show.push("OTA, Fold paper, put into envelope");
                conditions.show.push("OTA, Pour water from pure-pak");
                conditions.show.push("OTA, Pour water from jug");
                conditions.show.push("OTA, Pour water from cup");
                conditions.show.push("OTA, Sollermann test total score");
            }
            else {
                conditions.hide.push("OTA, Put key into Yale lock, turn 90 degrees");
                conditions.hide.push("OTA, Pick up coins up from flat surface, put into purses mounted on wall");
                conditions.hide.push("OTA, Pick up coins from purses");
                conditions.hide.push("OTA, Lift telephone receiver, put to ear");
                conditions.hide.push("OTA, Turn door-handle 30 degrees");
                conditions.hide.push("OTA, Lift wooden cubes over edge 5 cm in height");
                conditions.hide.push("OTA, Lift iron over edge 5 cm in height");
                conditions.hide.push("OTA, Turn screw with screwdriver");
                conditions.hide.push("OTA, Pick up nuts");
                conditions.hide.push("OTA, Open/close zip");
                conditions.hide.push("OTA, Put on tub grip stocking on the other hand");
                conditions.hide.push("OTA, Write with pen");
                conditions.hide.push("OTA, Do up buttons");
                conditions.hide.push("OTA, Unscrew lid of jars");
                conditions.hide.push("OTA, Put paper-clip on envelope");
                conditions.hide.push("OTA, Cut play-doh with knife and fork");
                conditions.hide.push("OTA, Fold paper, put into envelope");
                conditions.hide.push("OTA, Pour water from pure-pak");
                conditions.hide.push("OTA, Pour water from jug");
                conditions.hide.push("OTA, Pour water from cup");
                conditions.hide.push("OTA, Sollermann test total score");
            }
        }
        else if (conditionConcept == "Follow-up"){
            conditions.show.push("OTA, Follow-up");
            conditions.hide.push("OTA, Initial assessment");
            conditions.hide.push("OTA, Sollermann test");
            conditions.hide.push("OTA, Assessment scores");
            conditions.hide.push("OTA, Discharge");
        }
        else if (conditionConcept == "Discharge"){
            conditions.show.push("OTA, Sollermann test");
            conditions.show.push("OTA, Assessment scores");
            conditions.show.push("OTA, Discharge");
            conditions.hide.push("OTA, Initial assessment");
            conditions.hide.push("OTA, Follow-up");
            if (formFieldValues['OTA, Sollermann test administered'] == "Yes") {
                conditions.show.push("OTA, Put key into Yale lock, turn 90 degrees");
                conditions.show.push("OTA, Pick up coins up from flat surface, put into purses mounted on wall");
                conditions.show.push("OTA, Pick up coins from purses");
                conditions.show.push("OTA, Lift telephone receiver, put to ear");
                conditions.show.push("OTA, Turn door-handle 30 degrees");
                conditions.show.push("OTA, Lift wooden cubes over edge 5 cm in height");
                conditions.show.push("OTA, Lift iron over edge 5 cm in height");
                conditions.show.push("OTA, Turn screw with screwdriver");
                conditions.show.push("OTA, Pick up nuts");
                conditions.show.push("OTA, Open/close zip");
                conditions.show.push("OTA, Put on tub grip stocking on the other hand");
                conditions.show.push("OTA, Write with pen");
                conditions.show.push("OTA, Do up buttons");
                conditions.show.push("OTA, Unscrew lid of jars");
                conditions.show.push("OTA, Put paper-clip on envelope");
                conditions.show.push("OTA, Cut play-doh with knife and fork");
                conditions.show.push("OTA, Fold paper, put into envelope");
                conditions.show.push("OTA, Pour water from pure-pak");
                conditions.show.push("OTA, Pour water from jug");
                conditions.show.push("OTA, Pour water from cup");
                conditions.show.push("OTA, Sollermann test total score");
            }
            else {
                conditions.hide.push("OTA, Put key into Yale lock, turn 90 degrees");
                conditions.hide.push("OTA, Pick up coins up from flat surface, put into purses mounted on wall");
                conditions.hide.push("OTA, Pick up coins from purses");
                conditions.hide.push("OTA, Lift telephone receiver, put to ear");
                conditions.hide.push("OTA, Turn door-handle 30 degrees");
                conditions.hide.push("OTA, Lift wooden cubes over edge 5 cm in height");
                conditions.hide.push("OTA, Lift iron over edge 5 cm in height");
                conditions.hide.push("OTA, Turn screw with screwdriver");
                conditions.hide.push("OTA, Pick up nuts");
                conditions.hide.push("OTA, Open/close zip");
                conditions.hide.push("OTA, Put on tub grip stocking on the other hand");
                conditions.hide.push("OTA, Write with pen");
                conditions.hide.push("OTA, Do up buttons");
                conditions.hide.push("OTA, Unscrew lid of jars");
                conditions.hide.push("OTA, Put paper-clip on envelope");
                conditions.hide.push("OTA, Cut play-doh with knife and fork");
                conditions.hide.push("OTA, Fold paper, put into envelope");
                conditions.hide.push("OTA, Pour water from pure-pak");
                conditions.hide.push("OTA, Pour water from jug");
                conditions.hide.push("OTA, Pour water from cup");
                conditions.hide.push("OTA, Sollermann test total score");
            }
            if (formFieldValues['OTA, Did the patient receive a written home program?'] == "Yes") {
                conditions.show.push("OTA, Written home program");
            }
            else {
                conditions.hide.push("OTA, Written home program");
            }
            if (formFieldValues['OTA, Did the patient/family receive an occupational therapy education?'] == "Yes") {
                conditions.show.push("OTA, Patient/family occupational therapy education");
            }
            else {
                conditions.hide.push("OTA, Patient/family occupational therapy education");
            }
        }
        else {
            conditions.hide.push("OTA, Initial assessment");
            conditions.hide.push("OTA, Sollermann test");
            conditions.hide.push("OTA, Assessment scores");
            conditions.hide.push("OTA, Follow-up");
            conditions.hide.push("OTA, Discharge");
        }
        return conditions;
    },
    'OTA, Sollermann test administered': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OTA, Sollermann test administered'];
        if (conditionConcept == "Yes") {
            conditions.show.push("OTA, Put key into Yale lock, turn 90 degrees");
            conditions.show.push("OTA, Pick up coins up from flat surface, put into purses mounted on wall");
            conditions.show.push("OTA, Pick up coins from purses");
            conditions.show.push("OTA, Lift telephone receiver, put to ear");
            conditions.show.push("OTA, Turn door-handle 30 degrees");
            conditions.show.push("OTA, Lift wooden cubes over edge 5 cm in height");
            conditions.show.push("OTA, Lift iron over edge 5 cm in height");
            conditions.show.push("OTA, Turn screw with screwdriver");
            conditions.show.push("OTA, Pick up nuts");
            conditions.show.push("OTA, Open/close zip");
            conditions.show.push("OTA, Put on tub grip stocking on the other hand");
            conditions.show.push("OTA, Write with pen");
            conditions.show.push("OTA, Do up buttons");
            conditions.show.push("OTA, Unscrew lid of jars");
            conditions.show.push("OTA, Put paper-clip on envelope");
            conditions.show.push("OTA, Cut play-doh with knife and fork");
            conditions.show.push("OTA, Fold paper, put into envelope");
            conditions.show.push("OTA, Pour water from pure-pak");
            conditions.show.push("OTA, Pour water from jug");
            conditions.show.push("OTA, Pour water from cup");
            conditions.show.push("OTA, Sollermann test total score");
        }
        else {
            conditions.hide.push("OTA, Put key into Yale lock, turn 90 degrees");
            conditions.hide.push("OTA, Pick up coins up from flat surface, put into purses mounted on wall");
            conditions.hide.push("OTA, Pick up coins from purses");
            conditions.hide.push("OTA, Lift telephone receiver, put to ear");
            conditions.hide.push("OTA, Turn door-handle 30 degrees");
            conditions.hide.push("OTA, Lift wooden cubes over edge 5 cm in height");
            conditions.hide.push("OTA, Lift iron over edge 5 cm in height");
            conditions.hide.push("OTA, Turn screw with screwdriver");
            conditions.hide.push("OTA, Pick up nuts");
            conditions.hide.push("OTA, Open/close zip");
            conditions.hide.push("OTA, Put on tub grip stocking on the other hand");
            conditions.hide.push("OTA, Write with pen");
            conditions.hide.push("OTA, Do up buttons");
            conditions.hide.push("OTA, Unscrew lid of jars");
            conditions.hide.push("OTA, Put paper-clip on envelope");
            conditions.hide.push("OTA, Cut play-doh with knife and fork");
            conditions.hide.push("OTA, Fold paper, put into envelope");
            conditions.hide.push("OTA, Pour water from pure-pak");
            conditions.hide.push("OTA, Pour water from jug");
            conditions.hide.push("OTA, Pour water from cup");
            conditions.hide.push("OTA, Sollermann test total score");
        }
        return conditions;
    },
    'OTA, Did the patient receive a written home program?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OTA, Did the patient receive a written home program?'];
        if (conditionConcept == "Yes") {
            conditions.show.push("OTA, Written home program");
        }
        else {
            conditions.hide.push("OTA, Written home program");
        }
        return conditions;
    },
    'OTA, Did the patient/family receive an occupational therapy education?': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['OTA, Did the patient/family receive an occupational therapy education?'];
        if (conditionConcept == "Yes") {
            conditions.show.push("OTA, Patient/family occupational therapy education");
        }
        else {
            conditions.hide.push("OTA, Patient/family occupational therapy education");
        }
        return conditions;
    },
    'EC, Type of external consultation': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['EC, Type of external consultation'];
        if (conditionConcept == "Other") {
            conditions.show.push("EC, Type of external consultation, other");
        }
        else {
            conditions.hide.push("EC, Type of external consultation, other");
        }
        return conditions;
    },
    'PPN, Patient surgical status': function (formName, formFieldValues) {
        var conditions = {
            show: [],
            hide: []
        };
        var conditionConcept = formFieldValues['PPN, Patient surgical status'];
        if (conditionConcept == "Post-op") {
            conditions.show.push("PPN, Post-op day");
        }
        else {
            conditions.hide.push("PPN, Post-op day");
        }
        return conditions;
    }
}
