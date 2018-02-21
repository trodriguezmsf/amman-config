SELECT
  patient_id,
  CAST(sb.start_datetime AS DATE) AS surgeryStartDate,
  CAST(sa.date_changed AS DATE) AS dateChanged,
  sa.status
FROM
  surgical_appointment sa
  INNER JOIN surgical_block sb ON sa.surgical_block_id = sb.surgical_block_id AND
                                  sb.voided IS FALSE AND sa.voided IS FALSE
WHERE YEAR(sb.start_datetime) = YEAR(sa.date_changed)
      AND YEAR(sb.start_datetime) = YEAR('#startDate#')
ORDER BY patient_id, surgeryStartDate