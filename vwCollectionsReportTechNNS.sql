
alter view vwCollectionsReportTechNNS as 

select distinct techentity,   
		/*substring(
			(
				Select ', '+rtrim(SL2.Surgeon)  AS [text()]
				From Surgeonlookup as SL2
				Where SL.proentity = SL2.Proentity
				ORDER BY SL.ProEntity
				For XML PATH ('')
			), 2, 1000) [Surgeons],
		min(startdate) as [Formation Date],*/
		( 
			/*  Count Claims based on Claim Date */
			select count(*) from vwMaster2 where box33 = RTEL.techentity  and 
			DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')
		) [MTD Claims Billed],
		( 
			/* Count total Amount Claimed based on ClaimDate */
			select sum(ins_charged) from vwMaster2 where box33 = RTEL.techentity and 
			DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')
		) [MTD Amount Billed],
		(
		/* Amount Collected that month */
			select sum(payment_collected) from vwInsuranceDeposits where entity = RTEL.techentity and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [MTD Amount Collected],
		(
		select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = RTEL.techentity and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery
		) [MTD Collected Billed Amt],
		(
		(select sum(payment_collected) from vwInsurancedeposits where  entity = RTEL.techentity and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))

		/ (select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = RTEL.techentity and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery)
		) [MTD Pct Collected],
		
		-- YTD collections
		(select sum(payment_collected) from vwInsuranceDeposits where entity = RTEL.techentity and
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				and DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [YTD Amount Collected],
		(
		select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = RTEL.techentity and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery
		) [YTD Collected Billed Amt],
		(
		 (select sum(payment_collected) from vwInsuranceDeposits where entity = RTEL.techentity and
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))
				/
		(	select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits where entity = RTEL.techentity and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq) as myquery)
		) [YTD Pct Collected]
	From RegionTechEntityLookup RTEL
--	where techentity not in ('Neurodiagnostics & Neuromonitoring Institute, Inc.' , 'In-Site Surgical Monitoring Services')
	group by techentity