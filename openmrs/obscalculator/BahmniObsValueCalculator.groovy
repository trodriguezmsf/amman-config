import org.apache.commons.lang.StringUtils
import org.openmrs.Concept
import org.openmrs.ConceptSet
import org.openmrs.api.ConceptService
import org.openmrs.api.context.Context
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniEncounterTransaction
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniObservation
import org.openmrs.module.bahmniemrapi.obscalculator.ObsValueCalculator
import org.openmrs.module.emrapi.encounter.domain.EncounterTransaction

public class BahmniObsValueCalculator implements ObsValueCalculator {
    static Double ZERO = 0.0;

    class ScoreDetails {
        Double score;
        Integer totalQuestions;
        Integer answeredQuestions;

        ScoreDetails(Double score, Integer totalQuestions, Integer answeredQuestions) {
            this.score = score
            this.totalQuestions = totalQuestions
            this.answeredQuestions = answeredQuestions
        }

        Double getScore() {
            return score
        }

        Integer getAnsweredQuestions() {
            return answeredQuestions
        }

        boolean areAllQuestionsAnswered() {
            return this.answeredQuestions.equals(this.totalQuestions)
        }
    }

    interface ScoreCalculationType {
        ScoreDetails getScoreDetails(BahmniObservation bahmniObservation)
    }

    class DefaultScoreCalculation implements ScoreCalculationType {
        @Override
        ScoreDetails getScoreDetails(BahmniObservation bahmniObservation) {
            double score = ZERO
            int answeredQuestions = ZERO, totalQuestions = ZERO

            ConceptService conceptService = Context.getConceptService();
            Concept concept = conceptService.getConceptByUuid(bahmniObservation.getConcept().getUuid());
            for (ConceptSet conceptSet : concept.getConceptSets()) {
                boolean isCodedConcept = conceptSet.getConcept().getDatatype().getName() == "Coded";
                if (isCodedConcept) {
                    totalQuestions += 1;
                    String groupMemberName = conceptSet.getConcept().getName().getName();
                    List<BahmniObservation> bahmniObservations = getAllGroupMembersWithConcept(groupMemberName, bahmniObservation.getGroupMembers());
                    for (BahmniObservation observation : bahmniObservations) {
                        if (observation != null && !observation.getVoided()) {
                            String answer = observation.getValue().get('displayString') == null ? observation.getValue().get('name') : observation.getValue().get('displayString');
                            score += getValueFromConceptName(answer);
                            answeredQuestions += 1;
                        }
                    }
                }
            }
            return new ScoreDetails(score, totalQuestions, answeredQuestions)
        }
    }

    class AggregateScoreCalculation implements ScoreCalculationType {
        private List<String> scoreConceptNames;

        AggregateScoreCalculation(List<String> scoreConceptNames) {
            this.scoreConceptNames = scoreConceptNames
        }

        @Override
        ScoreDetails getScoreDetails(BahmniObservation bahmniObservation) {
            double score = 0
            int answeredQuestions = 0, totalQuestions = 0

            for (String scoreConcept : scoreConceptNames) {
                totalQuestions += 1
                BahmniObservation childObs = find(scoreConcept, bahmniObservation.getGroupMembers(), null)
                if (childObs != null && !childObs.getVoided()) {
                    Double value = Double.parseDouble(childObs.getValue() + "")
                    score += value;
                    answeredQuestions += 1;
                }
            }
            return new ScoreDetails(score, totalQuestions, answeredQuestions)
        }
    }

    interface Formula {
        String applyFormulaOnScore(ScoreDetails scoreDetails)
    }

