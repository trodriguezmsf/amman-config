SELECT * FROM
(SELECT
  p.patient_id                                                                                  AS `patient_id`,
  TIMESTAMPDIFF(YEAR, person.birthdate, CURDATE())                                              AS `Age`,
  person.gender                                                                                 AS `Sex`,
  GROUP_CONCAT(IF(pat.name = 'nationality1', cv.concept_full_name, NULL))                       AS nationality,
  GROUP_CONCAT(IF(pat.name = 'isCareTakerRequired', IF(pa.value = 'true', 'Yes', 'No'), NULL))  AS `need for caretaker`,
  GROUP_CONCAT(IF(pat.name = 'dateofArrival', CAST(pa.value AS DATE ), NULL))         AS `date of arrival`
FROM patient p
  JOIN person ON p.patient_id = person.person_id AND person.voided IS FALSE AND p.voided IS FALSE
  JOIN person_attribute_type pat ON pat.name IN ('dateofArrival', 'nationality1', 'isCareTakerRequired')
  LEFT JOIN person_attribute pa
    ON pa.person_id = p.patient_id AND pa.voided IS FALSE AND pat.person_attribute_type_id = pa.person_attribute_type_id
  LEFT JOIN concept_view cv ON cv.concept_id = pa.value
GROUP BY p.patient_id) patientAttributes
WHERE YEAR(`date of arrival`) = YEAR('#startDate#');