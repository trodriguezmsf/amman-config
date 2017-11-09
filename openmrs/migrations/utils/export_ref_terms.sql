select concept_source_id into @source_id from concept_reference_source where name = 'CEIL';

insert into concept_reference_term (creator,code,concept_source_id,uuid,date_created) values
(4,'1533',@source_id,uuid(),now()),
(4,'1534',@source_id,uuid(),now()),
(4,'1535',@source_id,uuid(),now()),
(4,'1552',@source_id,uuid(),now()),
(4,'119964',@source_id,uuid(),now());
