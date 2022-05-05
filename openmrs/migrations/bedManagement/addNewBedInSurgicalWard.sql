SELECT location_id INTO @locationId FROM location WHERE location.name='Ward (3rd floor)';

update bed_location_map set row_number=2, column_number=1 where location_id=@locationId and bed_id in (select bed_id from bed where bed_number='306');
update bed_location_map set row_number=1, column_number=1 where location_id=@locationId and bed_id in (select bed_id from bed where bed_number='305');
update bed_location_map set row_number=1, column_number=2 where location_id=@locationId and bed_id in (select bed_id from bed where bed_number='304');
update bed_location_map set row_number=1, column_number=3 where location_id=@locationId and bed_id in (select bed_id from bed where bed_number='303');
update bed_location_map set row_number=1, column_number=4 where location_id=@locationId and bed_id in (select bed_id from bed where bed_number='302');

CALL insertBedIntoLocation('301', 'Ward (3rd floor)',1,5);
