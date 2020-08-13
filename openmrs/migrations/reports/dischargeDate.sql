CREATE PROCEDURE DISCHARGE_DATE(IN patientId INT,IN dateStopped DATETIME, OUT dischargeDate DATETIME)
  BEGIN
    DECLARE current_patient INT;
    DECLARE curr_start_date DATETIME;
    DECLARE curr_stop_date DATETIME;
    SET max_sp_recursion_depth = 250;
    SELECT patient_id,
      date_started,date_stopped
    INTO current_patient,curr_start_date,curr_stop_date
    FROM bed_patient_assignment_map bpam
    WHERE bed_id IN (SELECT bed_id
                     FROM bed_location_map blm
                     WHERE location_id IN (
                       SELECT l.location_id
                       FROM location l
                       WHERE l.
                             name IN (
                               'Ward (3rd floor)',
                               'Ward (2nd floor)'
                             )
                     ) AND bpam.voided IS FALSE) AND bpam.voided IS FALSE
          AND patient_id = patientId AND date_started = dateStopped
    LIMIT 1;
    if current_patient = patientId  AND curr_start_date = dateStopped and curr_start_date != curr_stop_date THEN
      CALL DISCHARGE_DATE(current_patient, curr_stop_date, dischargeDate);
    ELSE
      SET dischargeDate = dateStopped;
    END IF ;
  END;
