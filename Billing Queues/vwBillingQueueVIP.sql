alter view vwBillingQueueVIP as 

select 
	PID,
	Patient,
	DOS,
	claim_id,
	[Primary Insurance],
	[consolidated payor],
	[Insurance Type],
	GroupID,
	box33,
	vwMaster2.Surgeon as SurgeonName, --Christy
	SurgeonRanking,
	clm_billing_type,
	ins_charged,
	[Total Collection],
	case	
		when ins_charged <>0  then [Total Collection]/ins_charged
		else null
	end as NetClaimReimbursement, --Christy
	Region_Short_Name as Region,
	[Claim Date],
	nt.initialdate as NoteDate,
	nt.note_type as NoteType,
	nt.note

from vwMaster2
	LEFT OUTER JOIN notes_3300 as nt on nt.billing_notes_id = 
			(select top 1 billing_notes_id from notes_3300  where notes_3300.patient_id = vwMaster2.pid  order by initialdate desc)
where 
	[Surgeon Ownd] = 'Yes'
	and folder = 'Ongoing Insurance Billing'

/*
select * from vwBillingQueueVIP  Order by SurgeonRanking Desc
*/
