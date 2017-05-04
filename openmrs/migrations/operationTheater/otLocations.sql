INSERT INTO location_tag(name, description, creator, date_created, retired, uuid) VALUES ('Operation Theater', 'Operation Theater', 1, now(), 0, uuid());

INSERT INTO location (name, description, retired, uuid, date_created, creator) VALUES ('OT 1', 'Operation Theater 1', FALSE, uuid(), NOW(), 1);
INSERT INTO location (name, description, retired, uuid, date_created, creator) VALUES ('OT 2', 'Operation Theater 2', FALSE, uuid(), NOW(), 1);
INSERT INTO location (name, description, retired, uuid, date_created, creator) VALUES ('OT 3', 'Operation Theater 3', FALSE, uuid(), NOW(), 1);


SELECT location_tag_id INTO @location_tag_id FROM location_tag WHERE name = 'Operation Theater' and description = 'Operation Theater' ;
SELECT location_id INTO @location_id FROM location WHERE location.name='OT 1' and description = 'Operation Theater 1';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id, @location_tag_id);

SELECT location_id INTO @location_id FROM location WHERE location.name='OT 2' and description = 'Operation Theater 2';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id, @location_tag_id);

SELECT location_id INTO @location_id FROM location WHERE location.name='OT 3' and description = 'Operation Theater 3';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id, @location_tag_id);


