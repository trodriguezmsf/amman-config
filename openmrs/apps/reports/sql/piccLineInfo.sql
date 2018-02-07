SELECT
  person,
  CAST(date_of_insertion AS DATE)                       `insertion_date`,
  CAST(date_of_removal AS DATE)            `removal_date`,
  CAST(complication_start_date AS DATE) AS `complication_date`
FROM
  (SELECT
     piccLineInfo.person_id           AS person,
     start_date                       AS date_of_insertion,
     coalesce(end_date, current_date) AS date_of_removal
   FROM
     (SELECT
        person_id,
        encounter_id,
        o1.obs_datetime AS 'start_date'
      FROM obs o1
        INNER JOIN concept_view cq
          ON cq.concept_id = o1.concept_id AND cq.concept_full_name = 'WWN, Does the patient have a PICC line?'
             AND o1.voided IS FALSE AND cq.retired IS FALSE
        INNER JOIN concept_view ca
          ON ca.concept_id = o1.value_coded AND ca.concept_full_name = 'Yes' AND ca.retired IS FALSE) piccLineInfo
     LEFT JOIN
     (SELECT
        o2.person_id,
        o2.encounter_id,
        o2.value_datetime AS 'end_date'
      FROM obs o2
        INNER JOIN concept_view cn ON cn.concept_id = o2.concept_id
                                      AND cn.concept_full_name = 'WWN, Date of removal, PICC line'
                                      AND o2.voided IS FALSE AND cn.retired IS FALSE) dateOfRemoval
       ON dateOfRemoval.person_id = piccLineInfo.person_id
          AND dateOfRemoval.encounter_id = piccLineInfo.encounter_id) piccLineDateInfo
  LEFT JOIN
  (SELECT
     pc_person,
     complication_start_date
   FROM
     (SELECT
        o3.person_id    AS pc_person,
        o3.encounter_id AS pc_encounter
      FROM obs o3
        INNER JOIN concept_view cq
          ON cq.concept_id = o3.concept_id AND cq.concept_full_name = 'CC, Patient complication'
             AND o3.voided IS FALSE AND cq.retired IS FALSE
        INNER JOIN concept_view ca ON ca.concept_id = o3.value_coded AND ca.concept_full_name IN (
          'PICC line occlusion',
          'PICC-related DVT',
          'PICC-related thrombophlebitis',
          'Other'
        ) AND ca.retired IS FALSE) patientComplication
     INNER JOIN
     (SELECT
        o4.value_datetime AS complication_start_date,
        o4.person_id      AS cc_person,
        o4.encounter_id   AS cc_encounter
      FROM obs o4
        INNER JOIN concept_view cq
          ON cq.concept_id = o4.concept_id AND cq.concept_full_name = 'CC, START DATE of complication'
             AND o4.voided IS FALSE AND cq.retired IS FALSE) ccStartDate
       ON ccStartDate.cc_person = patientComplication.pc_person AND
          ccStartDate.cc_encounter = patientComplication.pc_encounter) complication
    ON complication.pc_person = piccLineDateInfo.person AND
       complication.complication_start_date BETWEEN piccLineDateInfo.date_of_insertion
       AND piccLineDateInfo.date_of_removal
WHERE YEAR (date_of_insertion) = YEAR('#startDate#')