ALTER VIEW vwCases AS

/********* kta #48 1/31/2018  ********/
/********* re-write  ********/

SELECT c.PID,
	CAST(c.DOS AS SMALLDATETIME) AS DOS,
	c.Patient,
	c.Region_Short_Name,
	c.Hospital,
	c.hospital_id,
	c.Surgeon,
	c.pro_hosp_start,
	c.pro_hosp_close as pro_hosp_end,
	COALESCE(SL1.specialty, 'Unknown') as Specialty, 
	c.Closed,
	CASE
		WHEN c.PID = '624536' THEN 'Alamo City Neurodiagnostics, PLLC'
		ELSE COALESCE(SL1.Proentity, 'Neurodiagnostics & Neuromonitoring Institute, Inc.')
	END AS DefaultEntity,
	CEE.CorrectProEntity,
	CEE.CorrectProEntity as ExceptionCorrectEntity,
	c.Tech,
	trl.[ASSIGNED REGION] AS TechRegion,
	trl.TechName AS ConsolidatedTechName,
	COALESCE(tcl.TechEntity,rtel.TechEntity) as TechEntity,
	c.Tech2,
	c.Tech_Sign_Off_Date,
	tso.[Signoff Date] AS Tech_Sign_Off_Date_First,
	DATEDIFF(DAY, c.DOS, c.Tech_Sign_Off_Date) AS Tech_Days_to_Sign_Off,
	DATEDIFF(DAY, c.DOS, tso.[Signoff Date]) AS Tech_Days_to_Sign_Off_2,
	c.Reader,
	c.Reader_Sign_Off_Date,
	DATEDIFF(DAY, c.DOS, c.Reader_Sign_Off_Date) AS Reader_Days_to_SignOff,
	h.date_changed AS Aud_Sign_Off_Date,
	DATEDIFF(DAY, tso.[Signoff Date], h.date_changed) as Aud_Days_to_Sign_Off,
	h.cuser_name as Auditor,
	c.scheduled_by,
	c.TechTime,
	c.ORTime,
	c.ProTime,
	c.[Procedure Type],
	c.OR_Procedure,
	c.[Primary Insurance],
	c.[1st Insurance Category],
	c.[Secondary Insurance],
	r.[Secondary Policy, Group ID/Secondary ID No] as [Secondary Insurance Group ID],
	c.[2nd Insurance Category],
	c.Biller,
	c.[Second Biller],
	c.[Invoice #],
	c.Convert_hookup_time,
	c.Convert_unhook_time,
	c.pro_time_start,
	c.pro_time_end,
	CASE
		WHEN c.[1st Insurance Category] = 'Medicare Replacement Plan'
		THEN (	SELECT count(*)
				FROM dbo.case_report_3300  cr
				WHERE c.Reader = cr.reader
						AND cr.[1st Insurance Category] = 'Medicare Replacement Plan'
						AND c.dos = cr.dos
						AND c.pro_time_start < cr.pro_time_end
						AND cr.pro_time_start < c.pro_time_end
						AND c.pid <> cr.pid)
		ELSE 0 
	END AS MRPOverlap,
	CASE WHEN hl.PayRate > 0 THEN 'Yes'  ELSE '' END as HolidayPay,
	CASE WHEN c.Pending_Correction = 'TRUE'	THEN 'Yes' ELSE '' END AS Pending_Correction,
	IL.insurancegroup AS [consolidated payor],
	CASE
		WHEN c.Surgeon IN ('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')
				AND [1st Insurance Category] = 'Blue Cross Blue Shield' THEN 'Eligible'
		WHEN Region_short_name = 'Louisiana' AND [1st Insurance Category] = 'Workmans Comp' THEN 'Eligible'
		WHEN c.Surgeon = 'Mark Silver, M.D.' AND sl1.proentity = 'Texoma IOM, PLLC' AND
				[1st Insurance Category] = 'Blue Cross Blue Shield' THEN 'Eligible'
		WHEN c.Surgeon = 'Ram Vasudevan, M.D.' AND c.pid IN (461920, 475127, 504144, 521290) THEN 'Eligible'
	--	WHEN [1st Insurance Category] in ( 'Private Insurance','Letter of Protection','Lein Case') THEN 'Eligible'
		WHEN [1st Insurance Category] in ( 'Private Insurance','Letter of Protection','Lein Case', 'Cigna', 'Aetna') THEN 'Eligible'  -- ticket #63 kta
		WHEN SL1.ProEntity = 'Neuroguide IOM, PLLC' AND [1st insurance Category] = 'Blue Cross Blue Shield' THEN 'Private'
		ELSE 'Other' 
	END AS DashboardInsuranceType,
	datepart(WEEKDAY, dos) AS DayOfWeek,
	CASE
		WHEN datepart(WEEKDAY, dos) IN (1, 7) THEN 'Yes'
		WHEN try_convert(TIME, pro_time_start) < '06:00' THEN 'Yes'
		WHEN try_convert(TIME, pro_time_start) >= '17:00' THEN 'Yes'
		WHEN try_convert(TIME, pro_time_end) >= '18:00' THEN 'Yes'
		WHEN datepart("D", pro_time_end) = 2 THEN 'Yes'
		ELSE '' 
	END AS OnCall_Time,
	CASE 
		WHEN datepart(WEEKDAY, dos) IN (1, 7) THEN 'Yes'
		WHEN c.pro_hosp_start <= '1900-01-01 05:00:00' THEN 'Yes'
		WHEN c.pro_hosp_start > '1900-01-01 17:00:00' THEN 'Yes'
		WHEN c.pro_hosp_close > '1900-01-01 18:00:00' THEN 'Yes' 
		ELSE '' 
	END as OnCall_Tech,
	InsuranceRoundedUnits
FROM dbo.case_report_3300 c
	LEFT OUTER JOIN dbo.TechRegionLookup trl ON trl.TECH = c.Tech and c.DOS between trl.StartDate and trl.EndDate
	LEFT OUTER JOIN dbo.insurancelookup AS IL ON IL.insurancecompany = c.[Primary Insurance]
	LEFT OUTER JOIN dbo.surgeonlookup2 sl1 ON c.surgeon = sl1.surgeon
						AND c.dos between sl1.startdate and sl1.enddate
                        AND (sl1.region = c.Region_Short_Name)                                            
                        AND (sl1.payor = '* ANY *' or sl1.payor = IL.InsuranceGroup )
	LEFT OUTER JOIN dbo.vwCorrectEntityExceptionsByPID as CEE on c.PID = CEE.pid
	LEFT OUTER JOIN dbo.RegionTechEntityLookup rtel on rtel.RegionName = c.Region_Short_Name
						AND c.DOS between rtel.StartDate and rtel.EndDate
	LEFT OUTER JOIN (		SELECT patient_id, min([Signoff Date]) as [Signoff Date]
							FROM dbo.Tech_sign_off_3300
							GROUP BY patient_id ) tso on tso.patient_id = c.pid
	LEFT OUTER JOIN (	SELECT h2.patient_id, h2.date_changed, min(h2.cuser_name) as cuser_name
						FROM dbo.history_3300 h2
							INNER JOIN (	SELECT h1.patient_id, min(h1.date_changed) as date_changed
											FROM dbo.history_3300 h1
											WHERE h1.field_changed = 'Auditor Sign Off'
											GROUP BY patient_id	) x	 on x.patient_id = h2.patient_id and h2.date_changed = x.date_changed
							WHERE h2.field_changed = 'Auditor Sign Off'
							GROUP BY h2.patient_id, h2.date_changed) h on h.patient_id = c.PID
	LEFT OUTER JOIN dbo.holidaylookup hl on hl.HolidayDate = c.dos
	LEFT OUTER JOIN dbo.TechCompanyLookup tcl on tcl.Surgeon = c.Surgeon 
						AND c.dos between tcl.StartDate and tcl.EndDate and tcl.region = c.Region_Short_Name
	--LEFT OUTER JOIN dbo.DefaultEntityLookup del on del.Region = c.Region_Short_Name
	LEFT OUTER JOIN dbo.hl7_raw_data_3300 r on r.patient_id = c.PID
WHERE c.Deleted <> 'Yes' 
	AND c.Cancelled <> 'Yes' 
	AND c.Patient is NOT NULL 
	AND c.Patient not like '1, %' 
	AND c.Patient not like '2, %'
	AND c.Patient not LIKE 'test, %'
GO

/*SELECT
	dbo.case_report_3300.PID,
	CAST(dbo.case_report_3300.DOS AS SMALLDATETIME) AS DOS,
	dbo.case_report_3300.Patient,
	dbo.case_report_3300.Region_Short_Name,
	dbo.case_report_3300.Hospital,
	dbo.case_report_3300.hospital_id,
	dbo.case_report_3300.Surgeon,
	dbo.case_report_3300.pro_hosp_start,
	dbo.case_report_3300.pro_hosp_close as pro_hosp_end,
	CASE
		  WHEN SL1.specialty IS NOT NULL THEN sl1.Specialty
		  WHEN SL2.specialty IS NOT NULL THEN sl2.Specialty
		  ELSE 'Unknown'
	END AS Specialty,
	dbo.case_report_3300.Closed,
	CASE
		WHEN case_report_3300.PID = '624536'
		THEN 'Alamo City Neurodiagnostics, PLLC'
		WHEN SL1.Proentity IS NOT NULL
		THEN sl1.Proentity
		WHEN sl2.Proentity IS NOT NULL
		THEN sl2.Proentity
		ELSE 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
	END AS DefaultEntity,*/
	/* REMOVED PER Ticket #925						 CASE
				WHEN case_report_3300.surgeon = 'Sean Jones-Quaidoo, M.D.' and IL.InsuranceGroup = 'Blue Cross Blue Shield' and case_report_3300.DOS >='2016-07-07' then 'Cerebral Axis, PLLC'
				ELSE sl.proentity
				END as DefaultEntity,*/
	/*CASE
		WHEN case_report_3300.PID IN ('461920', '475127', '504144', '521290') THEN 'RRV Neuromonitoring PLLC' -- Ticket #702/819
		WHEN case_report_3300.PID IN ('347332', '354211', '354292', '347908', '298807', '711162','701379') THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN case_report_3300.PID IN ('521290') AND SL1.Proentity IS NOT NULL THEN SL1.Proentity
		WHEN case_report_3300.PID IN ('521290') AND SL2.Proentity IS NOT NULL THEN sl2.Proentity
		WHEN case_report_3300.PID in (611878,611862,610905,607476,606867,606861,605579,605560,579985,606800,607477,682760) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN case_report_3300.PID in (549577, 607480, 525878, 433968, 518238, 620998) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN case_report_3300.PID in (529219,548266,530012) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN case_report_3300.PID = '624536' THEN 'Alamo City Neurodiagnostics, PLLC'
		WHEN CEE.PID is not null then CEE.CorrectEntity
		WHEN case_report_3300.surgeon = 'Kevin James, M.D.' AND IL.InsuranceGroup = 'Aetna' 
			AND case_report_3300.[1st Insurance Category] = 'Private Insurance'
			AND case_report_3300.surgeon = 'Kevin James, M.D.' AND case_report_3300.dos > '2016-04-22' 
		THEN 'Andaz Monitoring, PLLC'
		--		WHEN case_report_3300.surgeon = 'Melanie Kinchen, M.D.' and IL.InsuranceGroup = 'Aetna' and case_report_3300.DOS >= '2016-06-28' then  'Wilcox Neuromonitoring, PLLC'
		
		--ticket 2284 lauren: Palmetto Axon Neuromonitoring, LLC will begin billing for BCBS (1st Insurance Type)  for all encounters >=DOS 9/1/2017
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.Surgeon IN ('Mike Tyler, M.D.', 'Jason Highsmith, M.D.', 'Sabino D''Agostino, D.O. ', 'William Wilson, M.D.','Don Stovall, M.D.') AND case_report_3300.DOS >= '2017-09-01' THEN SL1.Proentity 
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Mark Silver, M.D.' THEN SL1.Proentity
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Robert Urrea, M.D.' AND case_report_3300.DOS >= '2016-09-21' THEN SL1.Proentity
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Michael Rimlawi, D.O.' THEN SL1.ProEntity
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Curtis MIna, M.D.' THEN SL1.ProEntity -- Ticket #1262
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Ram Vasudevan, M.D.' AND case_report_3300.DOS >= '2016-11-30' THEN SL1.ProEntity -- Ticket #1314
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Samir Parikh, M.D.' AND case_report_3300.DOS >= '2016-10-03' AND SL1.proentity IS NOT NULL THEN SL1.ProEntity -- Ticket #1401
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Kendall Carll, M.D.' and case_report_3300.DOS >= '2017-07-01' THEN SL1.Proentity -- Ticket #2209
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Lewis Frazier, M.D.' and case_report_3300.DOS >= '2017-07-01' THEN SL1.Proentity -- Ticket #2209
		WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.Surgeon = 'Richard Westmark, M.D.' AND case_report_3300.DOS >= '2017-12-01' THEN SL1.Proentity  -- 2018-01-03 JTB Per #6 Github Issue

		--ticket 2469
		--WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.Surgeon IN ('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')	AND SL1.proentity IS NOT NULL AND case_report_3300.DOS < '2017-08-30' THEN SL1.ProEntity -- (Grand Canyon Neurology, PLLC)  Ticket #1652 and Ticket #2411
		--WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.Surgeon IN ('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')	AND SL1.proentity IS NOT NULL AND case_report_3300.DOS >= '2017-08-30' THEN 'AccuZone Diagnostics, LLC' -- Ticket #2411
		
		WHEN IL.InsuranceGroup = 'Blue Cross Blue Shield' AND  case_report_3300.hospital IN ('The Spine Hospital of Louisiana ', 'Cypress Pointe Surgical Hospital ') AND Reader IN('David Adams, M.D.') THEN 'Pro Read, LLC'
		WHEN case_report_3300.hospital = 'McBride Clinic Orthopedic Hospital' AND case_report_3300.[Primary Insurance] LIKE '%kempton%' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'		
		WHEN case_report_3300.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity -- Ticket #2186 Added Aetna as an Insurance category
		WHEN case_report_3300.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') AND SL2.Proentity IS NOT NULL THEN Sl2.Proentity -- Ticket #2186 Added Aetna as an Insurance category
		WHEN [1st Insurance Category] IN ('Workmans Comp') AND Region_short_name IN ('Louisiana') THEN SL1.Proentity
		WHEN case_report_3300.Region_Short_Name IN ('Louisiana','Mississippi - South') AND case_report_3300.dos >'2017-04-01' then 'Neuroplexus, LLC'
		
		WHEN Region_Short_Name in ('Maryland', 'California') AND SL1.Proentity is not null THEN SL1.ProEntity
		WHEN Region_short_name in ('Maryland', 'California') AND SL2.Proentity is not null then SL2.ProEntity

		WHEN Region_short_name in ('Arizona') AND DOS > '2017-06-01' Then 'AccuZone Diagnostics, LLC'
		--ticket 2272 lauren: please comment out the following lines 68,70,72
		--When Region_short_name in ('Arizona') Then 'AccuZone Diagnostics, LLC'
		WHEN Region_short_name in ('Ohio')  and DOS > '2017-06-01' Then 'One Care Monitoring, LLC'
		--When Region_short_name in ('Ohio') Then 'One Care Monitoring, LLC'
		WHEN Region_short_name in ('South Carolina') and DOS > '2017-05-01' Then 'Radiant Neuromonitoring, LLC' 
		--When Region_short_name in ('South Carolina') Then 'Radiant Neuromonitoring, LLC'
	--	WHEN Region_short_name in ('Texas - Houston') and DOS >= '2017-06-01' Then 'Integrate Practice Management, LLC'
	--	When Region_short_name in ('Texas - Houston') Then 'Integrate Practice Management, LLC'	

		WHEN case_report_3300.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services'
		WHEN case_report_3300.DOS > '2014-08-31' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		ELSE SL1.Proentity
	END AS CorrectProEntity,
	CEE.CorrectEntity as ExceptionCorrectEntity,
	dbo.case_report_3300.Tech,
	dbo.TechRegionLookup.[ASSIGNED REGION] AS TechRegion,
	dbo.TechRegionLookup.TechName  AS ConsolidatedTechName,
	CASE
		WHEN case_report_3300.Surgeon IS NULL 
			OR case_report_3300.Surgeon NOT IN (SELECT Surgeon FROM TechCompanyLookup TCL 
												WHERE case_report_3300.DOS BETWEEN TCL.StartDate AND TCL.EndDate) 				
			THEN (SELECT TOP (1) DefaultEntityLookup.TechEntityDefault FROM DefaultEntityLookup 
				  WHERE case_report_3300.Region_Short_Name = DefaultEntityLookup.Region)
		ELSE		 
			(SELECT TOP (1) TechEntity FROM TechCompanyLookup
			 WHERE case_report_3300.Surgeon = TechCompanyLookup.Surgeon 
				AND case_report_3300.DOS BETWEEN TechCompanyLookup.StartDate AND TechCompanyLookup.EndDate) 
	END AS TechEntity, --Ticket #2437
	dbo.case_report_3300.Tech2,
	dbo.case_report_3300.Tech_Sign_Off_Date,
	(SELECT TOP (1) [Signoff Date]
			FROM dbo.Tech_sign_off_3300 AS TSO
			WHERE (patient_id = dbo.case_report_3300.PID)
			ORDER BY [Signoff Date])  AS Tech_Sign_Off_Date_First,
	DATEDIFF(DAY, dbo.case_report_3300.DOS, dbo.case_report_3300.Tech_Sign_Off_Date)   AS Tech_Days_to_Sign_Off,
	DATEDIFF(DAY, dbo.case_report_3300.DOS,
			(SELECT TOP (1) [Signoff Date]
			FROM dbo.Tech_sign_off_3300 AS TSO
			WHERE (patient_id = dbo.case_report_3300.PID)
			ORDER BY [Signoff Date]))                                                AS Tech_Days_to_Sign_Off_2,
	dbo.case_report_3300.Reader,
	dbo.case_report_3300.Reader_Sign_Off_Date,

	DATEDIFF(DAY, dbo.case_report_3300.DOS, dbo.case_report_3300.Reader_Sign_Off_Date) AS Reader_Days_to_SignOff,
	cast((SELECT TOP (1) date_changed
		FROM dbo.history_3300
		WHERE field_changed = 'Auditor Sign Off' AND (dbo.case_report_3300.PID = dbo.history_3300.patient_id)
		ORDER BY date_changed) AS SMALLDATETIME)                                     AS Aud_Sign_Off_Date,
	DATEDIFF(DAY, (SELECT TOP (1) [Signoff Date]
					FROM dbo.Tech_sign_off_3300 AS TSO
					WHERE (patient_id = dbo.case_report_3300.PID)
					ORDER BY [Signoff Date]),
			(SELECT TOP (1) date_changed
			FROM dbo.history_3300
			WHERE field_changed = 'Auditor Sign Off' AND (dbo.case_report_3300.PID = dbo.history_3300.patient_id)
			ORDER BY date_changed))                                                  AS Aud_Days_to_Sign_Off,
	(SELECT TOP (1) cuser_name
	FROM dbo.history_3300
	WHERE field_changed = 'Auditor Sign Off' AND (dbo.case_report_3300.PID = dbo.history_3300.patient_id)
	ORDER BY date_changed)                                                            AS Auditor,
	dbo.case_report_3300.scheduled_by,
	dbo.case_report_3300.TechTime,
	dbo.case_report_3300.ORTime,
	dbo.case_report_3300.ProTime,
	dbo.case_report_3300.[Procedure Type],
	dbo.case_report_3300.OR_Procedure,
	dbo.case_report_3300.[Primary Insurance],
	dbo.case_report_3300.[1st Insurance Category],
	dbo.case_report_3300.[Secondary Insurance],
	r.[Secondary Policy, Group ID/Secondary ID No] as [Secondary Insurance Group ID], -- ticket #22 kta
	dbo.case_report_3300.[2nd Insurance Category],
	dbo.case_report_3300.Biller,
	dbo.case_report_3300.[Second Biller],
	dbo.case_report_3300.[Invoice #],
	dbo.case_report_3300.Convert_hookup_time,
	dbo.case_report_3300.Convert_unhook_time,
	dbo.case_report_3300.pro_time_start,
	dbo.case_report_3300.pro_time_end,
	CASE
	WHEN dbo.case_report_3300.[1st Insurance Category] = 'Medicare Replacement Plan'
	THEN
		(SELECT count(*)
		FROM dbo.case_report_3300 AS cr
		WHERE dbo.case_report_3300.Reader = case_report_3300.reader
				AND [1st Insurance Category] = 'Medicare Replacement Plan'
				AND case_report_3300.dos = dbo.case_report_3300.dos
				AND dbo.case_report_3300.pro_time_start < case_report_3300.pro_time_end
				AND case_report_3300.pro_time_start < dbo.case_report_3300.pro_time_end
				AND dbo.Case_report_3300.pid <> case_report_3300.pid
		)
	ELSE 0 END AS MRPOverlap,
	CASE
		WHEN (SELECT count(*)
			FROM holidaylookup
			WHERE holidaydate = dbo.case_report_3300.dos) > 0
		THEN 'Yes'
		ELSE '' 
	END AS HolidayPay,
	CASE
		WHEN
		dbo.case_report_3300.Pending_Correction = 'TRUE'
		THEN 'Yes'
		ELSE '' 
	END AS Pending_Correction,
	IL.insurancegroup AS [consolidated payor],
	CASE
	WHEN case_report_3300.Surgeon IN
		('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')
		AND [1st Insurance Category] = 'Blue Cross Blue Shield'
	THEN 'Eligible'
	WHEN Region_short_name = 'Louisiana' AND [1st Insurance Category] = 'Workmans Comp'
	THEN 'Eligible'
	WHEN case_report_3300.Surgeon = 'Mark Silver, M.D.' AND sl1.proentity = 'Texoma IOM, PLLC' AND
		[1st Insurance Category] = 'Blue Cross Blue Shield'
	THEN 'Eligible'
	WHEN case_report_3300.Surgeon = 'Ram Vasudevan, M.D.' AND case_report_3300.pid IN (461920, 475127, 504144, 521290)
	THEN 'Eligible'
	WHEN [1st Insurance Category] = 'Private Insurance' OR
		[1st Insurance Category] = 'Letter of Protection' OR
		[1st Insurance Category] = 'Lein Case'
	THEN 'Eligible'
	WHEN SL1.ProEntity = 'Neuroguide IOM, PLLC'
		AND [1st insurance Category] = 'Blue Cross Blue Shield'
	THEN 'Private'

	ELSE 'Other' END                                                                   AS DashboardInsuranceType,

	--			try_convert(smalldatetime, cast(dos as varchar) +' '+ convert_hookup_time) as Hookup_Time,
	--			try_convert(smalldatetime, cast(dos as varchar) +' '+ convert_unhook_time) as Unhook_Time,
	--			try_convert(time, convert_hookup_time),
	--			try_convert(time, convert_unhook_time),
	datepart(WEEKDAY, dos)                                                             AS DayOfWeek,
	CASE
		WHEN datepart(WEEKDAY, dos) IN (1, 7) THEN 'Yes'
		WHEN try_convert(TIME, pro_time_start) < '06:00' THEN 'Yes'
		WHEN try_convert(TIME, pro_time_start) >= '17:00' THEN 'Yes'
		WHEN try_convert(TIME, pro_time_end) >= '18:00' THEN 'Yes'
		WHEN datepart("D", pro_time_end) = 2 THEN 'Yes'
		ELSE '' 
	END AS OnCall_Time,
	CASE 
		WHEN datepart(WEEKDAY, dos) IN (1, 7) THEN 'Yes'
		--WHEN weekday is Saturday or Sunday
		
		--ticket 2199 
		WHEN dbo.case_report_3300.pro_hosp_start <= '1900-01-01 05:00:00' THEN 'Yes'
		WHEN dbo.case_report_3300.pro_hosp_start > '1900-01-01 17:00:00' THEN 'Yes'
		WHEN dbo.case_report_3300.pro_hosp_close > '1900-01-01 18:00:00' THEN 'Yes' 
	 
		--WHEN try_convert(TIME, Convert_hookup_time) = '17:00' THEN 'Yes'	
		ELSE '' 
	END as OnCall_Tech,

	--After 5 PM and before 6 AM. = on call
	--If a case begins before 5 PM and extends into on call hours the time elapsed after 5 PM must exceed one hour.
	InsuranceRoundedUnits
FROM dbo.case_report_3300

  --ticket 2269 lauren add: and dbo.TechRegionLookup.TechStatus = 'Active', and then undo, per Kim, 09/18
  --ticket 2327 lauren
  LEFT OUTER JOIN dbo.TechRegionLookup ON dbo.TechRegionLookup.TECH = dbo.case_report_3300.Tech and dbo.case_report_3300.DOS between dbo.TechRegionLookup.StartDate and dbo.TechRegionLookup.EndDate
 --LEFT OUTER JOIN dbo.TechRegionLookup ON dbo.TechRegionLookup.TECH = dbo.case_report_3300.Tech --and dbo.TechRegionLookup.TechStatus = 'Active'
  LEFT OUTER JOIN insurancelookup AS IL ON IL.insurancecompany = case_report_3300.[Primary Insurance]
  LEFT OUTER JOIN dbo.surgeonlookup2 sl1 ON dbo.case_report_3300.surgeon = sl1.surgeon
                            AND dbo.case_report_3300.dos >= sl1.startdate
                            AND dbo.case_report_3300.dos <= sl1.enddate
                            AND sl1.region = Region_Short_Name
                            AND sl1.payor = '* ANY *'
  LEFT OUTER JOIN dbo.surgeonlookup2 sl2 ON dbo.case_report_3300.surgeon = sl2.surgeon
                            AND dbo.case_report_3300.dos >= sl2.startdate
                            AND dbo.case_report_3300.dos <= sl2.enddate
                            AND sl2.region = Region_Short_Name
                            AND sl2.payor = IL.InsuranceGroup
	LEFT OUTER JOIN vwCorrectEntityExceptionsByPID as CEE on dbo.case_report_3300.PID = CEE.pid
	LEFT OUTER JOIN dbo.hl7_raw_data_3300 r on r.patient_id = dbo.case_report_3300.PID -- ticket #22 kta
WHERE (dbo.case_report_3300.Deleted <> 'Yes') AND (dbo.case_report_3300.Cancelled <> 'Yes')*/
