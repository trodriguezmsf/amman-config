SELECT
  o.person_id,
  CAST(dateObs.value_datetime as DATE) AS Date
from obs o
  INNER JOIN concept_view imageCV ON imageCV.concept_id = o.concept_id AND o.voided IS FALSE AND imageCV.retired IS FALSE AND imageCV.concept_full_name = 'Documents, Image Upload'
  INNER JOIN obs imageObs ON o.obs_id = imageObs.obs_group_id AND imageObs.voided IS FALSE
  INNER JOIN concept_view imageConcept ON imageObs.concept_id = imageConcept.concept_id AND imageConcept.retired IS FALSE AND
imageConcept.concept_full_name = 'Image'
  INNER JOIN (
               SELECT o.value_datetime, o.obs_group_id from obs o
                 INNER JOIN concept_view cv ON cv.concept_id = o.concept_id AND cv.retired IS FALSE AND o.voided IS FALSE AND cv.concept_full_name = 'Documents, Date'
             ) dateObs ON dateObs.obs_group_id = o.obs_group_id;