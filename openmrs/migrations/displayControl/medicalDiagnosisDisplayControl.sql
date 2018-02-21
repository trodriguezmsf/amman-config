DELETE FROM global_property WHERE property = 'bahmni.sqlGet.medicalDiagnosisData';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.medicalDiagnosisData',
"SELECT
  p.person_id,
  medical_diagnosis
FROM
  person p
  INNER JOIN (SELECT
                e.patient_id,
                medical_diagnosis
              FROM encounter e
                INNER JOIN (SELECT
                              v.visit_id,
                              v.patient_id
                            FROM visit v
                              INNER JOIN (SELECT
                                            patient_id,
                                            max(v.date_created) AS `date_created`
                                          FROM visit v
                                            INNER JOIN visit_type vt ON v.visit_type_id = vt.visit_type_id AND
                                                                        vt.name = 'Hospital' AND
                                                                        v.voided IS FALSE AND
                                                                        vt.retired IS FALSE
                                          GROUP BY v.patient_id) latestHospitalVist
                                ON v.patient_id = latestHospitalVist.patient_id AND
                                   v.date_created = latestHospitalVist.date_created) hospitalVisit
                  ON hospitalVisit.visit_id = e.visit_id AND e.patient_id = hospitalVisit.patient_id
                INNER JOIN (SELECT
                              CONCAT_WS(' , ', surgical_diagnosis.diagnosis_coded,
                                        surgical_diagnosis.diagnosis_non_coded) AS medical_diagnosis,
                              surgical_diagnosis.encounter_id
                            FROM
                              (SELECT
                                 diagnosis.encounter_id                  AS encounter_id,
                                 diagnosis.obs_group_id                  AS obs_group_id,
                                 GROUP_CONCAT(DISTINCT daignosis_answer_cn.name SEPARATOR
                                              ', ')                      AS diagnosis_coded,
                                 GROUP_CONCAT(DISTINCT dignosis_cn_answer.value_text SEPARATOR
                                              ', ')                      AS diagnosis_non_coded
                               FROM obs
                                    diagnosis
                                 INNER JOIN concept_name surgical_diagnosis
                                   ON surgical_diagnosis.concept_id = diagnosis.concept_id
                                      AND surgical_diagnosis.name = 'OBS, Medical Diagnoses'
                                      AND surgical_diagnosis.concept_name_type = 'FULLY_SPECIFIED' AND
                                      surgical_diagnosis.voided IS FALSE
                                      AND diagnosis.voided IS FALSE
                                 INNER JOIN concept_name diagnosis_cn
                                   ON diagnosis_cn.concept_name_type = 'FULLY_SPECIFIED'
                                      AND diagnosis_cn.voided IS FALSE
                                      AND diagnosis_cn.name = 'Medical Diagnosis Data'
                                 LEFT OUTER JOIN obs surgical_diagnosis_proc
                                   ON surgical_diagnosis_proc.obs_group_id = diagnosis.obs_id
                                      AND surgical_diagnosis_proc.concept_id = diagnosis_cn.concept_id
                                      AND surgical_diagnosis_proc.voided IS FALSE
                                 LEFT OUTER JOIN obs dignosis_cn_answer
                                   ON dignosis_cn_answer.obs_group_id = surgical_diagnosis_proc.obs_id
                                      AND dignosis_cn_answer.voided IS FALSE
                                 LEFT OUTER JOIN concept_name daignosis_answer_cn
                                   ON daignosis_answer_cn.concept_id = dignosis_cn_answer.value_coded
                                      AND daignosis_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                      daignosis_answer_cn.voided IS FALSE
                               GROUP BY diagnosis.obs_id) surgical_diagnosis) diagnosis
                  ON diagnosis.encounter_id = e.encounter_id) diagnosisData
    ON diagnosisData.patient_id = p.person_id
WHERE p.uuid = ${patientUuid};"
, 'medical diagnosis data for patients', @uuid);
