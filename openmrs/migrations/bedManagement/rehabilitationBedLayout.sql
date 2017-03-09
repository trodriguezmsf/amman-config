DROP PROCEDURE IF EXISTS addRcBed;
DELIMITER //
CREATE PROCEDURE addRcBed
   (
      IN bedNumber nvarchar(30),
      IN locationName nvarchar(30),
      IN rowNumber nvarchar(20),
      IN columnNumber nvarchar(20)
   )
BEGIN
    SELECT location_id INTO @locationId FROM location WHERE location.name=locationName;
    INSERT INTO bed (bed_number, bed_type_id, uuid, creator, date_created, voided) VALUES (bedNumber, 1, uuid(), 1, NOW(), FALSE);
    SELECT bed.bed_id INTO @bedId FROM bed LEFT OUTER JOIN bed_location_map ON bed_location_map.bed_id = bed.bed_id WHERE bed.bed_number=bedNumber AND bed_location_map.location_id IS NULL;
    INSERT INTO bed_location_map(location_id, row_number, column_number, bed_id) VALUES (@locationId, rowNumber, columnNumber, @bedId);
END//
DELIMITER ;
CALL insertBedIntoLocation('406/1', 'Rehabilitation Center (4th floor)',1,1);
CALL insertBedIntoLocation('406/2', 'Rehabilitation Center (4th floor)',1,2);
CALL insertBedIntoLocation('405', 'Rehabilitation Center (4th floor)',1,3);
CALL insertBedIntoLocation('404', 'Rehabilitation Center (4th floor)',1,4);
CALL insertBedIntoLocation('403', 'Rehabilitation Center (4th floor)',1,5);
CALL insertBedIntoLocation('402', 'Rehabilitation Center (4th floor)',1,6);
CALL insertBedIntoLocation('400', 'Rehabilitation Center (4th floor)',1,7);
CALL insertBedIntoLocation('407/1', 'Rehabilitation Center (4th floor)',2,1);
CALL insertBedIntoLocation('408/1', 'Rehabilitation Center (4th floor)',2,2);
CALL insertBedIntoLocation('409/1', 'Rehabilitation Center (4th floor)',2,3);
CALL insertBedIntoLocation('410/1', 'Rehabilitation Center (4th floor)',2,4);
CALL insertBedIntoLocation('411/1', 'Rehabilitation Center (4th floor)',2,5);
CALL insertBedIntoLocation('412/1', 'Rehabilitation Center (4th floor)',2,6);
CALL insertBedIntoLocation('412/2', 'Rehabilitation Center (4th floor)',2,7);
CALL insertBedIntoLocation('407/2', 'Rehabilitation Center (4th floor)',3,1);
CALL insertBedIntoLocation('408/2', 'Rehabilitation Center (4th floor)',3,2);
CALL insertBedIntoLocation('409/2', 'Rehabilitation Center (4th floor)',3,3);
CALL insertBedIntoLocation('410/2', 'Rehabilitation Center (4th floor)',3,4);
CALL insertBedIntoLocation('411/2', 'Rehabilitation Center (4th floor)',3,5);
CALL insertBedIntoLocation('413/1', 'Rehabilitation Center (4th floor)',3,6);
CALL insertBedIntoLocation('413/2', 'Rehabilitation Center (4th floor)',3,7);
CALL insertBedIntoLocation('413/3', 'Rehabilitation Center (4th floor)',4,6);
CALL insertBedIntoLocation('413/4', 'Rehabilitation Center (4th floor)',4,7);
CALL insertBedIntoLocation('414/1', 'Rehabilitation Center (4th floor)',5,6);
CALL insertBedIntoLocation('414/2', 'Rehabilitation Center (4th floor)',5,7);
CALL insertBedIntoLocation('414/3', 'Rehabilitation Center (4th floor)',6,6);
CALL insertBedIntoLocation('414/4', 'Rehabilitation Center (4th floor)',6,7);
CALL insertBedIntoLocation('414/5', 'Rehabilitation Center (4th floor)',7,6);
CALL insertBedIntoLocation('415/1', 'Rehabilitation Center (4th floor)',7,7);
CALL insertBedIntoLocation('415/2', 'Rehabilitation Center (4th floor)',8,6);
CALL insertBedIntoLocation('416', 'Rehabilitation Center (4th floor)',8,7);
CALL insertBedIntoLocation('417/1', 'Rehabilitation Center (4th floor)',9,6);
CALL insertBedIntoLocation('417/2', 'Rehabilitation Center (4th floor)',9,7);
CALL insertBedIntoLocation('417/3', 'Rehabilitation Center (4th floor)',10,6);
CALL insertBedIntoLocation('418/1', 'Rehabilitation Center (4th floor)',10,7);
CALL insertBedIntoLocation('418/2', 'Rehabilitation Center (4th floor)',11,6);
CALL insertBedIntoLocation('418/3', 'Rehabilitation Center (4th floor)',11,7);
CALL insertBedIntoLocation('418/4', 'Rehabilitation Center (4th floor)',12,6);