    class ExtremityFunctionFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
//            double score = scoreDetails.areAllQuestionsAnswered() ? scoreDetails.getScore() * 1.25 : (scoreDetails.getScore() + scoreDetails.getScore() / scoreDetails.getAnsweredQuestions()) * 1.25;
              double score = scoreDetails.areAllQuestionsAnswered() ? scoreDetails.getScore() * 1.25 : (scoreDetails.getScore()  / (4 * scoreDetails.getAnsweredQuestions())) * 100;
            String value = "" + roundOffToTwoDecimalPlaces(score);
            return value
        }
    }

    class DefaultFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
            String value = "" + roundOffToTwoDecimalPlaces(scoreDetails.getScore())
            return value
        }
    }

    class AverageFormula implements Formula{

        @java.lang.Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
            Double val = roundOffToTwoDecimalPlaces((scoreDetails.getScore())/2)
            String value = "" + val
            return value
        }
    }

    class RiskFallsFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            double score = scoreDetails.getScore();
            String risk;
            if (score <= 18) {
                risk = "High"
            } else if (score >= 19 && score <= 23) {
                risk = "Moderate";
            } else if (score >= 24) {
                risk = "Low";
            }
            return risk;
        }
    }

    class TotalPressureInjuryRiskScoreFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            double score = scoreDetails.getScore();
            String risk;
            if (score >= 19 && score <=23) {
                risk = " Not at risk"
            } else if (score >=15 && score <= 18) {
                risk = "Mild risk";
            } else if (score >= 13 && score <=14) {
                risk = "Moderate risk";
            }
            else if (score >= 10 && score <= 12){
                risk = "High risk";
            }
            else if (score <= 9){
                risk = "Severe risk";
            }
            return risk;
        }
    }

    class FunctionalIndexTableFormula implements Formula {
        double[] table = [0.0, 8.5, 14.4, 18.6, 21.7, 24.3, 26.5, 28.4, 30.1, 31.7, 33.1, 34.4, 35.6, 36.7, 37.8, 38.9, 39.9, 40.8, 41.8, 42.7, 43.5, 44.4, 45.2, 46.0, 46.9, 47.6, 48.4, 49.2, 50.0, 50.7, 51.5, 52.3, 53.0, 53.8, 54.6, 55.3, 56.1, 56.9, 57.7, 58.5, 59.4, 60.2, 61.1, 62.0, 63.0, 64.0, 65.0, 66.1, 67.3, 68.5, 69.9, 71.3, 72.9, 74.8, 76.8, 79.3, 82.3, 86.2, 91.8, 100.0];
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            int i = scoreDetails.getScore();
            double score = table[i];
            return score
        }
    }

    class PhysicalFunctionFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO;
            }
            double score = ((scoreDetails.getScore() - scoreDetails.getAnsweredQuestions()) / scoreDetails.getAnsweredQuestions()) * 25;
            String value = "" + roundOffToTwoDecimalPlaces(score)
            return value
        }
    }

    class SocialFunctionFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO;
            }
            double score = ((scoreDetails.getScore() - scoreDetails.getAnsweredQuestions()) / scoreDetails.getAnsweredQuestions()) * 20;
            String value = "" + roundOffToTwoDecimalPlaces(score);
            return value
        }
    }

    class Section {
        private BahmniObservation sectionObservation;
        private String scoreConceptName;
        private ScoreCalculationType scoreType;
        private Formula formula;

        Section(ScoreCalculationType scoreType, Formula formula, BahmniObservation formObs, String scoreConceptName) {
            this.scoreType = scoreType
            this.sectionObservation = formObs
            this.scoreConceptName = scoreConceptName
            this.formula = formula
        }

        void setScore() {
            if (sectionObservation != null) {
                ScoreDetails scoreDetails = scoreType.getScoreDetails(sectionObservation)
                BahmniObservation scoreObservation = find(this.scoreConceptName, sectionObservation.getGroupMembers(), null)
                if (scoreDetails.getAnsweredQuestions() == 0) {
                    voidObs(scoreObservation)
                    voidObs(sectionObservation)
                } else {
                    scoreObservation = hasValue(scoreObservation) ? scoreObservation : createObs(scoreConceptName, sectionObservation, null, getDate(sectionObservation))
                    String value = formula.applyFormulaOnScore(scoreDetails)
                    scoreObservation.setValue(value)
                }
            }
        }
    }

    void run(BahmniEncounterTransaction bahmniEncounterTransaction) {
        Collection<BahmniObservation> observations = bahmniEncounterTransaction.getObservations()
        BahmniObservation baselineVitalsForm = find("Vital Signs", observations, null)
        if (baselineVitalsForm != null) {
            calculateBMIAndSave(baselineVitalsForm, "Height", "Weight", "BMI Data", "BMI", "calculateBMI")
        }
        BahmniObservation patientRelatedMedicalInfo = find("CPA, Patient related medical information", observations, null)
        if (patientRelatedMedicalInfo != null) {
            calculateBMIAndSave(patientRelatedMedicalInfo, "CPA, Height", "CPA, Weight", "CPA, BMI", "BMI Computed", "calculateBMI")
            calculateBMIAndSave(patientRelatedMedicalInfo, "CPA, Ideal body weight (IBW)", "CPA, Weight", "CPA, Adjusted body weight (ABW)", "ABW Computed", "calculateABW")
        }
        BahmniObservation functionalScoreInNPForm = find("NP, Functional score", observations, null)
        if (functionalScoreInNPForm != null) {
            calculateFIMScore(functionalScoreInNPForm)
            calculateAIMTScore(functionalScoreInNPForm)
        }
        BahmniObservation sollermannTestTotalScoreInOTAForm = find("OTA, Sollermann test", observations, null)
        if (sollermannTestTotalScoreInOTAForm != null) {
            calculateSollermannTestTotalScore(sollermannTestTotalScoreInOTAForm)
        }
        BahmniObservation temperatureInPPNForm = find("Physician Progress Note-Ward", observations, null)
        if (temperatureInPPNForm != null) {
            restrictTemperatureToOneDecimal(temperatureInPPNForm)
        }
        calculateScores(observations)
        voidExistingObservationWithoutValue(observations)
    }

    static Double getValueFromConceptName(String conceptName) {
        return Double.parseDouble(conceptName.split("= ")[0]);
    }

    static void voidExistingObservationWithoutValue(Collection<BahmniObservation> observations) {
        for (BahmniObservation observation : observations) {
            if (observation.getGroupMembers().size() > 0) {
                voidExistingObservationWithoutValue(observation.getGroupMembers())
                observation.getVoided() || observation.setVoided(canBeVoided(observation))
            }
        }
    }

    static boolean isGroupWithOnlyVoidedMembers(BahmniObservation observation) {
        for (BahmniObservation groupMember : observation.getGroupMembers()) {
            if (!groupMember.getVoided()) {
                return false;
            }
        }
        return true;
    }

    static boolean canBeVoided(BahmniObservation bahmniObservation) {
        return (bahmniObservation.getUuid() != null && (bahmniObservation.getGroupMembers().size() == 0 || isGroupWithOnlyVoidedMembers(bahmniObservation)))
    }

    def calculateScores(Collection<BahmniObservation> observations) {
        ScoreCalculationType defaultScoreCalculation = new DefaultScoreCalculation();
        Formula extremityFunctionFormula = new ExtremityFunctionFormula()
        Formula defaultScoreFormula = new DefaultFormula()
        Formula riskFallsFormula = new RiskFallsFormula()
        Formula physicalFunctionFormula = new PhysicalFunctionFormula()
        Formula socialFunctionFormula = new SocialFunctionFormula()
        Formula functionalIndexTableFormula = new FunctionalIndexTableFormula()
        Formula averageFormula = new AverageFormula()
        Formula pressureInjuryriskFormula = new TotalPressureInjuryRiskScoreFormula()
        Section lowerLimbExtremityFunction = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Lower Extremity Functional Index (LEFI)", observations, null),
                "LLA LEFI, Total Score")
        Section lowerLimbPediatricExtremityFunction = new Section(
                defaultScoreCalculation,
                extremityFunctionFormula,
                find("LLA, Pediatric Lower Extremity Function(Mobility)", observations, null),
                "LLA Pediatric, Total Score");
        Section lowerLimbGaitSection = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Gait Section", observations, null),
                "LLA, Gait Score")
        Section lowerLimbBalanceSection = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Balance Section", observations, null),
                "LLA, Balance Score")
        Section lowerLimbBalanceAssessmentSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("LLA, Gait Score", "LLA, Balance Score")),
                defaultScoreFormula,
                find("LLA, Tinetti Balance Assessment Tool", observations, null),
                "LLA, Total Score")
        Section lowerLimbRiskFallsSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("LLA, Gait Score", "LLA, Balance Score")),
                riskFallsFormula,
                find("LLA, Tinetti Balance Assessment Tool", observations, null),
                "LLA, Risk of Falls")
        Section upperLimbPediatricExtremityFunction = new Section(
                defaultScoreCalculation,
                extremityFunctionFormula,
                find("ULA, Pediatric Upper Extremity Function ( Fine Motor, ADL)", observations, null),
                "ULA, Total score")
        Section upperLimbExtremityFunction = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("ULA, (UEFI) Upper Extremity Functional Index", observations, null),
                "ULA, Total raw score")
        Section upperLimbExtremityFinalScoreFunction = new Section(
                defaultScoreCalculation,
                functionalIndexTableFormula,
                find("ULA, (UEFI) Upper Extremity Functional Index", observations, null),
                "ULA, Final score")
        Section facialDisabiltyPhysicalFunction = new Section(
                defaultScoreCalculation,
                physicalFunctionFormula,
                find("MPA, Physical Function", observations, null),
                "MPA, Physical Function Score")
        Section facialDisabilitySocialFunction = new Section(
                defaultScoreCalculation,
                socialFunctionFormula,
                find("MPA, Social Function", observations, null),
                "MPA, Social Wellbeing Score")
        Section facialDisabilityIndexFunction = new Section(
                new AggregateScoreCalculation(Arrays.asList("MPA, Physical Function Score", "MPA, Social Wellbeing Score")),
                averageFormula,
                find("MPA, Facial Disability Index", observations, null),
                "MPA, Total score (FDI)")
        Section upperLimbGripSection = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("ULA, Basic Grip Test", observations, null),
                "ULA, Basic grip test, total score")
        Section pressureInjuryRiskAssessment = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("VS, Pressure injury risk assessment", observations, null),
                "VS, Total risk score")
        Section totalPressureInjuryRiskLevelSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("VS, Total risk score")),
                pressureInjuryriskFormula,
                find("VS, Pressure injury risk assessment", observations, null),
                "VS, Total Pressure Injury Risk Level")       

        Section[] forms = [lowerLimbGaitSection,
                           lowerLimbBalanceSection,
                           lowerLimbBalanceAssessmentSection,
                           lowerLimbExtremityFunction,
                           lowerLimbPediatricExtremityFunction,
                           upperLimbPediatricExtremityFunction,
                           upperLimbExtremityFunction,
                           upperLimbExtremityFinalScoreFunction,
                           facialDisabiltyPhysicalFunction,
                           facialDisabilitySocialFunction,
                           facialDisabilityIndexFunction,
                           lowerLimbRiskFallsSection,
                           upperLimbGripSection,
                           pressureInjuryRiskAssessment,
                           totalPressureInjuryRiskLevelSection]
        for (Section form : forms) {
            form.setScore();
        }
    }

    static
    private List<BahmniObservation> getAllGroupMembersWithConcept(String conceptName, Collection<BahmniObservation> observations) {
        List<BahmniObservation> groupMembers = new ArrayList<>();
        for (BahmniObservation observation : observations) {
            if (conceptName.equalsIgnoreCase(observation.getConcept().getName())) {
                groupMembers.add(observation);
            }
        }
        return groupMembers
    }

    static def calculateBMIAndSave(BahmniObservation baselineForm, String fieldOne, String fieldTwo, String fieldParent, String fieldCalValue, String funcName) {
        Collection<BahmniObservation> observations = baselineForm.getGroupMembers()
        BahmniObservation feildOneObservation = find(fieldOne, observations, null)
        BahmniObservation feildTwoObservation = find(fieldTwo, observations, null)
        BahmniObservation fieldParentObservation = find(fieldParent, observations, null)
        BahmniObservation fieldCalValueObservation = fieldParentObservation ? find(fieldCalValue, fieldParentObservation.getGroupMembers(), null) : null

        if ((feildOneObservation && feildOneObservation.voided) || (feildTwoObservation && feildTwoObservation.voided)) {
            voidObs(fieldParentObservation)
            voidObs(fieldCalValueObservation)
            return
        }
        if (hasValue(feildOneObservation) && hasValue(feildTwoObservation)) {
            Double fieldOneValue = feildOneObservation.getValue() as Double
            Double fieldTwoValue = feildTwoObservation.getValue() as Double
            Date obsDatetime = getDate(feildTwoObservation) != null ? getDate(feildTwoObservation) : getDate(feildOneObservation)

            fieldParentObservation = fieldParentObservation ?: createObs(fieldParent, baselineForm, null, obsDatetime) as BahmniObservation
            fieldCalValueObservation = fieldCalValueObservation ?: createObs(fieldCalValue, fieldParentObservation, null, obsDatetime) as BahmniObservation;

            def calculatedValue;
            if(funcName == "calculateABW"){
                calculatedValue = calculateABW(fieldOneValue, fieldTwoValue)
            }

            if(funcName == "calculateBMI"){
                calculatedValue = calculateBMI(fieldOneValue, fieldTwoValue)
            }

            fieldCalValueObservation.setValue(calculatedValue);
        }
    }

    static def calculateFIMScore(BahmniObservation functionalScoreInNPForm) {
        Collection<BahmniObservation> observations = functionalScoreInNPForm.getGroupMembers()
        BahmniObservation lowerFimObservation = find("NP, Total lower limb sub-score (FIM)", observations, null)
        BahmniObservation upperFimObservation = find("NP, Total upper limb sub-score (FIM)", observations, null)
        BahmniObservation fimObservation = find("NP, Total Modified Functional Independence Measure (FIM) score", observations, null)

        if (!(hasValue(lowerFimObservation)) && !(hasValue(upperFimObservation))) {
            voidObs(fimObservation)
            return
        }
        Double lowerFim = hasValue(lowerFimObservation) ? lowerFimObservation.getValue() as Double : 0
        Double upperFim = hasValue(upperFimObservation) ? upperFimObservation.getValue() as Double : 0
        Date obsDatetime = getDate(lowerFimObservation) != null ? getDate(lowerFimObservation) : getDate(upperFimObservation)
        fimObservation = fimObservation ?: createObs("NP, Total Modified Functional Independence Measure (FIM) score", functionalScoreInNPForm, null, obsDatetime) as BahmniObservation;
        fimObservation.setValue(roundOffToTwoDecimalPlaces(lowerFim + upperFim))
    }

    static def calculateAIMTScore(BahmniObservation functionalScoreInNPForm) {
        Collection<BahmniObservation> observations = functionalScoreInNPForm.getGroupMembers()
        BahmniObservation coreAimtObservation = find("NP, Total core score (AIM-T)", observations, null)
        BahmniObservation lowerAimtObservation = find("NP, Total lower limb score (AIM-T)", observations, null)
        BahmniObservation upperAimtObservation = find("NP, Total upper limb score (AIM-T)", observations, null)
        BahmniObservation activeAimtScoreObservation = find("NP, Activity Independence Measure for Trauma (AIM-T) score", observations, null)

        if (!(hasValue(coreAimtObservation)) && !(hasValue(lowerAimtObservation)) && !(hasValue(upperAimtObservation))) {
            voidObs(activeAimtScoreObservation)
            return
        }
        Double coreAimt = hasValue(coreAimtObservation) ? coreAimtObservation.getValue() as Double : 0
        Double lowerAimt = hasValue(lowerAimtObservation) ? lowerAimtObservation.getValue() as Double : 0
        Double upperAimt = hasValue(upperAimtObservation) ? upperAimtObservation.getValue() as Double : 0
        Date obsDatetime = getDate(coreAimtObservation) != null ? getDate(coreAimtObservation)
                : (getDate(lowerAimtObservation) != null ? getDate(lowerAimtObservation) : getDate(upperAimtObservation))
        activeAimtScoreObservation = activeAimtScoreObservation ?: createObs("NP, Activity Independence Measure for Trauma (AIM-T) score", functionalScoreInNPForm, null, obsDatetime) as BahmniObservation;
        activeAimtScoreObservation.setValue(roundOffToTwoDecimalPlaces(coreAimt + lowerAimt + upperAimt))
    }

    static def calculateSollermannTestTotalScore(BahmniObservation sollermannTestTotalScoreInOTAForm) {
        Collection<BahmniObservation> observations = sollermannTestTotalScoreInOTAForm.getGroupMembers()
        BahmniObservation ans1Observation = find("OTA, Put key into Yale lock, turn 90 degrees", observations, null)
        BahmniObservation ans2Observation = find("OTA, Pick up coins up from flat surface, put into purses mounted on wall", observations, null)
        BahmniObservation ans3Observation = find("OTA, Pick up coins from purses", observations, null)
        BahmniObservation ans4Observation = find("OTA, Lift telephone receiver, put to ear", observations, null)
        BahmniObservation ans5Observation = find("OTA, Turn door-handle 30 degrees", observations, null)
        BahmniObservation ans6Observation = find("OTA, Lift wooden cubes over edge 5 cm in height", observations, null)
        BahmniObservation ans7Observation = find("OTA, Lift iron over edge 5 cm in height", observations, null)
        BahmniObservation ans8Observation = find("OTA, Turn screw with screwdriver", observations, null)
        BahmniObservation ans9Observation = find("OTA, Pick up nuts", observations, null)
        BahmniObservation ans10Observation = find("OTA, Open/close zip", observations, null)
        BahmniObservation ans11Observation = find("OTA, Put on tub grip stocking on the other hand", observations, null)
        BahmniObservation ans12Observation = find("OTA, Write with pen", observations, null)
        BahmniObservation ans13Observation = find("OTA, Do up buttons", observations, null)
        BahmniObservation ans14Observation = find("OTA, Unscrew lid of jars", observations, null)
        BahmniObservation ans15Observation = find("OTA, Put paper-clip on envelope", observations, null)
        BahmniObservation ans16Observation = find("OTA, Cut play-doh with knife and fork", observations, null)
        BahmniObservation ans17Observation = find("OTA, Fold paper, put into envelope", observations, null)
        BahmniObservation ans18Observation = find("OTA, Pour water from pure-pak", observations, null)
        BahmniObservation ans19Observation = find("OTA, Pour water from jug", observations, null)
        BahmniObservation ans20Observation = find("OTA, Pour water from cup", observations, null)
        BahmniObservation sollermannTestTotalScoreObservation = find("OTA, Sollermann test total score", observations, null)

        BahmniObservation[] answerObservations = [
            ans1Observation,
            ans2Observation,
            ans3Observation,
            ans4Observation,
            ans5Observation,
            ans6Observation,
            ans7Observation,
            ans8Observation,
            ans9Observation,
            ans10Observation,
            ans11Observation,
            ans12Observation,
            ans13Observation,
            ans14Observation,
            ans15Observation,
            ans16Observation,
            ans17Observation,
            ans18Observation,
            ans19Observation,
            ans20Observation
        ]

        Boolean ret = true
        for (BahmniObservation observation : answerObservations) {
            ret = ret && !(hasValue(observation))
        }

        if (ret) {
            voidObs(sollermannTestTotalScoreObservation)
            return
        }

        Double answer = 0
        for (BahmniObservation observation : answerObservations) {
            if(hasValue(observation)){
                String val = observation.getValue().get('displayString') == null ? observation.getValue().get('name') : observation.getValue().get('displayString')
                answer += Double.parseDouble((val))
            }
        }

        sollermannTestTotalScoreObservation = sollermannTestTotalScoreObservation ?: createObs("OTA, Sollermann test total score", sollermannTestTotalScoreInOTAForm, null, getDate(sollermannTestTotalScoreInOTAForm)) as BahmniObservation
        sollermannTestTotalScoreObservation.setValue(roundOffToTwoDecimalPlaces(answer))
    }

    private static Date getDate(BahmniObservation observation) {
        return hasValue(observation) && !observation.voided ? observation.getObservationDateTime() : null;
    }

    private static boolean hasValue(BahmniObservation observation) {
        return observation != null && observation.getValue() != null && !StringUtils.isEmpty(observation.getValue().toString());
    }

    private static void voidObs(BahmniObservation observation) {
        if (hasValue(observation)) {
            observation.voided = true
        }
    }

    static BahmniObservation createObs(String conceptName, BahmniObservation parent, BahmniEncounterTransaction encounterTransaction, Date obsDatetime) {
        def concept = Context.getConceptService().getConceptByName(conceptName)
        BahmniObservation newObservation = new BahmniObservation()
        newObservation.setConcept(new EncounterTransaction.Concept(concept.getUuid(), conceptName))
        newObservation.setObservationDateTime(obsDatetime);
        parent == null ? encounterTransaction.addObservation(newObservation) : parent.addGroupMember(newObservation)
        return newObservation
    }

    static def Double calculateBMI(Double height, Double weight) {
        if (height == ZERO) {
            throw new IllegalArgumentException("Please enter Height greater than zero")
        } else if (weight == ZERO) {
            throw new IllegalArgumentException("Please enter Weight greater than zero")
        }
        Double heightInMeters = height / 100;
        Double value = weight / (heightInMeters * heightInMeters);
        return roundOffToTwoDecimalPlaces(value);
    };

    static Double roundOffToOneDecimalPlace(Double value) {
        return new BigDecimal(value).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    static Double roundOffToTwoDecimalPlaces(Double value) {
        return new BigDecimal(value).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    static def restrictTemperatureToOneDecimal(BahmniObservation temperatureInPPNForm) {
        Collection<BahmniObservation> observations = temperatureInPPNForm.getGroupMembers();
        BahmniObservation temperatureObservation = find("PPN, Temperature", observations, null);

        if (!(hasValue(temperatureObservation))) {
            return;
        }

        Double temperature = hasValue(temperatureObservation) ? temperatureObservation.getValue() as Double : 0;
        temperatureObservation.setValue(roundOffToOneDecimalPlace(temperature));
    }

    static BahmniObservation find(String conceptName, Collection<BahmniObservation> observations, BahmniObservation parent) {
        for (BahmniObservation observation : observations) {
            if (conceptName.equalsIgnoreCase(observation.getConcept().getName())) {
                return observation;
            }
            BahmniObservation matchingObservation = find(conceptName, observation.getGroupMembers(), observation)
            if (matchingObservation) return matchingObservation;
        }
        return null
    }

    static def Double calculateABW(Double IBW, Double ABW) {
        if (IBW == ZERO) {
            throw new IllegalArgumentException("Please enter ideal body weight greater than zero")
        } else if (ABW == ZERO) {
            throw new IllegalArgumentException("Please enter actual body Weight greater than zero")
        }
        Double value = IBW + 0.4 * (ABW - IBW);
        return roundOffToTwoDecimalPlaces(value);
    };

}
