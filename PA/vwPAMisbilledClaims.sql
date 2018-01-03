ALTER VIEW vwPAMisbilledClaims AS

SELECT        
	PID, 
	DOS, 
	claim_id, 
	[Claim Date], 
	Surgeon, 
	[Primary Insurance], 
	[Insurance Type], 
	biller, 
	Box33, 
	CorrectEntity, 
	DATEDIFF(day, [Claim Date], GETDATE()) AS DaysClaimed

FROM	dbo.vwPAMaster

WHERE   (Box33 <> CorrectEntity) AND 
		(Folder IN ('Ongoing Insurance Billing')) AND 
		(biller NOT IN ('Anesthesia Services, Ltd')) AND 
		(ins_charged > 0.25) AND 
        ([Insurance Type] <> 'Patient Responsibility') AND 
		(clm_billing_type <> 'MED REC')