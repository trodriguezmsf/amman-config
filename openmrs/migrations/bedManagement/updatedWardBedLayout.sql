update bed_location_map set column_number=8 where location_id in (18, 19) and column_number=7;
update bed_location_map set column_number=7 where location_id in (18, 19) and column_number=6;
update bed_location_map set column_number=6 where location_id in (18, 19) and column_number=5;
update bed_location_map set column_number=5 where location_id in (18, 19) and column_number=4;
update bed_location_map set column_number=4 where location_id in (18, 19) and column_number=3;
update bed_location_map set column_number=3 where location_id in (18, 19) and column_number=2;
update bed_location_map set column_number=2 where location_id in (18, 19) and column_number=1;

CALL insertBedIntoLocation('206', 'Ward (2nd floor)',1,1);
CALL insertBedIntoLocation('306', 'Ward (3rd floor)',1,1);

CALL insertBedIntoLocation('ICU/1', 'Ward (3rd floor)',11,8);
CALL insertBedIntoLocation('ICU/2', 'Ward (3rd floor)',12,8);
