SELECT
  vw_machine_user_account_payment.machine_id,
  machine_user_account_payment_adjustment.machine_user_account_payment_adjustment_amount,
  machine_user_account_payment_adjustment_type.name,
  vw_machine_user_account_payment.facility_id,
  vw_machine_user_account_payment.facility_name,
  vw_machine_user_account_payment.organization_id,
  vw_machine_user_account_payment.organization_name
FROM
  lms_machine.vw_machine_user_account_payment,
  lms_machine.machine_user_account_payment_adjustment,
  lms_machine.machine_user_account_payment_adjustment_type,
  lms_machine.machine_user_account_payment_adjustment_reason
WHERE
  vw_machine_user_account_payment.id = machine_user_account_payment_adjustment.machine_user_account_payment_payment_id AND
  machine_user_account_payment_adjustment_type.id = machine_user_account_payment_adjustment.machine_user_account_payment_adjustment_type_id AND
  machine_user_account_payment_adjustment_reason.id = machine_user_account_payment_adjustment.machine_user_account_payment_adjustment_reason_id AND
  organization_name = 'Alliance Labs United' AND
   lms_machine.machine_user_account_payment_adjustment_type.name IN  ('Gift Card Discount Adjustment') AND
 vw_machine_user_account_payment.machine_id IN
(SELECT DISTINCT(a."id")
FROM   lms_machine.vw_machine a, lms_facility.vw_facility_organization b, lms_machine.vw_machine_user_account_payment d
WHERE is_dryer = True
AND  b.facility_id = a.facility_id
AND  b.organization_name = 'Alliance Labs United'
AND  d.machine_id = a."id")
