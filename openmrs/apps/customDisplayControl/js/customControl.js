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

        var isDashboardBeingPrinted = function () {
            return $scope.$root.isBeingPrinted;
        };

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
            var number = isDashboardBeingPrinted() ? $scope.encounterLocationInfo.length : 3;
            var firstThreeEncounters = _.take($scope.encounterLocationInfo, number);
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

        var expandAllSpecimens = function () {
            _.each($scope.specimens, function (specimen) {
                specimen.isOpen = true;
            });
        };

        var expandAllSpecimensIfDashboardPrinting = function () {
            if ($scope.$root.isBeingPrinted) {
                expandAllSpecimens();
            }
        };

        bacteriologyTabInitialization().then(function (data) {
            $scope.bacteriologyTabData = data;
            bacteriologyResultsService.getBacteriologyResults(params).then(function (response) {
                handleResponse(response);
                expandAllSpecimensIfDashboardPrinting();
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
            var antiBiograms = {
                "Resistant": "R",
                "Intermediate": "I",
                "Susceptible": "S",
                "Positive": "+ve",
                "Negative": "-ve",
                "Sharp": "Sharp",
                "Fuzzy": "Fuzzy"
            };
            return _.indexOf(Object.keys(antiBiograms), observation.value.name) >= 0 && antiBiograms[observation.value.name];
        };

        $scope.getColor = function (observation) {
            var colors = {
                "Resistant": "#FF0000",
                "Intermediate": "#000000",
                "Susceptible": "#008000",
                "Positive": "#008000",
                "Negative": "#FF0000"
            };
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
}]).service("physioSummaryService", ["$http", function ($http) {
    const getContainer = function (baseHolder, conceptName) {
        var holder = baseHolder[conceptName] || {};
        holder.left = holder.left || [];
        holder.right = holder.right || [];
        holder.display = conceptName;
        baseHolder[conceptName] = holder;
        return baseHolder;
    };

    const splitByColon = function (conceptNameToDisplay) {
        return _.trim(_.last(conceptNameToDisplay.split(":")));
    };

    const isEqualName = function (conceptNameToDisplay, conceptName) {
        return getNameInLowerCase(splitByColon(conceptNameToDisplay)) === getNameInLowerCase(conceptName);
    };

    const getNameInLowerCase = function (name) {
        return _.trim(name.toLowerCase());
    };

    const findMember = function (member, conceptName) {
        return _.find(member.groupMembers, function (member) {
            return isEqualName(member.conceptNameToDisplay, conceptName);
        });
    };

    const getValue = function (members, conceptName) {
        var member = findMember(members, conceptName);
        return (member && member.value) || "";
    };

    const getValues = function (groupMembers, conceptNames, holders) {
        holders = holders || {};

        _.forEach(conceptNames, function (concept) {
            var conceptName = concept.name;
            holders = getContainer(holders, conceptName);
            holders[conceptName].sort = concept.sort;
            holders[conceptName].display = concept.name;
            holders[conceptName][getNameInLowerCase(groupMembers[0].conceptNameToDisplay)].push(getValue(groupMembers[0], conceptName));
            holders[conceptName][getNameInLowerCase(groupMembers[1].conceptNameToDisplay)].push(getValue(groupMembers[1], conceptName));
        });
        return holders;
    };

    const helper = function (conceptName, value, mappedData, sortWeight) {
        mappedData = getContainer(mappedData, conceptName);
        mappedData[conceptName]['sort'] = sortWeight;
        mappedData[conceptName]['display'] = conceptName;
        mappedData[conceptName]['left'].push(value);
        mappedData[conceptName]['right'].push(value);
        return mappedData;
    };

    const getFilterRecords = function (records, requiredConceptNames) {
        return _.map(records, function (record) {
            return _.filter(record.groupMembers, function (groupMember) {
                return _.includes(requiredConceptNames, groupMember.conceptNameToDisplay);
            });
        });
    };

    const findObservation = function (record, mappedData) {
        var dateRecordedMember = _.find(record, ['conceptNameToDisplay', 'Date recorded']) || {};
        var assessmentMember = _.find(record, ['conceptNameToDisplay', 'Type of assessment']) || {};
        mappedData = helper("Date Recorded", dateRecordedMember.valueAsString, mappedData, 0);
        mappedData = helper("Type of Assessment", assessmentMember.valueAsString, mappedData, 1);
        return mappedData;
    };

    this.mapObservations = function (records, requiredGroupConceptNames) {
        var mappedData = {};
        _.forEach(records, function (record) {
            var filteredRecords = _.filter(record, function (each) {
                return !_.includes(["Date Recorded", "Type of Assessment"], each.conceptNameToDisplay)
            });

            _.forEach(filteredRecords, function (eachRecord) {
                if (!_.isEmpty(eachRecord.groupMembers)) {
                    mappedData = getValues(eachRecord.groupMembers, requiredGroupConceptNames, mappedData);
                    mappedData = findObservation(record, mappedData)
                }
            });
        });
        return _.values(mappedData);
    };

    this.mapMultilevelObservations = function (records) {

        var concepts = {
            "Superior gluteal": {name: "Superior gluteal", leafConcepts: [{name: "Gluteus medius"}]},
            "Inferior gluteal": {name: "Inferior gluteal", leafConcepts: [{name: "Gluteus maxi."}]},
            "Femoral": {name: "Femoral", leafConcepts: [{name: "Quadriceps"}, {name: "Illiopsoas"}]},
            "Obturator": {name: "Obturator", leafConcepts: [{name: "Adductors"}]},
            "Peronial": {
                name: "Peronial",
                leafConcepts: [{name: "Tibialis anterior"}, {name: "Peron. long. brev"}, {name: "Ext. digitorum"}, {name: "Ext. hallucis"}]
            },
            "Tibial nerve": {
                name: "Tibial nerve",
                leafConcepts: [{name: "Gastrocnemius"}, {name: "Tibialis post."}, {name: "Flex. digi. long"}, {name: "Flex. hall. long"}]
            }
        };

        var mappedData = {};
        var allConcept = [];
        _.forEach(records, function (record) {
            var filteredRecords = _.find(record, ["conceptNameToDisplay", "Neurological exam of lower limb"]);
            if (!_.isEmpty(filteredRecords)) {
                var motor = _.find(filteredRecords.groupMembers, ["conceptNameToDisplay", "Motor"]);
                mappedData = findObservation(record, mappedData);


                if (!_.isEmpty(motor)) {
                    _.forEach(concepts, function (conceptMember, name) {
                        var leafConcepts = conceptMember.leafConcepts;
                        var conceptNameToDisplay = getNameInLowerCase(name);
                        var temp = mappedData[conceptNameToDisplay] || {};
                        var groupMembers = _.find(motor.groupMembers, ["conceptNameToDisplay", conceptMember.name]);

                        if (!_.isEmpty(groupMembers)) {
                            getValues(groupMembers.groupMembers, leafConcepts, temp);
                        } else {
                            _.forEach(leafConcepts, function (concept) {
                                getContainer(temp, concept.name)
                            })
                        }
                        mappedData[conceptNameToDisplay] = temp;
                    });
                }
            }
        });

        _.forEach(mappedData, function (eachLeafConcept, key) {
            if (!_.isEqual(eachLeafConcept.display)) {
                allConcept.push(eachLeafConcept)
            }
            else {
                allConcept.push({left: "left", right: "right", display: key, isSubHeader: true});
                _.forEach(eachLeafConcept, function (leafConcept) {
                    allConcept.push(leafConcept);
                })
            }
        });

        return allConcept;
    };

    const putMemberAt = function (holder, position, data) {
        holder.splice(position, 0, data);
        return holder;
    };

    const getMember = function (records) {
        return _.first(_.values(records));
    };

    this.map = function (tableTitles, responseData, requiredGroupConceptNames, extraMembers) {
        return tableTitles.map(function (title) {
            var conceptName = title.name;
            var filterRecords = getFilterRecords(responseData, ['Date recorded', 'Type of assessment', conceptName]);
            var data = title.mapper(filterRecords, requiredGroupConceptNames);
            var mappedData = {
                title: conceptName, data: data
            };
            if (!_.isEmpty(data)) {
                var member = getMember(data);
                if (conceptName !== 'Neurological exam of lower limb') {
                    extraMembers.forEach(function (each) {
                        putMemberAt(data, each.position, each.member)
                    });
                }
                return _.assign(mappedData, {
                    data: data,
                    leftHeaders: new Array(member.left.length),
                    rightHeaders: new Array(member.right.length)
                });
            }
            return mappedData;
        });
    };

    this.fetchObservationsData = function (conceptNames, enrollment, numberOfVisits) {
        var params = {
            concept: conceptNames,
            patientProgramUuid: enrollment,
            numberOfVisits: numberOfVisits
        };
        return $http.get('/openmrs/ws/rest/v1/bahmnicore/observations', {
            params: params,
            withCredentials: true
        });
    };
}]).directive('lowerLimbPhysioSummary', ['appService', 'physioSummaryService', 'spinner', '$q', function (appService, physioSummaryService, spinner, $q) {
    const requiredGroupConceptNames = [
        {name: "Hip Flex.", sort: 4},
        {name: "Hip Ext.", sort: 5},
        {name: "Int. Rotation", sort: 6},
        {name: "Ext. Rotation", sort: 7},
        {name: "Abduction", sort: 8},
        {name: "Adduction", sort: 9},
        {name: "Knee Flex.", sort: 10},
        {name: "Knee Ext.", sort: 11},
        {name: "Ankle Dorsiflex.", sort: 12},
        {name: "Ankle Planterflex", sort: 13},
        {name: "Ankle Inversion", sort: 14},
        {name: "Ankle Eversion", sort: 15}
    ];
    const subConcept = [{
        position: 2, member: {
            sort: 3,
            left: "Left",
            right: "Right",
            display: "Movement",
            isSubHeader: true
        }
    }];
    const conceptNames = [
        "Lower Limb Physiotherapy Assessment"
    ];

    var link = function ($scope, element) {
        var defer = $q.defer();
        spinner.forPromise(defer.promise, element);
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/lowerLimbPhysioSummary.html";

        physioSummaryService.fetchObservationsData(conceptNames, $scope.enrollment, 5).then(function (response) {
            var tableTitles = [{name: 'R.O.M Test for Lower Limbs', mapper: physioSummaryService.mapObservations},
                {name: 'Muscle Test for Lower Limbs', mapper: physioSummaryService.mapObservations},
                {name: 'Neurological exam of lower limb', mapper: physioSummaryService.mapMultilevelObservations}
            ];
            $scope.groupRecords = physioSummaryService.map(tableTitles, response.data, requiredGroupConceptNames, subConcept);
            defer.resolve();
        });
    };

    return {
        link: link,
        scope: {
            patient: "=",
            section: "=",
            enrollment: "="
        },
        template: '<ng-include src="contentUrl"/>'
    }
}]);