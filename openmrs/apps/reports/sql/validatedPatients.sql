SELECT
	DATE_FORMAT(dateOfPresentation.value_datetime, '%d/%m/%Y') AS 'Date of presentation',
    pi.identifier AS 'Identifier',
    CONCAT(pn.given_name, ' ', pn.family_name) AS 'Name',
    FLOOR(DATEDIFF(CURDATE(), p.birthdate) / 365) AS 'Age',
    pa.address3 AS 'Country',
    nameOfMLO.name AS 'Name of MLO',
    stage.value_numeric AS 'Stage',
    speciality.name AS 'Specialty',
    surgeon_name.name AS 'Name of Surgeon',
    priority.name AS 'Priority',
    comments.value_text AS 'Comments about Validation',
    surgical_final_validation.name AS 'Does the patient need surgical final validation',
    finalValidationExpectedDateOfArrival.monthYear AS 'Expected Month/Year of Arrival',
    careTakerRequired.value AS 'Is Caretaker Required?',
    statusOfOfficialDocuments.name AS 'Status of Official ID Documents'
FROM
    person p
INNER JOIN patient_identifier pi ON pi.patient_id = p.person_id
	AND p.voided IS FALSE
	AND pi.voided IS FALSE
INNER JOIN person_name pn ON pn.person_id = p.person_id
	AND pn.voided IS FALSE
INNER JOIN (
	SELECT
		pp.patient_id,
        workflow_state_cn.name
	FROM
		patient_program pp
	INNER JOIN patient_state ps ON ps.patient_program_id = pp.patient_program_id
		AND ps.voided IS FALSE
        AND ps.end_date IS NULL
		AND pp.voided IS FALSE
	INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state
		AND pws.retired IS FALSE
	INNER JOIN concept_name workflow_state_cn ON workflow_state_cn.concept_id = pws.concept_id
		AND workflow_state_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND workflow_state_cn.voided IS FALSE
) program_state ON program_state.patient_id = p.person_id
INNER JOIN (
	SELECT
        v.patient_id,
        vt.name,
        v.visit_id
    FROM
        visit v
    INNER JOIN visit_type vt ON vt.visit_type_id = v.visit_type_id
    INNER JOIN (
		SELECT
			v.patient_id,
            MAX(v.date_started) AS date_started
		FROM
			visit v
		GROUP BY v.patient_id
	) latest_visit ON latest_visit.patient_id = v.patient_id AND latest_visit.date_started = v.date_started
) latest_visit_type ON latest_visit_type.patient_id = p.person_id
LEFT OUTER JOIN person_address pa ON pa.person_id = p.person_id
	AND pa.voided IS FALSE
