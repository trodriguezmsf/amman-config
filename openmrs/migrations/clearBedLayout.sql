# Clear tables

DELETE FROM bed_patient_assignment_map;
DELETE FROM bed_location_map;
DELETE FROM bed_tag_map;
DELETE FROM bed;

SELECT
  location_id
INTO
  @ward_location
FROM
  location
WHERE
  location.name='General ward';

# Remove all location associated with ward

DELETE FROM
  location
WHERE
  location.parent_location = @ward_location;

# Remove the ward

DELETE FROM
  location
WHERE
  location.location_id = @ward_location;
