SELECT
 o.person_id,
 CAST(o.obs_datetime AS DATE) AS ObsDate,
 o.value_numeric                                  AS painSeverityValue
FROM obs o
 INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND cn.voided IS FALSE AND
                               o.voided IS FALSE
                               AND cn.concept_name_type = 'FULLY_SPECIFIED'
                               AND cn.name IN (
   'ANA, Pain Severity', 'ULA, Pain Severity', 'WWN, Pain Severity', 'OS, Pain Severity',
   'MPA, Pain Severity', 'ONN, Pain Severity', 'LLA, Pain Severity', 'POW, Pain Severity'
 ) AND o.value_numeric >= 5
 WHERE YEAR(o.obs_datetime) = YEAR('#startDate#')
ORDER BY o.person_id, o.obs_datetime