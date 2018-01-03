
alter view vwCollectionsReportTechSurgeonEntity as 

select distinct proentity,   
		substring(
			(
				Select ', '+rtrim(SL2.Surgeon)  AS [text()]
				From Surgeonlookup as SL2
				Where SL.proentity = SL2.Proentity
				ORDER BY SL.ProEntity
				For XML PATH ('')
			), 2, 1000) [Surgeons],
		min(startdate) as [Formation Date],
		( 
			/*  Count Claims based on Claim Date */
			select count(*) from vwMaster2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')
		) [MTD Tech Claims Billed],
		( 
			/* Count total Amount Claimed based on ClaimDate */
			select sum(ins_charged) from vwMaster2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')
		) [MTD Tech Amount Billed],
		(
		/* Amount Collected that month */
			select sum(payment_collected) from vwInsuranceDeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and 
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [MTD Tech Amount Collected],
		(
		select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwInsurancedeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and  
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery
		) [MTD Tech Collected Billed Amt],
		(
		(select sum(payment_collected) from vwInsurancedeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and 
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))

		/ (select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwInsurancedeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and  
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery)
		) [MTD Tech Pct Collected],
		
		-- YTD collections
		(select sum(payment_collected) from vwInsuranceDeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and 
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				and DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [YTD Tech Amount Collected],
		(
		select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and  
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery
		) [YTD Tech Collected Billed Amt],
		(
		 (select sum(payment_collected) from vwInsuranceDeposits2  where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and 
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))
				/
		(	select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwInsurancedeposits2 where surgeon in (select surgeon from surgeonlookup2 where proentity = SL.proentity) 
			and clm_billing_type = 'Tech Only' 
			and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery)
		) [YTD Tech Pct Collected]
	From SurgeonLookup2 SL
--	where proentity not in ('Neurodiagnostics & Neuromonitoring Institute, Inc.' , 'In-Site Surgical Monitoring Services')
	group by proentity