CALL insertBedIntoLocation('506/1', 'Rehabilitation Center (5th floor)',1,1);
CALL insertBedIntoLocation('506/2', 'Rehabilitation Center (5th floor)',1,2);
CALL insertBedIntoLocation('505', 'Rehabilitation Center (5th floor)',1,3);
CALL insertBedIntoLocation('504', 'Rehabilitation Center (5th floor)',1,4);
CALL insertBedIntoLocation('503', 'Rehabilitation Center (5th floor)',1,5);
CALL insertBedIntoLocation('502', 'Rehabilitation Center (5th floor)',1,6);
CALL insertBedIntoLocation('500', 'Rehabilitation Center (5th floor)',1,7);
CALL insertBedIntoLocation('507/1', 'Rehabilitation Center (5th floor)',2,1);
CALL insertBedIntoLocation('508/1', 'Rehabilitation Center (5th floor)',2,2);
CALL insertBedIntoLocation('509/1', 'Rehabilitation Center (5th floor)',2,3);
CALL insertBedIntoLocation('510/1', 'Rehabilitation Center (5th floor)',2,4);
CALL insertBedIntoLocation('511/1', 'Rehabilitation Center (5th floor)',2,5);
CALL insertBedIntoLocation('512/1', 'Rehabilitation Center (5th floor)',2,6);
CALL insertBedIntoLocation('513/2', 'Rehabilitation Center (5th floor)',2,7);
CALL insertBedIntoLocation('507/2', 'Rehabilitation Center (5th floor)',3,1);
CALL insertBedIntoLocation('508/2', 'Rehabilitation Center (5th floor)',3,2);
CALL insertBedIntoLocation('509/2', 'Rehabilitation Center (5th floor)',3,3);
CALL insertBedIntoLocation('510/2', 'Rehabilitation Center (5th floor)',3,4);
CALL insertBedIntoLocation('511/2', 'Rehabilitation Center (5th floor)',3,5);
CALL insertBedIntoLocation('513/1', 'Rehabilitation Center (5th floor)',3,6);
CALL insertBedIntoLocation('513/2', 'Rehabilitation Center (5th floor)',3,7);
CALL insertBedIntoLocation('513/3', 'Rehabilitation Center (5th floor)',4,6);
CALL insertBedIntoLocation('513/4', 'Rehabilitation Center (5th floor)',4,7);
CALL insertBedIntoLocation('514/1', 'Rehabilitation Center (5th floor)',5,6);
CALL insertBedIntoLocation('514/2', 'Rehabilitation Center (5th floor)',5,7);
CALL insertBedIntoLocation('514/3', 'Rehabilitation Center (5th floor)',6,6);
CALL insertBedIntoLocation('514/4', 'Rehabilitation Center (5th floor)',6,7);
CALL insertBedIntoLocation('514/4', 'Rehabilitation Center (5th floor)',7,6);
CALL insertBedIntoLocation('515/1', 'Rehabilitation Center (5th floor)',7,7);
CALL insertBedIntoLocation('515/2', 'Rehabilitation Center (5th floor)',8,6);
CALL insertBedIntoLocation('514', 'Rehabilitation Center (5th floor)',8,7);
CALL insertBedIntoLocation('517/1', 'Rehabilitation Center (5th floor)',9,6);
CALL insertBedIntoLocation('517/2', 'Rehabilitation Center (5th floor)',9,7);
CALL insertBedIntoLocation('517/3', 'Rehabilitation Center (5th floor)',10,6);
CALL insertBedIntoLocation('518/1', 'Rehabilitation Center (5th floor)',10,7);
CALL insertBedIntoLocation('518/2', 'Rehabilitation Center (5th floor)',11,6);
CALL insertBedIntoLocation('518/3', 'Rehabilitation Center (5th floor)',11,7);
CALL insertBedIntoLocation('518/4', 'Rehabilitation Center (5th floor)',12,6);
