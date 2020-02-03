select distinct patient_identifier.identifier                                    as `Patient ID`,
       concat(person_name.given_name, ' ', person_name.family_name)              as `Patient Name in English`,
       concat_ws(' ',pivoted_person_attributes.first_name,
                 pivoted_person_attributes.last_name)                            as `Patient Name in Arabic`,
       person_address.state_province                                             as Governorate,
       pivoted_person_attributes.is_caretaker_required                           as `Need for Caretaker?`,
       pivoted_person_attributes.caretaker_gender                                as `Caretaker Gender`,
       pivoted_person_attributes.caretaker_name_english                          as `Caretaker Name in English`,
       pivoted_person_attributes.caretaker_name_arabic                           as `Caretaker name in Arabic`,
       pivoted_person_attributes.status_of_id_documents                          as `Status of official ID documents`,
       CAST(obs_data.date_of_password_upload as DATE )                           as `Date of Passport upload`,
       pivoted_person_attributes.patient_id_document_number                      as `ID Document Number (patient ID)`,
       pivoted_person_attributes.caretaker_id_document_number                    as `ID Document Number (Caretaker ID)`,
       pivoted_person_attributes.patient_id_expiry_date                          as `Date of Expiry (patient ID)`,
       pivoted_person_attributes.caretaker_id_expiry_date                        as `Date of Expiry (caretaker ID)`,
       concat_ws(',', pivoted_person_attributes.patient_phone_number_1,
                 pivoted_person_attributes.patient_phone_number_2,
                 pivoted_person_attributes.patient_phone_number_3)               as `Phone number (Patient)`,
       pivoted_person_attributes.patient_email_address                           as `Email ID (Patient)`,
       pivoted_person_attributes.patient_whatsapp                                as `WhatsApp (Patient)`,
       pivoted_person_attributes.patient_viber                                   as `Viber (Patient)`,
       pivoted_person_attributes.patient_facebook                                as `Facebook (Patient)`,
       concat_ws(',', pivoted_person_attributes.caretaker_phone_number_1,
                 pivoted_person_attributes.caretaker_phone_number_2)             as `Phone number (Caretaker)`,
       pivoted_person_attributes.caretaker_whatsapp                              as `WhatsApp (Caretaker)`,
       pivoted_person_attributes.caretaker_viber                                 as `Viber (Caretaker)`,
       pivoted_person_attributes.caretaker_facebook                              as `Facebook (Caretaker)`

from patient_identifier
       join person_name on person_name.person_id = patient_identifier.patient_id
