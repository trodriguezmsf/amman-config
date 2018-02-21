SELECT
  person_id,
  CAST(sapDateOfConsultation AS DATE)          AS sapDateOfConsultation,
  CAST(MAX(preOpStartDate.start_date) AS DATE) AS `recentPreOperativeDate`
FROM
  (SELECT
     o.person_id,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'SAP, Date of consultation', CAST(o.value_datetime AS DATE),
                     NULL)) AS `sapDateOfConsultation`
   FROM obs o
     INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                     qcvn.concept_full_name IN (
                                       'SAP, Date of consultation'
                                     ) AND qcvn.retired IS FALSE AND o.voided IS FALSE
     LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
   GROUP BY o.encounter_id
   ORDER BY o.person_id) dateOfConsultation
  INNER JOIN
  (SELECT
     pp3.patient_id,
     ps3.start_date,
     cn.name
   FROM patient_state ps3
     INNER JOIN patient_program pp3 ON ps3.patient_program_id = pp3.patient_program_id AND
                                       pp3.voided IS FALSE AND ps3.voided IS FALSE
     INNER JOIN program_workflow_state pws
       ON ps3.state = pws.program_workflow_state_id AND pws.retired IS FALSE
     INNER JOIN concept_name cn
       ON cn.concept_id = pws.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
   WHERE cn.name = 'Pre-Operative') preOpStartDate ON preOpStartDate.patient_id = dateOfConsultation.person_id AND
                                                      preOpStartDate.start_date <=
                                                      dateOfConsultation.sapDateOfConsultation
GROUP BY preOpStartDate.patient_id, dateOfConsultation.sapDateOfConsultation