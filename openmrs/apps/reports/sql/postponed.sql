SELECT
  abc.Date_Presentation as 'Date of Presentation',
  pi.identifier                              AS `Identifier`,
  concat(pn.given_name, ' ', ifnull(pn.family_name,'')) AS 'Name',
  GROUP_CONCAT(DISTINCT(IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS 'Nationality',
  `Name of MLO`,
  `Specialty`,
  abc.Outcomes_surgical_validation as 'Outcomes for 1st Stage surgical validation',
  abc.Postpone_reason as 'Postpone reason',
  abc.Comments_Postpone_Reason as 'Comments About Postpone Reason',
  abc.Medical as 'Medical file to be submitted again by'
FROM patient_identifier pi
  JOIN person_name pn ON pi.patient_id = pn.person_id AND pn.voided IS FALSE
  LEFT OUTER JOIN person_attribute pa ON pi.patient_id = pa.person_id AND pa.voided is false
  LEFT OUTER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired is false
  LEFT OUTER JOIN concept_name scn ON pat.format = 'org.openmrs.Concept' AND pa.value = scn.concept_id AND scn.concept_name_type = 'SHORT' AND scn.voided is false
  LEFT OUTER JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided is false
  Left join  (select o.person_id,
                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Date of presentation at 1st stage' AND latest_encounter.person_id IS NOT NULL , DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL)) )       AS 'Date_Presentation',
                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Outcomes for 1st stage surgical validation' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ) AS 'Outcomes_surgical_validation',

                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Postpone reason' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ) AS 'Postpone_reason',
                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FV, Outcomes FV' AND latest_encounter.person_id IS NOT NULL, COALESCE(coded_fscn.name, coded_scn.name), NULL)) ) AS 'FV_Outcome',
                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Comments about postpone reason' AND latest_encounter.person_id IS NOT NULL, o.value_text, NULL)) ) AS 'Comments_Postpone_Reason',
                GROUP_CONCAT(DISTINCT (IF(obs_fscn.name = 'FSTG, Medical file to be submitted again by' AND latest_encounter.person_id IS NOT NULL , DATE_FORMAT(o.value_datetime, '%d/%m/%Y'), NULL)) )       AS 'Medical'
              from encounter e
                Inner JOIN obs o ON o.encounter_id = e.encounter_id AND o.voided IS FALSE AND e.voided IS FALSE
                Inner JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                                    obs_fscn.name IN
                                                    ('FSTG, Date of presentation at 1st stage',
                                                     'FSTG, Outcomes for 1st stage surgical validation',
                                                     'FSTG, Postpone reason',
                                                     'FSTG, Comments about postpone reason',
                                                     'FSTG, Medical file to be submitted again by',
                                                     'FV, Outcomes FV')
                                                    AND obs_fscn.voided IS FALSE AND obs_fscn.concept_name_type= 'FULLY_SPECIFIED'
                LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'FULLY_SPECIFIED' AND coded_fscn.voided is false
                LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type= 'SHORT' AND coded_scn.voided is false LEFT JOIN (SELECT
                                                                                                                                                                              en.visit_id,
                                                                                                                                                                              person_id,
                                                                                                                                                                              obs.concept_id,
                                                                                                                                                                              max(en.encounter_datetime) AS max_encounter_datetime
                                                                                                                                                                            FROM obs
                                                                                                                                                                              JOIN concept_name obs_fscn ON obs.concept_id = obs_fscn.concept_id AND
                                                                                                                                                                                                            obs_fscn.name IN
                                                                                                                                                                                                            ('FSTG, Date of presentation at 1st stage',
                                                                                                                                                                                                             'FSTG, Outcomes for 1st stage surgical validation',
                                                                                                                                                                                                             'FSTG, Postpone reason',
                                                                                                                                                                                                             'FSTG, Comments about postpone reason',
                                                                                                                                                                                                             'FSTG, Medical file to be submitted again by',
                                                                                                                                                                                                             'FV, Outcomes FV')
                                                                                                                                                                                                            AND obs_fscn.voided IS FALSE AND obs_fscn.concept_name_type= 'FULLY_SPECIFIED'
                                                                                                                                                                              JOIN encounter en ON obs.encounter_id = en.encounter_id AND obs.voided IS FALSE AND en.voided IS FALSE
                                                                                                                                                                                                   AND en.visit_id IN (SELECT v.visit_id FROM
                                                                                                                                                                                visit v
                                                                                                                                                                                JOIN  (SELECT patient_id AS patient_id, max(date_started) AS date_started
                                                                                                                                                                                       FROM visit WHERE voided IS FALSE GROUP BY patient_id) latest_visit
                                                                                                                                                                                  ON v.date_started = latest_visit.date_started AND v.patient_id = latest_visit.patient_id AND v.voided IS FALSE )
                                                                                                                                                                            GROUP BY obs.person_id, obs.concept_id) latest_encounter
                  ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id
                     AND latest_encounter.max_encounter_datetime = e.encounter_datetime
              GROUP BY o.person_id )abc on abc.person_id = pi.patient_id
  LEFT JOIN (SELECT
               obs.person_id,
               encounter.encounter_id,
               c_name AS name,
               GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Specialty',
               GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Name of MLO', COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of MLO'
             FROM (SELECT
                     cn.name                 AS c_name,
                     obs.person_id,
                     obs.encounter_id,
                     max(encounter_datetime) AS max_encounter_datetime,
                     obs.concept_id
                   FROM obs
                     JOIN encounter ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND encounter.voided IS FALSE
                     JOIN concept_name cn ON cn.name IN ('MH, Name of MLO', 'FSTG, Specialty determined by MLO')
                                             AND cn.concept_id = obs.concept_id AND cn.voided IS FALSE
                   GROUP BY person_id, concept_id) result
               JOIN encounter ON result.max_encounter_datetime = encounter.encounter_datetime AND encounter.voided IS FALSE
               JOIN obs ON encounter.encounter_id = obs.encounter_id AND obs.concept_id = result.concept_id AND obs.voided IS FALSE
               LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                    AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND coded_fscn.voided IS FALSE
               LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                   AND coded_fscn.concept_name_type = 'SHORT'
                                                   AND coded_scn.voided IS FALSE
             GROUP BY obs.person_id
            ) obs_across_visits ON pi.patient_id = obs_across_visits.person_id
  JOIN patient_program pp ON pi.patient_id = pp.patient_id AND  pp.date_completed is NULL and pp.voided IS FALSE
WHERE (abc.Date_Presentation is not null AND (abc.Outcomes_surgical_validation ='Postponed' )) OR abc.FV_Outcome = 'Further Evaluation'
group by pi.patient_id;
