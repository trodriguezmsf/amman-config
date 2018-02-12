SELECT
  patientAttributes.patient_id,
  patientAttributes.Age,
  patientAttributes.Sex,
  patientAttributes.nationality,
  patientAttributes.`need for caretaker`,
  preOpDate.preOpStartDate
FROM
(SELECT
  p.patient_id                                                                                  AS `patient_id`,
  TIMESTAMPDIFF(YEAR, person.birthdate, CURDATE())                                              AS `Age`,
  person.gender                                                                                 AS `Sex`,
  GROUP_CONCAT(IF(pat.name = 'nationality1', cv.concept_full_name, NULL))                       AS nationality,
  GROUP_CONCAT(IF(pat.name = 'isCareTakerRequired', IF(pa.value = 'true', 'Yes', 'No'), NULL))  AS `need for caretaker`
FROM patient p
  JOIN person ON p.patient_id = person.person_id AND person.voided IS FALSE AND p.voided IS FALSE
  JOIN person_attribute_type pat ON pat.name IN ('nationality1', 'isCareTakerRequired')
  LEFT JOIN person_attribute pa
    ON pa.person_id = p.patient_id AND pa.voided IS FALSE AND pat.person_attribute_type_id = pa.person_attribute_type_id
  LEFT JOIN concept_view cv ON cv.concept_id = pa.value
GROUP BY p.patient_id) patientAttributes
INNER JOIN
(SELECT
        patient_id,
        CAST(start_date AS DATE ) AS preOpStartDate
      FROM patient_state ps
        INNER JOIN patient_program pp
          ON pp.patient_program_id = ps.patient_program_id AND ps.voided IS FALSE AND pp.voided IS FALSE
        INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
        LEFT JOIN concept_name cn
          ON pws.concept_id = cn.concept_id AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
      WHERE cn.name IN ('Pre-Operative')) preOpDate ON patientAttributes.patient_id = preOpDate.patient_id
WHERE YEAR(preOpDate.preOpStartDate) = YEAR('#startDate#');