LEFT OUTER JOIN (
	SELECT
		pa.person_id,
		pa.value
	FROM
		person_attribute pa
	INNER JOIN person_attribute_type pat ON pat.person_attribute_type_id = pa.person_attribute_type_id
		AND pat.name = 'expectedDateofArrival'
		AND pa.voided IS FALSE
) expectedDateOfArrival ON expectedDateOfArrival.person_id = pi.patient_id
LEFT OUTER JOIN (
	SELECT
        o.person_id,
		GROUP_CONCAT(DISTINCT(COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
    FROM
		obs o
    INNER JOIN encounter e ON e.encounter_id = o.encounter_id
		AND o.voided IS FALSE
        AND e.voided IS FALSE
	INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
		AND cn.voided IS FALSE
		AND cn.concept_name_type = 'FULLY_SPECIFIED'
		AND cn.name = 'MH, Name of MLO'
    LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
        AND coded_fscn.voided IS FALSE
    LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'SHORT'
        AND coded_scn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name = 'MH, Name of MLO'
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY person_id
	) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
        AND latest_encounter.person_id = o.person_id
	GROUP BY o.person_id
) nameOfMLO ON nameOfMLO.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
        o.person_id,
		GROUP_CONCAT(DISTINCT(DATE_FORMAT(o.value_datetime, '%b/%Y'))) AS 'monthYear'
    FROM
		obs o
    INNER JOIN encounter e ON e.encounter_id = o.encounter_id
		AND o.voided IS FALSE
        AND e.voided IS FALSE
	INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
		AND cn.voided IS FALSE
		AND cn.concept_name_type = 'FULLY_SPECIFIED'
		AND cn.name = 'FV, Expected Date of Arrival'
    LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
        AND coded_fscn.voided IS FALSE
    LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'SHORT'
        AND coded_scn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name = 'FV, Expected Date of Arrival'
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY person_id
	) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
        AND latest_encounter.person_id = o.person_id
	GROUP BY o.person_id
) finalValidationExpectedDateOfArrival ON finalValidationExpectedDateOfArrival.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
        o.person_id,
		GROUP_CONCAT(DISTINCT(COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
    FROM
		obs o
    INNER JOIN encounter e ON e.encounter_id = o.encounter_id
		AND o.voided IS FALSE
        AND e.voided IS FALSE
	INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
		AND cn.voided IS FALSE
		AND cn.concept_name_type = 'FULLY_SPECIFIED'
		AND cn.name = 'FSTG, Specialty determined by MLO'
    LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
        AND coded_fscn.voided IS FALSE
    LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'SHORT'
        AND coded_scn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name = 'FSTG, Specialty determined by MLO'
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY person_id
	) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
        AND latest_encounter.person_id = o.person_id
	GROUP BY o.person_id
) speciality ON speciality.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
        o.person_id,
		MAX(o.value_numeric) AS 'value_numeric'
    FROM
		obs o
    INNER JOIN encounter e ON e.encounter_id = o.encounter_id
		AND o.voided IS FALSE
        AND e.voided IS FALSE
	INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
		AND cn.voided IS FALSE
		AND cn.concept_name_type = 'FULLY_SPECIFIED'
		AND cn.name = 'Stage'
    LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
        AND coded_fscn.voided IS FALSE
    LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
        AND coded_fscn.concept_name_type = 'SHORT'
        AND coded_scn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name = 'Stage'
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY person_id
    ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
        AND latest_encounter.person_id = o.person_id
    GROUP BY o.person_id
) stage ON stage.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		o.person_id,
		o.value_datetime
    FROM
		obs o
    INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
        AND cv.concept_full_name IN ('FUP, Date of presentation at Followup' , 'FSTG, Date of presentation at 1st stage')
        AND cv.retired IS FALSE
        AND o.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(o.obs_datetime) AS obs_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name IN ('FUP, Date of presentation at Followup' , 'FSTG, Date of presentation at 1st stage')
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		GROUP BY o.person_id
	) latest_obs ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
) dateOfPresentation ON dateOfPresentation.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		o.person_id,
        COALESCE(cv_answer.concept_short_name, cv_answer.concept_full_name) AS 'name'
    FROM obs o
    INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
        AND cv.concept_full_name IN ('FSTG, Priority' , 'FUP, Priority')
        AND cv.retired IS FALSE
        AND o.voided IS FALSE
    INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
        AND cv_answer.retired IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(o.obs_datetime) AS obs_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name IN ('FSTG, Priority' , 'FUP, Priority')
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		GROUP BY o.person_id
	) latest_obs ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
) priority ON priority.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		o.person_id,
        o.value_text
    FROM obs o
    INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
        AND cv.concept_full_name IN ('FSTG, Comments' , 'FUP, Comments about further stage admission')
        AND cv.retired IS FALSE
        AND o.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(o.obs_datetime) AS obs_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name IN ('FSTG, Comments' , 'FUP, Comments about further stage admission')
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		GROUP BY o.person_id
	) latest_obs ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
) comments ON comments.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		o.person_id,
        COALESCE(cv_answer.concept_short_name, cv_answer.concept_full_name) AS 'name'
    FROM obs o
    INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
        AND cv.concept_full_name IN ('FSTG, Does the Patient need Surgical Final Validation' , 'FUP, Does the Patient need Surgical Final Validation')
        AND cv.retired IS FALSE
        AND o.voided IS FALSE
    INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
        AND cv_answer.retired IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(o.obs_datetime) AS obs_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name IN ('FSTG, Does the Patient need Surgical Final Validation' , 'FUP, Does the Patient need Surgical Final Validation')
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		GROUP BY o.person_id
	) latest_obs ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
) surgical_final_validation ON surgical_final_validation.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		o.person_id,
        GROUP_CONCAT(DISTINCT(COALESCE(cv_answer.concept_short_name, cv_answer.concept_full_name))) AS 'name'
    FROM obs o
    INNER JOIN concept_view cv ON cv.concept_id = o.concept_id
        AND cv.concept_full_name IN ('FUP, Name (s) of Surgeon 1' , 'FV, Name (s) of Surgeon 1')
        AND cv.retired IS FALSE
        AND o.voided IS FALSE
    INNER JOIN concept_view cv_answer ON cv_answer.concept_id = o.value_coded
        AND cv_answer.retired IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(o.obs_datetime) AS obs_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.name IN ('FUP, Name (s) of Surgeon 1' , 'FV, Name (s) of Surgeon 1')
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
		GROUP BY o.person_id
	) latest_obs ON latest_obs.person_id = o.person_id AND latest_obs.obs_datetime = o.obs_datetime
	GROUP BY o.person_id
) surgeon_name ON surgeon_name.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
        p.person_id,
		IF(pa.value = 'true', 'Yes', NULL) AS 'value'
    FROM
        person p
    INNER JOIN person_attribute pa ON pa.person_id = p.person_id
        AND pa.voided IS FALSE
    INNER JOIN person_attribute_type pat ON pat.person_attribute_type_id = pa.person_attribute_type_id
		AND pat.name = 'isCareTakerRequired'
        AND pat.retired IS FALSE
) careTakerRequired ON careTakerRequired.person_id = p.person_id
LEFT OUTER JOIN	(
	SELECT
        p.person_id,
		cn.name
    FROM
        person p
	INNER JOIN person_attribute pa ON pa.person_id = p.person_id
		AND pa.voided IS FALSE
    INNER JOIN person_attribute_type pat ON pat.person_attribute_type_id = pa.person_attribute_type_id
		AND pat.name = 'statusofOfficialIDdocuments'
        AND pat.retired IS FALSE
    INNER JOIN concept_name cn ON cn.concept_id = pa.value
        AND cn.concept_name_type = 'FULLY_SPECIFIED'
        AND cn.voided IS FALSE
) statusOfOfficialDocuments ON statusOfOfficialDocuments.person_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		e.patient_id,
		e.visit_id,
		surgical_answer_cn.name AS 'surgicalOutcome',
		anaesthesia_answer_cn.name As 'anaesthesiaOutcome'
	FROM
		encounter e
	INNER JOIN obs surgical_obs ON surgical_obs.encounter_id = e.encounter_id
		AND e.voided IS FALSE
		AND surgical_obs.voided IS FALSE
	INNER JOIN concept_name surgical_cn ON surgical_cn.concept_id = surgical_obs.concept_id
		AND surgical_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND surgical_cn.name = 'FSTG, Outcomes for 1st stage surgical validation'
		AND surgical_cn.voided IS FALSE
	INNER JOIN concept_name surgical_answer_cn ON surgical_answer_cn.concept_id = surgical_obs.value_coded
		AND surgical_answer_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND surgical_answer_cn.voided IS FALSE
	INNER JOIN obs anaesthesia_obs ON anaesthesia_obs.encounter_id = e.encounter_id
		AND anaesthesia_obs.voided IS FALSE
	INNER JOIN concept_name anaesthesia_cn ON anaesthesia_cn.concept_id = anaesthesia_obs.concept_id
		AND anaesthesia_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND anaesthesia_cn.name = 'FSTG, Outcomes for 1st stage Anaesthesia validation'
		AND anaesthesia_cn.voided IS FALSE
	INNER JOIN concept_name anaesthesia_answer_cn ON anaesthesia_answer_cn.concept_id = anaesthesia_obs.value_coded
		AND anaesthesia_answer_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND anaesthesia_answer_cn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
			AND cn.name = 'First Stage Validation'
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY o.person_id
	) latest_first_stage_encounter ON latest_first_stage_encounter.person_id = e.patient_id AND latest_first_stage_encounter.encounter_datetime = e.encounter_datetime
) latest_first_stage_form ON latest_first_stage_form.patient_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		e.patient_id,
		e.visit_id,
		outcome_answer_cn.name AS 'outcome'
	FROM
		encounter e
	INNER JOIN obs o ON o.encounter_id = e.encounter_id
		AND e.voided IS FALSE
		AND o.voided IS FALSE
	INNER JOIN concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
		AND outcome_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND outcome_cn.name = 'FUP, Outcomes for follow-up surgical validation'
		AND outcome_cn.voided IS FALSE
	INNER JOIN concept_name outcome_answer_cn ON outcome_answer_cn.concept_id = o.value_coded
		AND outcome_answer_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND outcome_answer_cn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
			AND cn.name = 'Follow-up validation'
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY o.person_id
	) latest_followup_encounter ON latest_followup_encounter.person_id = e.patient_id AND latest_followup_encounter.encounter_datetime = e.encounter_datetime
) latest_followup_form ON latest_followup_form.patient_id = p.person_id
LEFT OUTER JOIN (
	SELECT
		e.patient_id,
		e.visit_id,
		outcome_answer_cn.name AS 'outcome'
		FROM
		encounter e
	INNER JOIN obs o ON o.encounter_id = e.encounter_id
		AND e.voided IS FALSE
		AND o.voided IS FALSE
	INNER JOIN concept_name outcome_cn ON outcome_cn.concept_id = o.concept_id
		AND outcome_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND outcome_cn.name = 'FV, Outcomes FV'
		AND outcome_cn.voided IS FALSE
	INNER JOIN concept_name outcome_answer_cn ON outcome_answer_cn.concept_id = o.value_coded
		AND outcome_answer_cn.concept_name_type = 'FULLY_SPECIFIED'
		AND outcome_answer_cn.voided IS FALSE
	INNER JOIN (
		SELECT
			o.person_id,
			MAX(e.encounter_datetime) AS encounter_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
			AND cn.concept_name_type = 'FULLY_SPECIFIED'
			AND cn.voided IS FALSE
			AND o.voided IS FALSE
			AND cn.name = 'FV, Final Validation'
		INNER JOIN encounter e ON e.encounter_id = o.encounter_id
			AND e.voided IS FALSE
		GROUP BY o.person_id
	) latest_final_validation_encounter ON latest_final_validation_encounter.person_id = e.patient_id AND latest_final_validation_encounter.encounter_datetime = e.encounter_datetime
) latest_final_validation_form ON latest_final_validation_form.patient_id = p.person_id
WHERE latest_visit_type.name IN ('First Stage Validation' , 'Follow-Up Validation')
	AND expectedDateOfArrival.value IS NULL
    AND ((
		latest_first_stage_form.surgicalOutcome = 'Valid'
			AND latest_first_stage_form.anaesthesiaOutcome = 'Fits anaesthesia criteria'
            AND latest_followup_form.patient_id IS NULL
            AND program_state.name = 'Identification'
	) OR (
		latest_followup_form.outcome = 'Further stage admission'
            AND program_state.name = 'Network Follow-up'
	))
    AND (
		latest_final_validation_form.outcome IS NULL OR latest_final_validation_form.outcome NOT IN (
			'Rejected',
			'R2A : Surgery Outside',
			'R2B: Refused Treatment or Follow-up',
			'R2C: refused to travel to Amman',
			'R2D: Refused to Undergo Surgery',
      'Further Evaluation'
		)
	)
ORDER BY dateOfPresentation.value_datetime