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
    static Map<String, Double> conceptValues;

    static {
        conceptValues = new HashMap<String, Double>();
        conceptValues.put("(0) No difficulty", 0);
        conceptValues.put("(1) With a little difficulty", 1);
        conceptValues.put("(2) With moderate difficulty", 2);
        conceptValues.put("(3) With much difficulty", 3);
        conceptValues.put("(4) Extremely difficult or unable to do", 4);

        conceptValues.put("(0) Not able to do", 0);
        conceptValues.put("(1) With a lot of trouble", 1);
        conceptValues.put("(2) With some trouble", 2);
        conceptValues.put("(3) With a little trouble", 3);
        conceptValues.put("(4) With no trouble", 4);

        conceptValues.put("0 = Any hesitancy or multiple attempts", 0)
        conceptValues.put("1 = No hesitancy", 1)
        conceptValues.put("0 = Steps to", 0)
        conceptValues.put("1 = Steps through R", 1)
        conceptValues.put("1 = Steps through L", 1)
        conceptValues.put("0 = Foot drop", 0)
        conceptValues.put("1 = L foot clears floor", 1)
        conceptValues.put("1 = R foot clears floor", 1)
        conceptValues.put("0 = Right and left step length not equal", 0)
        conceptValues.put("1 = Right and left step length appear equal", 1)
        conceptValues.put("0 = Stopping or discontinuity between steps", 0)
        conceptValues.put("1 = Steps appear Continuous", 1)
        conceptValues.put("0 = Marked deviation", 0)
        conceptValues.put("1 = Mild/moderate deviation or uses w. Aid", 1)
        conceptValues.put("2 = Straight without w. aid", 2)
        conceptValues.put("0 = Marked sway or uses w. Aid", 0)
        conceptValues.put("1 = No sway but flex. Knees or back or uses arms for stability", 1)
        conceptValues.put("2 = No sway, flex., use of arms or w. Aid", 2)
        conceptValues.put("0 = Heels apart", 0)
        conceptValues.put("1 = Heels almot touching while walking", 1)
    }

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

        boolean areAllQuestionsAnswered()  {
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
            double score = 0
            int answeredQuestions = 0, totalQuestions = 0

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
                            score += conceptValues.get(answer);
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

    class GaitSectionFormula implements Formula {
        @Override
        Double applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return 0
            }
            double score = scoreDetails.getScore() / 12;
            return roundOffToTwoDecimalPlaces(score)
        }
    }

    class ExtremityFunctionFormula implements Formula {
        @Override
        Double applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return 0
            }
            double score = scoreDetails.areAllQuestionsAnswered() ? scoreDetails.getScore()* 1.25 : (scoreDetails.getScore() + scoreDetails.getScore() / scoreDetails.getAnsweredQuestions()) * 1.25;
            return roundOffToTwoDecimalPlaces(score)
        }
    }

    class AggregateFormula implements Formula {
        @Override
        Double applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return 0
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

    static void voidExistingObservationWithoutValue(Collection<BahmniObservation> observations) {
        for (BahmniObservation observation : observations) {
            if(observation.getGroupMembers().size() > 0) {
                voidExistingObservationWithoutValue(observation.getGroupMembers())
                observation.getVoided() || observation.setVoided(canBeVoided(observation))
            }
        }
    }

    static boolean isGroupWithOnlyVoidedMembers(BahmniObservation observation) {
        for (BahmniObservation groupMember : observation.getGroupMembers()) {
            if(!groupMember.getVoided()) {
                return false;
            }
        }
        return true;
    }

    static boolean canBeVoided(BahmniObservation bahmniObservation){
        return (bahmniObservation.getUuid()!= null && (bahmniObservation.getGroupMembers().size() == 0 || isGroupWithOnlyVoidedMembers(bahmniObservation)))
    }

    def calculateScores(Collection<BahmniObservation> observations) {
        ScoreCalculationType defaultScoreCalculation = new DefaultScoreCalculation();
        Formula extremityFunctionFormula = new ExtremityFunctionFormula()
        Section lowerLimbExtremityFunction =  new Section(
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
                new GaitSectionFormula(),
                find("LLA, Gait Section", observations, null),
                "LLA, Gait Score")
        Section lowerLimbBalanceAssessmentSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("LLA, Gait Score", "LLA, Balance Section")),
                new AggregateFormula(),
                find("LLA, Tinetti Balance Assessment Tool", observations, null),
                "LLA, Total Score")
        Section[] forms = [lowerLimbExtremityFunction, lowerLimbPediatricExtremityFunction, lowerLimbGaitSection, lowerLimbBalanceAssessmentSection]
        for (Section form : forms) {
            form.setScore();
        }
    }

    static private List<BahmniObservation> getAllGroupMembersWithConcept(String conceptName, Collection<BahmniObservation> observations) {
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
        BahmniObservation bmiObservation = bmiDataObservation ? find("BMI", bmiDataObservation.getGroupMembers(), null): null

        if ((heightObservation && heightObservation.voided) || (weightObservation && weightObservation.voided)) {
            voidObs(bmiDataObservation)
            voidObs(bmiObservation)
            return
        }
        if (hasValue(heightObservation) && hasValue(weightObservation)) {
            Double height =  heightObservation.getValue() as Double
            Double weight =  weightObservation.getValue() as Double
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