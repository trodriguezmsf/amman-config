SELECT MIN(location_tag_id) INTO @min_admission_location_tag FROM location_tag WHERE name = 'Admission Location';
SELECT MAX(location_tag_id) INTO @max_admission_location_tag FROM location_tag WHERE name = 'Admission Location';

UPDATE location_tag_map SET location_tag_id = @max_admission_location_tag
WHERE location_tag_id = @min_admission_location_tag;

UPDATE location_tag SET retired = 1, name = 'Deprecated - Admission Location' WHERE location_tag_id > @min_admission_location_tag AND name = 'Admission Location';
UPDATE location_tag SET description = 'Patient admission location for ipd' WHERE location_tag_id = @min_admission_location_tag;

SELECT GROUP_CONCAT(location_id) INTO @locationIds FROM location WHERE BINARY name IN ('Ward', 'Rehabilitation Center', 'Kahramana')
OR parent_location IN (SELECT location_id FROM location WHERE BINARY name IN ('Ward', 'Rehabilitation Center', 'Kahramana'));
UPDATE location_tag_map SET location_tag_id = @min_admission_location_tag WHERE FIND_IN_SET(location_id, @locationIds);
