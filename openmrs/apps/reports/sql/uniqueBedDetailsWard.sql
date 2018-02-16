SELECT
  wardOccupency.patient_id,
  wardOccupency.date_started,
  wardOccupency.date_stopped
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
                              'Ward (3rd floor)',
                              'Ward (2nd floor)'
                   )
                 ) AND bpam.voided IS FALSE ) AND bpam.voided IS FALSE AND year(date_started)=YEAR('#startDate#')
) wardOccupency