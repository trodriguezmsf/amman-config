SELECT
    CAST(bpam.date_created AS DATE )    AS `admissionDate`,
    bpam.patient_id,
    b.bed_id,
    b.bed_number,
    l.name               AS `location`,
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
    WHERE ((l.name IN ('Kahramana(1st floor)', 'Kahramana(2nd floor)')) AND (YEAR(bpam.date_Created) = YEAR('#startDate#')))
ORDER BY bpam.patient_id;
