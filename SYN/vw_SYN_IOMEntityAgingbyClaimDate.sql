ALTER VIEW vw_SYN_IOMEntityAgingbyClaimDate as					
SELECT a.clm_billing_type,
	m.BillStatusTech,
	b.BillableStatusTech as BillableTech,
	a.ins_folder,
	a.region_short_name,
	a.box33,
	m.Hospital,
	a.Surgeon,
	a.dos,
	a.patient_id,
	a.[consolidated payor],
	a.InsuranceType,
	a.claim_date,
	a.claim_seq,
	a.ins_charged,
	m.AllowedAmt,
	a.TOTALCOLLECTED,
	a.ins_writte_off,
	a.Balance-(a.ins_charged-m.AllowedAmt) as [A/R Balance],
	datediff(day,cast(a.claim_date as date),getdate()) as [Days Outstanding],
	datediff(day,cast(a.DOS as date),cast(a.claim_date as date)) as [Days to Bill] 						
FROM vwIOMEntityAgingbyDOS a	
	INNER JOIN vw_SYN_SurgeonLookup2 s on s.surgeon = a.Surgeon and a.dos between s.StartDate and s.EndDate					
	LEFT JOIN vwMaster2 m ON a.claim_seq = m.claim_id						
	LEFT JOIN vwBillableCasesCalculation b	ON a.patient_id=b.PID						
WHERE a.clm_billing_type='Tech Only' 
	or a.clm_billing_type is NULL
	or m.claim_id in (823328, 786695)
