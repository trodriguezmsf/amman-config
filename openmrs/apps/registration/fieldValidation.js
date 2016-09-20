Bahmni.Registration.customValidator = {
    "legalRepDob": {
        method: function (name, value, personAttributeDetails) {
            var dateUtil = Bahmni.Common.Util.DateUtil;
            return moment(value).isBefore(dateUtil.today());
        },
        "errorMessage": "REGISTRATION_LGDOB_ERROR_KEY"
    },
    "caretakerDob": {
        method: function (name, value, personAttributeDetails) {
            var dateUtil = Bahmni.Common.Util.DateUtil;
            return moment(value).isBefore(dateUtil.today());
        },
        "errorMessage": "REGISTRATION_CTDOB_ERROR_KEY"
    },
    "id1DateOfExpiry": {
        method: function (name, value, personAttributeDetails) {
            var dateUtil = Bahmni.Common.Util.DateUtil;
            return moment(value).isAfter(dateUtil.today());
        },
        "errorMessage": "REGISTRATION_DOE_ERROR_KEY"
    },
    "id2DateOfExpiry": {
            method: function (name, value, personAttributeDetails) {
                var dateUtil = Bahmni.Common.Util.DateUtil;
                return moment(value).isAfter(dateUtil.today());
            },
            "errorMessage": "REGISTRATION_POE_ERROR_KEY"
        },
    "id3DateOfExpiry": {
                method: function (name, value, personAttributeDetails) {
                    var dateUtil = Bahmni.Common.Util.DateUtil;
                    return moment(value).isAfter(dateUtil.today());
                },
                "errorMessage": "REGISTRATION_POE_ERROR_KEY"
            },

};
