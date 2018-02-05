SELECT
  o.person_id,
  CAST(o.obs_datetime AS DATE),
  acv.concept_full_name
FROM obs o
  INNER JOIN obs child_obs
    ON child_obs.obs_group_id = o.obs_id AND child_obs.voided IS FALSE AND o.voided IS FALSE
  INNER JOIN concept_view qcv
    ON qcv.concept_id = child_obs.concept_id AND qcv.concept_full_name IN ('SFP, Impact of complication'
  ) AND qcv.retired IS FALSE
  INNER JOIN concept_view acv ON acv.concept_id = child_obs.value_coded
                                 AND acv.concept_full_name IN ('Increased LOS and / or required further surgeries',
                                                               'Serious Complications led to mortality or deterioration of patient condition'
  ) AND acv.retired IS FALSE AND YEAR(o.obs_datetime) = YEAR('#startDate#');