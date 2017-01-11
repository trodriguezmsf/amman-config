TRUNCATE bed_patient_assignment_map;
TRUNCATE bed_location_map;
TRUNCATE bed_tag_map;
DELETE FROM bed;
ALTER TABLE bed AUTO_INCREMENT = 1;

SELECT location_id INTO @ward_location FROM location WHERE location.name='General ward';

DELETE FROM location_tag_map WHERE location_id IN (SELECT location_id FROM location WHERE parent_location = @ward_location);

DELETE FROM location WHERE parent_location = @ward_location;

DELETE FROM location WHERE location.location_id = @ward_location;
