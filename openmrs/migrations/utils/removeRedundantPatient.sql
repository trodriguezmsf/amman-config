set 
  @patient_database_id1 = 1957;
set 
  @patient_database_id2 = 4261;
set 
  @patient_database_id3 = 4260;
set 
  @patient_database_id4 = 4251;
set 
  @patient_database_id5 = 4787;
set 
  @patient_database_id6 = 4231;
set 
  foreign_key_checks = 0;
/* voiding orders captured for patient */
UPDATE 
  orders 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* deleting drug order captured for patient */
DELETE FROM 
  drug_order 
WHERE 
  order_id IN (
    SELECT 
      order_id 
    FROM 
      orders 
    WHERE 
      patient_id IN (
        @patient_database_id1, @patient_database_id2, 
        @patient_database_id3, @patient_database_id4, 
        @patient_database_id5, @patient_database_id6
      )
  );
/* voiding bed related information */
UPDATE 
  bed_patient_assignment_map 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding obs captured for patient */
UPDATE 
  obs 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  person_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding entries from encounter provider */
UPDATE 
  encounter_provider 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  encounter_id IN (
    SELECT 
      encounter_id 
    FROM 
      encounter 
    WHERE 
      patient_id IN (
        @patient_database_id1, @patient_database_id2, 
        @patient_database_id3, @patient_database_id4, 
        @patient_database_id5, @patient_database_id6
      )
  );
/* voiding entries from encounter */
update 
  encounter 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding entries from visit aatribute */
UPDATE 
  visit_attribute 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  visit_id IN (
    SELECT 
      visit_id 
    FROM 
      visit 
    WHERE 
      patient_id IN (
        @patient_database_id1, @patient_database_id2, 
        @patient_database_id3, @patient_database_id4, 
        @patient_database_id5, @patient_database_id6
      )
  );
/* voiding visit related information */
update 
  visit 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* removing patient from patient identifier table */
DELETE FROM 
  patient_identifier 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/*voiding entries in Patient program */
update 
  patient_program 
set 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* removing episode patient program */
DELETE from 
  episode_patient_program 
WHERE 
  patient_program_id in (
    select 
      patient_program_id 
    from 
      patient_program 
    where 
      patient_id in (
        @patient_database_id1, @patient_database_id2, 
        @patient_database_id3, @patient_database_id4, 
        @patient_database_id5, @patient_database_id6
      )
  );
/* voiding patient state */
update 
  patient_state 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_program_id in (
    select 
      patient_program_id 
    from 
      patient_program 
    where 
      patient_id in (
        @patient_database_id1, @patient_database_id2, 
        @patient_database_id3, @patient_database_id4, 
        @patient_database_id5, @patient_database_id6
      )
  );
/* voiding episode entries*/
UPDATE 
  episode 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  episode_id IN (
    SELECT 
      episode_id 
    FROM 
      episode_patient_program 
    WHERE 
      patient_program_id IN (
        SELECT 
          patient_program_id 
        FROM 
          patient_program 
        WHERE 
          patient_id IN (
            @patient_database_id1, @patient_database_id2, 
            @patient_database_id3, @patient_database_id4, 
            @patient_database_id5, @patient_database_id6
          )
      )
  );
/* voiding patient  */
UPDATE 
  patient 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  patient_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding person address */
UPDATE 
  person_address 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  person_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding person attribute */
UPDATE 
  person_attribute 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
WHERE 
  person_id IN (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding person name */
UPDATE 
  person_name 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
where 
  not exists (
    select 
      u.person_id 
    from 
      users u 
    where 
      person_name.person_id = u.person_id 
      or person_name.person_id = 1
  ) 
  and not exists (
    select 
      p.person_id 
    from 
      provider p 
    where 
      person_name.person_id = p.person_id 
      or person_name.person_id = 1
  ) 
  and person_id in (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
/* voiding person */
UPDATE 
  person 
SET 
  voided = 1, 
  voided_by = 1, 
  date_voided = now(), 
  void_reason = 'redundant patient data removal FD 1082' 
where 
  not exists (
    select 
      u.person_id 
    from 
      users u 
    where 
      person.person_id = u.person_id 
      or person.person_id = 1
  ) 
  and not exists (
    select 
      p.person_id 
    from 
      provider p 
    where 
      person.person_id = p.person_id 
      or person.person_id = 1
  ) 
  and person_id in (
    @patient_database_id1, @patient_database_id2, 
    @patient_database_id3, @patient_database_id4, 
    @patient_database_id5, @patient_database_id6
  );
set 
  foreign_key_checks = 1;
