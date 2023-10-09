DELETE FROM global_property WHERE property = 'bahmni.sqlGet.siteAndSide';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.siteAndSide', "
  Select
  o.encounter_id,
  cn_scn.name as concept_name,
  coded_fscn.name as answer_concept_name,
  o.obs_group_id,
  p.person_id,
  o.obs_dateTime
FROM
  person p
  Inner Join obs o ON p.person_id = o.person_id
  INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
  AND cn.voided IS FALSE
  AND o.voided IS FALSE
  AND cn.concept_name_type = 'FULLY_SPECIFIED'
  AND cn.name IN ('DIA, Site','DIA, Side')
  LEFT OUTER JOIN concept_name cn_scn ON cn_scn.concept_id = o.concept_id
  AND cn_scn.concept_name_type = 'SHORT'
  AND cn_scn.voided IS FALSE
  Inner JOIN (
    SELECT
      o.encounter_id
    FROM
      obs o
      INNER JOIN (
        SELECT
          concept_id
        FROM
          concept_name
        WHERE
          name = 'OBS, Surgical Diagnoses'
      ) c ON o.concept_id = c.concept_id
      AND o.person_id = (select p.person_id from person p where p.uuid=${patientUuid})
      ORDER BY o.obs_dateTime DESC limit 1 
  ) encounterData ON encounterData.encounter_id = o.encounter_id
  Inner JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
  AND coded_fscn.concept_name_type LIKE
  CASE WHEN cn_scn.name = 'Site' THEN 
    'SHORT'
  ELSE
    'FULLY_SPECIFIED'
  END
  AND coded_fscn.voided IS FALSE
WHERE
  p.uuid = ${patientUuid};"
  , 'Site And Side', @uuid);