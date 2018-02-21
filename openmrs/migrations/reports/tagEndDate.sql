CREATE PROCEDURE TAG_END_DATE(IN tagMapUid INT, IN bedId INT, IN dateStopped DATETIME, OUT tagStopDate DATETIME)
  BEGIN
    DECLARE current_tag_map_uid INT;
    DECLARE current_bed INT;
    DECLARE curr_start_date DATETIME;
    DECLARE curr_stop_date DATETIME;
    SET max_sp_recursion_depth = 255;
    SELECT
      btm.bed_tag_map_id,
      bed_id,
      btm.date_created,
      coalesce(btm.date_changed, current_date)
    INTO current_tag_map_uid, current_bed, curr_start_date, curr_stop_date
    FROM bed_tag_map btm
      INNER JOIN bed_tag bt ON btm.bed_tag_id = bt.bed_tag_id
    WHERE bed_tag_map_id > tagMapUid AND bed_id = bedId AND
          CAST(btm.date_created AS DATE) = CAST(dateStopped AS DATE) AND bt.name IN (
      'Isolation',
      'Strict Isolation'
    )
    LIMIT 1;
    IF current_tag_map_uid > tagMapUid AND current_bed = bedId AND
       CAST(curr_start_date AS DATE) = CAST(dateStopped AS DATE)
    THEN
      CALL TAG_END_DATE(current_tag_map_uid, current_bed, curr_stop_date, tagStopDate);
    ELSE
      SET tagStopDate = dateStopped;
    END IF;
  END;