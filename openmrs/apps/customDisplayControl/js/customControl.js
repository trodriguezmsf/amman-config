'use strict';

angular.module('bahmni.common.displaycontrol.custom')
    .directive('birthCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
        var link = function ($scope) {
            var conceptNames = ["HEIGHT"];
            $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/birthCertificate.html";
            spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
                $scope.observations = response.data;
            }));
        };

        return {
            restrict: 'E',
            template: '<ng-include src="contentUrl"/>',
            link: link
        }
    }]).directive('deathCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
        var conceptNames = ["WEIGHT"];
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathCertificate.html";
        spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
            $scope.observations = response.data;
        }));
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('customTreatmentChart', ['appService', 'treatmentConfig', 'TreatmentService', 'spinner', '$q', function (appService, treatmentConfig, treatmentService, spinner, $q) {
    var link = function ($scope) {
        var Constants = Bahmni.Clinical.Constants;
        var days = [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday'
        ];
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/customTreatmentChart.html";

        $scope.atLeastOneDrugForDay = function (day) {
            var atLeastOneDrugForDay = false;
            $scope.ipdDrugOrders.getIPDDrugs().forEach(function (drug) {
                if (drug.isActiveOnDate(day.date)) {
                    atLeastOneDrugForDay = true;
                }
            });
            return atLeastOneDrugForDay;
        };

        $scope.getVisitStopDateTime = function () {
            return $scope.visitSummary.stopDateTime || Bahmni.Common.Util.DateUtil.now();
        };

        $scope.getStatusOnDate = function (drug, date) {
            var activeDrugOrders = _.filter(drug.orders, function (order) {
                if ($scope.config.frequenciesToBeHandled.indexOf(order.getFrequency()) !== -1) {
                    return getStatusBasedOnFrequency(order, date);
                } else {
                    return drug.getStatusOnDate(date) === 'active';
                }
            });
            if (activeDrugOrders.length === 0) {
                return 'inactive';
            }
            if (_.every(activeDrugOrders, function (order) {
                    return order.getStatusOnDate(date) === 'stopped';
                })) {
                return 'stopped';
            }
            return 'active';
        };

        var getStatusBasedOnFrequency = function (order, date) {
            var activeBetweenDate = order.isActiveOnDate(date);
            var frequencies = order.getFrequency().split(",").map(function (day) {
                return day.trim();
            });
            var dayNumber = moment(date).day();
            return activeBetweenDate && frequencies.indexOf(days[dayNumber]) !== -1;
        };

        var init = function () {
            var getToDate = function () {
                return $scope.visitSummary.stopDateTime || Bahmni.Common.Util.DateUtil.now();
            };

            var programConfig = appService.getAppDescriptor().getConfigValue("program") || {};

            var startDate = null, endDate = null, getEffectiveOrdersOnly = false;
            if (programConfig.showDetailsWithinDateRange) {
                startDate = $stateParams.dateEnrolled;
                endDate = $stateParams.dateCompleted;
                if (startDate || endDate) {
                    $scope.config.showOtherActive = false;
                }
                getEffectiveOrdersOnly = true;
            }

            return $q.all([treatmentConfig(), treatmentService.getPrescribedAndActiveDrugOrders($scope.config.patientUuid, $scope.config.numberOfVisits,
                $scope.config.showOtherActive, $scope.config.visitUuids || [], startDate, endDate, getEffectiveOrdersOnly)])
                .then(function (results) {
                    var config = results[0];
                    var drugOrderResponse = results[1].data;
                    var createDrugOrderViewModel = function (drugOrder) {
                        return Bahmni.Clinical.DrugOrderViewModel.createFromContract(drugOrder, config);
                    };
                    for (var key in drugOrderResponse) {
                        drugOrderResponse[key] = drugOrderResponse[key].map(createDrugOrderViewModel);
                    }

                    var groupedByVisit = _.groupBy(drugOrderResponse.visitDrugOrders, function (drugOrder) {
                        return drugOrder.visit.startDateTime;
                    });
                    var treatmentSections = [];

                    for (var key in groupedByVisit) {
                        var values = Bahmni.Clinical.DrugOrder.Util.mergeContinuousTreatments(groupedByVisit[key]);
                        treatmentSections.push({visitDate: key, drugOrders: values});
                    }
                    if (!_.isEmpty(drugOrderResponse[Constants.otherActiveDrugOrders])) {
                        var mergedOtherActiveDrugOrders = Bahmni.Clinical.DrugOrder.Util.mergeContinuousTreatments(drugOrderResponse[Constants.otherActiveDrugOrders]);
                        treatmentSections.push({
                            visitDate: Constants.otherActiveDrugOrders,
                            drugOrders: mergedOtherActiveDrugOrders
                        });
                    }
                    $scope.treatmentSections = treatmentSections;
                    if ($scope.visitSummary) {
                        $scope.ipdDrugOrders = Bahmni.Clinical.VisitDrugOrder.createFromDrugOrders(drugOrderResponse.visitDrugOrders, $scope.visitSummary.startDateTime, getToDate());
                    }
                });
        };
        spinner.forPromise(init());
    };

    return {
        restrict: 'E',
        link: link,
        scope: {
            config: "=",
            visitSummary: '='
        },
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('patientEncounterLocations', ['$http', 'appService', 'spinner', function ($http, appService, spinner) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/patientLocationEncounters.html";
        $scope.title = $scope.config.title;
        $scope.isEncounterListShown = true;

        var emitNoDataPresentEvent = function () {
            return $scope.$emit("no-data-present-event");
        };

        var sortEncounterByEncounterDateTime = function (encounters) {
            return _.sortBy(encounters, "encounterDateTime").reverse();
        };

        var fetchLocationsInfoForEncounters = function (patientProgramUuid) {
            return $http.get('/openmrs/ws/rest/v1/bahmniprogramencounter', {
                params: {
                    patientProgramUuid: patientProgramUuid
                },
                withCredentials: true
            });
        };

        spinner.forPromise(fetchLocationsInfoForEncounters($scope.enrollment).then(function (response) {
            var encounters = response.data;
            $scope.encounterLocationInfo = sortEncounterByEncounterDateTime(encounters);
            var firstThreeEncounters = _.take($scope.encounterLocationInfo, 3);
            _.each(firstThreeEncounters, function (encounter) {
                encounter.isOpen = true
            });
            if ($scope.encounterLocationInfo.length <= 0) {
                emitNoDataPresentEvent();
                $scope.isEncounterListShown = false;
            }
        }));
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('surgicalHistory', ['$http', 'appService', 'spinner', function ($http, appService, spinner) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/surgicalHistory.html";
        $scope.title = $scope.config.title;

        var emitNoDataPresentEvent = function () {
            return $scope.$emit("no-data-present-event");
        };

        var getResponseFromQuery = function () {
            var params = {
                q: "bahmni.sqlGet.otSurgicalHistory",
                v: "full",
                patientUuid: $scope.patient.uuid
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };

        spinner.forPromise(getResponseFromQuery().then(function (response) {
            $scope.surgicalHistory = response.data;
            if ($scope.surgicalHistory.length <= 0) {
                emitNoDataPresentEvent();
            } else {
                $scope.headings = _.keys($scope.surgicalHistory[0]);
            }
        }));
    };

    return {
        restrict: 'E',
        link: link,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('patientMovementHistory', ['$http', '$stateParams', 'appService', 'spinner', function ($http, $stateParams, appService, spinner) {
    var controller = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/patientMovementHistory.html";
        $scope.title = $scope.config.title;

        var emitNoDataPresentEvent = function () {
            return $scope.$emit("no-data-present-event");
        };

        var getResponseFromQuery = function () {
            var params = {
                patientUuid: $scope.patient.uuid,
                visitUuid: $stateParams.visitUuid,
                q: "bahmni.sqlGet.ipdPatientMovementHistory",
                v: "full"
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };

        spinner.forPromise(getResponseFromQuery().then(function (response) {
            $scope.patientMovementHistory = response.data;
            if ($scope.patientMovementHistory.length <= 0) {
                emitNoDataPresentEvent();
            } else {
                $scope.headings = _.keys($scope.patientMovementHistory[0]);
            }
        }));
    };

    return {
        restrict: 'E',
        controller: controller,
        template: '<ng-include src="contentUrl"/>'
    }
}]).directive('patientAppointmentsDashboard', ['$http', '$q', '$window', 'appService', function ($http, $q, $window, appService) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/patientAppointmentsDashboard.html";
        var getUpcomingAppointments = function () {
            var params = {
                q: "bahmni.sqlGet.upComingAppointments",
                v: "full",
                patientUuid: $scope.patient.uuid
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };
        var getPastAppointments = function () {
            var params = {
                q: "bahmni.sqlGet.pastAppointments",
                v: "full",
                patientUuid: $scope.patient.uuid
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };
        $q.all([getUpcomingAppointments(), getPastAppointments()]).then(function (response) {
            $scope.upcomingAppointments = response[0].data;
            $scope.upcomingAppointmentsHeadings = _.keys($scope.upcomingAppointments[0]);
            $scope.pastAppointments = response[1].data;
            $scope.pastAppointmentsHeadings = _.keys($scope.pastAppointments[0]);
        });

        $scope.goToListView = function () {
            $window.open('/bahmni/appointments/#/home/manage/appointments/list');
        };
    };
    return {
        restrict: 'E',
        link: link,
        scope: {
            patient: "=",
            section: "="
        },
        template: '<ng-include src="contentUrl"/>'
    };
}]).directive('microbiologyLabResults', ['$http', '$q', '$window', 'appService', 'bacteriologyTabInitialization', 'bacteriologyResultsService', function ($http, $q, $window, appService, bacteriologyTabInitialization, bacteriologyResultsService) {
    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/bacteriologyResultsControl.html";
        var params = {
            patientUuid: $scope.patient.uuid,
            patientProgramUuid: $scope.enrollment
        };

        bacteriologyTabInitialization().then(function (data) {
            $scope.bacteriologyTabData = data;
            bacteriologyResultsService.getBacteriologyResults(params).then(function (response) {
                handleResponse(response);
            });
        });

        $scope.getDisplayName = function (specimen) {
            var type = specimen.type;
            var displayName = type.shortName ? type.shortName : type.name;
            if (displayName === Bahmni.Clinical.Constants.bacteriologyConstants.otherSampleType) {
                displayName = specimen.typeFreeText;
            }
            return displayName;
        };

        $scope.getFinalIdentificationSections = function (specimen) {
            return _.filter(specimen.sampleResult.groupMembers, function (groupMember) {
                return groupMember.concept.name === 'Bacteriology, Final Identification';
            });
        };

        $scope.isAntibiogram = function (observation) {
            var antiBiograms = { "Resistant": "R","Intermediate": "I", "Susceptible": "S", "Positive": "+ve" , "Negative": "-ve" } ;
            return _.indexOf(Object.keys(antiBiograms), observation.value.name) >= 0 && antiBiograms[observation.value.name];
        };

        $scope.getColor = function (observation) {
            var colors = {"Resistant": "#FF0000", "Intermediate": "#000000", "Susceptible": "#008000", "Positive": "#008000" , "Negative": "#FF0000"};
            return colors[observation.value.name];
        };

        $scope.isAlert = function (observation) {
            var alerts = ['Microbiology, Are there any alerts?', 'Microbiology, Alerts Set'];
            return alerts.indexOf(observation.concept.name) >= 0;
        };

        var handleResponse = function (response) {
            $scope.observations = response.data.results;
            if ($scope.observations && $scope.observations.length > 0) {
                $scope.specimens = [];
                var sampleSource = _.find($scope.bacteriologyTabData.setMembers, function (member) {
                    return member.name.name === Bahmni.Clinical.Constants.bacteriologyConstants.specimenSampleSourceConceptName;
                });
                $scope.allSamples = sampleSource !== undefined && _.map(sampleSource.answers, function (answer) {
                    return new Bahmni.Common.Domain.ConceptMapper().map(answer);
                });
                var specimenMapper = new Bahmni.Clinical.SpecimenMapper();
                var conceptsConfig = appService.getAppDescriptor().getConfigValue("conceptSetUI") || {};
                var dontSortByObsDateTime = true;
                _.forEach($scope.observations, function (observation) {
                    $scope.specimens.push(specimenMapper.mapObservationToSpecimen(observation, $scope.allSamples, conceptsConfig, dontSortByObsDateTime));
                });

                $scope.specimens = _.filter($scope.specimens, function (specimen) {
                    return _.isEmpty(specimen.sampleResult) || !_.find(specimen.sampleResult.groupMembers, function (member) {
                        return member.value && member.value.name === 'Answer, Intermediate Identification';
                    });
                });
            } else {
                $scope.specimens = [];
            }

            $scope.isDataPresent = function () {
                if (!$scope.specimens || !$scope.specimens.length) {
                    return $scope.$emit("no-data-present-event") && false;
                }
                return true;
            };
        };
    };
    return {
        restrict: 'E',
        link: link,
        scope: {
            patient: "=",
            section: "="
        },
        template: '<ng-include src="contentUrl"/>'
    };
}]);

