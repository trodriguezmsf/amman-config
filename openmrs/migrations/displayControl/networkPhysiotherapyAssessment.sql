DELETE FROM global_property WHERE property = 'bahmni.sqlGet.networkPhysiotherapyAssessment';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.networkPhysiotherapyAssessment', "
  SELECT
  DATE_FORMAT(dateReorded.value_dateTime,'%d/%m/%Y') as 'Date recorded',
  typeOfAssessment.name AS 'Type of Assessment',
  DATE_FORMAT(dateOfAdmission.value_dateTime,'%d/%m/%Y') AS 'Date Of Admission to network physio',
  dominantSide.name AS 'Dominant side',
  targetedSite.name AS 'Targeted Site',
  targetedSide.name AS 'Targeted Side',
  specialCase.name AS 'Special Case',
  specialCaseOther.value_text AS 'Special case, other',
  notesForSpecialCases.value_text AS 'Notes about network physio special cases',
  lowerLimbSubScore.value_numeric AS 'Total lower limb sub-score (FIM)',
  upperLimbSubScore.value_numeric AS 'Total upper limb sub-score (FIM)',
  modifiedFunctionalIndependenceMeasure.value_numeric AS 'Total Modified Functional Independence Measure (FIM) score',
  totalCoreScore.value_numeric AS 'Total core score (AIM-T)',
  totalLowerLimbScore.value_numeric AS 'Total lower limb score (AIM-T)',
  totalUpperLimbScore.value_numeric AS 'Total upper limb score (AIM-T)',
  independenceMeasureForTrauma.value_numeric AS 'Activity Independence Measure for Trauma (AIM-T) score',
  patientReferredByNetworkPhysio.name AS 'Was the patient refered by network physio to other MSF or non-MSF project?',
  referredByNetworkPhysioTo.value_text AS 'Referred by network physio to',
  feedbackToSurgeons.value_text AS 'Network physio feedback to the surgeons',
  networkPhysioFollowUp.value_numeric AS 'Network physio follow-up at',
  physioTreatmentGolas.value_text AS 'Network physio treatment goals',
  physiotherapyPrescription.name AS 'Physiotherapy prescription',
  otherPhysiotherapyPrescription.value_text AS 'Other physiotherapy prescription',
  modalities.value_text AS 'Modalities/ Specifications',
  treatmentDuration.name AS 'Treatment duration of the physiotherapy prescription',
  comments.value_text AS 'Comments',
  photo.uploadedPhotoes AS 'Photo Upload',
  video.uploadedVideos AS 'Video Upload'
