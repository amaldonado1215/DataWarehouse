alter view vwPACollectionSummary as	
	select 
		box33,
		[Consolidated Payor],
		[Primary Insurance],
		monthcollected,
		yearcollected,
		sum(payment_collected) as Reimbursements,
		sum(claim_seq) as ClaimsCollected,
				sum ([2017 PYMT]) as [2017 PYMT]
	from (
		select box33,
				case 
					when reimbursementPct < .1 then 'Other'
					else [Consolidated Payor]
					end
					as [Consolidated Payor],
				[primary insurance], yearcollected, monthcollected, payment_collected, claim_seq,
				[2017 PYMT]

		 from (

	 		select box33,[consolidated payor], 
				[primary insurance], 
				monthcollected, 
				yearcollected,
				count(claim_seq)as claim_seq, 
				sum(payment_collected) as payment_collected, 
				sum(ins_charged) as ins_charged, 
				case
					when sum(ins_charged) >0 then sum(payment_collected)/sum(ins_charged)
					else 0
					end as ReimbursementPct,
				sum ([2017 PYMT]) as [2017 PYMT]
			from (
				select box33,[Consolidated Payor],
					[Primary Insurance], 
					datepart(m,date_collected) as monthcollected ,
					datepart(yyyy,date_collected) as yearcollected,
					claim_seq, 
					sum(payment_collected) as payment_collected, max(ins_charged) as ins_charged,
					case
						when datepart(yyyy,date_collected) = 2017 then sum(payment_collected)
						else 0
						end as [2017 PYMT]
				from vwPAInsuranceDeposits2 
					where date_collected >= '2016-01-01' and payment_collected <>0
					--	and box33 = 'Neuriom, PLLC'  
					group by box33,[consolidated payor], [Primary Insurance],claim_seq, datepart(yyyy,date_collected), datepart(m,date_collected)
				) as sq group by box33,[consolidated payor], [primary insurance], yearcollected, monthcollected,[2017 PYMT]
		) as sb where payment_collected <> 0 
	) as sbb
	group by box33,[Consolidated Payor],[Primary Insurance], yearcollected, monthcollected, [2017 PYMT]
	--order by monthcollected asc, Reimbursements desc
	--ticket 2197 add yearcollected lauren
