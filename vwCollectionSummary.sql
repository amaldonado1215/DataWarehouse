alter view vwCollectionSummary as	
	select 
		box33,
		[Consolidated Payor],
		[Primary Insurance],
		monthcollected,
		yearcollected, 
		folder,
		sum(payment_collected) as Reimbursements,
		sum(claim_seq) as ClaimsCollected
	from (
		select  box33,
				case 
					when reimbursementPct < .1 then 'Other'
					else [Consolidated Payor]
					end
					as [Consolidated Payor],
				[primary insurance], monthcollected, yearcollected, payment_collected, claim_seq, folder

		 from (

	 		select  box33,[consolidated payor], [primary insurance], monthcollected, yearcollected, count(claim_seq)as claim_seq, 
					sum(payment_collected) as payment_collected, sum(ins_charged) as ins_charged, folder,  
				case
					when sum(ins_charged) >0 then sum(payment_collected)/sum(ins_charged)
					else 0
					end as ReimbursementPct
			from (
				select  box33,[Consolidated Payor],[Primary Insurance], datepart(m,date_collected) as monthcollected, datepart(yyyy,date_collected) as yearcollected, claim_seq, 
						sum(payment_collected) as payment_collected, max(ins_charged) as ins_charged, folder
					from vwInsuranecDeposits2 
					where date_collected >= '2016-01-01' and payment_collected <>0
					--	and box33 = 'Neuriom, PLLC'  
					group by box33,[consolidated payor], [Primary Insurance], folder, claim_seq, datepart(m,date_collected), datepart(yyyy,date_collected)
				) as sq group by box33,[consolidated payor], [primary insurance], monthcollected, yearcollected, folder


		) as sb where payment_collected <> 0
	) as sbb
	group by box33,[Consolidated Payor],[Primary Insurance],  monthcollected, yearcollected, folder
	--order by monthcollected asc, Reimbursements desc