SELECT
  o.person_id,
  o.encounter_id,
  GROUP_CONCAT(
      if(qcvn.concept_full_name = 'FSTG, Date received', CAST(o.value_datetime AS DATE), NULL))                      AS `dateOfFileRecieved`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'FSTG, Date of presentation at 1st stage', CAST(o.value_datetime AS DATE),
                  NULL))                                                                                             AS `dateOfPresentation`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'FSTG, Outcomes for 1st stage surgical validation', acvn.concept_full_name,
                  NULL))                                                                                             AS `outComeOfFSTG`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'ONN, Was the dressing changed', acvn.concept_full_name,
                  NULL))                                                                                             AS `wasTheDressingChanged`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'ONN, Date recorded', CAST(o.value_datetime AS DATE),
                  NULL))                                                                                             AS `dateRecorderedForONN`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'Documents, Image Upload', 'Yes',
                  NULL))                                                                                             AS `xRayUploaded`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'Documents, Date', CAST(o.value_datetime AS DATE),
                  NULL))                                                                                             AS `xRayUploadedDate`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Type of anaesthesia administered', acvn.concept_full_name,
                  NULL))                                                                                             AS `typeOfAnaesthesia`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'APN, Anaesthesia start time', CAST(o.value_datetime AS DATE),
                  NULL))                                                                                             AS `anaesthesiaDateStarted`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'AIA, date of consultation', CAST(o.value_datetime AS DATE),
                  NULL))                                                                                             AS `aiaDateOfConsultation`,
  GROUP_CONCAT(if(qcvn.concept_full_name = 'SAP, Date of consultation', CAST(o.value_datetime AS DATE),
                  NULL))                                                                                             AS `sapDateOfConsultation`,
  if(qcvn.concept_full_name = 'OR, Time started', CAST(o.value_datetime AS DATE), NULL)                              AS `operativeReportDate`,
  if(qcvn.concept_full_name = 'CC, Patient complication',acvn.concept_full_name, NULL)                               AS `patientComplication`,
  if(qcvn.concept_full_name = 'CC, Start date of complication',CAST(o.value_datetime AS DATE), NULL)                 AS `patientComplicationDate`,
  if(qcvn.concept_full_name = 'SFP, Date recorded' AND
     formDetails.concept_full_name = 'Increased LOS and / or required further surgeries'
  ,CAST(o.value_datetime AS DATE), NULL)                                                                             AS `sfpDateRecordedForIncreased`,
  if(qcvn.concept_full_name = 'SFP, Date recorded' AND
     formDetails.concept_full_name = 'Did not effect the results of flow'
  ,CAST(o.value_datetime AS DATE), NULL)                                                                              AS `sfpDateRecordedForDidNot`,
  if(qcvn.concept_full_name = 'WWN, Date of removal, PICC line',CAST(o.value_datetime AS Date), NULL)                 AS `wwnDateOfRemoval`,
  if(qcvn.concept_full_name = 'WWN, Date recorded' AND (if(qcvn.concept_full_name = 'WWN, Date of removal, PICC line',
                                                           CAST(o.value_datetime AS Date), NULL)) IS NULL,
     CAST(o.value_datetime AS DATE), NULL)                                                              AS `wwnDateRecorded`
FROM obs o
  INNER JOIN concept_view qcvn ON qcvn.concept_id = o.concept_id AND
                                  qcvn.concept_full_name IN ('FSTG, Outcomes for 1st stage surgical validation',
                                    'FSTG, Date of presentation at 1st stage',
                                    'FSTG, Date received',
                                    'ONN, Was the dressing changed',
                                    'ONN, Date recorded',
                                    'Documents, Image Upload',
                                    'Documents, Date',
                                    'APN, Type of anaesthesia administered',
                                    'APN, Anaesthesia start time',
                                    'AIA, date of consultation',
                                    'SAP, Date of consultation',
                                    'OR, Time started',
                                    'CC, Start date of complication',
                                    'CC, Patient complication',
                                    'SFP, Date recorded',
                                    'WWN, Date of removal, PICC line',
                                    'WWN, Date recorded') AND qcvn.retired IS FALSE AND o.voided IS FALSE
  LEFT JOIN concept_view acvn ON o.value_coded = acvn.concept_id AND acvn.retired IS FALSE
  LEFT JOIN (SELECT
               o.person_id,
               acv.concept_full_name,
               o.encounter_id
             FROM obs o
               INNER JOIN obs child_obs
                 ON child_obs.obs_group_id = o.obs_id AND child_obs.voided IS FALSE AND o.voided IS FALSE
               INNER JOIN concept_view qcv
                 ON qcv.concept_id = child_obs.concept_id AND qcv.concept_full_name IN ('OR, Operation performed Coded',
                                                                                        'SFP, Impact of complication',
                                                                                        'WWN, Does the patient have a PICC line?'
                                                                                        ) AND qcv.retired IS FALSE
               INNER JOIN concept_view acv ON acv.concept_id = child_obs.value_coded
                                              AND acv.concept_full_name IN ('Nerve block',
                                                                            'Insertion of peripherally inserted central catheter',
                                                                            'Did not effect the results of flow',
                                                                            'Increased LOS and / or required further surgeries',
                                                                            'Yes') AND acv.retired IS FALSE
            ) formDetails ON formDetails.encounter_id = o.encounter_id AND formDetails.person_id = o.person_id
GROUP BY o.encounter_id
ORDER BY o.person_id
