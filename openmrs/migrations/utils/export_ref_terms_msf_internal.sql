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
  (4,'OPERATION_NONCODED',@source_id,uuid(),now());
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
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'T_RECORDED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PN_NOTES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ANAESTH_START',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ANAESTH_END',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRUGS_INTRAOP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMPLICATION_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_COMPLICATION_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BL_INTRAOP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AE_TRANSFUSION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_AE_TRANSFUSION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LAB_INTRAOP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DEVICES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'POSTOP_ANAESTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_XRAY_DOC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_XRAY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_PAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SEVERITY_PAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_BURNING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_PAINFULCOLD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_ELECTRIC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_TINGLING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_PINS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_NUMBNESS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_ITCHING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_TOUCH_HYPOESTHESIA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_PRICKING_HYPOESTHESIA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_LIGHT_BRUSING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DN4_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PT_CC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ISPAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ONSET_PAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PAIN_WITH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PHYSIO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_PAIN_WITH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'INC_DEC_FACTORS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REFERRAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PAIN_FUP_COMMENTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'REASON_VISIT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RENEWAL_MEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NEW_PTCOMPLAINT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PTCOMPLAINTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_ABX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STATUS_WOUND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'KFT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LIVER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NOTES_ABX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MEDCOURSE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COND_TRM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_COND_TRM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DCMEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_DCMEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DCMEDS_DOSEFX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DCMEDS_DUR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FUPNEEDS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_REASON_VISIT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ASSESSMENT_TYPE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HXPHYSIO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DETAILHXPHYSIO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PROBLEM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AFFECTEDSIDE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'GROOMING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FEEDING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DRESSING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TOILETUSE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TRANSFERS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STAIRS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MOBILITY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ASSISDEVICE_ORTHOSIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_DEVICE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_DEVICE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_DEVICE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMPUTEE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMPUTATIONLEVEL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OTHER_AMPUTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SIDE_AMPUTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STUMP_FROM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STUMP_CM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_STUMP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PROSTHESES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_PROSTHESES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LLD_TRUE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LLD_FUNCTIONAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_HIPFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_HIPEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_INTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_EXTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ABD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ADD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_KNEEFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_KNEEEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ANKDORSIFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ANKPLANTERFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ANKINV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ANKEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_HIPFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_HIPEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_INTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_EXTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ABD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ADD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_KNEEFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_KNEEEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ANKDORSIFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ANKPLANTERFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ANKINV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ANKEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_HIPFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_HIPEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_INTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_EXTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ABD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ADD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_KNEEFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_KNEEEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ANKDORSIFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ANKPLANTERFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ANKINV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ANKEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_HIPFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_HIPEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_INTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_EXTROTATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ABD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ADD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_KNEEFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_KNEEEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ANKDORSIFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ANKPLANTERFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ANKINV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ANKEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_SENSATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NERV_INJURY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTGLUTMEDIUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTGLUTMEDIUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTGLUTMAXI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTGLUTMAXI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTQUADRICEPS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTQUADRICEPS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTILLIOPSOAS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTILLIOPSOAS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTADDUCTORS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTADDUCTORS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTTIBIALISANT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTTIBIALISANT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTPERONLONGBREV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTPERONLONGBREV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTDIGITORUM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTDIGITORUM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTHALLUCIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTHALLUCIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTGASTROCNEMIUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTGASTROCNEMIUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTTIBIALISPOST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTTIBIALISPOST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXDIGILONG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXDIGILONG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXHALLLONG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXHALLLONG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BALANCE_SITTING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CHAIR_RISE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RISE_ATTEMPT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'IMMEDIATE_STAND_BALANCE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BALANCE_STANDING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NUDGED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EYES_CLOSED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TURNING_360_1',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TURNING_360_2',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SITTING_DOWN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BALANCE_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'INDICATION_GAIT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STEP_LENGTH_HEIGHT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FOOT_CLEARANCE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STEP_SYMMETRY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'STEP_CONTINUITY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PATH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TRUNK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'WALKING_TIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'GAIT_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TINETTI_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RISK_FALLS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PTAGE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_USUAL_WORK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_USUAL_HOBBIES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_BATH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_WALK_BTROOMS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_SOCKS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_SQUATTING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_LIFTING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_LIGHT_ACTIVITIES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_HEAVY_ACTIVITIES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_CAR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_TWO_BLOCKS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_ONEMILE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_STAIRS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_STANDING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_SITTING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_EVEN_RUNNING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_UNEVEN_RUNNING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_SHARP_TURNS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_HOPPING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_BED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFI_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_KNEES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_PLAYING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_WALK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_WALK_BTROOMS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_TOILET',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_CHAIR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_FLOOR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_BENCH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_TIPTOES_REACHING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_TIPTOES_PLACING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_WALK_SLIGHT_UNEVEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_WALK_ROUGH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_UPDOWN_HILLS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_UPDOWN_CURBS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_BUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_CAR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_ACROSS_ROOM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_BACKPACK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_BEND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_EXERCISE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDLL_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PO_CENTER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PHYSIO_CENTER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RECOM_PHYSIO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HOME_EXERCISE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DOMINANTSIDE',@source_id,uuid(),now());
  INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'WOUND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_WOUND',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NAIL_COLOR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_NAIL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SWEATING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_SWEATING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ADHESION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_ADHESION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BLOODSUPPLY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_BLOODSUPPLY',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ARCHES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_ARCHES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_SHOULDFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_SHOULDEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ELBOWFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ELBOWEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_FOREARMSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_FOREARMPRON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_WRISTFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_WRISTEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_ULNARDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTROM_RADIALDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_SHOULDFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_SHOULDEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ELBOWFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ELBOWEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_FOREARMSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_FOREARMPRON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_WRISTFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_WRISTEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_ULNARDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTROM_RADIALDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_WRIST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_THUMBMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_THUMBDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_SECFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_THRFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_FRTHFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_FTHFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_SECFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_THRFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_FRTHFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_FTHFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_SECFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_THRFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_FRTHFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FLEXROM_FTHFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_WRIST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_THUMBMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_THUMBDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_SECFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_THRFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_FRTHFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_FTHFINGMC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_SECFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_THRFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_FRTHFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_FTHFINGPIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_SECFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_THRFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_FRTHFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'EXTROM_FTHFINGDIP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROM_DIST_SECTOFTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ROM_DIST_THUMTOSEC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_SHOULDFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_SHOULDEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ELBOWFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ELBOWEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_FOREARMSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_FOREARMPRON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_WRISTFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_WRISTEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_ULNARDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTMUSC_RADIALDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_SHOULDFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_SHOULDEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ELBOWFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ELBOWEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_FOREARMSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_FOREARMPRON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_WRISTFLEX',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_WRISTEXT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_ULNARDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTMUSC_RADIALDEV',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTBICEPBRACHII',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTBICEPBRACHII',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTDELTOID',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTDELTOID',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTTRICEP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTTRICEP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTCRADLB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTCRADLB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTCULNARIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTCULNARIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTDIGITI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTDIGITI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTABDPOLLONGUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTABDPOLLONGUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTPOLLONGUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTPOLLONGUS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTINDICIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTINDICIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTEXTDIGMIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTEXTDIGMIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTPRONATOR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTPRONATOR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXCARPIRADIALIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXCARPIRADIALIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXDIGSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXDIGSUP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXDIGPROF',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXDIGPROF',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTOPPPOLLICIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTOPPPOLLICIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXPOLLLB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXPOLLLB',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTABDPOLLBREVIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTABDPOLLBREVIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTLUMBRICALIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTLUMBRICALIS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTFLEXCARPIULN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTFLEXCARPIULN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTINTEROSSEI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTINTEROSSEI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTADDPOLL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTADDPOLL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LEFTOPPABDFLEXMINIMI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIGHTOPPABDFLEXMINIMI',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CHUCK_PINCH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CYLIND_GRASP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SPHERICAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'HOOK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TIP_PINCH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LATERAL_KEYPINCH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BASICGRIP_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_USUAL_WORK',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_LIFTING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_PLACING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_WASHING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_PUSHING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_PREPFOOD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_DRIVING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_VACUUMING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_BUTTONS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_TOOLS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_OPENDOORS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_CLEANING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_LAUNDERING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_OPENJAR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_CARRYING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_RAWSCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'UEFI_FINALSCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_POINT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_SOCKS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_PANTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_BUTTONS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_SPOON',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_WIPETOILET',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_PANTSTOILET',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_HOLDFULLPLATE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_SCISSORS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_SHOWER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_BATH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_PHONE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_BED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_SHOES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_OPENJAR',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_TOOTHPAST',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_BRUSHTEETH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_TOWEL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_PUTONCLOTHES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_ZIPPER',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PEDUL_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SPECIAL_CONCERNS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'WHISTLE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_WHISTLE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FACIALMUSCL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_FACIALMUSCL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DIFFICULTYEYES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_DIFFICULTYEYES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DIFFICULTYMOUTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_DIFFICULTYMOUTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DIFFICULTYTONGUE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_DIFFICULTYTONGUE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OBSERVATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PALPATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MUSCL_STRENGTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MUSCL_CONTROL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AROM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_AROM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MOUTH_OPENING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_EAT',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_DRINKING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_SPEAKING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_EYES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_CHEWING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PHYSICAL_FUNCTION_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_CALM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_ISOLATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_IRRITABLE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_SLEEPING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_SOCIAL_ACTIVITIES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SOCIALWELLBEING_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FDI_SCORE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_REFERRAL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_SAMPLE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SAMP_SOURCENONCODED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'SAMP_SOURCE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ID_SPECIMEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VOL_BLOOD',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'APPEAR_MACRO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DESC_SPECIMEN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CRP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'D_CRP',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'GROWTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_GROWTH',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TYPE_IDENTIFICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'INT_IDENTIFICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_INTERMED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FINAL_IDENTIFICATION',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'GRAMSTAIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'LATEX_AGG',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PIPERACILLIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TICARCILLIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AZTREONAM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TOBRAMYCINE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMIKACIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TICARCLAVAC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CEFEPIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'IMIPENEM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CEFTAZIDIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'GENTAMICINE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CIPROFLOXACIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'MEROPENEM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PENICILLIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PENICILLIN_SENS_ZONE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CEFOXITIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PBP2A',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NORFLOXACIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'GENTAMICIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TOBRAMYCIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ERYTHROMYCIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CLINDAMYCIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'DZONE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CHLORAMPHENICOL',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TRIMETHSULFA',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'FUSIDICACID',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'RIFAMPICIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VANC_MIC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TETRACYCLINE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMPICILLIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'VANCOMYCIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'OXACILLIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CEFTRIAXONE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AMOXICILLINCLAVAC',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'CEFOTAXIME',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ERTAPENEM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PIPTAZOBACTAM',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ESBLSCREENING',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'PENICILLIN_G',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BETALACTAMASETESTPERF',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'BETALACTAMASETESTRES',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'AUGMENTIN',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'NALIDIXICACID',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'TETRACYCINE',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'COMMENTS_MICRO',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ALERTS',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ALERTS_NONCODED',@source_id,uuid(),now());
INSERT INTO concept_reference_term (creator,code,concept_source_id,uuid,date_created) VALUES
  (4,'ALERTS_CODED',@source_id,uuid(),now());