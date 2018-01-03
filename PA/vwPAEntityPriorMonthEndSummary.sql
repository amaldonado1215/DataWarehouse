alter view vwPAEntityPriorMonthEndSummary as 

select distinct entity,   
		substring(
			(
				Select ', '+rtrim(SL2.Surgeon)  AS [text()]
				From PASurgeonlookup as SL2
				Where SL.entity = SL2.entity
				ORDER BY SL.entity
				For XML PATH ('')
			), 2, 1000) [Surgeons],
		min(startdate) as [Formation Date],
		( 
			/*  Count Claims based on Claim Date */
			select count(*) from vwPAMaster where box33 = SL.entity  and 
			DATEPART(m, OriginalClaimDate) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, OriginalClaimDate) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing','Pending Clearinghouse')
		) [MTD Claims Billed],
		( 
			/* Count total Amount Claimed based on OriginalClaimDate --ticket 2401 lauren */
			select sum(ins_charged) from vwPAMaster where box33 = SL.entity and 
			DATEPART(m, [OriginalClaimDate]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [OriginalClaimDate]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing','Pending Clearinghouse')
		) [MTD Amount Billed],
		(
		/* Amount Collected that month */
			select sum(payment_collected) from vwPAInsuranceDeposits2 where box33 = SL.entity and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [MTD Amount Collected],
		(
		select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwPAInsuranceDeposits2 where box33 = SL.entity and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery
		) [MTD Collected Billed Amt],
		(
		(select sum(payment_collected) from vwPAInsuranceDeposits2 where  box33 = SL.entity and
				DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))

		/ (select sum(mysum) from (
			select max([claim Total Charge]) as mysum  from vwPAInsuranceDeposits2 where box33 = SL.entity and 
			DATEPART(m, date_collected) = DATEPART(m, DATEADD(m, -1, getdate()))
			AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			AND Payment_Collected <> 0
			group by claim_seq ) as myquery)
		) [MTD Pct Collected],
		
		-- YTD collections
		(select sum(payment_collected) from vwPAInsuranceDeposits2 where box33 = SL.entity and
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				and DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
		) [YTD Amount Collected],
		(
		select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwPAInsuranceDeposits2 where box33 = SL.entity and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery
		) [YTD Collected Billed Amt],
		(
		 (select sum(payment_collected) from vwPAInsuranceDeposits2 where box33 = SL.entity and
				DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate())))
				/
		(	select sum(mysum) from (
					select max([claim Total Charge]) as mysum  from vwPAInsuranceDeposits2 where box33 = SL.entity and 
					DATEPART(m, date_collected) <= DATEPART(m, DATEADD(m, -1, getdate()))
					AND DATEPART(yyyy, date_collected) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
					AND Payment_Collected <> 0
					group by claim_seq ) as myquery)
		) [YTD Pct Collected]
	From PASurgeonLookup SL
	--where entity not in ('NPPA Services','Precision Assist of Dallas','Precision Assist of San Antonio')
	group by entity