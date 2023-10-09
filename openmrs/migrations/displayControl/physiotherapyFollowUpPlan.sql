DELETE FROM global_property WHERE property = 'bahmni.sqlGet.physiotherapyFollowUpPlan';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.physiotherapyFollowUpPlan', "
 SELECT
    treatment_provided.value as 'Physiotherapy treatment provided to patient',
    referral_suggested.answer_concept_name as 'Referral suggested',
    recommended_plan.value as 'Recommended physiotherapy treatment plan',
    physio_suggested.answer_concept_name as 'Network Physio Suggested',
    exercises_training.value as 'Home exercises / Family training',
    points_concerns.value as 'Points to consider / Special concerns'
FROM
    (
        SELECT
            o.encounter_id,
            SUBSTRING(cn.name, 1, 5) AS substring_of_concept_name
        FROM
            obs o
            INNER JOIN concept_name cn ON o.concept_id = cn.concept_id
        WHERE
            (
                CASE
                    WHEN (
                        SELECT
                            MAX(max_value_dateTime) AS MAX_DATE
                        FROM
                            (
                                SELECT
                                    value_dateTime AS max_value_dateTime
                                FROM
                                    obs o
                                    INNER JOIN (
                                        SELECT
                                            encounter_id
                                        FROM
                                            obs
                                        WHERE
                                            concept_id IN (
                                                SELECT
                                                    concept_id
                                                FROM
                                                    concept_name
                                                WHERE
                                                    name = 'ULA, Type of assessment'
                                            )
                                        AND person_id = (
                                            SELECT
                                                p.person_id
                                            from
                                                person p
                                            where
                                                p.uuid = ${patientUuid}
                                        )
                                        ORDER BY
                                            obs_dateTime DESC
                                        LIMIT
                                            1
                                    ) latest_encounter ON latest_encounter.encounter_id = o.encounter_id
                                WHERE
                                    concept_id = (
                                        SELECT
                                            concept_id
                                        FROM
                                            concept_name
                                        WHERE
                                            name = 'ULA, Date recorded'
                                    )
                                    AND o.voided = 0
                                    AND o.person_id = (
                                        SELECT
                                            p.person_id
                                        FROM
                                            person p
                                        WHERE
                                            p.uuid = ${patientUuid}
                                    )
                                UNION
                                ALL
                                SELECT
                                    value_dateTime AS max_value_dateTime
                                FROM
                                    obs o
                                    INNER JOIN (
                                        SELECT
                                            encounter_id
                                        FROM
                                            obs
                                        WHERE
                                            concept_id IN (
                                                SELECT
                                                    concept_id
                                                FROM
                                                    concept_name
                                                WHERE
                                                    name = 'LLA, Type of assessment'
                                            )
                                        AND person_id = (
                                            SELECT
                                                p.person_id
                                            from
                                                person p
                                            where
                                                p.uuid = ${patientUuid}
                                        )
                                        ORDER BY
                                            obs_dateTime DESC
                                        LIMIT
                                            1
                                    ) latest_encounter ON latest_encounter.encounter_id = o.encounter_id
                                WHERE
                                    concept_id = (
                                        SELECT
                                            concept_id
                                        FROM
                                            concept_name
                                        WHERE
                                            name = 'LLA, Date recorded'
                                    )
                                    AND o.voided = 0
                                    AND o.person_id = (
                                        SELECT
                                            p.person_id
                                        FROM
                                            person p
                                        WHERE
                                            p.uuid = ${patientUuid}
                                    )
                                UNION
                                ALL
                                SELECT
                                    value_dateTime AS max_value_dateTime
                                FROM
                                    obs o
                                    INNER JOIN (
                                        SELECT
                                            encounter_id
                                        FROM
                                            obs
                                        WHERE
                                            concept_id IN (
                                                SELECT
                                                    concept_id
                                                FROM
                                                    concept_name
                                                WHERE
                                                    name = 'MPA, Type of assessment'
                                            )
                                        AND person_id = (
                                            SELECT
                                                p.person_id
                                            from
                                                person p
                                            where
                                                p.uuid = ${patientUuid}
                                        )
                                        ORDER BY
                                            obs_dateTime DESC
                                        LIMIT
                                            1
                                    ) latest_encounter ON latest_encounter.encounter_id = o.encounter_id
                                WHERE
                                    concept_id = (
                                        SELECT
                                            concept_id
                                        FROM
                                            concept_name
                                        WHERE
                                            name = 'MPA, Date recorded'
                                    )
                                    AND o.voided = 0
                                    AND o.person_id = (
                                        SELECT
                                            p.person_id
                                        FROM
                                            person p
                                        WHERE
                                            p.uuid = ${patientUuid}
                                    )
                            ) AS getMaxDateTime
                    ) IS NOT NULL THEN (
                        o.value_dateTime = (
                            SELECT
                                MAX(max_value_dateTime) AS MAX_DATE
                            FROM
                                (
                                    SELECT
                                        value_dateTime AS max_value_dateTime
                                    FROM
                                        obs o
                                        INNER JOIN (
                                            SELECT
                                                encounter_id
                                            FROM
                                                obs
                                            WHERE
                                                concept_id IN (
                                                    SELECT
                                                        concept_id
                                                    FROM
                                                        concept_name
                                                    WHERE
                                                        name = 'ULA, Type of assessment'
                                                )
                                            AND person_id = (
                                                SELECT
                                                    p.person_id
                                                from
                                                    person p
                                                where
                                                    p.uuid = ${patientUuid}
                                            )
                                            ORDER BY
                                                obs_dateTime DESC
                                            LIMIT
                                                1
                                        ) latest_encounter ON latest_encounter.encounter_id = o.encounter_id
                                    WHERE
                                        concept_id = (
                                            SELECT
                                                concept_id
                                            FROM
                                                concept_name
                                            WHERE
                                                name = 'ULA, Date recorded'
                                        )
                                        AND o.voided = 0
                                        AND o.person_id = (
                                            SELECT
                                                p.person_id
                                            FROM
                                                person p
                                            WHERE
                                                p.uuid = ${patientUuid}
                                        )
                                    UNION
                                    ALL
                                    SELECT
                                        value_dateTime AS max_value_dateTime
                                    FROM
                                        obs o
                                        INNER JOIN (
                                            SELECT
                                                encounter_id
                                            FROM
                                                obs
                                            WHERE
                                                concept_id IN (
                                                    SELECT
                                                        concept_id
                                                    FROM
                                                        concept_name
                                                    WHERE
                                                        name = 'LLA, Type of assessment'
                                                )
                                            AND person_id = (
                                                SELECT
                                                    p.person_id
                                                from
                                                    person p
                                                where
                                                    p.uuid = ${patientUuid}
                                            )
                                            ORDER BY
                                                obs_dateTime DESC
                                            LIMIT
                                                1
                                        ) latest_encounter ON latest_encounter.encounter_id = o.encounter_id
                                    WHERE
                                        concept_id = (
                                            SELECT
                                                concept_id
                                            FROM
                                                concept_name
                                            WHERE
                                                name = 'LLA, Date recorded'
                                        )
                                        AND o.voided = 0
                                        AND o.person_id = (
                                            SELECT
                                                p.person_id
                                            FROM
                                                person p
                                            WHERE
                                                p.uuid = ${patientUuid}
                                        )
                                    UNION
                                    ALL
                                    SELECT
                                        value_dateTime AS max_value_dateTime
                                    FROM
                                        obs o
                                        INNER JOIN (
                                            SELECT
                                                encounter_id
                                            FROM
                                                obs
                                            WHERE
                                                concept_id IN (
                                                    SELECT
                                                        concept_id
                                                    FROM
                                                        concept_name
                                                    WHERE
                                                        name = 'MPA, Type of assessment'
                                                )
                                            AND person_id = (
                                                SELECT
                                                    p.person_id
                                                from
                                                    person p
                                                where
                                                    p.uuid = ${patientUuid}
                                            )
                                            ORDER BY
                                                obs_dateTime DESC
                                            LIMIT
                                                1
                                        ) latest_encounter ON latest_encounter.encounter_id = o.encounter_id
                                    WHERE
                                        concept_id = (
                                            SELECT
                                                concept_id
                                            FROM
                                                concept_name
                                            WHERE
                                                name = 'MPA, Date recorded'
                                        )
                                        AND o.voided = 0
                                        AND o.person_id = (
                                            SELECT
                                                p.person_id
                                            FROM
                                                person p
                                            WHERE
                                                p.uuid = ${patientUuid}
                                        )
                                ) AS getMaxDateTime
                        )
                        AND o.concept_id = (
                            SELECT
                                o.concept_id
                            FROM
                                obs o
                            WHERE
                                concept_id IN (
                                    SELECT
                                        concept_id
                                    from
                                        concept_name cn
                                    where
                                        cn.name IN (
                                            'LLA, Date recorded',
                                            'ULA, Date recorded',
                                            'MPA, Date recorded'
                                        )
                                )
                                AND o.voided=0
                                AND o.person_id = (
                                    SELECT
                                        p.person_id
                                    from
                                        person p
                                    where
                                        p.uuid = ${patientUuid}
                                )
                            ORDER BY
                                o.value_dateTime DESC,
                                o.encounter_id DESC
                            LIMIT
                                1
                        )
                        AND o.person_id = (
                            SELECT
                                p.person_id
                                FROM
                                person p
                                WHERE
                                p.uuid = ${patientUuid}
                        )
                    )
                    ELSE (
                        o.obs_dateTime = (
                            SELECT
                                MAX(o.obs_dateTime)
                            FROM
                                obs o
                            WHERE
                                concept_id IN (
                                    SELECT
                                        concept_id
                                    FROM
                                        concept_name
                                    WHERE
                                        name IN (
                                            'LLA, Type of assessment',
                                            'ULA, Type of assessment',
                                            'MPA, Type of assessment'
                                        )
                                )
                                AND o.person_id = (
                                    SELECT
                                        p.person_id
                                    from
                                        person p
                                    where
                                        p.uuid = ${patientUuid}
                                )
                            ORDER BY
                                obs_dateTime DESC
                            LIMIT
                                1
                        )
                        AND o.concept_id = (
                            SELECT
                                o.concept_id
                            FROM
                                obs o
                            WHERE
                                concept_id IN (
                                    SELECT
                                        concept_id
                                    FROM
                                        concept_name
                                    WHERE
                                        name IN (
                                            'LLA, Type of assessment',
                                            'ULA, Type of assessment',
                                            'MPA, Type of assessment'
                                        )
                                )
                                AND o.person_id = (
                                    SELECT
                                        p.person_id
                                    from
                                        person p
                                    where
                                        p.uuid = ${patientUuid}
                                )
                            ORDER BY
                                obs_dateTime DESC
                            LIMIT
                                1
                        )
                        AND o.person_id = (
                            SELECT
                                p.person_id
                                FROM
                                person p
                                WHERE
                                p.uuid = ${patientUuid}
                        )
                    )
                END
            )
        ORDER BY
            obs_dateTime DESC
        LIMIT
            1
    ) encounterData
    LEFT JOIN (
        SELECT
            cn.name,
            o.value_text as value,
            o.encounter_id
        FROM
            person p
            INNER JOIN obs o ON p.person_id = o.person_id
            INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
            AND cn.voided IS FALSE
            AND o.voided IS FALSE
            AND cn.concept_name_type = 'FULLY_SPECIFIED'
            AND o.person_id = (
                SELECT
                    p.person_id
                FROM
                    person p
                WHERE
                    p.uuid = ${patientUuid}
            )
    ) treatment_provided on treatment_provided.encounter_id = encounterData.encounter_id
    AND treatment_provided.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Physiotherapy treatment provided to patient'
        )
    )
    LEFT JOIN (
        SELECT
            cn.name,
            coded_fscn.name answer_concept_name,
            o.encounter_id
        FROM
            person p
            INNER JOIN obs o ON p.person_id = o.person_id
            INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
            AND cn.voided IS FALSE
            AND o.voided IS FALSE
            AND cn.concept_name_type = 'FULLY_SPECIFIED'
            INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
            AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
            AND coded_fscn.voided IS FALSE
            AND o.person_id = (
                SELECT
                    p.person_id
                FROM
                    person p
                WHERE
                    p.uuid = ${patientUuid}
            )
    ) referral_suggested on referral_suggested.encounter_id = encounterData.encounter_id
    AND referral_suggested.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Referral suggested'
        )
    )
    LEFT JOIN (
        SELECT
            cn.name,
            o.value_text as value,
            o.encounter_id
        FROM
            person p
            INNER JOIN obs o ON p.person_id = o.person_id
            INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
            AND cn.voided IS FALSE
            AND o.voided IS FALSE
            AND cn.concept_name_type = 'FULLY_SPECIFIED'
            AND o.person_id = (
                SELECT
                    p.person_id
                FROM
                    person p
                WHERE
                    p.uuid = ${patientUuid}
            )
    ) recommended_plan on recommended_plan.encounter_id = encounterData.encounter_id
    AND recommended_plan.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Recommended physiotherapy treatment plan'
        )
    )
    LEFT JOIN (
        SELECT
            cn.name,
            coded_fscn.name answer_concept_name,
            o.encounter_id
        FROM
            person p
            INNER JOIN obs o ON p.person_id = o.person_id
            INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
            AND cn.voided IS FALSE
            AND o.voided IS FALSE
            AND cn.concept_name_type = 'FULLY_SPECIFIED'
            INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
            AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
            AND coded_fscn.voided IS FALSE
            AND o.person_id = (
                SELECT
                    p.person_id
                FROM
                    person p
                WHERE
                    p.uuid = ${patientUuid}
            )
    ) physio_suggested on physio_suggested.encounter_id = encounterData.encounter_id
    AND physio_suggested.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Network physio suggested'
        )
    )
    LEFT JOIN (
        SELECT
            cn.name,
            o.value_text as value,
            o.encounter_id
        FROM
            person p
            INNER JOIN obs o ON p.person_id = o.person_id
            INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
            AND cn.voided IS FALSE
            AND o.voided IS FALSE
            AND cn.concept_name_type = 'FULLY_SPECIFIED'
            AND o.person_id = (
                SELECT
                    p.person_id
                FROM
                    person p
                WHERE
                    p.uuid = ${patientUuid}
            )
    ) exercises_training on exercises_training.encounter_id = encounterData.encounter_id
    AND exercises_training.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Home exercises / Family training'
        )
    )
    LEFT JOIN (
        SELECT
            cn.name,
            o.value_text as value,
            o.encounter_id
        FROM
            person p
            INNER JOIN obs o ON p.person_id = o.person_id
            INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
            AND cn.voided IS FALSE
            AND o.voided IS FALSE
            AND cn.concept_name_type = 'FULLY_SPECIFIED'
            AND o.person_id = (
                SELECT
                    p.person_id
                FROM
                    person p
                WHERE
                    p.uuid = ${patientUuid}
            )
    ) points_concerns on points_concerns.encounter_id = encounterData.encounter_id
    AND points_concerns.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Points to consider / Special concerns'
        )
    );"
  , 'PhysiotherapyFollowUpPlan', @uuid);