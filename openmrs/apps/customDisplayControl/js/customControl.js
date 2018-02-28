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
        $scope.isEmpty = true;
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/surgicalHistory.html";
        $scope.title = $scope.config.title;

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
            var entries = response.data;
            if (_.isEmpty(entries)) {
                $scope.$emit("no-data-present-event");
            } else {
                $scope.surgicalHistory = entries;
                $scope.headings = _.filter(_.keys(_.first(entries)), function (header) {
                    return _.some(entries, function (entry) {
                        return !_.isEmpty(entry[header]);
                    });
                });
            }
            $scope.isEmpty = _.isEmpty($scope.headings);
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
}]).service("physioSummaryService", ["$http", "$q", function ($http, $q) {

    var self = this;

    const getContainer = function (baseHolder, conceptName) {
        var holder = baseHolder[conceptName] || {};
        holder.left = holder.left || [];
        holder.right = holder.right || [];
        holder.display = conceptName;
        baseHolder[conceptName] = holder;
        return baseHolder;
    };

    const splitByColon = function (conceptNameToDisplay, reducer) {
        return _.trim(reducer(_.split(conceptNameToDisplay, ":")));
    };

    const isEqualName = function (conceptNameToDisplay, conceptName) {
        return getNameInLowerCase(splitByColon(conceptNameToDisplay, _.last)) === getNameInLowerCase(conceptName);
    };

    const getNameInLowerCase = function (name) {
        return _.trim(name.toLowerCase());
    };

    const findMember = function (member, conceptName) {
        return _.find(member.groupMembers, function (member) {
            return isEqualName(member.conceptNameToDisplay, conceptName);
        }) || {};
    };

    this.findByConceptNameToDisplay = function (members, conceptName) {
        return _.find(members, ['conceptNameToDisplay', conceptName]) || {};
    };

    const getValue = function (members, conceptName) {
        var member = findMember(members, conceptName);
        return (member && member.value) || "";
    };

    const insertValue = function (conceptName, baseHolder, values, sortWeight) {
        baseHolder = getContainer(baseHolder || {}, conceptName);
        baseHolder[conceptName].sort = sortWeight;

        _.forEach(values, function (valueMember) {
            baseHolder[conceptName][getNameInLowerCase(valueMember.key)].push(valueMember.value);
        });

        return baseHolder;
    };

    const getValues = function (leftMember, rightMember, conceptNames, holders, mapper) {
        holders = holders || {};

        _.forEach(conceptNames, function (concept) {
            var values = [
                {
                    key: "left",
                    value: mapper(leftMember, concept.name)
                },
                {
                    key: "right",
                    value: mapper(rightMember, concept.name)
                }
            ];
            insertValue(concept.name, holders, values, concept.sort);
        });
        return holders;
    };

    const getFilterRecords = function (records, requiredConceptNames) {
        return _.map(records, function (record) {
            return _.filter(record.groupMembers, function (groupMember) {
                return _.includes(requiredConceptNames, groupMember.conceptNameToDisplay);
            });
        });
    };

    const mapCrucialInfoToObs = function (crucialConcepts, record, mappedData) {
        _.forEach(crucialConcepts, function (conceptName, index) {
            var value = self.findByConceptNameToDisplay(record, conceptName).valueAsString;
            if (getNameInLowerCase(conceptName) === getNameInLowerCase("Date recorded")) {
                value = self.getDateString(value);
            }

            mappedData = insertValue(conceptName, mappedData, [{key: "left", value: value},
                {key: "right", value: value}], index);
        });
        return mappedData;
    };

    const isEmpty = function (record, key) {
        return _.isEmpty(_.compact(_.get(record, key)));
    };

    const isEmptyRow = function (row) {
        return isEmpty(row, "left") && isEmpty(row, "right");
    };


    const flatMultiLevelObs = function (records, concepts) {
        return _.flatMap(records, function (record, key) {
            if (_.includes(concepts, record.display))
                return record;
            var values = _.values(record);
            return _.every(values, isEmptyRow) ? record :
                _.concat([{left: "Left", right: "Right", display: key, isSubHeader: true}], values);
        });
    };

    const mapLeafConcepts = function (leafConcepts, holder, groupMember) {
        if (!_.isEmpty(groupMember)) {
            getValues(findMember(groupMember, "Left"), findMember(groupMember, "Right"), leafConcepts, holder, getValue);
        } else {
            _.forEach(leafConcepts, function (concept) {
                getContainer(holder, concept.name)
            })
        }
        return holder;
    };

    const mapSubGroupMembers = function (concepts, baseHolder, members) {
        _.forEach(concepts, function (conceptMember) {
            baseHolder[conceptMember.name] = mapLeafConcepts(conceptMember.leafConcepts, baseHolder[conceptMember.name] || {},
                self.findByConceptNameToDisplay(members, conceptMember.name));
        });
        return baseHolder;
    };

    const putMemberAt = function (holder, position, data) {
        holder.splice(position, 0, data);
        return holder;
    };

    const getFirstMember = function (records) {
        return _.first(_.values(records));
    };

    const insertAdditionalInfo = function (tableInfo, data, mappedData) {
        data = _.sortBy(data, 'sort');
        if (!_.isEmpty(tableInfo.crucialConcepts)) {
            _.forEach(tableInfo.additionalConcepts, function (concept) {
                var shouldAddAdditionalInfo = _.some(data.slice(concept.position), function (record) {
                    return !isEmptyRow(record);
                });
                shouldAddAdditionalInfo && putMemberAt(data, concept.position, concept.member);
            });

            var member = getFirstMember(data);
            return _.assign(mappedData, {
                data: data,
                leftHeaders: new Array(member.left.length),
                rightHeaders: _.range(member.right.length)
            });
        }
        return data;
    };

    const filterConceptsExceptCrucialConcept = function (record, crucialConcepts) {
        return _.filter(record, function (each) {
            return !(_.isEmpty(each.groupMembers) || _.includes(crucialConcepts, each.conceptNameToDisplay))
        });
    };

    const mapValues = function (parentConcept, childConcept1, childConcept2, concepts, mappedData) {
        return getValues(findMember(parentConcept, childConcept1), findMember(parentConcept, childConcept2), concepts, mappedData, getValue);
    };

    this.mapObservations = function (records, concepts, crucialConcepts) {
        //TODO: Need Refactoring
        var mappedData = {};
        _.forEach(records, function (record) {
            var filteredRecords = filterConceptsExceptCrucialConcept(record, crucialConcepts);
            _.forEach(filteredRecords, function (eachRecord) {
                mapValues(eachRecord, "Left", "Right", concepts, mappedData);
                mapCrucialInfoToObs(crucialConcepts, record, mappedData)
            });
        });
        return _.values(mappedData);
    };

    this.mapHandAndFinger = function (records, concepts, crucialConcepts) {
        //TODO: Need Refactoring. Try to merge/use "mapObservations" method
        var mappedData = {};
        _.forEach(records, function (record) {
            var filteredRecords = filterConceptsExceptCrucialConcept(record, crucialConcepts);

            _.forEach(filteredRecords, function (eachRecord) {
                var side = findMember(eachRecord, "Side of assessment").valueAsString;
                mappedData[side] = mappedData[side] || {};

                var romHandAndFinger = findMember(eachRecord, "R.O.M hand and finger");
                mappedData[side] = getValues(findMember(romHandAndFinger, "Flex"), findMember(romHandAndFinger, "Ext."), concepts, mappedData[side], getValue);
                var additionalConcepts = [
                    {name: "Distance tip (2nd -5th)", sort: 2},
                    {name: "Distance tip (Thumb 2nd)", sort: 3}
                ];
                mappedData[side] = getValues(eachRecord, eachRecord, additionalConcepts, mappedData[side], getValue);
                mapCrucialInfoToObs(crucialConcepts, record, mappedData[side])
            });
        });
        return mappedData;
    };

    this.mapMultilevelObservations = function (records, concepts, crucialConcepts, parentConcept) {
        var mappedData = {};
        _.forEach(records, function (record) {
            var motor = findMember(self.findByConceptNameToDisplay(record, parentConcept), "Motor");
            if (!_.isEmpty(motor)) {
                mappedData = mapSubGroupMembers(concepts, mapCrucialInfoToObs(crucialConcepts, record, mappedData), motor.groupMembers);
            }
        });

        return flatMultiLevelObs(mappedData, crucialConcepts);
    };

    const assign = function (record, holder) {
        holder = holder || {};
        if (record) {
            holder[splitByColon(record.conceptNameToDisplay, _.first)] = record.valueAsString;
        }
        return holder;
    };

    const getData = function (title, mappedData) {
        return _.isEmpty(mappedData.data) ? mappedData : insertAdditionalInfo(title, mappedData.data, mappedData);
    };

    this.map = function (tableTitles, responseData) {
        var records = [];
        var getTableTitle = function (title) {
            return title.display || title.name;
        };
        _.forEach(tableTitles, function (title) {
            var filterRecords = getFilterRecords(responseData, title.crucialConcepts.concat(title.name));
            var data = title.mapper(filterRecords, title.requiredGroupConceptNames, title.crucialConcepts, title.name);
            if (_.isArray(data)) {
                records.push(getData(title, {title: getTableTitle(title), data: data}));
            } else {
                _.forEach(data, function (record, key) {
                    records.push(getData(title, {
                        title: getTableTitle(title) + " (" + key + ")",
                        data: _.values(record)
                    }));
                })
            }
        });
        return records;
    };

    this.fetchObservationsData = function (conceptNames, enrollment, numberOfVisits, scope) {
        var params = {
            concept: conceptNames,
            patientProgramUuid: enrollment,
            scope: scope,
            numberOfVisits: numberOfVisits
        };
        return $http.get('/openmrs/ws/rest/v1/bahmnicore/observations', {
            params: params,
            withCredentials: true
        });
    };

    this.mapStumpCircumference = function (records) {
        var data = {};
        _.forEach(records, function (record) {
            var typeOfAmputation = findMember(record, "Type of amputation");
            if (!_.isEmpty(typeOfAmputation)) {
                var container = data[typeOfAmputation.valueAsString] || {};
                container.type = typeOfAmputation.valueAsString;
                container.values = container.values || [];
                _.forEach(record.groupMembers, function (groupMember) {
                    if (isEqualName(groupMember.conceptNameToDisplay, "Stump circumference")) {
                        var holder = assign(_.last(groupMember.groupMembers), assign(_.first(groupMember.groupMembers), {}));

                        !_.isEmpty(holder) && container.values.push(holder);
                    }
                });
                if (!_.isEmpty(container.values)) {
                    data[typeOfAmputation.valueAsString] = container;
                }
            }
        });
        return data;
    };

    this.getDateString = function (date) {
        return date ? moment(date).format("DD MMM YY") : date;
    };

    this.isEmptySummary = function (records, key) {
        return _.every(records, function (record) {
            return isEmpty(record, key);
        });
    };

    const isEmptyStumpCircumference = function (records) {
        return self.isEmptySummary(_.get(records, "data"), "values");
    };

    this.isEmptyRecord = function (records, key) {
        return isEmpty(records, key);
    };

    this.mapDataForDisplay = function ($scope, configBaseUrl, conceptNames, tableTitles, circumferenceConceptNames) {
        const priorities = {
            "Initial": 0,
            "Post-operative": 1,
            "Final": 2
        };

        var defer = $q.defer();
        $scope.contentUrl = configBaseUrl + "/customDisplayControl/views/limbPhysioSummary.html";

        $scope.isEmptyRow = isEmptyRow;
        $scope.isEmptyRecord = self.isEmptyRecord;

        var promise1 = self.fetchObservationsData(conceptNames, $scope.enrollment, 5).then(function (response) {
            var data = _.sortBy(response.data, function (record) {
                var typeOfAssessment = self.findByConceptNameToDisplay(record.groupMembers, 'Type of assessment').valueAsString;
                return priorities[typeOfAssessment];
            });
            $scope.groupRecords = self.map(tableTitles, data);
        });

        var getStumpCircumferenceTitle = function (encounterUuid) {
            var defer = $q.defer();
            var title = "Stump Circumference";

            if (encounterUuid) {
                $http.get("/openmrs/ws/rest/v1/bahmnicore/bahmniencounter/" + encounterUuid, {
                    params: {includeAll: true},
                    withCredentials: true
                }).then(function (res) {
                    var physioAssessment = self.findByConceptNameToDisplay(_.get(res.data, "observations"), _.first(conceptNames));
                    var dateRecorded = self.findByConceptNameToDisplay(physioAssessment.groupMembers, "Date recorded").value;
                    if (dateRecorded) {
                        title = title + " (" + self.getDateString(dateRecorded) + ")";
                    }
                    defer.resolve(title);
                });
            } else {
                defer.resolve(title);
            }
            return defer.promise;
        };

        var promise2 = self.fetchObservationsData(circumferenceConceptNames, $scope.enrollment, undefined, "latest").then(function (response) {
            var data = self.mapStumpCircumference(response.data);
            return getStumpCircumferenceTitle(_.get(_.first(response.data), 'encounterUuid')).then(function (title) {
                $scope.stumpCircumferences = {title: title, data: data};
            });
        });

        $q.all([promise1, promise2]).then(function () {
            $scope.isEmptyStumpCircumference = isEmptyStumpCircumference($scope.stumpCircumferences);
            $scope.isEmptySummary = self.isEmptySummary($scope.groupRecords, "data") && $scope.isEmptyStumpCircumference;
            defer.resolve();
        });

        return defer.promise;
    }

}]).directive('lowerLimbPhysioSummary', ['appService', 'physioSummaryService', 'spinner', function (appService, physioSummaryService, spinner) {
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

    const multiLevelGroupConcepts = [
        {name: "Superior gluteal", leafConcepts: [{name: "Gluteus medius"}]},
        {name: "Inferior gluteal", leafConcepts: [{name: "Gluteus maxi."}]},
        {name: "Femoral", leafConcepts: [{name: "Quadriceps"}, {name: "Illiopsoas"}]},
        {name: "Obturator", leafConcepts: [{name: "Adductors"}]},
        {
            name: "Peronial",
            leafConcepts: [{name: "Tibialis anterior"}, {name: "Peron. long. brev"}, {name: "Ext. digitorum"}, {name: "Ext. hallucis"}]
        },
        {
            name: "Tibial nerve",
            leafConcepts: [{name: "Gastrocnemius"}, {name: "Tibialis post."}, {name: "Flex. digi. long"}, {name: "Flex. hall. long"}]
        }
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

    const tableTitles = [
        {
            name: 'R.O.M Test for Lower Limbs',
            mapper: physioSummaryService.mapObservations,
            requiredGroupConceptNames: requiredGroupConceptNames,
            additionalConcepts: subConcept,
            crucialConcepts: ['Date recorded', 'Type of assessment']
        },
        {
            name: 'Muscle Test for Lower Limbs',
            mapper: physioSummaryService.mapObservations,
            requiredGroupConceptNames: requiredGroupConceptNames,
            additionalConcepts: subConcept,
            crucialConcepts: ['Date recorded', 'Type of assessment']
        },
        {
            name: 'Neurological exam of lower limb',
            display: "Motor (Neurological Examination)",
            mapper: physioSummaryService.mapMultilevelObservations,
            requiredGroupConceptNames: multiLevelGroupConcepts,
            additionalConcepts: [],
            crucialConcepts: ['Date recorded', 'Type of assessment']
        }
    ];

    var link = function ($scope, element) {
        var promise = physioSummaryService.mapDataForDisplay($scope, appService.configBaseUrl(), conceptNames, tableTitles, ["LLA, Level of amputation"]);
        spinner.forPromise(promise, element);
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
}]).service("physioSummaryScoresService", ["physioSummaryService", function (physioSummaryService) {
    const getContainer = function (baseHolder, conceptName) {
        var holder = baseHolder[conceptName] || {};
        holder.display = conceptName;
        holder.rows = holder.rows || [];
        return holder;
    };

    const findByConceptNameToDisplay = physioSummaryService.findByConceptNameToDisplay;

    const assignToHolder = function (holder, headers, values) {
        if (!_.isEmpty(_.compact(_.slice(values, 1)))) {
            holder.headers = headers;
            holder.rows.push({values: values});
        }
        return holder;
    };

    var mapMaxillofacialPhysioAssessment = function (record, holder) {
        var dateRecorded = findByConceptNameToDisplay(record.groupMembers, "Date recorded");
        var facialDisabilityIndex = findByConceptNameToDisplay(record.groupMembers, "Facial Disability Index");
        var totalScore = findByConceptNameToDisplay(facialDisabilityIndex.groupMembers, "Total score (FDI)");

        var physicalFunction = findByConceptNameToDisplay(facialDisabilityIndex.groupMembers, "Physical Function");
        var physicalFunctionScore = findByConceptNameToDisplay(physicalFunction.groupMembers, "Physical Function Score");
        var socialFunction = findByConceptNameToDisplay(facialDisabilityIndex.groupMembers, "Social Function");
        var socialWellbeingScore = findByConceptNameToDisplay(socialFunction.groupMembers, "Social Wellbeing Score");
        var date = physioSummaryService.getDateString(dateRecorded.value);

        return assignToHolder(holder, ["Date Recorded", "Physical Function", "Social Wellbeing", "Total Score (FDI)"], [date, physicalFunctionScore.value, socialWellbeingScore.value, totalScore.value]);
    };

    var getExtremityFunctionalIndex = function (groupMembers, primaryConceptName, secondaryConceptName) {
        var extremityFunctionalIndex = findByConceptNameToDisplay(groupMembers, primaryConceptName);
        if (_.isEmpty(extremityFunctionalIndex)) {
            extremityFunctionalIndex = findByConceptNameToDisplay(groupMembers, secondaryConceptName);
        }
        return extremityFunctionalIndex;
    };

    const mapUpperLimbAssessment = function (record, holder) {
        var dateRecorded = findByConceptNameToDisplay(record.groupMembers, "Date recorded");
        var basicGripTestMember = findByConceptNameToDisplay(record.groupMembers, "Basic Grip Test");
        var basicGripTotal = findByConceptNameToDisplay(basicGripTestMember.groupMembers, "Total Score");
        var upperExtremityFunctionalIndex = getExtremityFunctionalIndex(record.groupMembers, "Upper Extremity Functional Index (UEFI) 15", "Pediatric Upper Extremity Function ( Fine Motor, ADL)");
        var upperExtremityFunctionalIndexTotal = findByConceptNameToDisplay(upperExtremityFunctionalIndex.groupMembers, "Final score");
        if (_.isEmpty(upperExtremityFunctionalIndexTotal)) {
            upperExtremityFunctionalIndexTotal = findByConceptNameToDisplay(upperExtremityFunctionalIndex.groupMembers, "Total score");
        }

        var date = physioSummaryService.getDateString(dateRecorded.value);
        return assignToHolder(holder, ["Date Recorded", "Basic Grip Test", "UEFI Total Score"], [date, basicGripTotal.value, upperExtremityFunctionalIndexTotal.value]);
    };

    const mapLowerLimbAssessment = function (record, holder) {
        var dateRecorded = findByConceptNameToDisplay(record.groupMembers, "Date recorded");
        var member = findByConceptNameToDisplay(record.groupMembers, "Tinetti Balance Assessment Tool");

        var totalScore = findByConceptNameToDisplay(member.groupMembers, "Total Score");
        var riskOfFall = findByConceptNameToDisplay(member.groupMembers, "Risk of Falls");

        var lowerExtremityFunctionalIndex = getExtremityFunctionalIndex(record.groupMembers, "Lower Extremity Functional Index (LEFI)", "Pediatric Lower Extremity Function (Mobility)");
        var lowerIndexTotal = findByConceptNameToDisplay(lowerExtremityFunctionalIndex.groupMembers, "Total Score");
        var date = physioSummaryService.getDateString(dateRecorded.value);

        return assignToHolder(holder, ["Date Recorded", "Tinetti Total Score", "Risk of Falls", "LEFI Total Score"], [date, totalScore.value, riskOfFall.value, lowerIndexTotal.value]);
    };

    const assessmentMappers = {
        "Lower Limb Physiotherapy Assessment": mapLowerLimbAssessment,
        "Upper Limb Physiotherapy Assessment": mapUpperLimbAssessment,
        "Maxillofacial Physio Assessment": mapMaxillofacialPhysioAssessment
    };

    this.map = function (data, holder) {
        holder = holder || {};
        _.forEach(data, function (record) {
            var conceptNameToDisplay = record.conceptNameToDisplay;
            holder[conceptNameToDisplay] = assessmentMappers[conceptNameToDisplay](record, getContainer(holder, conceptNameToDisplay));
        });
        return holder;
    };

    this.fetchObservationsData = physioSummaryService.fetchObservationsData;

    this.isEmptySummary = function (records) {
        return physioSummaryService.isEmptySummary(records, "rows");
    };

    this.isEmptyRecord = function (record) {
        return physioSummaryService.isEmptyRecord(record, "rows");
    };

}]).directive("physioSummaryScores", ["appService", 'physioSummaryScoresService', 'spinner', '$q', function (appService, physioSummaryScoresService, spinner, $q) {
    var link = function ($scope, element) {
        var defer = $q.defer();
        spinner.forPromise(defer.promise, element);
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/physioSummaryScores.html";

        const conceptNames = [
            "Lower Limb Physiotherapy Assessment",
            "Upper Limb Physiotherapy Assessment",
            "Maxillofacial Physio Assessment"
        ];

        physioSummaryScoresService.fetchObservationsData(conceptNames, $scope.enrollment, 5).then(function (response) {
            $scope.data = physioSummaryScoresService.map(response.data, {});
            $scope.isEmptySummary = physioSummaryScoresService.isEmptySummary($scope.data);
            defer.resolve();
        });

        $scope.isEmptyRecord = physioSummaryScoresService.isEmptyRecord;
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
}]).directive('upperLimbPhysioSummary', ['appService', 'physioSummaryService', 'spinner', '$q', function (appService, physioSummaryService, spinner, $q) {
    const requiredGroupConceptNames = [
        {name: "Shoulder Flex.", sort: 4},
        {name: "Shoulder Ext.", sort: 5},
        {name: "Int. Rotation", sort: 6},
        {name: "Ext. Rotation", sort: 7},
        {name: "Abduction", sort: 8},
        {name: "Adduction", sort: 9},
        {name: "Elbow Flex.", sort: 10},
        {name: "Elbow Ext.", sort: 11},
        {name: "Forearm Sup.", sort: 12},
        {name: "Forearm Pron.", sort: 13},
        {name: "Wrist Flex.", sort: 14},
        {name: "Wrist Ext.", sort: 15},
        {name: "Ulnar Dev.", sort: 16},
        {name: "Radial Dev.", sort: 17}
    ];

    const groupConceptsForROMHandAndFinger = [
        {name: "Wrist", sort: 5},
        {name: "Thumb MC", sort: 6},
        {name: "Thumb DIP", sort: 7},
        {name: "2nd Finger MC", sort: 8},
        {name: "3rd Finger MC", sort: 9},
        {name: "4th Finger MC", sort: 10},
        {name: "5th Finger MC", sort: 11},
        {name: "2nd Finger PIP", sort: 12},
        {name: "3rd Finger PIP", sort: 13},
        {name: "4th Finger PIP", sort: 14},
        {name: "5th Finger PIP", sort: 15},
        {name: "2nd Finger DIP", sort: 16},
        {name: "3rd Finger DIP", sort: 17},
        {name: "4th Finger DIP", sort: 18},
        {name: "5th Finger DIP", sort: 19}
    ];

    const multiLevelGroupConcepts = [
        {name: "Musculocutaneous nerve", leafConcepts: [{name: "Biceps brachii"}]},
        {name: "Axillary nerve", leafConcepts: [{name: "Deltoid"}]},
        {
            name: "Radial nerve", leafConcepts: [{name: "Tricep"}, {name: "Supinator"}, {name: "Ext. C. Rad. L&B"},
            {name: "Ext. C. Ulnaris"}, {name: "Ext. Digiti"}, {name: "Abd. Poll. Longus"}, {name: "Ext. Poll. Longus"},
            {name: "Ext. Indicis"}, {name: "Ext. Dig. Min."}]
        },
        {
            name: "Median nerve", leafConcepts: [{name: "Pronator"}, {name: "Flex. Carpi Radialis"},
            {name: "Flex. Dig. Sup"}, {name: "Flex. Dig Prof"}, {name: "Opp. Pollicis"}, {name: "Flex. Poll. L&B"},
            {name: "Abd. Poll. Brevis"}, {name: "Lumbricalis"}]
        },
        {
            name: "Ulnar nerve",
            leafConcepts: [{name: "Flex. Carpi Uln"}, {name: "Interossei"}, {name: "Add. Poll."}, {name: "Opp /Abd/flex minimi"}]
        }
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

    const tableTitles = [
        {
            name: 'R.O.M Test for Upper Limbs',
            mapper: physioSummaryService.mapObservations,
            requiredGroupConceptNames: requiredGroupConceptNames,
            additionalConcepts: subConcept,
            crucialConcepts: ['Date recorded', 'Type of assessment']
        },
        {
            name: 'Hand and Finger',
            mapper: physioSummaryService.mapHandAndFinger,
            requiredGroupConceptNames: groupConceptsForROMHandAndFinger,
            additionalConcepts: [{
                position: 4, member: {
                    sort: 4,
                    left: "Flex",
                    right: "Ext",
                    display: "Movement",
                    isSubHeader: true
                }
            }],
            crucialConcepts: ['Date recorded', 'Type of assessment']
        },
        {
            name: 'Muscle Test for Upper Limbs',
            mapper: physioSummaryService.mapObservations,
            requiredGroupConceptNames: requiredGroupConceptNames,
            additionalConcepts: subConcept,
            crucialConcepts: ['Date recorded', 'Type of assessment']
        },
        {
            name: 'Neurological exam of upper  limb',
            display: "Motor (Neurological Examination)",
            mapper: physioSummaryService.mapMultilevelObservations,
            requiredGroupConceptNames: multiLevelGroupConcepts,
            additionalConcepts: [],
            crucialConcepts: ['Date recorded', 'Type of assessment']
        }
    ];

    const conceptNames = ["Upper Limb Physiotherapy Assessment"];

    var link = function ($scope, element) {
        var promise = physioSummaryService.mapDataForDisplay($scope, appService.configBaseUrl(), conceptNames, tableTitles, ["ULA, Level of amputation"]);
        spinner.forPromise(promise, element);
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
}]).directive('patientInformation', ['appService', 'conceptSetService', '$http', function (appService, conceptSetService, $http) {
    const getSpecialities = function (data) {
        var specialities = _.map(data, function (speciality) {
            return speciality.value.name;
        });
        return _.join(specialities, ', ');
    };

    const filterValueByConcept = function (records, conceptName) {
        return _.filter(records, function (eachObs) {
            return eachObs.concept.name === conceptName;
        })
    };

    const conceptNameForSurgeon = function (conceptName) {
        return conceptSetService.getConcept({
            name: conceptName,
            v: "custom:(uuid,names,displayString,synonyms)"
        });
    };

    const fetchObservationsData = function (conceptNames, enrollment, numberOfVisits, scope) {
        var params = {
            concept: conceptNames,
            patientProgramUuid: enrollment,
            scope: scope,
            numberOfVisits: numberOfVisits
        };
        return $http.get('/openmrs/ws/rest/v1/bahmnicore/observations', {
            params: params,
            withCredentials: true
        });
    };

    const getValidInformation = function (patientInformation) {
        return _.filter(patientInformation, function (eachConcept) {
            return !_.isEmpty(eachConcept.answer) || eachConcept.answer > 0;
        });
    };

    var link = function ($scope) {

        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/patientSummary.html";
        var conceptNames = ["Stage", "FSTG, Specialty determined by MLO", "FV, Name (s) of Surgeon 1"];

        fetchObservationsData(conceptNames, $scope.enrollment, 1, "latest").then(function (response) {

            const stageConcept = filterValueByConcept(response.data, "Stage");

            const specialities = filterValueByConcept(response.data, "FSTG, Specialty determined by MLO");

            const nameOfSurgeonAnswers = filterValueByConcept(response.data, "FV, Name (s) of Surgeon 1");

            if (!_.isEmpty(specialities)) {
                var specialityAnswers = getSpecialities(specialities);
            }

            if (!_.isEmpty(stageConcept)) {
                var stage = stageConcept[0].value;
            }

            var patientInformation = [
                {name: "Stage", answer: stage},
                {name: "Speciality", answer: specialityAnswers}
            ];

            var validInformation = getValidInformation(patientInformation);

            if (nameOfSurgeonAnswers.length == 1) {

                var surgeonName = nameOfSurgeonAnswers[0].value.name;

                conceptNameForSurgeon(surgeonName).then(function (response) {
                    var synonyms = response.data.results[0].synonyms;
                    if (!_.isEmpty(synonyms)) {
                        var surgeonSynonym = _.last(_.split(_.last(synonyms).display, ','));
                    }
                    $scope.concepts = _.concat({
                        name: "Name of Surgeon",
                        answer: surgeonSynonym || surgeonName
                    }, validInformation);
                });
            } else {
                $scope.isDataPresent = function () {
                    return _.isEmpty($scope.concepts);
                };
            }

            if (nameOfSurgeonAnswers.length == 0) {
                $scope.concepts = validInformation;
            }
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
}]).directive('physicalExamination', ['appService', 'conceptSetService', '$http', function (appService, conceptSetService, $http) {
    var link = function ($scope) {

        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/physicalExamination.html";
        var conceptNames = ["Physical Examination"];

        const fetchObservationsData = function (conceptNames, enrollment, numberOfVisits, scope) {
            var params = {
                concept: conceptNames,
                patientProgramUuid: enrollment,
                scope: scope
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/observations', {
                params: params,
                withCredentials: true
            });
        };

        const getPhysicalExaminationData = function (encounterData) {
            var concepts = [];
            _.each(encounterData.groupMembers, function (groupMember) {
                var conceptName = {name: groupMember.conceptNameToDisplay, answer: groupMember.valueAsString}
                concepts.push(conceptName)
            });
            return concepts;

        };

        const getDisplayableEncounter = function (records, methods) {
            var allValues = [];
            _.forEach(methods, function (method) {
                var encounterValue = method(records);
                if (!_.isEmpty(encounterValue)) {
                    var value = getPhysicalExaminationData(encounterValue);
                    allValues.push({date: encounterValue.encounterDateTime, value: value})
                }
            });
            return allValues;
        };

        fetchObservationsData(conceptNames, $scope.enrollment, "all").then(function (response) {
            if (response.data.length > 1) {
                $scope.allEncounter = getDisplayableEncounter(response.data, [_.first, _.last]);
            } else {
                $scope.allEncounter = getDisplayableEncounter(response.data, [_.first])
            }

            $scope.isDataPresent = function () {
                return _.isEmpty($scope.allEncounter);
            }
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
}]).directive('surgicalFollowUp', ['appService', '$http', function (appService, $http) {

    const fetchObservationsData = function (conceptNames, enrollment, numberOfVisits, scope) {
        var params = {
            concept: conceptNames,
            patientProgramUuid: enrollment,
            scope: scope,
            numberOfVisits: numberOfVisits
        };
        return $http.get('/openmrs/ws/rest/v1/bahmnicore/observations', {
            params: params,
            withCredentials: true
        });
    };

    const findConcept = function (members, conceptName) {
        return _.find(members.groupMembers, ['conceptNameToDisplay', conceptName]) || {};
    };

    const getNotesDetails = function (member, conceptName) {
        return findConcept(findConcept(member, "Follow-up needs"), conceptName);
    };

    const margeValues = function (documentRequestedMembers, siteMembers, conceptValues, freeText, values) {
        values = values || [];
        _.forEach(documentRequestedMembers, function (each, index) {
            var requestedValue = "_";
            var siteValue = "{}";
            const reportAt = findConcept(conceptValues, each);
            const reportOf = findConcept(freeText, siteMembers[index]);

            if (reportAt.valueAsString || reportOf.valueAsString) {
                each = _.first(_.split(each, " "));
                if (reportAt.valueAsString) {
                    requestedValue = reportAt.valueAsString;
                }
                if (reportOf.valueAsString) {
                    siteValue = reportOf.valueAsString;
                }
                values.push(each + " after " + requestedValue + " of: " + siteValue)
            }
        });
        return values;
    };

    const mapMultiLevelObs = function (data, documentRequestedMembers, siteMembers, parentConcept, values) {
        values = values || [];
        if (!_.isEmpty(data)) {
            var conceptValues = findConcept(data, "Document requested");
            var freeText = findConcept(data, "Site");
            values = margeValues(documentRequestedMembers, siteMembers, conceptValues, freeText, values);
        }
        return {name: parentConcept, value: values, sort: 2}
    };

    const getFollowUpNeedsValues = function (result, responseData, requestDocuments, requestDocumentsOf) {
        result = result || [];
        var values = [];
        const followupNeeds = getNotesDetails(responseData, "MLO visit at:");
        if (!_.isEmpty(followupNeeds)) {
            values.push("MLO visit at " + followupNeeds.valueAsString)
        }

        const data = getNotesDetails(responseData, "Follow-up needs");
        const followupNeedsData = mapMultiLevelObs(data, requestDocuments, requestDocumentsOf, "Follow-up needs", values);
        result.push(followupNeedsData);
    };

    const getValidData = function (data) {
        return _.filter(data, function (each) {
            return !_.isEmpty(each.value)
        });

        return conceptDetails;
    };

    const map = function (records, responseData, concepts, requestDocuments, requestDocumentsOf) {
        records = records || [];
        _.forEach(concepts, function (eachConcept) {
            if (eachConcept.title === "Follow-up needs") {
                eachConcept.mapper(records, responseData, requestDocuments, requestDocumentsOf);
            } else {
                var data = eachConcept.mapper(responseData, eachConcept.name);
                if (!_.isEmpty(data)) {
                    records.push({
                        name: eachConcept.title,
                        value: data.valueAsString,
                        sort: eachConcept.sort
                    })
                }
            }
        });
        return records;
    };

    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/surgicalFollowUpPlan.html";
        var conceptNames = ["Surgeon Follow-up"];

        fetchObservationsData(conceptNames, $scope.enrollment, 1, "latest").then(function (response) {
            var records = [];
            var requestDocuments = ["X-ray at:", "Video after:", "Photo after:"];
            var requestDocumentsOf = ["X-ray of:", "Video of:", "Photo of::"];
            var concepts = [
                {title: "Follow-up plan", name: "Follow-up plan", mapper: findConcept, sort: 1},
                {title: "Follow-up needs", name: "MLO visit at:", mapper: getFollowUpNeedsValues, sort: 2},
                {title: "Notes", name: "Notes, other", mapper: getNotesDetails, sort: 3}
            ];

            if (!_.isEmpty(response.data[0])) {
                var responseData = response.data[0];
                records = map(records, responseData, concepts, requestDocuments, requestDocumentsOf);
            }

            $scope.records = _.sortBy(getValidData(records), ['sort']);
            $scope.isSubTableAble = function (data) {
                return data.name === "Follow-up needs";
            };
            $scope.isDataPresent = function () {
                return _.isEmpty($scope.records)
            };
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
}]).directive('dischargeMedication', ['appService', '$http', function (appService, $http) {

    var fetchObservationsData = function (conceptNames, enrollment, numberOfVisits, scope) {
        var params = {
            concept: conceptNames,
            patientProgramUuid: enrollment,
            scope: scope,
            numberOfVisits: numberOfVisits
        };
        return $http.get('/openmrs/ws/rest/v1/bahmnicore/observations', {
            params: params,
            withCredentials: true
        });
    };

    var filterConcept = function (groupMembers, conceptName) {
        return _.filter(groupMembers, function (groupMember) {
            return groupMember.concept.name === conceptName;
        });
    };

    var link = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/dischargeMedication.html";
        var conceptNames = ["Medical Doctor OPD Follow-up"];

        fetchObservationsData(conceptNames, $scope.enrollment, 1, "latest").then(function (response) {
            var groupMembers = response.data[0] && response.data[0].groupMembers;
            var medication = filterConcept(groupMembers, "MDOF, Discharge medication")[0];

            if (!_.isEmpty(medication)) {
                var values = [];
                var dischargeMedication = {name: medication.concept.shortName, answer: medication.valueAsString};
                var answers = filterConcept(groupMembers, "MDOF, Discharge medication section");
                values.push(dischargeMedication);
                _.forEach(answers, function (answer) {
                    _.forEach(answer.groupMembers, function (member) {
                        values.push({
                            name: member.concept.shortName,
                            answer: member.valueAsString
                        });
                    })
                });
                $scope.medications = values;
            }

            $scope.isDataPresent = function () {
                return _.isEmpty($scope.medications);
            }
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
}]).directive('surgicalDiagnosis', ['$http', '$stateParams', '$q', 'appService', 'spinner', function ($http, $stateParams, $q, appService, spinner) {
    var controller = function ($scope) {
        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/surgicalDiagnosis.html";
        $scope.title = $scope.config.title;

        var getResponseFromQuery = function (queryParameter) {
            var params = {
                patientUuid: $scope.patient.uuid,
                q: queryParameter,
                v: "full"
            };
            return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
                method: "GET",
                params: params,
                withCredentials: true
            });
        };

        spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.surgicalDiagnosisData"), getResponseFromQuery("bahmni.sqlGet.medicalDiagnosisData")]).then(function (response) {
            $scope.headings = ["Surgical Diagnosis", "Side and Site"];
            $scope.medicalDiagnosisHeadings = ["Medical Diagnosis"];
            $scope.surgicalDiagnosis = response[0].data;
            $scope.medicalDiagnosis = response[1].data;
        }));
    };

    return {
        restrict: 'E',
        controller: controller,
        template: '<ng-include src="contentUrl"/>'
    }
}]);
