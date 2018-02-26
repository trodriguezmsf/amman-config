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
                o.person_id,
                o.encounter_id,
                GROUP_CONCAT(IF(qcvn.concept_full_name = 'Stage', o.value_numeric, NULL))                           AS stage,
                GROUP_CONCAT(IF(qcvn.concept_full_name = 'FSTG, Specialty determined by MLO', acvn.concept_full_name,
                                NULL))                                                                              AS specialty,
                GROUP_CONCAT(IF(qcvn.concept_full_name = 'MH, Name of MLO',
                                COALESCE(acvn.concept_full_name, acvn.concept_short_name),
                                NULL))                                                                              AS nameOfMLO
              FROM obs o
                INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                                qcvn.concept_full_name IN (
                                                  'Stage',
                                                  'FSTG, Specialty determined by MLO',
                                                  'MH, Name of MLO'
                                                ) AND qcvn.retired IS FALSE AND o.voided IS FALSE
                LEFT JOIN concept_view acvn ON acvn.concept_id = o.value_coded AND acvn.retired IS FALSE
              GROUP BY o.encounter_id
            ) formAttributes ON patientAttributes.patient_id = formAttributes.person_id;