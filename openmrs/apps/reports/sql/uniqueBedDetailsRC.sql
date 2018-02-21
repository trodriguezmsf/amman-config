SELECT
  rcOccupency.date_started,
  rcOccupency.patient_id,
  rcOccupency.bed_id,
  '' as bedNumber,
  '' as location,
  rcOccupency.date_stopped
  FROM
(SELECT
  patient_id,
  bed_id,
  cast(date_started AS DATE ) AS date_started,
  cast(COALESCE(date_stopped, CURRENT_DATE()) AS DATE ) AS date_stopped
 FROM bed_patient_assignment_map bpam
WHERE bed_id IN (SELECT bed_id
                 FROM bed_location_map blm
                 WHERE location_id IN (
                   SELECT
                     l.location_id
                   FROM location l WHERE l.name IN (
                     'Rehabilitation Center (4th floor)',
                     'Rehabilitation Center (5th floor)'
                   )
                 ) AND bpam.voided IS FALSE ) AND bpam.voided IS FALSE
) rcOccupency