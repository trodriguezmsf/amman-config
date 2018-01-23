SELECT p.patient_id,
  cn.name,
  DATE_FORMAT(ps.start_date,'%c/%e/%y') AS `startDate`,
  DATE_FORMAT(ps.end_date,'%c/%e/%y') AS `endDate`
FROM patient p
INNER JOIN patient_program pp ON p.patient_id = pp.patient_id AND p.voided IS FALSE AND pp.voided IS FALSE
INNER JOIN patient_state ps ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE
INNER JOIN program_workflow_state pws ON ps.state = pws.program_workflow_state_id AND ps.voided IS FALSE AND pws.retired IS FALSE
INNER JOIN concept_name cn ON pws.concept_id = cn.concept_id AND cn.voided IS FALSE AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.name = 'Identification'
ORDER BY patient_id, start_date