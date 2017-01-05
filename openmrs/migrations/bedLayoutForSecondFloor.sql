# Set location value into variable

SELECT
  location_id
INTO
  @location
FROM
  location
WHERE
  location.name='General ward (2nd floor)';


# Set bed location map

INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 1, 2, 5);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 1, 3, 4);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 1, 4, 3);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 1, 5, 2);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 1, 7, 1);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 2, 1, 6);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 3, 1, 7);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 2, 2, 8);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 3, 2, 9);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 2, 3, 10);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 3, 3, 11);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 2, 4, 12);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 3, 4, 13);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 2, 5, 14);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 3, 5, 15);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 4, 6, 16);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 5, 6, 17);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 6, 6, 18);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 7, 6, 19);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 8, 6, 20);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 9, 6, 21);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 9, 7, 34);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 10, 6, 22);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 10, 7, 34);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 11, 6, 23);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 11, 7, 35);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 12, 6, 24);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 12, 7, 36);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 13, 6, 25);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 13, 7, 30);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 14, 6, 26);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 14, 7, 31);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 15, 6, 27);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 15, 7, 32);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 16, 6, 28);
INSERT INTO
  bed_location_map(location_id, row_number, column_number, bed_id)
VALUES
  (@location, 16, 7, 29);
