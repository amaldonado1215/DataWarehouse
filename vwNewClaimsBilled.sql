alter view vwNewClaimsBilled as
select
	Folder,
	Claimbiller,
	ClaimMethod,
	DOS,
	[Claim Date],
	Clm_Billing_Type,
	[Consolidated Payor],
	[Primary Insurance],
	[Insurance Type],
	PID,
	[Box33],
	Claim_id,
	GroupID,
	Ins_charged
from vwMaster2
where DATEDIFF(day, [Claim Date], getdate()) <= 45

