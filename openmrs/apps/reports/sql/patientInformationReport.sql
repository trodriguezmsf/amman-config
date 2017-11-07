SELECT
  p.patient_id                                                     AS `patient_id`,
  pi.identifier                                                    AS `identifier`,
  person.gender                                                    AS sex,
  TIMESTAMPDIFF(YEAR, person.birthdate, CURDATE())                 AS age,
  p_addr.state_province                                            AS governorate,
  p_addr.address3                                                  AS country,
  MAX(IF(pat.name='nameoftheCamp', cv.concept_full_name, NULL))    AS `name of camp`,
  MAX(IF(pat.name='occupation', pa.value, NULL))                   AS occupation,
  MAX(IF(pat.name='nationality1', cv.concept_full_name, NULL))     AS nationality,
  MAX(IF(pat.name='isCareTakerRequired', IF(pa.value='true', 'Yes', 'No'), NULL)) AS `need for caretaker`,
  MAX(IF(pat.name='dateofArrival', DATE_FORMAT(pa.value, '%d/%m/%Y'), NULL)) AS `date of arrival`
FROM patient p
  JOIN person ON p.patient_id = person.person_id AND person.voided IS FALSE AND p.voided IS FALSE
  JOIN patient_identifier pi ON pi.patient_id = p.patient_id AND pi.voided IS FALSE
  JOIN patient_program pp ON p.patient_id = pp.patient_id
  JOIN person_attribute_type pat  ON pat.name IN ('nameoftheCamp', 'dateofArrival', 'occupation', 'nationality1', 'isCareTakerRequired')
  LEFT JOIN person_attribute pa ON pa.person_id = p.patient_id AND pa.voided IS FALSE AND pat.person_attribute_type_id = pa.person_attribute_type_id
  LEFT JOIN concept_view cv ON cv.concept_id = pa.value
  LEFT JOIN person_address p_addr ON p_addr.person_id = p.patient_id
  GROUP BY p.patient_id;











