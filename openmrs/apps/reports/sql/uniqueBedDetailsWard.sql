SELECT
  wardOccupency.patient_id,
  CAST(min(wardOccupency.date_started) AS DATE )             AS startDate,
  CAST(GET_DISCHARGE_DATE(patient_id, date_stopped) AS DATE) AS dischargeDate
FROM
  (SELECT
     patient_id,
     date_started                           AS date_started,
     date_stopped AS date_stopped
   FROM bed_patient_assignment_map bpam
   WHERE bed_id IN (SELECT bed_id
                    FROM bed_location_map blm
                    WHERE location_id IN (
                      SELECT l.location_id
                      FROM location l
                      WHERE l.
                            name IN (
                              'Ward (3rd floor)',
                              'Ward (2nd floor)'
                            )
                    ) AND bpam.voided IS FALSE) AND bpam.voided IS FALSE
  ) wardOccupency
GROUP BY patient_id, dischargeDate
HAVING dischargeDate is not NULL
ORDER BY patient_id,date_started