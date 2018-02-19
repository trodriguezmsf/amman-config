SELECT
  antiBioticsDetails.patient_id,
  antiBioticsDetails.date_activated,
  microBiology.sampleCollectionDate,
  antiBioticsDetails.auto_expire_date
FROM
  (SELECT
     s1.order_id,
     s1.patient_id,
     s1.date_activated,
     MIN(t1.auto_expire_date) AS auto_expire_date
   FROM ANTI_BIOTIC_DRUGS s1
     INNER JOIN ANTI_BIOTIC_DRUGS t1 ON t1.patient_id = s1.patient_id AND s1.date_activated <= t1.auto_expire_date
                                        AND NOT EXISTS(SELECT *
                                                       FROM ANTI_BIOTIC_DRUGS t2
                                                       WHERE
                                                         t1.patient_id = t2.patient_id AND
                                                         t1.auto_expire_date >= t2.date_activated
                                                         AND t1.auto_expire_date < t2.auto_expire_date)
   WHERE NOT EXISTS(SELECT *
                    FROM ANTI_BIOTIC_DRUGS s2
                    WHERE s1.patient_id = s2.patient_id AND s1.date_activated > s2.date_activated AND
                          s1.date_activated <= s2.auto_expire_date)
   GROUP BY s1.patient_id, s1.date_activated) antiBioticsDetails
  LEFT JOIN (
              SELECT
                specimenCollection.person_id,
                specimenCollection.value AS sampleCollectionDate
              FROM
                (SELECT
                   obs.person_id,
                   CAST(value_datetime AS DATE) AS value,
                   obs_group_id                 AS specimenGroupId

                 FROM obs
                   INNER JOIN concept_name cn
                     ON cn.concept_id = obs.concept_id AND cn.name = 'Specimen Collection Date' AND cn.voided IS FALSE
                        AND
                        obs.voided IS FALSE
                ) specimenCollection
                INNER JOIN
                (SELECT *
                 FROM
                   (SELECT
                      obs_id       AS resultsObsId,
                      obs_group_id AS resultsGroupId
                    FROM obs
                      INNER JOIN concept_name cn
                        ON cn.concept_id = obs.concept_id AND cn.name = 'Bacteriology Results' AND
                           cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND cn.voided IS FALSE AND
                           obs.voided IS FALSE
                   ) resultsSection
                   INNER JOIN
                   (SELECT obs_group_id AS groupId
                    FROM obs
                      INNER JOIN concept_name cn ON cn.concept_id = obs.concept_id AND
                                                    cn.name = 'Microbiology, Type of identification' AND
                                                    cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                                    cn.voided IS FALSE AND
                                                    obs.voided IS FALSE
                      INNER JOIN concept_name answer ON answer.concept_id = obs.value_coded AND
                                                        answer.concept_name_type = 'FULLY_SPECIFIED' AND
                                                        answer.voided IS FALSE
                    WHERE answer.name = 'Answer, Final Identification'
                   ) finalIdentificationAnswerObs ON finalIdentificationAnswerObs.groupId = resultsSection.resultsObsId
                ) finalIdentification
                  ON finalIdentification.resultsGroupId = specimenCollection.specimenGroupId
            ) microBiology ON microBiology.person_id = antiBioticsDetails.patient_id AND
                              microBiology.sampleCollectionDate BETWEEN antiBioticsDetails.date_activated AND antiBioticsDetails.auto_expire_date;