SELECT
  pp.patient_id,
  min(ps.start_date)                                                                          StartDate,
  IF(max(ps.end_date) IS NOT NULL, max(ps.end_date), DATE_ADD(curdate(), INTERVAL 31 DAY)) AS EndDate
FROM patient_state ps
  INNER JOIN patient_program pp
    ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
  INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
  LEFT JOIN concept_name cn
    ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
WHERE cn.name IN ('Pre-Operative', 'Surgical / Hospitalisation', 'Rehabilitation')
GROUP BY pp.patient_id