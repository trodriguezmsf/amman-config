INSERT INTO location_tag(name, description, creator, date_created, retired, uuid) VALUES ('Admission Location', 'Hospital Wards', 1, now(), 0, uuid());
INSERT INTO location_tag(name, description, creator, date_created, retired, uuid) VALUES ('Admission Location', 'Kahramana Hotel', 1, now(), 0, uuid());


INSERT INTO location (name, description, retired, uuid, date_created, creator) VALUES ('Ward', 'Wards in hospital', FALSE, uuid(), NOW(), 1);
SELECT location_id INTO @ward_location FROM location WHERE location.name='Ward';
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Ward (2nd floor)', 'Hospital 2nd floor ward', FALSE, uuid(), NOW(), 1, @ward_location);
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Ward (3rd floor)', 'Hospital 3rd floor ward', FALSE, uuid(), NOW(), 1, @ward_location);

SELECT location_tag_id INTO @location_tag_id1 FROM location_tag WHERE name = 'Admission Location' AND description = 'Hospital Wards';
SELECT location_id INTO @location_id1 FROM location WHERE location.name='Ward';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id1, @location_tag_id1);

SELECT location_id INTO @location_id2 FROM location WHERE location.name='Ward (2nd floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id2, @location_tag_id1);

SELECT location_id INTO @location_id3 FROM location WHERE location.name='Ward (3rd floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id3, @location_tag_id1);



INSERT INTO location (name, description, retired, uuid, date_created, creator) VALUES ('Rehabilitation Center', 'Rehabilitation Center in Hospital', FALSE, uuid(), NOW(), 1);
SELECT location_id INTO @rc_location FROM location where name = 'Rehabilitation Center' and description = 'Rehabilitation Center in Hospital';
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Rehabilitation Center (4th floor)', 'Rehabilitation Center (4th floor)', FALSE, uuid(), NOW(), 1, @rc_location);
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Rehabilitation Center (5th floor)', 'Rehabilitation Center (4th floor)', FALSE, uuid(), NOW(), 1, @rc_location);

SELECT location_tag_id INTO @location_tag_id2 FROM location_tag WHERE name = 'Admission Location' and description = 'Rehabilitation center' ;
SELECT location_id INTO @location_id4 FROM location WHERE location.name='Rehabilitation Center' and description = 'Rehabilitation Center in Hospital';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id4, @location_tag_id2);

SELECT location_id INTO @location_id5 FROM location WHERE location.name='Rehabilitation Center (4th floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id5, @location_tag_id2);

SELECT location_id INTO @location_id6 FROM location WHERE location.name='Rehabilitation Center (5th floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id6, @location_tag_id2);







INSERT INTO location(name,description,creator,date_created,uuid) VALUES ("Kahramana","Hotel kahramana",1,now(),uuid());
SELECT location_id INTO @ward_location FROM location WHERE location.name='Kahramana';
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Kahramana(1st floor)', 'Hotel kahramana 1st floor', FALSE, uuid(), NOW(), 1, @ward_location);
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Kahramana(2nd floor)', 'Hotel kahramana 2nd floor', FALSE, uuid(), NOW(), 1, @ward_location);
INSERT INTO location (name, description, retired, uuid, date_created, creator, parent_location) VALUES ('Buffer Beds', 'Hotel kahramana buffer beds', FALSE, uuid(), NOW(), 1, @ward_location);



SELECT location_tag_id INTO @location_tag_id3 FROM location_tag WHERE name = 'Admission Location' AND description = 'Kahramana Hotel';
SELECT location_id INTO @location_id7 FROM location WHERE location.name='Kahramana';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id7, @location_tag_id3);

SELECT location_id INTO @location_id8 FROM location WHERE location.name='Kahramana(1st floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id8, @location_tag_id3);

SELECT location_id INTO @location_id9 FROM location WHERE location.name='Kahramana(2nd floor)';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id9, @location_tag_id3);

SELECT location_id INTO @location_id10 FROM location WHERE location.name='Buffer Beds';
INSERT INTO location_tag_map(location_id, location_tag_id) VALUES(@location_id10, @location_tag_id3);