FROM
  (
    SELECT
      o.encounter_id,
      coded_fscn.name as name
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Type of assessment'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.name = 'Initial'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
    ORDER BY
      obs_dateTime DESC
    LIMIT
      1
  ) encounterData
  LEFT JOIN(
    SELECT
      cn.name,
      o.value_dateTime,
      o.obs_dateTime,
      o.encounter_id,
      o.obs_group_id
    FROM
      obs o
      INNER JOIN person p ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name IN ('NP, Date recorded')
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name c_sn ON c_sn.concept_id = o.concept_id
      AND c_sn.concept_name_type = 'SHORT'
      AND c_sn.voided IS FALSE
      AND p.uuid = ${patientUuid}
  ) dateReorded ON dateReorded.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      coded_fscn.name as name
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Type of assessment'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) typeOfAssessment ON typeOfAssessment.encounter_id = encounterData.encounter_id
  LEFT JOIN(
    SELECT
      cn.name,
      o.value_dateTime,
      o.obs_dateTime,
      o.encounter_id,
      o.obs_group_id
    FROM
      obs o
      INNER JOIN person p ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name IN ('NP, Date of admission to network physio')
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name c_sn ON c_sn.concept_id = o.concept_id
      AND c_sn.concept_name_type = 'SHORT'
      AND c_sn.voided IS FALSE
      AND p.uuid = ${patientUuid}
  ) dateOfAdmission ON dateOfAdmission.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      concat_ws(
        ':<br>',
        GROUP_CONCAT(coded_fscn.name SEPARATOR ', ')
      ) AS 'name'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Targeted site'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'SHORT'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) targetedSite ON targetedSite.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      coded_fscn.name AS 'name'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Dominant side'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) dominantSide ON dominantSide.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      concat_ws(
        ':<br>',
        GROUP_CONCAT(coded_fscn.name SEPARATOR ', ')
      ) AS 'name'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Targeted side'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) targetedSide ON targetedSide.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      concat_ws(
        ':<br>',
        GROUP_CONCAT(coded_fscn.name SEPARATOR ', ')
      ) AS 'name'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Special case'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) specialCase ON specialCase.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Special case, other'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) specialCaseOther ON specialCaseOther.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Notes about network physio special cases'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) notesForSpecialCases ON notesForSpecialCases.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Total lower limb sub-score (FIM)'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) lowerLimbSubScore ON lowerLimbSubScore.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Total upper limb sub-score (FIM)'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) upperLimbSubScore ON upperLimbSubScore.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Total Modified Functional Independence Measure (FIM) score'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) modifiedFunctionalIndependenceMeasure ON modifiedFunctionalIndependenceMeasure.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Total core score (AIM-T)'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) totalCoreScore ON totalCoreScore.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Total lower limb score (AIM-T)'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) totalLowerLimbScore ON totalLowerLimbScore.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Total upper limb score (AIM-T)'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) totalUpperLimbScore ON totalUpperLimbScore.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Activity Independence Measure for Trauma (AIM-T) score'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) independenceMeasureForTrauma ON independenceMeasureForTrauma.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      coded_fscn.name as name
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Was the patient refered by network physio to other MSF or non-MSF project?'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'SHORT'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) patientReferredByNetworkPhysio ON patientReferredByNetworkPhysio.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Referred by network physio to'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) referredByNetworkPhysioTo ON referredByNetworkPhysioTo.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Network physio feedback to the surgeons'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) feedbackToSurgeons ON feedbackToSurgeons.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_numeric
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Network physio follow-up at'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) networkPhysioFollowUp ON networkPhysioFollowUp.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Network physio treatment goals'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) physioTreatmentGolas ON physioTreatmentGolas.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      concat_ws(
        ':<br>',
        GROUP_CONCAT(coded_fscn.name SEPARATOR ', ')
      ) AS 'name'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Physiotherapy prescription'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) physiotherapyPrescription ON physiotherapyPrescription.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Other physiotherapy prescription'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) otherPhysiotherapyPrescription ON otherPhysiotherapyPrescription.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Target/ Modalities/ Specifications'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) modalities ON modalities.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      coded_fscn.name
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Treatment duration of the physiotherapy prescription'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
      AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
      AND coded_fscn.voided IS FALSE
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) treatmentDuration ON treatmentDuration.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      o.value_text
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'NP, Comments'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) comments ON comments.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      concat_ws(
        ':<br>',
        GROUP_CONCAT(o.value_complex SEPARATOR ', ')
      ) AS 'uploadedVideos'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'Video'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) video ON video.encounter_id = encounterData.encounter_id
  LEFT JOIN (
    SELECT
      o.encounter_id,
      concat_ws(
        ':<br>',
        GROUP_CONCAT(o.value_complex SEPARATOR ', ')
      ) AS 'uploadedPhotoes'
    FROM
      person p
      INNER JOIN obs o ON p.person_id = o.person_id
      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
      AND cn.name = 'Image'
      AND cn.voided IS FALSE
      AND o.voided IS FALSE
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      INNER JOIN (
        SELECT
          encounter_id
        FROM
          obs
        WHERE
          concept_id =(
            SELECT
              concept_id
            FROM
              concept_name
            WHERE
              name = 'NP, Network Physiotherapy Assessment'
          )
        ORDER BY
          obs_dateTime DESC
        LIMIT
          1
      ) encounterData ON encounterData.encounter_id = o.encounter_id
      AND p.uuid = ${patientUuid}
  ) photo ON photo.encounter_id = encounterData.encounter_id;"
  , 'Network Physiotherapy Assessment', @uuid);