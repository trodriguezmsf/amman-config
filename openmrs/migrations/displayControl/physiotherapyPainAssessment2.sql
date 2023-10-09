DELETE FROM global_property WHERE property = 'bahmni.sqlGet.physiotherapyPainAssessment2';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.physiotherapyPainAssessment2', "
SELECT
    c_sn.name as concept_name,
    coded_fscn.name as answer_concept_name,
    o.obs_group_id
FROM
    person p
    INNER JOIN obs o ON p.person_id = o.person_id
    INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
    AND cn.voided IS FALSE
    AND o.voided IS FALSE
    AND cn.concept_name_type = 'FULLY_SPECIFIED'
    INNER JOIN concept_name c_sn ON c_sn.concept_id = o.concept_id
    AND c_sn.concept_name_type = 'SHORT'
    AND c_sn.voided IS FALSE
    INNER JOIN (
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
    ) encounterData ON encounterData.encounter_id = o.encounter_id
    AND cn.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Side of pain'
        )
    )
    INNER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
    AND coded_fscn.concept_name_type LIKE CASE
        WHEN c_sn.name = 'Site of pain' THEN 'SHORT'
        ELSE 'FULLY_SPECIFIED'
    END
    AND coded_fscn.voided IS FALSE
    WHERE
    p.uuid = ${patientUuid}
UNION
ALL
SELECT
    c_sn.name as concept_name,
    o.value_text as answer_concept_name,
    o.obs_group_id
FROM
    person p
    INNER JOIN obs o ON p.person_id = o.person_id
    INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
    AND cn.voided IS FALSE
    AND o.voided IS FALSE
    AND cn.concept_name_type = 'FULLY_SPECIFIED'
    INNER JOIN concept_name c_sn ON c_sn.concept_id = o.concept_id
    AND c_sn.concept_name_type = 'SHORT'
    AND c_sn.voided IS FALSE
    INNER JOIN (
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
    ) encounterData ON encounterData.encounter_id = o.encounter_id
    AND cn.name IN (
        CONCAT(
            encounterData.substring_of_concept_name,
            'Type of pain'
        ),
        CONCAT(
            encounterData.substring_of_concept_name,
            'When does the pain occur'
        )
    )WHERE
  p.uuid = ${patientUuid} 
  ;"
  , 'PhysiotherapyPainAssessment2', @uuid);