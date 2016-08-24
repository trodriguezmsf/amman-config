var showOrHideLegalRepresentativeSection = function (patient) {
    var returnValues = {
        show: [],
        hide: []
    };
    if (patient["age"].years < 18) {
        returnValues.show.push("LegalRepresentative")
    } else {
        returnValues.hide.push("LegalRepresentative")
    }
    return returnValues
};

Bahmni.Registration.AttributesConditions.rules = {
    'age': function (patient) {
        return showOrHideLegalRepresentativeSection(patient);
    },

    'birthdate': function (patient) {
        return showOrHideLegalRepresentativeSection(patient);
    },
    'isCareTakerRequired': function(patient) {
        var returnValues = {
            show: [],
            hide: []
        };
        if (patient["isCareTakerRequired"]) {
            returnValues.show.push("caretaker");
            returnValues.show.push("Caretaker ID documents");
            returnValues.show.push("Caretaker Contact Details");
        } else {
            returnValues.hide.push("caretaker");
            returnValues.hide.push("Caretaker ID documents");
            returnValues.hide.push("Caretaker Contact Details");
        }
        return returnValues

    },
    'caretakeralsoLegalRep': function(patient) {
        var returnValues = {
            show: [],
            hide: []
        };
        if (patient["caretakeralsoLegalRep"] && patient["caretakeralsoLegalRep"].value && patient["caretakeralsoLegalRep"].value.fullySpecifiedName === "Yes") {
            returnValues.show.push("LegalRepresentative");
            patient["legalRepFullNameEnglish"] = patient["caretakerNameEnglish"];
            patient["legalRepFullNameArabic"] = patient["caretakerNameArabic"];
            patient["legalRepGender"] = patient["caretakerGender"];
            patient["legalRepDob"] = patient["caretakerDob"];
            patient["legalRepNationality"] = patient["caretakerNationality"]
        } else if((patient["age"].years === undefined || patient["age"].years > 18) && patient["caretakeralsoLegalRep"] && (patient["caretakeralsoLegalRep"].value === undefined || patient["caretakeralsoLegalRep"].value.fullySpecifiedName === "No")){
            returnValues.hide.push("LegalRepresentative");
            patient["legalRepFullNameEnglish"] = undefined;
            patient["legalRepFullNameArabic"] = undefined;
            patient["legalRepGender"] = undefined;
            patient["legalRepDob"] = undefined;
            patient["legalRepNationality"] = undefined
        } else {
            patient["legalRepFullNameEnglish"] = undefined;
            patient["legalRepFullNameArabic"] = undefined;
            patient["legalRepGender"] = undefined;
            patient["legalRepDob"] = undefined;
            patient["legalRepNationality"] = undefined
        }
        return returnValues
    }
};