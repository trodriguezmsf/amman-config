SELECT
  o.person_id,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Type of anaesthesia administered', acvn.concept_full_name, null))                                 AS `typeOfAnaesthesia`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Anaesthesia start time', DATE_FORMAT(o.value_datetime,'%c/%e/%y'), null))                         AS `anaesthesiaDateStarted`,
  dateOfArrival.`value`                                                                                                                            AS `dateOfArrival`
FROM obs o
  INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                 qcvn.concept_full_name IN (
                                              'APN, Type of anaesthesia administered',
                                              'APN, Anaesthesia start time') AND qcvn.retired IS FALSE AND o.voided IS FALSE
  LEFT JOIN concept_view acvn ON o.value_coded  = acvn.concept_id AND acvn.retired IS FALSE
  LEFT JOIN (SELECT
                pa.person_id,
                DATE_FORMAT(pa.value,'%c/%e/%y') as `value`
    FROM person_attribute pa
  INNER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.name = 'dateOfArrival'
  ) dateOfArrival ON o.person_id = dateOfArrival.person_id
GROUP BY o.encounter_id