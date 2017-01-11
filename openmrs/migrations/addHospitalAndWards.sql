INSERT INTO location (name, description, retired, uuid, date_created, creator) VALUES ('General ward', 'General ward', FALSE, uuid(), NOW(), 1);

SELECT location_id INTO @ward_location FROM location WHERE location.name='General ward';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@ward_location, 4);

INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('General ward (2nd floor)', 'General ward (2nd floor)', FALSE, uuid(), NOW(), 1, @ward_location);

SELECT location_id INTO @ward_location FROM location WHERE location.name='General ward (2nd floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@ward_location, 4);