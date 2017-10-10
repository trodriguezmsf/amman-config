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

    interface Formula {
        Double applyFormulaOnScore(ScoreDetails scoreDetails)
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
                    score += childObs.getValue()
                    answeredQuestions += 1;
                }
            }
            return new ScoreDetails(score, totalQuestions, answeredQuestions)
        }
    }

    class ExtremityFunctionFormula implements Formula {
        @Override
        Double applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
            double score = scoreDetails.areAllQuestionsAnswered() ? scoreDetails.getScore() * 1.25 : (scoreDetails.getScore() + scoreDetails.getScore() / scoreDetails.getAnsweredQuestions()) * 1.25;
            return roundOffToTwoDecimalPlaces(score)
        }
    }

    class DefaultFormula implements Formula {
        @Override
        Double applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
            return roundOffToTwoDecimalPlaces(scoreDetails.getScore())
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
                    double value = formula.applyFormulaOnScore(scoreDetails)
                    scoreObservation.setValue(value)
                }
            }

        }
    }

    void run(BahmniEncounterTransaction bahmniEncounterTransaction) {
        Collection<BahmniObservation> observations = bahmniEncounterTransaction.getObservations()
        BahmniObservation baselineVitalsForm = find("Baseline Vital Signs", observations, null)
        if (baselineVitalsForm != null) {
            calculateBMIAndSave(baselineVitalsForm)
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
        Section lowerLimbExtremityFunction = new Section(
                defaultScoreCalculation,
                extremityFunctionFormula,
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
        Section lowerLimbBalanceAssessmentSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("LLA, Gait Score", "LLA, Balance Score")),
                defaultScoreFormula,
                find("LLA, Tinetti Balance Assessment Tool", observations, null),
                "LLA, Total Score")
        Section lowerLimbBalanceSection = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Balance Section", observations, null),
                "LLA, Balance Score")
        Section[] forms = [lowerLimbExtremityFunction,
                           lowerLimbPediatricExtremityFunction,
                           lowerLimbGaitSection,
                           lowerLimbBalanceSection,
                           lowerLimbBalanceAssessmentSection]
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

    static def calculateBMIAndSave(BahmniObservation baselineForm) {
        Collection<BahmniObservation> observations = baselineForm.getGroupMembers()
        BahmniObservation heightObservation = find("Height", observations, null)
        BahmniObservation weightObservation = find("Weight", observations, null)
        BahmniObservation bmiDataObservation = find("BMI Data", observations, null)
        BahmniObservation bmiObservation = bmiDataObservation ? find("BMI", bmiDataObservation.getGroupMembers(), null) : null

        if ((heightObservation && heightObservation.voided) || (weightObservation && weightObservation.voided)) {
            voidObs(bmiDataObservation)
            voidObs(bmiObservation)
            return
        }
        if (hasValue(heightObservation) && hasValue(weightObservation)) {
            Double height = heightObservation.getValue() as Double
            Double weight = weightObservation.getValue() as Double
            Date obsDatetime = getDate(weightObservation) != null ? getDate(weightObservation) : getDate(heightObservation)

            bmiDataObservation = bmiDataObservation ?: createObs("BMI Data", baselineForm, null, obsDatetime) as BahmniObservation
            bmiObservation = bmiObservation ?: createObs("BMI", bmiDataObservation, null, obsDatetime) as BahmniObservation;
            def bmi = calculateBMI(height, weight)
            bmiObservation.setValue(bmi);
        }
    }

    private static Date getDate(BahmniObservation observation) {
        return hasValue(observation) && !observation.voided ? observation.getObservationDateTime() : null;
    }

    private static boolean hasValue(BahmniObservation observation) {
        return observation != null && observation.getValue() != null && !StringUtils.isEmpty(observation.getValue().toString());
    }

    private static void voidObs(BahmniObservation bmiObservation) {
        if (hasValue(bmiObservation)) {
            bmiObservation.voided = true
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

    static Double roundOffToTwoDecimalPlaces(Double value) {
        return new BigDecimal(value).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
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

}
