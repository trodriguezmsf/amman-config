SELECT
  o.person_id,
  CAST(o.obs_datetime AS DATE) AS xRayUploadedDate
FROM obs o
  INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                  qcvn.concept_full_name IN (
                                    'Documents, Image Upload'
                                  ) AND qcvn.retired IS FALSE AND o.voided IS FALSE
ORDER BY o.person_id;