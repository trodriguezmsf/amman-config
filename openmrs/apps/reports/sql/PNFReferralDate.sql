SELECT
  o.person_id,
  CAST(recentPainSeverity.PNFRefferalDate AS DATE) AS PNFRefferalDate,
  o.value_numeric                                  AS painSeverityValue
FROM obs o
  INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND cn.voided IS FALSE AND
                                o.voided IS FALSE
                                AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                AND cn.name IN (
    'ANA, Pain Severity', 'ULA, Pain Severity', 'WWN, Pain Severity', 'OS, Pain Severity',
    'MPA, Pain Severity', 'ONN, Pain Severity', 'LLA, Pain Severity', 'POW, Pain Severity'
  )
  INNER JOIN
  (SELECT
     PNFDateTime.patient_id,
     PNFDateTime.obs_datetime           AS PNFRefferalDate,
     MAX(painSeverity.painSeverityDate) AS recentPainSeverityDateTime
   FROM
     (SELECT
        person_id AS patient_id,
        obs_datetime,
        e.encounter_id,
        v.visit_id
      FROM obs o
        INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND name = 'PNF, Referral needed:'
                                      AND o.voided IS FALSE AND cn.voided IS FALSE
        INNER JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
        INNER JOIN visit v ON v.visit_id = e.visit_id AND v.voided IS FALSE) PNFDateTime
     LEFT JOIN
     (SELECT
        e.patient_id,
        obs_datetime AS painSeverityDate,
        v.visit_id,
        name         AS painSeverityName
      FROM obs o
        INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND o.voided IS FALSE
                                      AND
                                      concept_name_type = 'FULLY_SPECIFIED'
                                      AND name IN
                                          (
                                            'ANA, Pain Severity', 'ULA, Pain Severity', 'WWN, Pain Severity', 'OS, Pain Severity',
                                            'MPA, Pain Severity', 'ONN, Pain Severity', 'LLA, Pain Severity', 'POW, Pain Severity'
                                          ) AND cn.voided IS FALSE
        INNER JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
        INNER JOIN visit v ON v.visit_id = e.visit_id AND v.voided IS FALSE
     ) painSeverity
       ON painSeverity.patient_id = PNFDateTime.patient_id AND painSeverity.painSeverityDate <= PNFDateTime.obs_datetime
   GROUP BY PNFDateTime.encounter_id
  ) recentPainSeverity
    ON o.obs_datetime = recentPainSeverity.recentPainSeverityDateTime AND recentPainSeverity.patient_id = o.person_id
  WHERE YEAR(PNFRefferalDate) = YEAR('#startDate#')
ORDER BY o.person_id