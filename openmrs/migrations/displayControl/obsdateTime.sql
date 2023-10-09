DELETE FROM global_property WHERE property = 'bahmni.sqlGet.obsDateTime';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('bahmni.sqlGet.obsDateTime', "
SELECT
    'Obs datetime' as concept_name,
    DATE_FORMAT(o.obs_dateTime, '%d/%m/%Y %H:%i:%s') as answer_concept_name,
    o.obs_id as obs_group_id
FROM
    person p
    INNER JOIN obs o ON p.person_id = o.person_id
    INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
    AND cn.voided IS FALSE
    AND o.voided IS FALSE
    AND cn.concept_name_type = 'FULLY_SPECIFIED'
    INNER JOIN (
        SELECT
            o.encounter_id,
            CASE
                WHEN SUBSTRING(cn.name, 1, 3) = 'MPA' THEN 'Maxillofacial Physio Assessment'
                WHEN SUBSTRING(cn.name, 1, 3) = 'LLA' THEN 'Lower Limb Physiotherapy Assessment'
                WHEN SUBSTRING(cn.name, 1, 3) = 'ULA' THEN 'Upper Limb Physiotherapy Assessment'
                ELSE ''
            END AS name
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
                                value_dateTime DESC,
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
    AND cn.name IN (encounterData.name)
WHERE
  p.uuid = ${patientUuid} 
", 'PhysiotherapyPainAssessment ObsDateTime', @uuid);