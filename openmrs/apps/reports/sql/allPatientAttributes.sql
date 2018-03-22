SELECT
  patientAttributes.*,
  formAttributes.stage,
  formAttributes.nameOfMLO,
  formAttributes.specialty
FROM
  (SELECT
     p.patient_id                                     AS `patient_id`,
     person.gender                                    AS `Sex`,
     TIMESTAMPDIFF(YEAR, person.birthdate, CURDATE()) AS `Age`,
     cv.concept_full_name                             AS nationality
   FROM patient p
     JOIN person ON p.patient_id = person.person_id AND person.voided IS FALSE AND p.voided IS FALSE
     JOIN person_attribute_type pat ON pat.name = 'nationality1'
     LEFT JOIN person_attribute pa
       ON pa.person_id = p.patient_id AND pa.voided IS FALSE AND
          pat.person_attribute_type_id = pa.person_attribute_type_id
     LEFT JOIN concept_view cv ON cv.concept_id = pa.value
  ) patientAttributes
  LEFT JOIN (
              SELECT
                latestObsDateTimes.person_id,
                MAX(IF(qcvn.concept_full_name = 'Stage', obs.value_numeric, NULL))                                  AS stage,
                GROUP_CONCAT(DISTINCT
                             IF(qcvn.concept_full_name = 'FSTG, Specialty determined by MLO', acvn.concept_full_name,
                                NULL))                                                                              AS specialty,
                GROUP_CONCAT(DISTINCT IF(qcvn.concept_full_name = 'MH, Name of MLO', acvn.concept_full_name,
                                         NULL))                                                                     AS nameOfMLO
              FROM
                (SELECT
                   o.person_id,
                   o.concept_id,
                   MAX(o.obs_datetime) AS latest_obs_datetime
                 FROM obs o INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                                            qcvn.concept_full_name IN (
                                                              'Stage',
                                                              'FSTG, Specialty determined by MLO',
                                                              'MH, Name of MLO'
                                                            ) AND qcvn.retired IS FALSE AND o.voided IS FALSE
                 GROUP BY o.person_id, o.concept_id
                 ORDER BY o.person_id, o.concept_id) latestObsDateTimes
                INNER JOIN obs ON latestObsDateTimes.person_id = obs.person_id AND
                                  latestObsDateTimes.concept_id = obs.concept_id AND
                                  latestObsDateTimes.latest_obs_datetime = obs.obs_datetime
                INNER JOIN concept_view qcvn ON qcvn.concept_id = obs.concept_id
                LEFT JOIN concept_view acvn ON acvn.concept_id = obs.value_coded AND acvn.retired IS FALSE
              GROUP BY obs.person_id
            ) formAttributes ON patientAttributes.patient_id = formAttributes.person_id