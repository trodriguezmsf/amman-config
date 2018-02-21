SELECT
  btm.bed_id,
  CAST(MIN(btm.date_created) AS
       DATE) AS date_started,
  CAST(GET_TAG_END_DATE(btm.bed_tag_map_id, btm.bed_id, COALESCE(btm.date_changed, current_date())) AS
       DATE) AS date_stopped
FROM bed_tag_map btm
  INNER JOIN bed_tag bt ON btm.bed_tag_id = bt.bed_tag_id
  INNER JOIN bed_location_map blm ON blm.bed_id = btm.bed_id
  INNER JOIN location l ON l.location_id = blm.location_id AND l.retired IS FALSE
WHERE l.name IN (
  'Ward (2nd floor)',
  'Ward (3rd floor)') AND
      bt.name IN (
        'Isolation',
        'Strict Isolation')
GROUP BY blm.bed_id, date_stopped