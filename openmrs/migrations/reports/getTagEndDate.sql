CREATE FUNCTION GET_TAG_END_DATE(tagMapUid INT, bed_id INT, date_stopped DATETIME)
  RETURNS DATETIME
  BEGIN
    DECLARE stopDate DATETIME;
    CALL TAG_END_DATE(tagMapUid, bed_id, date_stopped, stopDate);
    RETURN stopDate;
  END;