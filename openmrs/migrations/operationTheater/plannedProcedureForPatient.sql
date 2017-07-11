DELETE FROM global_property WHERE property = 'emrapi.sqlSearch.plannedProcedureForPatient';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
VALUES ('emrapi.sqlSearch.plannedProcedureForPatient',
"SELECT
    GROUP_CONCAT(grouped_proc SEPARATOR ' + ') AS all_procedures,
    MAX(est_hrs)                               AS esthrs,
    MAX(est_mins)                              AS estmins
FROM
    (
        SELECT
            row_id,
            form_id,
            CONCAT_WS('', procedures, IF(procedures_non_coded IS NOT NULL, concat(', ', procedures_non_coded), ''), ' on ', side, ' ', site) AS grouped_proc,
            est_hrs,
            est_mins
        FROM
            (
                SELECT
                    planned_surgical_procedures.obs_id                                                      AS row_id,
                    form_obs.obs_id                                                                         AS form_id,
                    GROUP_CONCAT(DISTINCT proc_coded_answer_cn.name SEPARATOR ', ')                         AS procedures,
                    GROUP_CONCAT(DISTINCT planned_proc_answer.value_text SEPARATOR ', ')                    AS procedures_non_coded,
                    GROUP_CONCAT(DISTINCT COALESCE(site_coded_answer_cn.concept_short_name,
                                                   site_coded_answer_cn.concept_full_name) SEPARATOR ', ')  AS site,
                    GROUP_CONCAT(DISTINCT side_coded_answer_cn.name)                                        AS side,
                    GROUP_CONCAT(DISTINCT estimated_hrs.value_numeric)                                      AS est_hrs,
                    GROUP_CONCAT(DISTINCT estimated_mins.value_numeric)                                     AS est_mins
                FROM
                    person p
                    INNER JOIN
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
                    ) latest_form_obs ON latest_form_obs.person_id = p.person_id
                    INNER JOIN obs form_obs
                        ON form_obs.obs_datetime = latest_form_obs.max_obs_datetime
                           AND form_obs.person_id = p.person_id
                           AND form_obs.voided IS FALSE
                    INNER JOIN concept_name form_cn
                        ON form_cn.concept_id = form_obs.concept_id
                           AND form_cn.name IN ('Surgeon Pre-Op Assessment and Treatment Plan', 'Surgeon Follow-up')
                           AND form_cn.concept_name_type = 'FULLY_SPECIFIED' AND form_cn.voided IS FALSE
                    INNER JOIN obs consent_obs
                        ON consent_obs.obs_group_id = form_obs.obs_id
                           AND consent_obs.voided IS FALSE
                    INNER JOIN concept_name consent_cn
                        ON consent_cn.concept_id = consent_obs.concept_id
                           AND consent_cn.name IN
                               ('SAP, Has Patient Consent Been Obtained?', 'SFP, Has patient consent been obtained?')
                           AND consent_cn.concept_name_type = 'FULLY_SPECIFIED' AND consent_cn.voided IS FALSE
                    INNER JOIN concept_name consent_answer_cn
                        ON consent_answer_cn.concept_id = consent_obs.value_coded
                           AND consent_answer_cn.name = 'Yes'
                           AND consent_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                           consent_answer_cn.voided IS FALSE
                    INNER JOIN obs planned_surgical_procedures
                        ON planned_surgical_procedures.obs_group_id = form_obs.obs_id
                           AND planned_surgical_procedures.voided IS FALSE
                    INNER JOIN concept_name planned_sp_cn
                        ON planned_sp_cn.concept_id = planned_surgical_procedures.concept_id
                           AND planned_sp_cn.name IN
                               ('SAP, Planned Surgical Procedures for next OT', 'FP, Planned Surgical Procedures for next OT')
                           AND planned_sp_cn.concept_name_type = 'FULLY_SPECIFIED' AND planned_sp_cn.voided IS FALSE
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
                    INNER JOIN concept_name estimated_duration_cn
                        ON estimated_duration_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_duration_cn.voided IS FALSE
                           AND estimated_duration_cn.name IN
                               ('SAP, Estimated duration', 'SFP, Estimated duration')
                    INNER JOIN concept_name estimated_hrs_cn
                        ON estimated_hrs_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_hrs_cn.voided IS FALSE
                           AND estimated_hrs_cn.name IN ('SAP, Est Hours', 'SFP, Est Hours')
                    INNER JOIN concept_name estimated_mins_cn
                        ON estimated_mins_cn.concept_name_type = 'FULLY_SPECIFIED'
                           AND estimated_mins_cn.voided IS FALSE
                           AND estimated_mins_cn.name IN ('SAP, Est Minutes', 'SFP, Est Minutes')
                    LEFT OUTER JOIN obs planned_procedure
                        ON planned_procedure.obs_group_id = planned_surgical_procedures.obs_id
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
                        ON site_of_surgical_procedure.obs_group_id = planned_surgical_procedures.obs_id
                           AND site_of_surgical_procedure.concept_id = site_of_surgical_procedure_cn.concept_id
                           AND site_of_surgical_procedure.voided IS FALSE
                    LEFT OUTER JOIN concept_view site_coded_answer_cn
                        ON site_coded_answer_cn.concept_id = site_of_surgical_procedure.value_coded
                           AND site_coded_answer_cn.retired IS FALSE
                    LEFT OUTER JOIN obs side_of_surgical_procedure
                        ON side_of_surgical_procedure.obs_group_id = planned_surgical_procedures.obs_id
                           AND side_of_surgical_procedure.concept_id = side_of_surgical_procedure_cn.concept_id
                           AND side_of_surgical_procedure.voided IS FALSE
                    LEFT OUTER JOIN concept_name side_coded_answer_cn
                        ON side_coded_answer_cn.concept_id = side_of_surgical_procedure.value_coded
                           AND side_coded_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                           side_coded_answer_cn.voided IS FALSE
                    LEFT OUTER JOIN obs estimated_duration
                        ON estimated_duration.obs_group_id = form_obs.obs_id
                           AND estimated_duration.concept_id = estimated_duration_cn.concept_id
                           AND estimated_duration.voided IS FALSE
                    LEFT OUTER JOIN obs estimated_hrs
                        ON estimated_hrs.obs_group_id = estimated_duration.obs_id
                           AND estimated_hrs.concept_id = estimated_hrs_cn.concept_id
                           AND estimated_hrs.voided IS FALSE
                    LEFT OUTER JOIN obs estimated_mins
                        ON estimated_mins.obs_group_id = estimated_duration.obs_id
                           AND estimated_mins.concept_id = estimated_mins_cn.concept_id
                           AND estimated_mins.voided IS FALSE
                WHERE
                    p.uuid = ${patientUuid}
                GROUP BY planned_surgical_procedures.obs_id) innerQuery) outerQuery
GROUP BY form_id"
   ,'SQL for to be scheduled patient listing queues for OT module',@uuid);