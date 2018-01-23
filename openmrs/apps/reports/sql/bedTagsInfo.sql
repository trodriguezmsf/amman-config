SELECT
  blm.bed_id,
  bt.name AS bed_tag_name,
  btm.date_created AS tag_start_time,
  coalesce(btm.date_voided,current_date) AS tag_end_time,
  l.name AS location_name
from bed_location_map blm
INNER JOIN bed_tag_map btm ON btm.bed_id = blm.bed_id
INNER JOIN location l ON l.location_id = blm.location_id AND name LIKE "Ward%"
INNER JOIN bed_tag bt ON bt.bed_tag_id = btm.bed_tag_id;