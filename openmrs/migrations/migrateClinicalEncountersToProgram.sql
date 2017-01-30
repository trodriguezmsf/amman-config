INSERT INTO episode_encounter(episode_id, encounter_id)
 SELECT patient_episodes.episode_id, patient_encounters.encounter_id
 FROM
   (SELECT
      epi.episode_id,
      pp.patient_id
    FROM patient_program pp
      JOIN episode_patient_program epp ON epp.patient_program_id = pp.patient_program_id
      JOIN episode epi ON epi.episode_id = epp.episode_id WHERE pp.date_completed IS NULL AND pp.voided = 0) patient_episodes
   JOIN
   (SELECT
      encounter_id,
      patient_id
    FROM encounter en
      JOIN encounter_type et ON en.encounter_type = et.encounter_type_id
    WHERE et.encounter_type_id = 1 AND encounter_id NOT IN (SELECT ee.encounter_id
                                                            FROM patient_program pp
                                                              JOIN episode_patient_program epp
                                                                ON epp.patient_program_id = pp.patient_program_id
                                                              JOIN episode_encounter ee ON ee.episode_id = epp.episode_id
                                                            ORDER BY ee.encounter_id)) patient_encounters
     ON patient_episodes.patient_id = patient_encounters.patient_id;