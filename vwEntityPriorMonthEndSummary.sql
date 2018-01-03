 --  select * from vwMaster2
 -- select distinct folder from vwMaster2
 -- select * from vwEntityMonthEndSummary

 /*			select * from vwMaster2 where box33 like '%ACME%'  and 
			DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing') 

			select * from vwInsuranceDeposits where entity  like '%ACME%' and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				*/

	/*	select sum(mysum) from (
			select max([claim Total Charge]) as mysum from vwInsuranecDeposits2 where entity  like '%ACME%' and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_id ) as myquery

		select sum(mysum) from (
			select * from vwInsuranecDeposits2 where box33  like '%ACME%' and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_id ) as myquery

			select * from vwInsuranecDeposits2 where patient_id = '193502' */
				
				
					

alter view vwEntityPriorMonthEndSummary as 

select distinct proentity,   
		substring(
			(
				Select ', '+rtrim(SL2.Surgeon)  AS [text()]
				From Surgeonlookup2 as SL2
				Where SL.proentity = SL2.Proentity
				ORDER BY SL.ProEntity
				For XML PATH ('')
			), 2, 1000) [Surgeons],
		min(startdate) as [Formation Date],
		( 
			/*  Count Claims based on Claim Date */
			select count(*) from vwMaster2 where box33 = SL.ProEntity  and 
			DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')
		) [MTD Claims Billed],
		( 
			/* Count total Amount Claimed based on ClaimDate */
			select sum(ins_charged) from vwMaster2 where box33 = SL.ProEntity and 
			DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')
		) [MTD Amount Billed],
		(
		/* Amount Collected that month */
			select sum(payment_collected) from vwInsuranceDeposits where entity = SL.proentity and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [MTD Amount Collected],
		(
		select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = SL.proentity and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery
		) [MTD Collected Billed Amt],
		(
		(select sum(payment_collected) from vwInsurancedeposits where  entity = SL.proentity and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))

		/ (select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = SL.proentity and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery)
		) [MTD Pct Collected],
		
		-- YTD collections
		(select sum(payment_collected) from vwInsuranceDeposits where entity = SL.proentity and
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				and DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [YTD Amount Collected],
		(
		select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = SL.proentity and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery
		) [YTD Collected Billed Amt],
		(
		 (select sum(payment_collected) from vwInsuranceDeposits where entity = SL.proentity and
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))
				/
		(	select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = SL.proentity and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery)
		) [YTD Pct Collected]
	From SurgeonLookup2 SL
	where proentity not in ('Neurodiagnostics & Neuromonitoring Institute, Inc.' , 'In-Site Surgical Monitoring Services')
	group by proentity

	/*	1. Entity name 
2. Physician's name who owns the company
3. Date of formation 
4. Number of claims billed
5. Amount billed
6. Amount collected that month
7. Percentage of collections vs amount billed 
7. YTD collections 
8. Percentage of collections vs amount billed for the YTD  */
/*
select * from surgeonlookup
select top 100 * from vwMaster2
select top 100 * from vwNewClaimsBilled
select top 100 * from vwInsuranceDeposits  
select max([Claim Total Charge]), sum(payment_collected) from vwInsurancedeposits where 
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		Group by claim_id

select sum([Claim Total Charge])  from vwInsurancedeposits where entity = 'ACME Medical, PLLC ' and 
				 DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		         3710204.62
select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = 'ACME Medical, PLLC ' and 
					DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					group by claim_id ) as myquery

*/