SELECT location_id INTO @ward_location FROM location WHERE location.name='General ward';
SELECT location_id INTO @floor_location FROM location WHERE location.name='General ward (2nd floor)';

UPDATE location SET name = "Ward", description = "Ward" WHERE location_id = @ward_location;
UPDATE location SET name = "Ward (2nd Floor)", description = "Ward (2nd Floor)" WHERE location_id = @floor_location;

INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Ward (3rd floor)', 'Ward (3rd floor)', FALSE, uuid(), NOW(), 1, @ward_location);

SELECT location_id INTO @ward_location FROM location WHERE location.name='Rehabilitation center';


INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Rehabilitation Center (4th floor)', 'Rehabilitation Center (4th floor)', FALSE, uuid(), NOW(), 1, @ward_location);
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Rehabilitation Center (5th floor)', 'Rehabilitation Center (5th floor)', FALSE, uuid(), NOW(), 1, @ward_location);


SELECT location_id INTO @ward_location FROM location WHERE location.name='Ward (3rd floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@ward_location, 4);
SELECT location_id INTO @ward_location FROM location WHERE location.name='Rehabilitation Center (4th floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@ward_location, 4);
SELECT location_id INTO @ward_location FROM location WHERE location.name='Rehabilitation Center (5th floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@ward_location, 4);
