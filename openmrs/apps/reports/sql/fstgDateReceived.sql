SELECT
  dateRecieved.person_id,
  dateRecieved.dateOfFileRecieved
FROM
  (SELECT
     o.person_id,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'FSTG, Date received', CAST(o.value_datetime AS DATE),
                     NULL)) AS `dateOfFileRecieved`
   FROM obs o
     INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                     qcvn.concept_full_name IN (
                                       'FSTG, Date received') AND qcvn.retired IS FALSE AND o.voided IS FALSE
     LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
   GROUP BY o.encounter_id
  ) dateRecieved
  INNER JOIN (
               SELECT
                 p.patient_id,
                 cn.name,
                 CAST(ps.start_date AS DATE)                    AS `startDate`,
                 COALESCE(CAST(ps.end_date AS DATE), CURDATE()) AS `endDate`
               FROM patient p
                 INNER JOIN patient_program pp
                   ON p.patient_id = pp.patient_id AND p.voided IS FALSE AND pp.voided IS FALSE
                 INNER JOIN patient_state ps ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE
                 INNER JOIN program_workflow_state pws
                   ON ps.state = pws.program_workflow_state_id AND ps.voided IS FALSE AND pws.retired IS FALSE
                 INNER JOIN concept_name cn
                   ON pws.concept_id = cn.concept_id AND cn.voided IS FALSE AND cn.concept_name_type = 'FULLY_SPECIFIED'
               WHERE cn.name = 'Identification') identificationStateDetails
    ON identificationStateDetails.patient_id = dateRecieved.person_id AND
       dateOfFileRecieved BETWEEN startDate AND endDate
