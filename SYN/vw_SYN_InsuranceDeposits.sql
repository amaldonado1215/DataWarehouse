CREATE VIEW vw_SYN_InsuranceDeposits as 
SELECT i.claimbiller,
	i.clm_billing_type,
	i.Folder,
	i.Region_Short_Name,
	i.box33,
	i.Hospital,
	i.Surgeon,
	i.DOS,
	i.patient_id,
	i.Insurance_Type,
	i.[consolidated payor],
	i.[Primary Insurance],
	i.claim_seq,
	i.[claim date],
	i.ins_charged,
	i.Date_Collected,
	i.check_no,
	i.Payment_Collected						
FROM vwInsuranceDeposits2 i						
WHERE i.[Payment_Collected]<>0
	and box33 in('Synergy Neuromonitoring LLC','Apex Health Monitoring, LLC')	
