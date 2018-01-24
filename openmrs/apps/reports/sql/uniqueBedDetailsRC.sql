SELECT
    CAST(bpam.date_created AS DATE )    AS `admissionDate`,
    bpam.patient_id,
    b.bed_id,
    b.bed_number,
    l.name               AS `location`,
    bedTagsInfo.name          AS `bedTag`,
    CAST(bedTagsInfo.`Date Started` AS DATE )         AS `Bed Tag Start time`,
    CAST(bedTagsInfo.`Date Stopped` AS DATE )         AS `Bed Tag End time`,
    CAST(dischargeDetails.bed_discharge_date AS DATE ) AS `Discharge Time`
FROM bed b
    INNER JOIN bed_location_map blm ON blm.bed_id = b.bed_id AND b.voided IS FALSE
    INNER JOIN bed_patient_assignment_map bpam ON b.bed_id = bpam.bed_id AND bpam.voided IS FALSE
    INNER JOIN
    (
        SELECT
            bpam.patient_id,
            MAX(bpam.date_stopped) AS `bed_discharge_date`,
            dischargeTimes.date_created
        FROM bed_patient_assignment_map bpam
            INNER JOIN (
                           SELECT e.patient_id, e.date_created FROM encounter e
                               INNER JOIN encounter_type et ON e.encounter_type = et.encounter_type_id and et.name = 'DISCHARGE'
                       ) dischargeTimes ON bpam.patient_id = dischargeTimes.patient_id AND bpam.date_stopped <= dischargeTimes.date_created
        GROUP BY bpam.patient_id,dischargeTimes.date_created
    ) dischargeDetails ON bpam.patient_id = dischargeDetails.patient_id AND bpam.date_stopped = dischargeDetails.bed_discharge_date
    INNER JOIN location l ON blm.location_id = l.location_id AND l.retired IS FALSE
    LEFT OUTER JOIN (SELECT
                         btm.bed_id,
                         bpam.bed_patient_assignment_map_id,
                         bt.name,
                         GREATEST(btm.date_created, bpam.date_started) AS `Date Started`,
                         IF(btm.date_voided IS NULL AND
                            bpam.date_stopped IS NULL,
                            NULL,
                            LEAST(IFNULL(btm.date_voided, now()),
                                  IFNULL(bpam.date_stopped,
                                         now())))                      AS `Date Stopped`
                     FROM bed_tag_map btm
                         INNER JOIN bed_tag bt
                             ON btm.bed_tag_id = bt.bed_tag_id AND bt.voided IS FALSE
                         INNER JOIN bed_patient_assignment_map bpam
                             ON bpam.bed_id = btm.bed_id AND bpam.voided IS FALSE
                         INNER JOIN person p
                             ON p.person_id = bpam.patient_id AND p.voided IS FALSE
                                AND NOT
                                (
                                    btm.date_voided IS NOT NULL &&
                                    btm.date_voided < bpam.date_started
                                    OR
                                    bpam.date_stopped IS NOT NULL &&
                                    btm.date_created > bpam.date_stopped
                                )
                    ) bedTagsInfo
        ON bedTagsInfo.bed_patient_assignment_map_id = bpam.bed_patient_assignment_map_id AND bedTagsInfo.bed_id = bpam.bed_id
    WHERE l.name IN ('Rehabilitation Center (4th floor)', 'Rehabilitation Center (5th floor)')
ORDER BY bpam.patient_id;
