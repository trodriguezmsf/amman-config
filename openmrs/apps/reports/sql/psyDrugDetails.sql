SELECT e.patient_id,
  name,
  CAST(o.date_activated AS DATE) AS psyDrugStartDate,
  CAST(coalesce(o.date_stopped, o.auto_expire_date) AS DATE)  AS psyDrugEndDate
FROM drug d
  INNER JOIN orders o ON o.concept_id = d.concept_id AND order_action = 'NEW'
  INNER JOIN drug_order od ON od.order_id = o.order_id
  INNER JOIN encounter e ON e.encounter_id = o.encounter_id
where name IN (
  'AMITRIPTYLINE hydrochloride 25 mg',
  'BROMAZEPAM 3mg',
  'CARBAMAZEPINE 200 mg',
  'CLOMIPRAMINE hydrochloride 25 mg',
  'DIAZEPAM 5 mg/ml 2 ml, amp',
  'DIAZEPAM 5 mg',
  'HALOPERIDOL 5 mg/ml 1 ml, amp',
  'HALOPERIDOL 5 mg',
  'OLANZAPINE 10 mg',
  'OLANZAPINE 5 mg',
  'SERTRALINE 100 mg',
  'VALPROIC ACID 500 mg Coated')