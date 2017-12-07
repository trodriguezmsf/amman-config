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
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AD_REASON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HPI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MEDHX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_MEDHX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXALLERGY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_ALLERGY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CURR_MEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_CURRMEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CURRMEDS_DOSEFX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CURRMEDS_LASTD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FUNCTION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SENSATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURGHX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PROC_HX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_PROC_HX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_PROC_HX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PROC_HX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_PROC_HX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_FIX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_INT_FIX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DUR_EX_FIX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FIX_OTHER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXINFECTION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_HXINFECTION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DISCHARG_SINUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DUR_DISCHARGESINUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BONELOSS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CM_BONELOSS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UNITEDFX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SHORTENING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CM_SHORTENING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_GEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_GEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_GEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_CARDIOPUL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_CARDIOPUL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_CARDIOPUL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_GI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_GI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_GI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_GU',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_GU',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_GU',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_CNS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_CNS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_CNS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_HEENT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_HEENT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_HEENT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROS_MSK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_MSK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_ROS_MSK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'33',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'34',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'35',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'36',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'37',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'38',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'39',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'40',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'41',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'42',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'43',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'44',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'45',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'46',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'47',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'48',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'49',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'50',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'51',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'52',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'53',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'54',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'55',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'56',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'57',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'58',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'59',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'60',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'61',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'62',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'63',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'64',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'65',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'66',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'67',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'68',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'69',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'70',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'71',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'72',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'73',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'74',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'75',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'76',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'77',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'78',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'79',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'80',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'81',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'82',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'83',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'84',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'85',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'86',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'87',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'88',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'89',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'90',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'91',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'92',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'93',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'94',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'95',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'96',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'97',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'98',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'100',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'101',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'102',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'103',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_GEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_HEENT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_CHEST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_HEART',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_ABDOMEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_RECTAL_GENITAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_EXTREMITIES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PE_NEURO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_ALLERGY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TIMES_RECANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AE_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_AE_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXTRANSFUSION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXINCIDENT_TRANSF',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESCRIBE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MALLAMPATI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MOUTHOPENING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ASA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PLANNED_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FIBEROPTIC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REMARKS_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUTCOME_ANAESTH_IA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_ANAESTH_IA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RISKS_DISCUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FUTURE_EXPC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_EXPECTATIONS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXPSYCOUNSL_PT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BYWHO_PT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXPSYCOUNSL_FAM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BYWHO_FAM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXPSYCHIATRIC_PT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXPSYCHIATRIC_FAM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXPSYDRUGS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRUG_PSY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SQR20',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PTSD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PSYCA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEEDED_MH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_COUNSELLOR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CONDITION_SOFTTISSUE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEURAL_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_NEURAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VASCULAR_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_VASCULAR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FORSURGERY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CONSENT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_PROC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_PROC_NONCODED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_PROC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_PROC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ES_HRS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ES_MINS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SUMMARY_SURG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_SAP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'INITIAL_PLAN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PHYSIO_OBJ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_OBJ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_UNCERT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_SURG_OBJ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FREQ_OP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ES_SURGERIES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITES_DONOR_EX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SPACING_SURG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ES_LOS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PLANNING_FURTHER_ADMIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEED_CONSULTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REASON_CONSULTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_CONSULTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_DX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_DX_NONCODED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_DX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_DX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MED_DX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MED_DX_NONCODED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'104',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'105',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'106',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'107',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'108',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'109',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'110',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'111',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'112',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'113',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'114',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'115',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'116',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'117',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'118',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'119',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'120',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'121',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'122',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'123',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'124',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'125',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'126',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'127',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'128',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'129',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'130',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'131',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'132',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'133',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'134',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'135',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'136',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'137',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'138',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'139',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'140',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'141',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'142',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'143',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'144',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'145',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'146',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'147',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'148',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'149',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'150',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'151',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'152',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'153',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'154',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'155',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'156',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'157',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'158',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'159',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'160',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'161',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'162',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'163',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'164',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'165',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'166',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'167',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'168',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'169',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'170',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'171',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'172',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'173',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'174',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'175',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'176',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'177',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'178',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'179',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'180',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'181',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'182',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'183',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'184',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'185',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'186',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'187',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'188',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'189',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'190',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'191',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'192',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'193',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'194',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'195',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'196',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'197',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'198',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'199',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'200',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'201',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'202',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'203',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'204',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'205',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'206',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'207',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'208',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'209',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'210',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'211',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'212',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'213',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'214',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'215',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'216',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'217',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'218',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'219',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'220',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'221',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'222',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'223',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'224',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'225',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'226',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'227',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'228',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'229',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'230',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'231',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'232',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'233',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'234',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'235',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'236',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'237',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'238',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'239',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'240',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'241',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'242',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'243',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'244',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'245',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'246',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'247',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'248',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'249',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'250',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'251',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'252',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'253',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'254',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'255',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'256',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'257',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'258',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'259',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'260',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'261',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'262',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'263',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'264',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'265',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'266',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'267',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'268',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'269',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'270',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'271',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'272',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'273',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'274',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'275',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'276',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'277',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'278',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'279',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'280',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'281',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'282',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'283',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'284',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'285',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'286',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'287',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'288',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'289',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'290',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'291',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'292',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'293',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'294',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'295',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'296',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'297',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'298',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'299',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'300',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'301',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'P_TYPE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'P_WHEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRSG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDEDRSG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITEDRSG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_DESC_WOUND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRSG_COMMENTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_TE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TE_AMT_INJ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TE_AMT_OUT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TE_TOTAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TE_CONDITION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_REASON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PMOOD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_PMOOD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SUIC_THOUGHTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NUT_ASSES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_NUT_ASSES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ORIENTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PERIPHERAL_LINE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_PERIPHERAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_INSERT_PERIPHERAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_REMOV_PERIPHERAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PERIPHERAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PICC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_INSERT_PICC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_DRSG_PICC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PICC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_REMOV_PICC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FOLEY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BLOODSUGAR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RBS_BEFORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RBS_AFTER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FBS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'INSULIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMT_INSULIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PCOMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_START_COMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_ANEMIA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_ANAESTH_COMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_AE_ABX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_ARRHYTHMIA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_NECROSIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_PRESSURE_ULCER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_COMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OUT_COMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_END_COMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PCOMPLAINT_SUBJ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PCOMPLAINT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_PCOMPLAINT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ASSESS_VS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_VS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PAPPETITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DVT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DUR_DVT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DOSE_DVT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'WOUND_SIDE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STATUS_WOUND_1',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STATUS_WOUND_2',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REMOVAL_CLIPS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ASSESS_WOUND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRAINAGE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMT_DRAINAGE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_DRAINAGE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRSG_FREQ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_DRSG_FREQ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LAB_ABNORMAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'P_ACTIVE_ISSUE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_P_ACTIVE_ISSUE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PT_ASSESS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_PT_ASSESS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_INFORM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PT_PLAN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_REMOV_DRAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_REMOV_DRAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_PT_PLAN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SUM_CONSULT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CONSCIOUSNESS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SPO2',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NAUSEA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VOMITING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'URINE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_DRAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITE_DRAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PT_POSITION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EARLY_FUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PARTIAL_ACH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'IMPACT_COMPLICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMPUTATION_REQ',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FUP_NOTES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TRM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PT_INFORMED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FUP_PLAN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MLO_VISIT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'X-RAY_TIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'X-RAY_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VIDEO_TIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VIDEO_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PHOTO_TIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PHOTO_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURG_NOTES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'START_TIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'END_TIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SURGEON_ASSIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ANAESTHETIST_TECH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ANAESTHESIA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NURSE_SCRUB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OPERATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TE_SIZE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OPERATION_SIDE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OPERATION_SITE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FINDINGS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OP_DETAILS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_DRAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SPECIMEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ES_BLOODLOSS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TRANSFUSION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NUM_BLUNITS',@source_id,uuid(),now());