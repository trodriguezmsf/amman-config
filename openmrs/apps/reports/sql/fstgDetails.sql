SELECT *
FROM
  (SELECT
     o.person_id,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'FSTG, Date received', CAST(o.value_datetime AS DATE ), null))                                 AS `dateOfFileRecieved`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'FSTG, Date of presentation at 1st stage', CAST(o.value_datetime AS DATE ), null))             AS `dateOfPresentation`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'FSTG, Outcomes for 1st stage surgical validation', acvn.concept_full_name, null))                      AS `outComeOfFSTG`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'ONN, Was the dressing changed', acvn.concept_full_name, null))                                         AS `wasTheDressingChanged`,
     NULL                                                                                                                                    AS `xRayUploaded`,
     NULL                                                                                                                                    AS `xRayUploadedDate`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'ONN, Date recorded', CAST(o.value_datetime AS DATE ), null))                                  AS `dateRecorderedForONN`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Type of anaesthesia administered', acvn.concept_full_name, null))                                 AS `typeOfAnaesthesia`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Anaesthesia start time', CAST(o.value_datetime AS DATE ), null))                         AS `anaesthesiaDateStarted`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'AIA, date of consultation', CAST(o.value_datetime AS DATE ), null))                           AS `aiaDateOfConsultation`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'SAP, Date of consultation', CAST(o.value_datetime AS DATE ), null))                           AS `sapDateOfConsultation`,
     GROUP_CONCAT(if(qcvn.concept_full_name = 'Surgical Diagnosis Data', CAST(o.obs_datetime AS DATE ), null))                               AS `surgicalDiagnosisObsDate`
   FROM obs o
     INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                     qcvn.concept_full_name IN ('FSTG, Outcomes for 1st stage surgical validation',
                                                                'FSTG, Date of presentation at 1st stage',
                                                                'FSTG, Date received',
                                                                'ONN, Was the dressing changed',
                                                                'ONN, Date recorded',
                                                                'APN, Type of anaesthesia administered',
                                                                'APN, Anaesthesia start time',
                                                                'AIA, date of consultation',
                                                                'SAP, Date of consultation',
                                                                'Surgical Diagnosis Data') AND qcvn.retired IS FALSE AND o.voided IS FALSE
     LEFT JOIN concept_view acvn ON o.value_coded  = acvn.concept_id AND acvn.retired IS FALSE
   GROUP BY o.encounter_id) allConceptsExceptXRayDetails
UNION
SELECT *
FROM
  (
    SELECT
      o.person_id,
      NULL                                                                                               AS `dateOfFileRecieved`,
      NULL                                                                                               AS `dateOfPresentation`,
      NULL                                                                                               AS `outComeOfFSTG`,
      NULL                                                                                               AS `wasTheDressingChanged`,
      GROUP_CONCAT(IF(qcvn.concept_full_name = 'Documents, Image Upload', 'Yes', NULL))                  AS `xRayUploaded`,
      GROUP_CONCAT(IF(qcvn.concept_full_name = 'Documents, Date', CAST(o.value_datetime AS DATE), NULL)) AS `xRayUploadedDate`,
      NULL                                                                                               AS `dateRecorderedForONN`,
      NULL                                                                                               AS `typeOfAnaesthesia`,
      NULL                                                                                               AS `anaesthesiaDateStarted`,
      NULL                                                                                               AS `aiaDateOfConsultation`,
      NULL                                                                                               AS `sapDateOfConsultation`,
      NULL                                                                                               AS `surgicalDiagnosisObsDate`
    FROM obs o
      INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                      qcvn.concept_full_name IN (
                                        'Documents, Image Upload',
                                        'Documents, Date'
                                      ) AND qcvn.retired IS FALSE AND o.voided IS FALSE
      LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
    GROUP BY o.encounter_id, o.obs_datetime
    ORDER BY o.person_id
  ) xRayDetails;