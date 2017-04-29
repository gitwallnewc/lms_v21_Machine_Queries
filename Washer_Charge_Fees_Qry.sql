SELECT
    a.machine_user_account_payment_amount AS amount,
    a.charge_fee_amount,
    a.is_user_account_customer,
    a.machine_id,
    b.machine_control_id,
    b.machine_number,
    b.facility_id,
    b.facility_name,
    b.organization_id,
    b.organization_name
FROM lms_machine.machine_user_account_payment a
     JOIN lms_machine.vw_machine b ON a.machine_id = b.id
WHERE a.is_user_account_customer = false AND
 a.machine_id IN
(SELECT DISTINCT(a."id")
FROM   lms_machine.vw_machine a, lms_facility.vw_facility_organization b, lms_machine.vw_machine_user_account_payment d
WHERE is_washer = True
AND  b.facility_id = a.facility_id
AND  b.organization_name = 'Alliance Labs United'
AND  d.machine_id = a."id")
