CREATE FUNCTION GET_DISCHARGE_DATE(patientId INT, date_stopped DATETIME)
  RETURNS DATETIME
  BEGIN
    DECLARE disDate DATETIME;
    CALL DISCHARGE_DATE(patientId, date_stopped, disDate);
    RETURN disDate;
  END;