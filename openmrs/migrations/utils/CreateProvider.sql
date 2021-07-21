CREATE PROCEDURE create_provider (user_gender VARCHAR(50),user_given_name VARCHAR(50),user_family_name VARCHAR(50),user_username varchar(50),user_password VARCHAR(255), user_salt varchar(255))
  BEGIN
    SET @puuid = uuid();
    INSERT INTO person (gender, creator, date_created, uuid) VALUES (user_gender, 8, now(), @puuid);
    INSERT INTO person_name (person_id, given_name, family_name,creator, date_created, uuid) VALUES ((SELECT max(person_id) FROM person),user_given_name,user_family_name,8, now(), @puuid);
    INSERT INTO users (system_id, username, password, salt, creator, date_created, changed_by, person_id,retired,uuid)
     VALUES (user_username, user_username, user_password, user_salt, 8,now(),8,(SELECT max(person_id) FROM person),0,@puuid);
    INSERT INTO user_role VALUES ((select max(user_id) FROM users),'Bahmni-User'),((select max(user_id) from users),'Appointments:ReadOnly'), ((select max(user_id) from users),'Clinical-App-Treatment'), ((select max(user_id) from users),'Clinical:FullAccess'),((select max(user_id) from users),'Clinical:ReadOnly'), ((select max(user_id) from users),'InPatient-Read'),((select max(user_id) from users),'OT: ReadOnly'),((select max(user_id) from users),'Programs-App:LimitedQueues');
    INSERT INTO user_property values ((select max(user_id) from users),'forcePassword','true');
    INSERT INTO provider (person_id, creator, date_created, retired, uuid)VALUES ((SELECT max(person_id) FROM person),8,now(),0,@puuid);
  END;
