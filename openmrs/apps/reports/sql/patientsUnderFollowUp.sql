SELECT
  nwFlpStateAndOutcomeInfo.patient_id,
  MIN(nwFlpStateAndOutcomeInfo.start_date) AS start_date,
  nwFlpStateAndOutcomeInfo.end_date
FROM
  (SELECT
     allStates.patient_id,
     nextStates.start_date,
     nextStates.end_date
   FROM
     (SELECT
        patient_id,
        name,
        start_date,
        end_date
      FROM patient_state ps
        INNER JOIN patient_program pp
          ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
        INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
        LEFT JOIN concept_name cn
          ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
     ) allStates
     LEFT JOIN (
                 SELECT
                   patient_id,
                   name,
                   start_date,
                   IF(name = 'Network Follow-up' AND end_date IS NULL, CURDATE(), end_date) AS end_date
                 FROM patient_state ps
                   INNER JOIN patient_program pp
                     ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
                   INNER JOIN program_workflow_state pws
                     ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
                   LEFT JOIN concept_name cn
                     ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND
                        cn.voided IS FALSE
               ) nextStates ON allStates.patient_id = nextStates.patient_id AND
                               allStates.end_date = nextStates.start_date
   WHERE allStates.name IN ('Pre-Operative', 'Surgical / Hospitalisation', 'Rehabilitation') AND
         nextStates.name = 'Network Follow-up'
   UNION
   SELECT
     continueUnderFlpOutcome.patient_id,
     continueUnderFlpOutcome.flpOutcomeObsDate,
     MIN(IF(allPreOpSurgRehabStates.start_date IS NULL, CURDATE(),
            allPreOpSurgRehabStates.start_date)) AS preOrSurgOrRehabStartDate
   FROM
     (SELECT
        person_id                    AS patient_id,
        CAST(o.obs_datetime AS DATE) AS flpOutcomeObsDate,
        cna.concept_full_name        AS fupOutCome
      FROM obs o
        INNER JOIN concept_view cnq
          ON o.concept_id = cnq.concept_id AND cnq.concept_full_name = 'FUP, Outcomes for follow-up surgical validation'
             AND cnq.retired IS FALSE AND o.voided IS FALSE
        INNER JOIN concept_view cna ON cna.concept_id = o.value_coded AND
                                       cna.concept_full_name = 'Continue under follow-up' AND
                                       cna.retired IS FALSE) continueUnderFlpOutcome
     LEFT JOIN (
                 SELECT
                   patient_id,
                   name,
                   start_date,
                   end_date
                 FROM patient_state ps
                   INNER JOIN patient_program pp
                     ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
                   INNER JOIN program_workflow_state pws
                     ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
                   LEFT JOIN concept_name cn
                     ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND
                        cn.voided IS FALSE
                 WHERE name IN ('Pre-Operative', 'Surgical / Hospitalisation', 'Rehabilitation')
               ) allPreOpSurgRehabStates ON continueUnderFlpOutcome.patient_id = allPreOpSurgRehabStates.patient_id AND
                                            continueUnderFlpOutcome.flpOutcomeObsDate <
                                            allPreOpSurgRehabStates.start_date
   GROUP BY continueUnderFlpOutcome.patient_id, continueUnderFlpOutcome.flpOutcomeObsDate
  ) nwFlpStateAndOutcomeInfo
GROUP BY nwFlpStateAndOutcomeInfo.patient_id, nwFlpStateAndOutcomeInfo.end_date;