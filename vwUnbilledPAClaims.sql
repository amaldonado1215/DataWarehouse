alter view vwUnbilledPAClaims as
select 
	PID, DOS, claim_id, Patient, Surgeon, [Primary Insurance], [Insurance Type], clm_billing_type, [Procedure Type],
	Region_Short_Name as Region, [Consolidated Payor], CorrectEntity, SurgeonOwnd, Folder 
from vwPAMaster
where 
	BillStatus = 'Not Billed'
