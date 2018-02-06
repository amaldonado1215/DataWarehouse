ALTER VIEW vwInsuranceDeposits2 as 

select --ID.Full_Name,
	LEFT(ID.First_Name,1) + '. ' + LEFT(ID.Last_Name,1) + '.' as Full_Name,
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
	CASE	
		when vwmaster2.entity = 'Frisco Neurosurgical, PLLC' then 'Frisco Neurosurgical Products, PLLC'
		else vwmaster2.entity
		end as entity,
	vwmaster2.[Consolidated Payor],
	vwMaster2.[Surgeon Ownd],
	vwMaster2.clm_billing_type,
	vwMaster2.[claim date],
	CASE	
		when vwmaster2.box33 = 'Frisco Neurosurgical, PLLC' then 'Frisco Neurosurgical Products, PLLC'
		else vwmaster2.box33
		end as box33,
	vwMaster2.OriginalClaimDate, --ticket #2434
	vwMaster2.Folder,
	vwMaster2.claimbiller,
	vwMaster2.GroupID,
	vwMaster2.[Procedure type],
	vwMaster2.ins_charged,
	vwMaster2.[Primary Insurance]

from Insurance_Deposits_3300 as ID
	Left outer Join vwMaster2 on ID.claim_seq = vwmaster2.claim_id

where ID.date_Collected >= '2013-01-01'