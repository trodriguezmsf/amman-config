SELECT
  drug_orders.patient_id,
  CAST(drug_orders.autoExpireDate AS DATE)        AS `autoExpireDate`,
  CAST(microBiology.sampleCollectionDate AS DATE) AS `sampleCollectionDate`
FROM
  (SELECT
     o.order_id,
     CAST(o.date_activated AS DATE)   AS dateActivated,
     CAST(o.auto_expire_date AS DATE) AS autoExpireDate,
     o.concept_id,
     e2.visit_id,
     e2.patient_id
   FROM drug
     INNER JOIN orders o ON o.concept_id = drug.concept_id AND o.voided IS FALSE AND drug.retired IS FALSE
     INNER JOIN encounter e2 ON e2.encounter_id = o.encounter_id AND e2.voided IS FALSE
   WHERE name IN (
     'AMIKACIN 500 mg/ 2ml 2 ml, amp.',
     'AMOXICILLIN 1 g',
     'AMOXICILLIN 400mg & CLAVULANIC acid   57mg /5ml 70ml, powder',
     'AMOXICILLIN 875mg & CLAVULANIC acid   125mg',
     'AMPICILLIN 1 g Powder, vial',
     'AMPICILLIN 500 mg Powder, vial',
     'CEFAZOLIN powder (IV) 1 g Powder, vial',
     'CEFIXIME 400 mg Capsules',
     'CEFTAZIDIME 1 g Powder, vial',
     'CEFTRIAXONE sodium eq. 1 g base Powder, vial',
     'CHLORAMPHENICOL 1% Tube',
     'CIPROFLOXACIN 0.30% 5 ml, bottle',
     'CIPROFLOXACIN hydrochloride eq. 250 mg base',
     'CIPROFLOXACIN hydrochloride eq. 500 mg base',
     'CLARITHROMYCIN 500 mg',
     'CLINDAMYCIN 150mg Capsules',
     'CLINDAMYCIN hydrochloride eq. 300 mg base Capsules',
     'CLINDAMYCINE 150mg/ml 4 ml, amp',
     'CLINDAMYCIN hydrochloride eq. 300 mg base Capsules',
     'CLINDAMYCINE 150mg/ml 4 ml, amp',
     'CLOXACILLIN sodium eq. 500 mg base Powder, vial',
     'COTRIMOXAZOLE 80mg/16mg/ml 5 ml for infusion, vial',
     'COTRIMOXAZOLE 400 mg / 80 mg',
     'DOXYCYCLINE 100 mg',
     'ERYTHROMYCIN eq. 400 mg base',
     'GENTAMICIN sulfate eq. 40 mg/ml base 2 ml, amp',
     'HYDROXYZINE HYDROCHLORIDE 25 mg',
     'VANCOMYCIN hydrocloride eq. 1g base Powder, vial',
     'VANCOMYCIN 500 mg Vial',
     'TOBRAMYCIN  0.3% & DEXAMETHANE  0.1% 5 g, tube',
     'TIGECYCLINE 50 mg Powder, vial',
     'TETRACYCLINE hydrochloride 1% 5g, tube',
     'TEICOPLANIN 200 mg Powder, vial  solvent',
     'SULFADIAZINE SILVER 1% 50g, tube',
     'RIFAMPICIN 300 mg Capsules',
     'PIPERACILLIN 4g &  TAZOBACTAM 500 mg Powder, vial, for infusion',
     'NEOMYCINE 5 mg & BACTRICIN   500 UI/g Tube',
     'METRONIDAZOLE 500 mg',
     'METRONIDAZOLE 5 mg/ml 100 ml, semi-rigid bot. PVC free',
     'MEROPENEM 1 g Powder, vial',
     'LEVOFLOXACIN 500 mg'
   )
  ) drug_orders
  INNER JOIN
  (SELECT
      specimenCollection.person_id,
     specimenCollection.visit_id,
     specimenCollection.value AS sampleCollectionDate
   FROM
     (SELECT
        obs.person_id,
        e.visit_id,
        value_datetime AS value,
        obs_group_id   AS specimenGroupId

      FROM obs
        INNER JOIN concept_name cn
          ON cn.concept_id = obs.concept_id AND cn.name = 'Specimen Collection Date' AND cn.voided IS FALSE AND
             obs.voided IS FALSE
        INNER JOIN encounter e ON obs.encounter_id = e.encounter_id AND e.voided IS FALSE
     ) specimenCollection
     INNER JOIN
     (SELECT *
      FROM
        (SELECT
           obs_id       AS resultsObsId,
           obs_group_id AS resultsGroupId
         FROM obs
           INNER JOIN concept_name cn
             ON cn.concept_id = obs.concept_id AND cn.name = 'Bacteriology Results' AND
                cn.concept_name_type = 'FULLY_SPECIFIED'
                AND cn.voided IS FALSE AND
                obs.voided IS FALSE
        ) resultsSection
        INNER JOIN
        (SELECT
          obs_group_id AS groupId
         FROM obs
           INNER JOIN concept_name cn ON cn.concept_id = obs.concept_id AND
                                         cn.name = 'Microbiology, Type of identification' AND
                                         cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                         cn.voided IS FALSE AND
                                         obs.voided IS FALSE
           INNER JOIN concept_name answer ON answer.concept_id = obs.value_coded AND
                                             answer.concept_name_type = 'FULLY_SPECIFIED' AND
                                             answer.voided IS FALSE
         WHERE answer.name = 'Answer, Final Identification'
        ) finalIdentificationAnswerObs ON finalIdentificationAnswerObs.groupId = resultsSection.resultsObsId
     ) finalIdentification
       ON finalIdentification.resultsGroupId = specimenCollection.specimenGroupId
  ) microBiology
    ON drug_orders.patient_id = microBiology.person_id AND drug_orders.visit_id = microBiology.visit_id
WHERE microBiology.sampleCollectionDate BETWEEN dateActivated AND autoExpireDate