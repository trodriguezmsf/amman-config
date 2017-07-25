DELETE FROM global_property WHERE property = 'emrapi.sqlSearch.plannedProcedureForPatient';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
VALUES ('emrapi.sqlSearch.plannedProcedureForPatient',
"SELECT
  planned_procedures.all_procedures,
  estimated_hrs.value_numeric AS esthrs,
  estimated_mins.value_numeric AS estmins
FROM
  person p
  INNER JOIN (
               SELECT
                 form_obs.obs_id,
                 form_obs.person_id
               FROM
                 (SELECT
                    MAX(o.obs_datetime) AS max_obs_datetime,
                    o.person_id
                  FROM obs o
                    INNER JOIN concept_name cn
                      ON cn.concept_id = o.concept_id
                         AND cn.name IN ('Surgeon Pre-Op Assessment and Treatment Plan', 'Surgeon Follow-up')
                         AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE AND
                         o.voided IS FALSE
                  GROUP BY o.person_id
                 ) latest_form_obs
                 INNER JOIN obs form_obs
                   ON form_obs.obs_datetime = latest_form_obs.max_obs_datetime
                      AND form_obs.person_id = latest_form_obs.person_id
                      AND form_obs.voided IS FALSE
                 INNER JOIN concept_name form_cn
                   ON form_cn.concept_id = form_obs.concept_id
                      AND form_cn.name IN ('Surgeon Pre-Op Assessment and Treatment Plan', 'Surgeon Follow-up')
                      AND form_cn.concept_name_type = 'FULLY_SPECIFIED' AND form_cn.voided IS FALSE
             ) latest_form ON latest_form.person_id = p.person_id
  INNER JOIN (

               SELECT consent_obs.obs_group_id
               FROM obs consent_obs
                 INNER JOIN concept_name consent_cn
                   ON consent_cn.concept_id = consent_obs.concept_id
                      AND consent_cn.name IN
                          ('SAP, Has Patient Consent Been Obtained?', 'SFP, Has patient consent been obtained?')
                      AND consent_cn.concept_name_type = 'FULLY_SPECIFIED' AND consent_cn.voided IS FALSE
                      AND consent_obs.voided IS FALSE
                 INNER JOIN concept_name consent_answer_cn
                   ON consent_answer_cn.concept_id = consent_obs.value_coded
                      AND consent_answer_cn.name = 'Yes'
                      AND consent_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                      consent_answer_cn.voided IS FALSE
             ) consent_on_form ON consent_on_form.obs_group_id = latest_form.obs_id

  LEFT OUTER JOIN (
                    SELECT
                      estimated_duration.obs_group_id,
                      estimated_hrs.value_numeric
                    FROM obs estimated_duration
                      INNER JOIN concept_name estimated_duration_cn
                        ON estimated_duration_cn.concept_id = estimated_duration.concept_id
                           AND estimated_duration_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_duration_cn.voided IS FALSE
                           AND estimated_duration_cn.name IN
                               ('SAP, Estimated duration', 'SFP, Estimated duration')
                           AND estimated_duration.voided IS FALSE
                      INNER JOIN concept_set cs ON  cs.concept_set = estimated_duration_cn.concept_id
                      INNER JOIN concept_name estimated_hrs_cn
                        ON estimated_hrs_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_hrs_cn.voided IS FALSE
                           AND estimated_hrs_cn.name IN ('SAP, Est Hours', 'SFP, Est Hours')
                           AND estimated_hrs_cn.concept_id = cs.concept_id
                      LEFT OUTER JOIN obs estimated_hrs
                        ON estimated_hrs.concept_id = estimated_hrs_cn.concept_id
                           AND estimated_hrs.obs_group_id = estimated_duration.obs_id
                           AND estimated_hrs.voided IS FALSE
                    GROUP BY estimated_duration.obs_group_id
                  ) estimated_hrs ON estimated_hrs.obs_group_id = latest_form.obs_id
  LEFT OUTER JOIN (
                    SELECT
                      estimated_duration.obs_group_id,
                      estimated_mins.obs_id,
                      estimated_mins.value_numeric
                    FROM obs estimated_duration
                      INNER JOIN concept_name estimated_duration_cn
                        ON estimated_duration_cn.concept_id = estimated_duration.concept_id
                           AND estimated_duration_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_duration_cn.voided IS FALSE
                           AND estimated_duration_cn.name IN
                               ('SAP, Estimated duration', 'SFP, Estimated duration')
                           AND estimated_duration.voided IS FALSE
                      INNER JOIN concept_set cs ON  cs.concept_set = estimated_duration_cn.concept_id
                      INNER JOIN concept_name estimated_hrs_cn
                        ON estimated_hrs_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_hrs_cn.voided IS FALSE
                           AND estimated_hrs_cn.name IN ('SAP, Est Minutes', 'SFP, Est Minutes')
                           AND estimated_hrs_cn.concept_id = cs.concept_id
                      LEFT OUTER JOIN obs estimated_mins
                        ON estimated_mins.concept_id = estimated_hrs_cn.concept_id
                           AND estimated_mins.obs_group_id = estimated_duration.obs_id
                           AND estimated_mins.voided IS FALSE
                    GROUP BY estimated_duration.obs_group_id
                  ) estimated_mins ON estimated_mins.obs_group_id = latest_form.obs_id
  LEFT OUTER JOIN (
                    SELECT
                      GROUP_CONCAT(planned_procedure SEPARATOR ' + ') AS all_procedures,
                      planned_procedure_group_id
                    FROM
                      (SELECT
                         CONCAT_WS(' on ', CONCAT_WS(' , ', procedures, procedures_non_coded), NULLIF(CONCAT_WS(' ', side, site), ' '))
                                                                              AS planned_procedure,
                         planned_surgical_procedures_on_form.planned_procedure__obs_group_id AS planned_procedure_group_id
                       FROM

                         (SELECT
                            planned_surgical_procedures_for_next_ot_section.obs_id                                 AS planned_procedure__obs_id,
                            planned_surgical_procedures_for_next_ot_section.obs_group_id                           AS planned_procedure__obs_group_id,
                            GROUP_CONCAT(DISTINCT proc_coded_answer_cn.name SEPARATOR
                                         ', ')                                                                     AS procedures,
                            GROUP_CONCAT(DISTINCT planned_proc_answer.value_text SEPARATOR
                                         ', ')                                                                     AS procedures_non_coded,
                            GROUP_CONCAT(DISTINCT COALESCE(site_coded_answer_cn.concept_short_name,
                                                           site_coded_answer_cn.concept_full_name) SEPARATOR
                                         ', ')                                                                     AS site,
                            GROUP_CONCAT(DISTINCT
                                         side_coded_answer_cn.name)                                                AS side
                          FROM obs
                               planned_surgical_procedures_for_next_ot_section
                            INNER JOIN concept_name planned_sp_cn
                              ON planned_sp_cn.concept_id = planned_surgical_procedures_for_next_ot_section.concept_id
                                 AND planned_sp_cn.name IN
                                     ('SAP, Planned Surgical Procedures for next OT', 'FP, Planned Surgical Procedures for next OT')
                                 AND planned_sp_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                 planned_sp_cn.voided IS FALSE
                                 AND planned_surgical_procedures_for_next_ot_section.voided IS FALSE
                            INNER JOIN concept_name planned_proc_cn
                              ON planned_proc_cn.concept_name_type = 'FULLY_SPECIFIED'
                                 AND planned_proc_cn.voided IS FALSE
                                 AND planned_proc_cn.name IN
                                     ('SAP, Planned procedure data', 'FP, Planned Procedure (surgical) data')
                            INNER JOIN concept_name site_of_surgical_procedure_cn
                              ON site_of_surgical_procedure_cn.concept_name_type = 'FULLY_SPECIFIED'
                                 AND site_of_surgical_procedure_cn.voided IS FALSE
                                 AND site_of_surgical_procedure_cn.name IN
                                     ('SAP, Site of surgical procedure', 'SFP, Site of surgical procedure')
                            INNER JOIN concept_name side_of_surgical_procedure_cn
                              ON side_of_surgical_procedure_cn.concept_name_type = 'FULLY_SPECIFIED'
                                 AND side_of_surgical_procedure_cn.voided IS FALSE
                                 AND side_of_surgical_procedure_cn.name IN
                                     ('SAP, Side of surgical procedure', 'SFP, Side of surgical procedure')
                            LEFT OUTER JOIN obs planned_procedure
                              ON planned_procedure.obs_group_id = planned_surgical_procedures_for_next_ot_section.obs_id
                                 AND planned_procedure.concept_id = planned_proc_cn.concept_id
                                 AND planned_procedure.voided IS FALSE
                            LEFT OUTER JOIN obs planned_proc_answer
                              ON planned_proc_answer.obs_group_id = planned_procedure.obs_id
                                 AND planned_proc_answer.voided IS FALSE
                            LEFT OUTER JOIN concept_name proc_coded_answer_cn
                              ON proc_coded_answer_cn.concept_id = planned_proc_answer.value_coded
                                 AND proc_coded_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                 proc_coded_answer_cn.voided IS FALSE
                            LEFT OUTER JOIN obs site_of_surgical_procedure
                              ON site_of_surgical_procedure.obs_group_id =
                                 planned_surgical_procedures_for_next_ot_section.obs_id
                                 AND site_of_surgical_procedure.concept_id = site_of_surgical_procedure_cn.concept_id
                                 AND site_of_surgical_procedure.voided IS FALSE
                            LEFT OUTER JOIN concept_view site_coded_answer_cn
                              ON site_coded_answer_cn.concept_id = site_of_surgical_procedure.value_coded
                                 AND site_coded_answer_cn.retired IS FALSE
                            LEFT OUTER JOIN obs side_of_surgical_procedure
                              ON side_of_surgical_procedure.obs_group_id =
                                 planned_surgical_procedures_for_next_ot_section.obs_id
                                 AND side_of_surgical_procedure.concept_id = side_of_surgical_procedure_cn.concept_id
                                 AND side_of_surgical_procedure.voided IS FALSE
                            LEFT OUTER JOIN concept_name side_coded_answer_cn
                              ON side_coded_answer_cn.concept_id = side_of_surgical_procedure.value_coded
                                 AND side_coded_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                 side_coded_answer_cn.voided IS FALSE
                          GROUP BY planned_surgical_procedures_for_next_ot_section.obs_id
                         ) planned_surgical_procedures_on_form
                       GROUP BY planned_surgical_procedures_on_form.planned_procedure__obs_id
                      ) planned_surgical_procedures_on_form
                    GROUP BY planned_surgical_procedures_on_form.planned_procedure_group_id
                  ) planned_procedures ON planned_procedures.planned_procedure_group_id = latest_form.obs_id
                  WHERE p.uuid = ${patientUuid}
"
   ,'SQL for to be scheduled patient listing queues for OT module',@uuid);