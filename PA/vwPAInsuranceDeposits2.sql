alter view vwPAInsuranceDeposits2 as 

select ID.Full_Name,
	ID.Region_SHort_Name,
	ID.claim_seq,
	ID.check_no,
	ID.DOS,
	ID.Date_Collected,
	datediff(month,ID.DOS,ID.Date_Collected) as CollectionMonths,
	ID.Payment_Collected,
	ID.patient_id,
	ID.Biller, 
	ID.Insurance_Type,
	ID.Hospital,
	ID.surgeon,
	ID.[Claim Total Charge],
	ID.Payer as Payor,
	vwPAMaster.[Consolidated Payor],
	vwPAMaster.surgeonownd,
	vwPAMaster.clm_billing_type,
	vwPAMaster.[claim date],
	vwPAMaster.OriginalClaimDate, --ticket #2434
	vwPAMaster.box33,
	vwPAMaster.Folder,
	vwPAMaster.claimbiller,
	vwPAMaster.GroupID,
	vwPAMaster.[Procedure type],
	vwPAMaster.ins_charged,
	vwPAMaster.[Primary Insurance],
	vwPAMaster.InitialDate

from Insurance_Deposits_3350 as ID
Left outer Join vwPAMaster on ID.claim_seq = vwPAMaster.claim_id

