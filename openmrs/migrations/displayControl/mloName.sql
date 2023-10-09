DELETE FROM global_property WHERE property = 'bahmni.sqlGet.mloName';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.mloName', "
 Select
  'MLO Name' as concept_name, coded_fscn.name as answer_concept_name
FROM
  person p
  Inner Join obs o ON p.person_id = o.person_id
  INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
  AND cn.voided IS FALSE
  AND o.voided IS FALSE
  AND p.voided IS FALSE
  AND cn.concept_name_type = 'FULLY_SPECIFIED'
  AND cn.name = 'MH, Name OF MLO'
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
          name = 'Patient History' and concept_name_type = 'FULLY_SPECIFIED'
      ) c ON o.concept_id = c.concept_id
      AND o.person_id = (select p.person_id from person p where p.uuid=${patientUuid})
      ORDER BY o.obs_dateTime DESC limit 1 
  ) encounterData ON encounterData.encounter_id = o.encounter_id
  INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
  AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
  AND coded_fscn.voided IS FALSE
WHERE
  p.uuid = ${patientUuid};"
  , 'MLOName', @uuid);