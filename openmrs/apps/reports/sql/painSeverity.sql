SELECT
  aYearLatestPainSeverity.person_id,
  CAST(aYearLatestPainSeverity.painSeverityDate AS DATE) AS painSeverityDate,
  obs.value_numeric AS painSeverity
FROM
  (SELECT
     latestPainSeverityPerVisit.person_id,
     latestPainSeverityPerVisit.painSeverityDate
   FROM
     (SELECT
        o.person_id,
        MAX(o.obs_datetime) AS painSeverityDate,
        e.visit_id
      FROM obs o
        INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND cn.voided IS FALSE AND
                                      o.voided IS FALSE
                                      AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                      AND cn.name IN (
          'ANA, Pain Severity', 'ULA, Pain Severity', 'WWN, Pain Severity', 'OS, Pain Severity',
          'MPA, Pain Severity', 'ONN, Pain Severity', 'LLA, Pain Severity', 'POW, Pain Severity'
        )
        INNER JOIN encounter e ON o.encounter_id = e.encounter_id
      GROUP BY e.visit_id
     ) latestPainSeverityPerVisit
   WHERE YEAR(latestPainSeverityPerVisit.painSeverityDate) = YEAR('#startDate#')
  ) aYearLatestPainSeverity
  INNER JOIN obs ON aYearLatestPainSeverity.person_id = obs.person_id AND
                    aYearLatestPainSeverity.painSeverityDate = obs.obs_datetime AND
                    obs.voided IS FALSE
  INNER JOIN concept_name cn ON obs.concept_id = cn.concept_id AND cn.voided IS FALSE AND
                                obs.voided IS FALSE
                                AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                AND cn.name IN (
  'ANA, Pain Severity', 'ULA, Pain Severity', 'WWN, Pain Severity', 'OS, Pain Severity',
  'MPA, Pain Severity', 'ONN, Pain Severity', 'LLA, Pain Severity', 'POW, Pain Severity'
)
WHERE obs.value_numeric >= 5;