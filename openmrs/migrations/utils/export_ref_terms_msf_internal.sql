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