-- Start of Label 1: TO GET REQUIRED PERSON ATTRIBUTES FILLED FOR A PERSON
       join (select person_id,
                    group_concat(first_name)                             as first_name,
                    group_concat(last_name)                              as last_name,
                    (select CASE
                              WHEN strcmp(group_concat(is_caretaker_required), 'true') THEN 'No'
                              ELSE 'Yes' END)                            as is_caretaker_required,
                    group_concat(caretaker_gender)                       as caretaker_gender,
                    group_concat(caretaker_name_english)                 as caretaker_name_english,
                    group_concat(caretaker_name_arabic)                  as caretaker_name_arabic,
                    group_concat(status_of_id_documents)                 as status_of_id_documents,
                    group_concat(patient_id_document_number)             as patient_id_document_number,
                    group_concat(caretaker_id_document_number)           as caretaker_id_document_number,
                    CAST(group_concat(patient_id_expiry_date) AS DATE)   as patient_id_expiry_date,
                    CAST(group_concat(caretaker_id_expiry_date) AS DATE) as caretaker_id_expiry_date,
                    group_concat(patient_phone_number_1)                 as patient_phone_number_1,
                    group_concat(patient_phone_number_2)                 as patient_phone_number_2,
                    group_concat(patient_phone_number_3)                 as patient_phone_number_3,
                    group_concat(patient_email_address)                  as patient_email_address,
                    group_concat(patient_whatsapp)                       as patient_whatsapp,
                    group_concat(patient_viber)                          as patient_viber,
                    group_concat(patient_facebook)                       as patient_facebook,
                    group_concat(caretaker_phone_number_1)               as caretaker_phone_number_1,
                    group_concat(caretaker_phone_number_2)               as caretaker_phone_number_2,
                    group_concat(caretaker_whatsapp)                     as caretaker_whatsapp,
                    group_concat(caretaker_viber)                        as caretaker_viber,
                    group_concat(caretaker_facebook)                     as caretaker_facebook

             from (
             (select person_attribute.person_id,
       person_attribute.value,
       case when person_attribute_type.name = 'givenNameLocal' then value end                                     as first_name,
       case when person_attribute_type.name = 'familyNameLocal' then value end                                    as last_name,
       case
         when person_attribute_type.name = 'isCareTakerRequired'
                 then value end                                                                                   as is_caretaker_required,
       case
         when person_attribute_type.name = 'caretakerGender' then (select concept_name.name
                                                                   from concept_name
                                                                   where concept_name.concept_id = value
                                                                     and concept_name.voided = 0) end             as caretaker_gender,
       case
         when person_attribute_type.name = 'caretakerNameEnglish'
                 then value end                                                                                   as caretaker_name_english,
       case
         when person_attribute_type.name = 'caretakerNameArabic'
                 then value end                                                                                   as caretaker_name_arabic,
       case
         when person_attribute_type.name = 'statusofOfficialIDdocuments' then (select concept_name.name
                                                                               from concept_name
                                                                               where concept_name.concept_id = value
                                                                                 and concept_name.voided = 0) end as status_of_id_documents,
       case when person_attribute_type.name = 'id1DocNumber' then value end                                       as patient_id_document_number,
       case when person_attribute_type.name = 'id3DocNumber' then value end                                       as caretaker_id_document_number,
       case when person_attribute_type.name = 'id1DateOfExpiry' then value end                                    as patient_id_expiry_date,
       case when person_attribute_type.name = 'id3DateOfExpiry' then value end                                    as caretaker_id_expiry_date,
       case when person_attribute_type.name = 'phoneNumber1' then value end                                       as patient_phone_number_1,
       case when person_attribute_type.name = 'phoneNumber2' then value end                                       as patient_phone_number_2,
       case when person_attribute_type.name = 'phoneNumber3' then value end                                       as patient_phone_number_3,
       case when person_attribute_type.name = 'emailAddress' then value end                                       as patient_email_address,
       case when person_attribute_type.name = 'whatsapp' then value end                                           as patient_whatsapp,
       case when person_attribute_type.name = 'viber' then value end                                              as patient_viber,
       case when person_attribute_type.name = 'facebook' then value end                                           as patient_facebook,
       case
         when person_attribute_type.name = 'caretakerPhoneNumber1'
                 then value end                                                                                   as caretaker_phone_number_1,
       case
         when person_attribute_type.name = 'caretakerPhoneNumber2'
                 then value end                                                                                   as caretaker_phone_number_2,
       case
         when person_attribute_type.name = 'caretakerWhatsapp'
                 then value end                                                                                   as caretaker_whatsapp,
       case when person_attribute_type.name = 'caretakerViber' then value end                                     as caretaker_viber,
       case
         when person_attribute_type.name = 'caretakerFacebook'
                 then value end                                                                                   as caretaker_facebook

       from person_attribute
       join person_attribute_type
         on person_attribute.person_attribute_type_id = person_attribute_type.person_attribute_type_id where voided=0) as person_attributes_with_name
                 )

             group by person_id) as pivoted_person_attributes
         on pivoted_person_attributes.person_id = patient_identifier.patient_id
-- End of Label 1
       join person_address on person_address.person_id = patient_identifier.patient_id
-- Start of Label 2: TO GET DATE WHEN THE PASSPORT GOT UPLOADED INTO THE SYSTEM
       left join (select obs.person_id, max(obs.date_created) as date_of_password_upload
             from obs
             where concept_id = (select concept_id
                                from concept_name
                                where name = 'Passport'
                                  and concept_name_type = 'FULLY_SPECIFIED'
                                  and voided = 0)
               and voided = 0 group by person_id) as obs_data on obs_data.person_id = patient_identifier.patient_id
-- End of Label 2
order by patient_identifier.date_created desc;



