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

    }
};