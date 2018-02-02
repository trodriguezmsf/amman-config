SELECT
     bed_id,
     tagName,
     cast(date_started AS DATE ) AS date_started,
     cast(date_stopped AS DATE ) AS date_stopped,
     location
FROM
     (SELECT
        btm.bed_id,
        bt.name AS tagName,
        l.name AS location,
        btm.date_created                                             AS date_started,
        btm.date_changed,
        coalesce(btm.date_changed,current_date())                     AS date_stopped
      FROM bed_tag_map btm
        INNER JOIN bed_tag bt ON btm.bed_tag_id = bt.bed_tag_id
        INNER JOIN bed_location_map blm ON blm.bed_id = btm.bed_id
        INNER JOIN location l ON l.location_id = blm.location_id AND l.retired IS FALSE
        )bedAvailability
   WHERE year(date_started) = 2017 AND year(date_stopped) = 2017 AND year(date_started)=YEAR('#startDate#') AND year(date_stopped)=YEAR('#startDate#')
