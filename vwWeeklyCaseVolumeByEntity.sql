		
	--	select * from vwCases
alter view vwWeeklyCaseVolumeByEntity as 

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
			/* Count WEEKLY Cases based on DOS */
			select count(*) from vwCases where
				DATEPART(wk, [DOS]) + 1 = DATEPART(wk, getdate())
						AND DATEPART(m, [DOS]) = DATEPART(m, getdate())
						AND DATEPART(yyyy, [DOS]) = DATEPART(yyyy, getdate())
				AND Closed = 'Yes'
				AND [1st Insurance Category] <> 'Blue Cross Blue Shield'
				AND DefaultEntity = SL.ProEntity
		) [Prior Week Claims Billed],
		( 
			/* Count MONTHLY Cases based on DOS */
			select count(*) from vwCases where 
				DATEPART(m, [DOS]) = DATEPART(m, getdate())
						AND DATEPART(yyyy, [DOS]) = DATEPART(yyyy, getdate())
				AND Closed = 'Yes'
				AND [1st Insurance Category] <> 'Blue Cross Blue Shield'
				AND DefaultEntity = SL.ProEntity
		) [MTD Claims Billed],
		( 
			/* Count MONTHLY Cases based on DOS */
			select count(*) from vwCases where 
				DATEPART(yyyy, [DOS]) = DATEPART(yyyy, getdate())
				AND Closed = 'Yes'
				AND [1st Insurance Category] <> 'Blue Cross Blue Shield'
				AND DefaultEntity = SL.ProEntity
		) [YTD Claims Billed]
		
	From SurgeonLookup2 SL
--	where proentity not in ('Neurodiagnostics & Neuromonitoring Institute, Inc.' , 'In-Site Surgical Monitoring Services')
	group by proentity
