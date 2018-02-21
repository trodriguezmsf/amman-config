SELECT *
FROM
(SELECT
  currentAndPrevStates.patient_id,
  currentAndPrevStates.nwFlpStartDate
FROM
  (SELECT
     allCurrentNwFlpStates.patient_id,
     allCurrentNwFlpStates.name,
     allCurrentNwFlpStates.start_date AS nwFlpStartDate,
     MAX(allPreviousStates.start_date) AS previousStateStartDate
   FROM (SELECT
           pp.patient_id,
           cn.name,
           ps.start_date
         FROM patient_state ps
           INNER JOIN patient_program pp
             ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
           INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
           INNER JOIN concept_name cn
             ON pws.concept_id = cn.concept_id AND cn.name = 'Network Follow-up' AND
                cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
          WHERE YEAR(ps.start_date) = YEAR('#startDate#')
        ) allCurrentNwFlpStates
     LEFT JOIN (SELECT
                  pp.patient_id,
                  cn.name,
                  ps.start_date
                FROM patient_state ps
                  INNER JOIN patient_program pp
                    ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
                  INNER JOIN program_workflow_state pws
                    ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
                  INNER JOIN concept_name cn
                    ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND
                       cn.voided IS FALSE
               ) allPreviousStates ON allCurrentNwFlpStates.patient_id = allPreviousStates.patient_id AND
                                      allPreviousStates.start_date < allCurrentNwFlpStates.start_date
   GROUP BY allCurrentNwFlpStates.patient_id, allCurrentNwFlpStates.start_date
  ) currentAndPrevStates
  INNER JOIN (
              SELECT
                pp.patient_id,
                cn.name,
                ps.start_date AS previousStateStartDate
              FROM patient_state ps
                INNER JOIN patient_program pp
                  ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
                INNER JOIN program_workflow_state pws
                  ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
                INNER JOIN concept_name cn
                  ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
            ) allStates ON allStates.patient_id = currentAndPrevStates.patient_id AND
                           allStates.previousStateStartDate = currentAndPrevStates.previousStateStartDate
WHERE allStates.name IN (
  'Pre-Operative',
  'Surgical / Hospitalisation',
  'Rehabilitation'
))curNwAndPrevRehabSurgPreOpStateInfo
UNION
(SELECT
   continueUndrFlpOutcome.patient_id,
   continueUndrFlpOutcome.flpOutcomeObsDate
 FROM
   (SELECT
      person_id             AS patient_id,
      CAST(o.obs_datetime AS DATE) AS flpOutcomeObsDate,
      cna.concept_full_name AS fupOutCome
    FROM obs o
      INNER JOIN concept_view cnq
        ON o.concept_id = cnq.concept_id AND cnq.concept_full_name = 'FUP, Outcomes for follow-up surgical validation'
           AND cnq.retired IS FALSE
      INNER JOIN concept_view cna ON cna.concept_id = o.value_coded AND
                                     cna.concept_full_name = 'Continue under follow-up' AND
                                     cna.retired IS FALSE) continueUndrFlpOutcome
  WHERE YEAR(continueUndrFlpOutcome.flpOutcomeObsDate) = YEAR('#startDate#')
  )
ORDER BY patient_id;