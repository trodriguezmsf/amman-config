SELECT
  person_id                  AS patient_id,
  CAST(obs_datetime AS DATE) AS pnfReferralDate
FROM obs o
  INNER JOIN concept_name cn ON o.concept_id = cn.concept_id AND name = 'PNF, Referral needed:'
                                AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                AND o.voided IS FALSE AND cn.voided IS FALSE
WHERE YEAR(o.obs_datetime) = YEAR('#startDate#')
ORDER BY person_id