SELECT
  patient_id,
  typeOfAnaesthesia,
  IF((typeOfAnaesthesia LIKE '%GA%' AND typeOfAnaesthesia NOT LIKE '%R%' AND
      typeOfAnaesthesia NOT LIKE '%LOA%'
      AND typeOfAnaesthesia NOT LIKE '%SED%' AND typeOfAnaesthesia NOT LIKE '%INF%'),'Yes', 'No')           AS `generalAnaesthesia`,
  IF((typeOfAnaesthesia LIKE '%R%' AND typeOfAnaesthesia NOT LIKE '%GA%' AND
      typeOfAnaesthesia NOT LIKE '%LOA%'
      AND typeOfAnaesthesia NOT LIKE '%SED%' AND typeOfAnaesthesia NOT LIKE '%INF%'), 'Yes', 'No')          AS `regionalAnaesthesia`,
  IF(((typeOfAnaesthesia LIKE '%SED%' OR typeOfAnaesthesia LIKE '%LOA%' OR typeOfAnaesthesia LIKE '%INF%')
      AND typeOfAnaesthesia NOT LIKE '%GA%' AND typeOfAnaesthesia NOT LIKE '%R%'), 'Yes', 'No')             AS `LSIAnaesthesia`,
  IF((typeOfAnaesthesia LIKE '%GA%' AND (typeOfAnaesthesia LIKE '%R%' OR typeOfAnaesthesia LIKE '%LOA%' OR
                                        typeOfAnaesthesia LIKE '%SED%' OR typeOfAnaesthesia LIKE '%INF%')) OR
     (typeOfAnaesthesia LIKE '%R%' AND (typeOfAnaesthesia LIKE '%LOA%' OR typeOfAnaesthesia LIKE '%SED%' OR
                                        typeOfAnaesthesia LIKE '%INF%')), 'Yes', 'No')                      AS `mixedAnaesthesia`,
  CAST(anaesthesiaDateStarted AS DATE ) AS anaesthesiaDateStarted
FROM
  (SELECT
     o.person_id                                                                                                      AS patient_id,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Type of anaesthesia administered', acvn.concept_full_name,
                     NULL))                                                                                           AS `typeOfAnaesthesia`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Anaesthesia start time', CAST(o.value_datetime AS DATE),
                     NULL))                                                                                           AS `anaesthesiaDateStarted`
   FROM obs o
     INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                     qcvn.concept_full_name IN (
                                       'APN, Type of anaesthesia administered',
                                       'APN, Anaesthesia start time') AND qcvn.retired IS FALSE AND o.voided IS FALSE
     LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
   GROUP BY o.encounter_id) typeOfAnaestesiaInfo;