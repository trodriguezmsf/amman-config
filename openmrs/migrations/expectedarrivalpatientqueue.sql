 DELETE FROM global_property where property = 'emrapi.sqlSearch.expectedArrival';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.expectedArrival',
"SELECT
  `identifier`, name, `Age`, uuid, `Country`, `Nationality`, `Specialty`, `Stage`,
  DATE_FORMAT(`ExpectedDateOfArrival`, '%d/%m/%Y') AS `Expected Date of Arrival`,
  `Does the Patient need Accommodation?`, `Type of Admission Recommended`
FROM
  (

    SELECT
      expectedPerson.name                                                                        AS name,
      expectedPerson.age                                                                         AS `Age`,
      expectedPerson.patient_identifier                                                                   AS `identifier`,
      expectedPerson.uuid                                                                        AS  uuid,
      expectedPerson.country                                                                     AS 'Country',
      expectedPerson.nationality                                                                 AS 'Nationality',
      expectedPerson.expectedDateOfArrival                                                       AS 'ExpectedDateOfArrival',
      expectedPerson.dateOfArrival                                                               AS 'Date of Arrival',
      `Specialty`,
      `Stage`,
      GROUP_CONCAT(DISTINCT (IF(
          obs_fscn.name = 'FV, Does the Patient need Accommodation?' AND latest_encounter.person_id IS NOT NULL,
          COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                   DESC)                                                                         AS 'Does the Patient need Accommodation?',
      GROUP_CONCAT(DISTINCT
                   (IF(obs_fscn.name = 'FV, Type of Admission Recommended' AND latest_encounter.person_id IS NOT NULL,
                       COALESCE(coded_fscn.name, coded_scn.name), NULL)) ORDER BY o.obs_id
                   DESC)                                                                         AS 'Type of Admission Recommended'
    FROM
    (
      SELECT *
      FROM
        (
          SELECT
            concat(pn.given_name, ' ', pn.family_name)                                                  AS name,
            floor(DATEDIFF(CURDATE(), p.birthdate) / 365)                                               AS age,
            pi.identifier                                                                               AS patient_identifier,
            p.person_id                                                                                 As person_id,
            p.uuid                                                                                      AS uuid,
            paddress.address3                                                                           AS country,
            GROUP_CONCAT(DISTINCT (IF(pat.name = 'nationality1', coalesce(scn.name, fscn.name), NULL))) AS nationality,
            GROUP_CONCAT(DISTINCT (IF(pat.name = 'expectedDateofArrival', pa.value,
                                      NULL)))                                                           AS expectedDateOfArrival,
            GROUP_CONCAT(DISTINCT (IF(pat.name = 'dateofArrival', pa.value, NULL)))                     AS dateOfArrival
          FROM person p
          JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
          JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE
          LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided IS FALSE
          LEFT OUTER JOIN person_attribute_type pat
          ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE
          LEFT OUTER JOIN person_address paddress ON p.person_id = paddress.person_id AND paddress.voided IS FALSE
          LEFT OUTER JOIN concept_name scn
          ON pat.format = 'org.openmrs.Concept' AND pa.value = scn.concept_id AND scn.concept_name_type = 'SHORT' AND
             scn.voided IS FALSE
          LEFT OUTER JOIN concept_name fscn ON pat.format = 'org.openmrs.Concept' AND pa.value = fscn.concept_id AND
                                               fscn.concept_name_type = 'FULLY_SPECIFIED' AND fscn.voided IS FALSE
          GROUP BY p.person_id) personData
      WHERE (personData.expectedDateOfArrival IS NOT NULL AND personData.dateOfArrival IS NULL)) expectedPerson
    LEFT JOIN obs o ON expectedPerson.person_id = o.person_id AND o.voided IS FALSE
    LEFT JOIN concept_name obs_fscn ON o.concept_id = obs_fscn.concept_id AND
                                       obs_fscn.name IN
                                       ('FSTG, Date received', 'FSTG, Date of presentation at 1st stage', 'FSTG, Is the medical file complete?', 'FV, Does the Patient need Accommodation?', 'FV, Type of Admission Recommended')
                                       AND obs_fscn.voided IS FALSE AND obs_fscn.concept_name_type = 'FULLY_SPECIFIED'
    LEFT JOIN encounter e ON o.encounter_id = e.encounter_id AND e.voided IS FALSE
    LEFT JOIN concept_name coded_fscn
    ON coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED' AND
       coded_fscn.voided IS FALSE
    LEFT JOIN concept_name coded_scn
    ON coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type = 'SHORT' AND coded_scn.voided IS FALSE
    LEFT JOIN (SELECT
                 person_id,
                 obs.concept_id,
                 max(encounter_datetime) AS max_encounter_datetime
               FROM obs
               JOIN encounter
               ON obs.encounter_id = encounter.encounter_id AND obs.voided = FALSE AND encounter.voided IS FALSE
                  AND encounter.visit_id IN (SELECT v.visit_id
                                             FROM
                                             visit v
                                             JOIN (SELECT
                                                     patient_id AS patient_id, max(date_started) AS date_started
                                                   FROM visit
                                                   WHERE visit.voided IS FALSE
                                                   GROUP BY patient_id) latest_visit
                                             ON v.date_started = latest_visit.date_started AND
                                                v.patient_id = latest_visit.patient_id AND v.voided IS FALSE)
               GROUP BY obs.person_id, obs.concept_id) latest_encounter
    ON o.person_id = latest_encounter.person_id AND o.concept_id = latest_encounter.concept_id AND
       e.encounter_datetime = latest_encounter.max_encounter_datetime
    LEFT JOIN (SELECT
                 obs.person_id,
                 encounter.encounter_id,
                 c_name                                                                       AS name,
                 GROUP_CONCAT(DISTINCT (IF(c_name = 'FSTG, Specialty determined by MLO',
                                           COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Specialty',
                 max(obs.value_numeric)                                                       AS 'Stage'
               FROM (SELECT
                       cn.name                 AS c_name,
                       obs.person_id,
                       max(encounter_datetime) AS max_encounter_datetime,
                       obs.concept_id
                     FROM obs
                     JOIN encounter
                     ON obs.encounter_id = encounter.encounter_id AND obs.voided IS FALSE AND encounter.voided IS FALSE
                     JOIN concept_name cn ON cn.name IN ('FSTG, Specialty determined by MLO', 'Stage')
                                             AND cn.concept_id = obs.concept_id AND cn.voided IS FALSE
                     GROUP BY person_id, concept_id) result
               JOIN encounter
               ON result.max_encounter_datetime = encounter.encounter_datetime AND encounter.voided IS FALSE
               JOIN obs ON encounter.encounter_id = obs.encounter_id AND obs.concept_id = result.concept_id AND
                           obs.voided IS FALSE
               LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                    AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND coded_fscn.voided IS FALSE
               LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                   AND coded_fscn.concept_name_type = 'SHORT'
                                                   AND coded_scn.voided IS FALSE
               GROUP BY obs.person_id
              ) obs_across_visits ON expectedPerson.person_id = obs_across_visits.person_id
    JOIN patient_program pp
    ON expectedPerson.person_id = pp.patient_id AND pp.date_completed IS NULL AND pp.voided IS FALSE
    GROUP BY expectedPerson.person_id
    ORDER BY expectedDateOfArrival) result", 'Expected Arrival Patient Queue', @uuid);