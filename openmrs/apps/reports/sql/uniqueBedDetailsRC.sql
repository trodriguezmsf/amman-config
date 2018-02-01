SELECT
  wardOccupency.date_started,
  wardOccupency.patient_id,
  wardOccupency.bed_id,
  '' as bedNumber,
  '' as location,
  wardOccupency.date_stopped
  FROM
(SELECT
  patient_id,
  bed_id,
  cast(date_started AS DATE ) AS date_started,
  cast(IF(date_stopped IS NULL, '2017-12-31', date_stopped) AS DATE ) AS date_stopped
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
                 ) AND bpam.voided IS FALSE ) AND bpam.voided IS FALSE AND year(date_started)=YEAR('#startDate#') AND year(date_stopped)=YEAR('#startDate#')
) wardOccupency