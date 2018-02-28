ALTER VIEW vw_SYN_Master as
SELECT m.clm_billing_type, 
	m.BillStatusTech, 
	b.BillableStatusTech,
	m.Folder, 
	m.Region_Short_Name, 
	m.Box33, 
	m.Hospital, 
	m.Surgeon, 
	m.DOS, 
	m.PID, 
	m.[consolidated payor], 
	m.[Insurance Type],
	 m.[Claim Date], 
	 m.claim_id, 
	 m.DaysToBill, 
	 m.ins_charged, 
	 m.AllowedAmt, 
	 datediff(day,cast(m.OriginalClaimDate as date), cast(m.[First Collection] as date)) as [Days to First Collection], 
	 m.[Total Collection], 
	 datediff(day,cast(m.OriginalClaimDate as date), cast(m.claim_closed_date as date)) as [Days to Close], 
	 m.claim_closed_date,
	 m.ins_writte_off,
	 m.Balance, 
	 m.[A/R Balance]						
FROM vwMaster2 m
	INNER JOIN  dbo.vw_SYN_SurgeonLookup2 s on s.Surgeon = m.Surgeon and m.DOS between s.startdate and s.enddate			
	LEFT JOIN vwBillableCasesCalculation b ON m.PID = b.PID						
WHERE m.clm_billing_type='Tech Only' 
	or m.clm_billing_type is NULL 
	or m.claim_id in (823328, 786695)
