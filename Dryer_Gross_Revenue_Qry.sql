SELECT b.organization_name, b.organization_type, b.facility_id, b.facility_name, 'Dryers' AS "Type", a.id AS "machine_id", a.machine_type_id, a.machine_type, d.amount
FROM   lms_machine.vw_machine a, lms_facility.vw_facility_organization b, lms_machine.vw_machine_user_account_payment d
WHERE is_dryer = True
AND  b.facility_id = a.facility_id
AND  b.organization_name = 'Alliance Labs United'
AND  d.machine_id = a."id";
