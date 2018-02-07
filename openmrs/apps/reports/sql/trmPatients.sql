SELECT
  dateOfArrival.dateOfArrival                                AS 'Date of Arrival',
  pi.identifier                                              AS 'Identifier',
  concat(pn.given_name, ' ', pn.family_name)                 AS 'Name',
  floor(DATEDIFF(CURDATE(), p.birthdate) / 365)              AS 'Age',
  paddr.address3                                             AS `Country`,
  careTakerRequired.isCareTakerRequired                      AS 'Is Caretaker Required?',
  sn.surgeonName                                             AS 'Name of Surgeon',
  `Bed allocation`,
  DATE_FORMAT(surgeonTRM.value_datetime, '%d/%m/%Y')         AS `Surgeon TRM`,
  DATE_FORMAT(physioTRM.value_datetime, '%d/%m/%Y')          AS `Physio TRM`,
  DATE_FORMAT(psychoSocialTRM.value_datetime, '%d/%m/%Y')    AS `Psycho-social TRM`,
  DATE_FORMAT(reasonForVisitDate.value_datetime, '%d/%m/%Y') AS `OPD Doctor TRM`
FROM person p
  INNER JOIN patient_identifier pi ON pi.patient_id = p.person_id AND p.voided IS FALSE AND pi.voided IS FALSE
  INNER JOIN person_name pn ON pn.person_id = p.person_id AND pn.voided IS FALSE
  INNER JOIN patient_program pp ON pp.patient_id = p.person_id AND pp.voided IS FALSE
  INNER JOIN program prog ON prog.program_id = pp.program_id AND prog.retired IS FALSE
  INNER JOIN concept_name prog_cn
    ON prog_cn.concept_id = prog.concept_id AND prog_cn.name = 'Reconstructive surgery' AND
       prog_cn.concept_name_type = 'FULLY_SPECIFIED' AND prog_cn.voided IS FALSE
  INNER JOIN concept_name state_cn
    ON state_cn.name IN ('Pre-operative', 'Surgical / hospitalisation', 'Rehabilitation') AND
       state_cn.concept_name_type = 'FULLY_SPECIFIED' AND
       state_cn.voided IS FALSE
  INNER JOIN program_workflow_state pws ON pws.concept_id = state_cn.concept_id AND pws.retired IS FALSE
  INNER JOIN patient_state ps ON
                                ps.patient_program_id = pp.patient_program_id AND
                                ps.state = pws.program_workflow_state_id AND
                                ps.end_date IS NULL AND ps.voided IS FALSE
  INNER JOIN visit v ON v.patient_id = p.person_id AND v.date_stopped IS NULL AND v.voided IS FALSE
  INNER JOIN visit_type vt ON vt.visit_type_id = v.visit_type_id AND vt.retired IS FALSE AND vt.name = 'Hospital'
  INNER JOIN encounter e ON e.visit_id = v.visit_id AND e.voided IS FALSE
  LEFT OUTER JOIN (
        SELECT
        obs.person_id,
        obs.encounter_id,
        GROUP_CONCAT(if(cn.name = 'SFP, Is patient for surgery', cn_ans.name, NULL)) AS isPatientForSurgeory,
        GROUP_CONCAT(if(cn.name = 'SFP, IS patient ready TO be discharged (TRM)?', cn_ans.name,
                        NULL))                                                       AS isPatientReadyForDischarged
      FROM obs obs
        INNER JOIN concept_name cn ON obs.concept_id = cn.concept_id
                                      AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                      AND cn.name IN
                                          ('SFP, Is patient for surgery', 'SFP, IS patient ready TO be discharged (TRM)?')
                                      AND obs.voided IS FALSE AND cn.voided IS FALSE
        INNER JOIN concept_name cn_ans ON obs.value_coded = cn_ans.concept_id
                                          AND cn_ans.concept_name_type = 'FULLY_SPECIFIED'
                                          AND cn_ans.voided IS FALSE
        INNER JOIN (
                     SELECT
                       o.person_id,
                       o.encounter_id
                     FROM
                       obs o
                       INNER JOIN (
                                    SELECT
                                      o.person_id,
                                      o.concept_id,
                                      MAX(o.obs_datetime) AS obsDateTime
                                    FROM obs o
                                      JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                                              cn.name IN
                                                              ('SFP, Is patient for surgery')
                                                              AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                              AND o.voided IS FALSE
                                                              AND cn.voided IS FALSE
                                    GROUP BY person_id) latestObs ON latestObs.obsDateTime = o.obs_datetime
                                                                     AND latestObs.person_id = o.person_id
                                                                     AND latestObs.concept_id = o.concept_id
                                                                     AND
                                                                     o.voided IS FALSE) latestEncounterWithIsPatientForSurgery
          ON latestEncounterWithIsPatientForSurgery.encounter_id = obs.encounter_id
      GROUP BY obs.person_id
  ) surgeonFollowUp ON surgeonFollowUp.person_id = p.person_id AND surgeonFollowUp.encounter_id = e.encounter_id
  LEFT OUTER JOIN person_address paddr ON paddr.person_id = p.person_id AND paddr.voided IS FALSE
  LEFT OUTER JOIN (SELECT
                     DATE_FORMAT(pa.value, '%d/%m/%Y') AS dateOfArrival,
                     pa.value                          AS date_of_arrival,
                     pa.person_id
                   FROM person_attribute pa
                     JOIN person_attribute_type pat
                       ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND
                          pat.name = 'dateofArrival' AND pa.voided IS FALSE
                   GROUP BY pa.person_id
                  ) dateOfArrival ON dateOfArrival.person_id = p.person_id
  LEFT OUTER JOIN (SELECT
                     IF(pa.value = 'TRUE', 'Yes', NULL) AS isCareTakerRequired,
                     pa.person_id
                   FROM person_attribute pa
                     JOIN person_attribute_type pat
                       ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND
                          pat.name = 'isCareTakerRequired' AND pa.voided IS FALSE
                   GROUP BY pa.person_id
                  ) careTakerRequired ON careTakerRequired.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      surgeon_cn.name AS surgeonName,
                      o.person_id
                    FROM
                      obs o
                      JOIN (
                             SELECT
                               o.obs_id,
                               MAX(o.obs_datetime) AS obsDateTime,
                               o.person_id,
                               o.concept_id
                             FROM obs o
                               JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                                       cn.name = 'FV, NAME (s) of Surgeon 1'
                                                       AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                       AND o.voided IS FALSE AND cn.voided IS FALSE
                             GROUP BY person_id) latest_obs ON latest_obs.obsDateTime = o.obs_datetime
                                                               AND latest_obs.person_id = o.person_id
                                                               AND latest_obs.concept_id = o.concept_id
                                                               AND o.voided IS FALSE
                      JOIN concept_name surgeon_cn ON surgeon_cn.concept_id = o.value_coded
                                                      AND surgeon_cn.voided IS FALSE
                                                      AND surgeon_cn.concept_name_type = 'FULLY_SPECIFIED') sn
    ON sn.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      concat(parentLocation.name, '(', b.bed_number, ')') AS 'Bed allocation',
                      bpam.patient_id
                    FROM
                      bed_patient_assignment_map bpam
                      INNER JOIN bed b
                        ON b.bed_id = bpam.bed_id AND b.voided IS FALSE AND bpam.date_stopped IS NULL AND
                           bpam.voided IS FALSE
                      INNER JOIN bed_location_map blm ON b.bed_id = blm.bed_id
                      INNER JOIN location childLocation
                        ON blm.location_id = childLocation.location_id AND childLocation.retired IS FALSE
                      INNER JOIN location parentLocation
                        ON parentLocation.location_id = childLocation.parent_location AND
                           parentLocation.retired IS FALSE
                    GROUP BY bpam.patient_id
                  ) bed_allocation ON bed_allocation.patient_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      o.encounter_id,
                      o.person_id,
                      o.value_datetime
                    FROM obs o
                      JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                              cn.name = 'SFP, DATE recorded'
                                              AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                              AND o.voided IS FALSE AND cn.voided IS FALSE
                  ) surgeonTRM
    ON surgeonTRM.encounter_id = surgeonFollowUp.encounter_id AND surgeonTRM.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                      answer.name,
                      o.person_id,
                      daterecorded.value_datetime
                    FROM
                      obs o
                      JOIN (
                             SELECT
                               o.obs_id,
                               MAX(o.obs_datetime) AS obsDateTime,
                               o.person_id
                             FROM obs o
                               JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                                       cn.name IN
                                                       ('MPA, Type of assessment', 'ULA, Type of assessment', 'LLA, Type of assessment')
                                                       AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                       AND o.voided IS FALSE AND cn.voided IS FALSE
                             GROUP BY person_id) latest_obs ON latest_obs.obsDateTime = o.obs_datetime
                                                               AND latest_obs.person_id = o.person_id
                                                               AND o.voided IS FALSE
                      JOIN concept_name assessment ON assessment.concept_id = o.concept_id
                                                      AND assessment.name IN
                                                          ('MPA, Type of assessment', 'ULA, Type of assessment', 'LLA, Type of assessment')
                                                      AND assessment.voided IS FALSE
                                                      AND assessment.concept_name_type = 'FULLY_SPECIFIED'
                      JOIN concept_name answer ON answer.concept_id = o.value_coded AND answer.voided IS FALSE AND answer.name= 'Final'
                      JOIN obs daterecorded
                        ON daterecorded.obs_group_id = o.obs_group_id AND daterecorded.voided IS FALSE
                      JOIN concept_name drConcept
                        ON drConcept.name IN ('LLA, DATE recorded', 'ULA, DATE recorded', 'MPA, DATE recorded') AND
                           drConcept.concept_id = daterecorded.concept_id
                      GROUP BY o.person_id
                  ) physioTRM ON physioTRM.person_id = p.person_id
  LEFT OUTER JOIN (
                  SELECT
                      o.person_id,
                      daterecorded.value_datetime
                    FROM
                      obs o
                      JOIN (
                             SELECT
                               o.obs_id,
                               MAX(o.obs_datetime) AS obsDateTime,
                               o.person_id
                             FROM obs o
                               JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                                       cn.name = 'PIA, Psychosocial overview and comments'
                                                       AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                       AND o.voided IS FALSE AND cn.voided IS FALSE
                             GROUP BY person_id) latest_obs ON latest_obs.obsDateTime = o.obs_datetime
                                                               AND latest_obs.person_id = o.person_id
                                                               AND o.voided IS FALSE
                      JOIN obs daterecorded
                        ON daterecorded.obs_group_id = o.obs_group_id AND daterecorded.voided IS FALSE
                      JOIN concept_name drConcept
                        ON drConcept.name = 'PIA, Date of consultation' AND
                           drConcept.concept_id = daterecorded.concept_id
                  GROUP BY o.person_id
                 ) psychoSocialTRM ON psychoSocialTRM.person_id = p.person_id
  LEFT OUTER JOIN (
                    SELECT
                        o.person_id,
                        daterecordedObs.value_datetime
                    FROM
    obs o
    JOIN (
             SELECT
                 o.obs_id,
                 MAX(e.encounter_datetime) AS latestEncounterDateTime,
                 o.concept_id,
                 o.person_id
             FROM obs o
                 JOIN concept_name cn ON cn.concept_id = o.concept_id AND
                                         cn.name = 'MDOF, Reason FOR visit'
                                         AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                         AND o.voided IS FALSE AND cn.voided IS FALSE
                 JOIN encounter e ON e.encounter_id = o.encounter_id AND e.voided IS FALSE
             GROUP BY person_id) latest_obs ON latest_obs.person_id = o.person_id
                                               AND latest_obs.concept_id = o.concept_id
                                               AND o.voided IS FALSE
    JOIN encounter e ON e.encounter_datetime = latest_obs.latestEncounterDateTime AND e.encounter_id = o.encounter_id
                        AND e.patient_id = latest_obs.person_id AND e.voided IS FALSE
    JOIN concept_name answer ON answer.concept_id = o.value_coded
                                AND answer.concept_name_type = 'FULLY_SPECIFIED'
                                AND answer.voided IS FALSE
                                AND answer.name = 'TRM visit'
    JOIN obs daterecordedObs
        ON daterecordedObs.obs_group_id = o.obs_group_id AND daterecordedObs.voided IS FALSE
    JOIN concept_name drConcept
        ON drConcept.name = 'MDOF, DATE recorded' AND drConcept.concept_id = daterecordedObs.concept_id AND
           drConcept.voided IS FALSE AND drConcept.concept_name_type = 'FULLY_SPECIFIED'
GROUP BY o.person_id
                  ) reasonForVisitDate ON reasonForVisitDate.person_id = p.person_id
  WHERE
        surgeonFollowUp.isPatientForSurgeory = 'No Surgery Planned'
    AND surgeonFollowUp.isPatientReadyForDischarged = 'Yes'
