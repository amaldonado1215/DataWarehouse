/*
select  box33 as Box33Entity, concat(datepart(yyyy,[claim Date]), '-', RIGHT('0' + RTRIM(MONTH([claim date])), 2)) as MonthClaimed, 
		count(*) as ClaimsSubmitted 
from vwmaster2 
Where billstatus in ('Billed','Appealed')
	group by 
		box33, concat(datepart(yyyy,[claim Date]), '-', RIGHT('0' + RTRIM(MONTH([claim date])), 2)) 
	order by
		box33, concat(datepart(yyyy,[claim Date]), '-', RIGHT('0' + RTRIM(MONTH([claim date])), 2)) 
		*/

--	select * from vwCases
create view vwBillingClaimsByEntity as 

select distinct proentity,  region, 
		substring(
			(
				Select ', '+rtrim(SL2.Surgeon)  AS [text()]
				From Surgeonlookup2 as SL2
				Where SL.proentity = SL2.Proentity
				ORDER BY SL.ProEntity
				For XML PATH ('')
			), 2, 1000) [Surgeons],
		min(startdate) as [Formation Date],

	/* Count WEEKLY Cases based on DOS */
		( 
			select count(*) from vwMaster2 where
				DATEPART(wk, [Claim Date]) + 1 = DATEPART(wk, getdate())
						AND DATEPART(m, [Claim Date]) = DATEPART(m, getdate())
						AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, getdate())
--				AND Closed = 'Yes'
				AND [Insurance Type] <> 'Blue Cross Blue Shield'
				AND box33 = SL.ProEntity
		) [Prior Week Claims Billed],

	/* Sume WEEKLY Cases Billed based on DOS */
		( 
			select sum(ins_charged) from vwMaster2 where
				DATEPART(wk, [Claim Date]) + 1 = DATEPART(wk, getdate())
						AND DATEPART(m, [Claim Date]) = DATEPART(m, getdate())
						AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, getdate())
--				AND Closed = 'Yes'
				AND [Insurance Type] <> 'Blue Cross Blue Shield'
				AND box33 = SL.ProEntity
		) [Prior Week Billed Amt],

	/* Count MONTHLY Cases based on DOS */
		( 
			select count(*) from vwMaster2 where 
				DATEPART(m, [Claim Date]) = DATEPART(m, getdate())
						AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, getdate())
--				AND Closed = 'Yes'
				AND [Insurance Type] <> 'Blue Cross Blue Shield'
				AND box33 = SL.ProEntity
		) [MTD Claims Billed],

	/* Sum MONTHLY Cases based on DOS */
		( 
			select Sum(ins_charged) from vwMaster2 where 
				DATEPART(m, [Claim Date]) = DATEPART(m, getdate())
						AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, getdate())
--				AND Closed = 'Yes'
				AND [Insurance Type] <> 'Blue Cross Blue Shield'
				AND box33 = SL.ProEntity
		) [MTD Billed Amt],

     /* Count MONTHLY Cases based on DOS */
		( 
			select count(*) from vwMaster2 where 
				DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, getdate())
--				AND Closed = 'Yes'
				AND [Insurance Type] <> 'Blue Cross Blue Shield'
				AND box33 = SL.ProEntity
		) [YTD Claims Billed],

     /* Sum MONTHLY Cases based on DOS */
		( 
			select sum(ins_charged) from vwMaster2 where 
				DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, getdate())
--				AND Closed = 'Yes'
				AND [Insurance Type] <> 'Blue Cross Blue Shield'
				AND box33 = SL.ProEntity
		) [YTD Billed Amt]
		
	From SurgeonLookup2 SL
--	where proentity not in ('Neurodiagnostics & Neuromonitoring Institute, Inc.' , 'In-Site Surgical Monitoring Services')
	group by proentity, region
