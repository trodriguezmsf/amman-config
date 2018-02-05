SELECT
  o.person_id,
  GROUP_CONCAT(DISTINCT if(qcvn.concept_full_name = 'OR, Time started' AND
                            formDetails.concept_full_name IN ('Nerve block',
                                                              'Insertion of peripherally inserted central catheter')
  , CAST(o.value_datetime AS DATE), NULL))                              AS `operativeReportDate`
FROM obs o
  INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                  qcvn.concept_full_name IN (
                                    'OR, Time started') AND qcvn.retired IS FALSE AND o.voided IS FALSE
  LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
  LEFT JOIN (SELECT
               o.person_id,
               acv.concept_full_name,
               o.encounter_id
             FROM obs o
               INNER JOIN obs child_obs
                 ON child_obs.obs_group_id = o.obs_id AND child_obs.voided IS FALSE AND o.voided IS FALSE
               INNER JOIN concept_view qcv
                 ON qcv.concept_id = child_obs.concept_id AND qcv.concept_full_name IN ('OR, Operation performed Coded'
               ) AND qcv.retired IS FALSE
               INNER JOIN concept_view acv ON acv.concept_id = child_obs.value_coded
                                              AND acv.concept_full_name IN ('Nerve block',
                                                                            'Insertion of peripherally inserted central catheter'
               ) AND acv.retired IS FALSE
            ) formDetails ON formDetails.encounter_id = o.encounter_id AND formDetails.person_id = o.person_id
 WHERE year(o.value_datetime)=YEAR('#startDate#')
GROUP BY o.encounter_id
ORDER BY o.person_id