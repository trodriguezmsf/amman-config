SELECT concept_source_id INTO @source_id FROM concept_reference_source where name = 'MSF-INTERNAL';

INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MLO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NETWORK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REFERRED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'C_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PGENCON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEEDCT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_MEDINFO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_RECEIVED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMPLETE_FILE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEEDED_DOCS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SPECIALTY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PTSTAGE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_PRESENTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_1STSURG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PRIORITY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURGEON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEEDFV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_1STANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ANAESTHETIST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PP_REASON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DATE_RESUB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_MEDINFO_RESUB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REFUSED_REASON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_REFUSAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_UNION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_INFECTION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_SMFA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_FUPVAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TIME_FUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_FUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_MEDINV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_NEXT_FUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_MBA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DISMISSAL_REASON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CONF_DISMISSAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_DISMISSAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_DEFAULTER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REASON_READMIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PSTAGE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_READMIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_FV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_FV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_EXP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ACCOM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_ADMIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'0',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'1',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'2',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'3',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'4',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'5',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'6',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'7',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'8',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'9',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'10',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'11',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'12',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'13',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'14',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'15',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'16',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'17',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'18',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'19',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'20',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'21',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'22',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'23',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'24',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'25',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'26',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'27',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'28',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'29',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'30',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'31',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'32',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'99',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_RECORDED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'WEIGHT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HEIGHT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BMI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TEMP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PULSE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SBP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DBP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OXYGEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VS_FASTING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VS_RANDOM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_VS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_CONSULTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'P_SIDE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'P_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_P_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NUM_WOUNDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'WOUND_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_WOUND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NOTES_NURS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MARSTAT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EDUCATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PREGNANCY ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SMOKING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CIGPERDAY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DURATION_SMOK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRUG_ALC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXDEVICE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_EXDEVICE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NUTRI_ASS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PHYGIENE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEARN_NEEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REFERRAL_PLAN',@source_id,uuid(),now());