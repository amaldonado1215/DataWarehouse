alter View vwCases3 as 
SELECT        dbo.case_report_3300.PID, 
						 CAST(dbo.case_report_3300.DOS AS smalldatetime) AS DOS, 
						 dbo.case_report_3300.Patient, 
                         dbo.case_report_3300.Region_Short_Name, 
						 dbo.case_report_3300.Hospital, 
						 dbo.case_report_3300.hospital_id,
						 dbo.case_report_3300.Surgeon, 
						 Case	
								When SL1.specialty is not null THEN sl1.Specialty
								When SL2.specialty is not null THEN sl2.Specialty
								Else 'Unknown'
								End As Specialty,
						 dbo.case_report_3300.Closed, 
						 Case	
								When SL1.Proentity is not null then sl1.Proentity
								When sl2.Proentity is not null then sl2.Proentity
								Else 'Unknown'
								End as DefaultEntity, 
/* REMOVED PER Ticket #925						 CASE
							WHEN case_report_3300.surgeon = 'Sean Jones-Quaidoo, M.D.' and IL.InsuranceGroup = 'Blue Cross Blue Shield' and case_report_3300.DOS >='2016-07-07' then 'Cerebral Axis, PLLC'
							ELSE sl.proentity 
							END as DefaultEntity,*/
						 Case 
								WHEN case_report_3300.PID in ('461920', '475127', '504144', '521290') THEN 'RRV Neuromonitoring PLLC'  -- Ticket #702/819
								WHEN case_report_3300.PID IN ('347332', '354211', '354292', '347908', '298807') THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.' 
								WHEN case_report_3300.PID IN ('521290') AND SL1.Proentity is not null THEN SL1.Proentity
								WHEN case_report_3300.PID in ('521290') AND SL2.Proentity is not null THEN sl2.Proentity
								WHEN case_report_3300.surgeon = 'Kevin James, M.D.' and IL.InsuranceGroup = 'Aetna' and case_report_3300.[1st Insurance Category]  = 'Private Insurance' 
												and case_report_3300.surgeon = 'Kevin James, M.D.' and case_report_3300.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC' 
						--		WHEN case_report_3300.surgeon = 'Melanie Kinchen, M.D.' and IL.InsuranceGroup = 'Aetna' and case_report_3300.DOS >= '2016-06-28' then  'Wilcox Neuromonitoring, PLLC'
								WHEN case_report_3300.[1st Insurance Category] = 'Blue Cross Blue Shield' AND case_report_3300.SURGEON = 'Mark Silver, M.D.' THEN SL1.Proentity 
								
								WHEN case_report_3300.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
										AND SL1.Proentity is not null then Sl1.Proentity
								WHEN case_report_3300.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
										AND SL2.Proentity is not null then Sl2.Proentity
								
								WHEN [1st Insurance Category] IN ('Workmans Comp') AND Region_short_name IN ('Louisiana') THEN SL1.Proentity 
								WHEN case_report_3300.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services' 
								WHEN case_report_3300.DOS > '2014-08-31' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
								ELSE SL1.Proentity 
								END AS CorrectProEntity, 
                         dbo.case_report_3300.Tech, 
						 dbo.TechRegionLookup.[ASSIGNED REGION] AS TechRegion,
						 dbo.case_report_3300.Tech2, 
                         dbo.case_report_3300.Tech_Sign_Off_Date,
                             (SELECT        TOP (1) [Signoff Date]
                               FROM            dbo.Tech_sign_off_3300 AS TSO
                               WHERE        (patient_id = dbo.case_report_3300.PID)
                               ORDER BY [Signoff Date]) AS Tech_Sign_Off_Date_First, 
						 DATEDIFF(day, dbo.case_report_3300.DOS, dbo.case_report_3300.Tech_Sign_Off_Date) AS Tech_Days_to_Sign_Off, 
						 DATEDIFF(day, dbo.case_report_3300.DOS,
                             (SELECT        TOP (1) [Signoff Date]
                               FROM            dbo.Tech_sign_off_3300 AS TSO
                               WHERE        (patient_id = dbo.case_report_3300.PID)
                               ORDER BY [Signoff Date])) AS Tech_Days_to_Sign_Off_2, dbo.case_report_3300.Reader, dbo.case_report_3300.Reader_Sign_Off_Date, 
							   
						 DATEDIFF(day, dbo.case_report_3300.DOS, dbo.case_report_3300.Reader_Sign_Off_Date) AS Reader_Days_to_SignOff, 
						 cast ((SELECT TOP (1) date_changed from dbo.history_3300 
								WHERE  field_changed = 'Auditer Sign Off' and (dbo.case_report_3300.PID = dbo.history_3300.patient_id)
								ORDER BY date_changed ) as smalldatetime) AS Aud_Sign_Off_Date,
						 DATEDIFF(day, (SELECT        TOP (1) [Signoff Date]
                               FROM            dbo.Tech_sign_off_3300 AS TSO
                               WHERE        (patient_id = dbo.case_report_3300.PID)
                               ORDER BY [Signoff Date]), 
								(SELECT TOP (1) date_changed from dbo.history_3300 
								WHERE  field_changed = 'Auditor Sign Off' and (dbo.case_report_3300.PID = dbo.history_3300.patient_id)
								ORDER BY date_changed )) AS Aud_Days_to_Sign_Off,
						 (SELECT TOP (1) cuser_name from dbo.history_3300 
								WHERE  field_changed = 'Auditor Sign Off' and (dbo.case_report_3300.PID = dbo.history_3300.patient_id)
								ORDER BY date_changed ) as Auditor, 
						 dbo.case_report_3300.TechTime, 
                         dbo.case_report_3300.ORTime, 
						 dbo.case_report_3300.ProTime, 
						 dbo.case_report_3300.[Procedure Type], 
						 dbo.case_report_3300.OR_Procedure, 
                         dbo.case_report_3300.[Primary Insurance], dbo.case_report_3300.[1st Insurance Category], dbo.case_report_3300.[Secondary Insurance], 
                         dbo.case_report_3300.[2nd Insurance Category], dbo.case_report_3300.Biller, dbo.case_report_3300.[Second Biller], dbo.case_report_3300.[Invoice #], 
                         dbo.case_report_3300.Convert_hookup_time, dbo.case_report_3300.Convert_unhook_time,
						 dbo.case_report_3300.pro_time_start,
						 dbo.case_report_3300.pro_time_end,
						 case
							when dbo.case_report_3300.[1st Insurance Category] = 'Medicare Replacement Plan' then
								(Select count(*) from dbo.case_report_3300 as cr 
								where dbo.case_report_3300.Reader = case_report_3300.reader
									AND [1st Insurance Category] = 'Medicare Replacement Plan'
									AND case_report_3300.dos = dbo.case_report_3300.dos
									AND dbo.case_report_3300.pro_time_start < case_report_3300.pro_time_end 
									AND case_report_3300.pro_time_start < dbo.case_report_3300.pro_time_end 
									AND dbo.Case_report_3300.pid <> case_report_3300.pid
								) 
							else 0 end as MRPOverlap,
						 case
							when	
								dbo.case_report_3300.Pending_Correction = 'TRUE' then 'Yes'
							else '' end as Pending_Correction,
						IL.insurancegroup  as [consolidated payor],
						CASE 
							WHEN Region_short_name = 'Louisiana' and [1st Insurance Category] = 'Workmans Comp' Then 'Eligible'
							WHEN case_report_3300.Surgeon = 'Mark Silver, M.D.' and sl1.proentity = 'Texoma IOM, PLLC' and [1st Insurance Category] = 'Blue Cross Blue Shield' Then 'Eligible'
							WHEN case_report_3300.Surgeon = 'Ram Vasudevan, M.D.' and pid in (461920,475127,504144,521290) Then 'Eligible'
							WHEN [1st Insurance Category] = 'Private Insurance' OR
									[1st Insurance Category] = 'Letter of Protection' OR
									[1st Insurance Category] = 'Lein Case' THEN 'Eligible' 
							ELSE 'Other' END AS DashboardInsuranceType,

			--			try_convert(smalldatetime, cast(dos as varchar) +' '+ convert_hookup_time) as Hookup_Time,
			--			try_convert(smalldatetime, cast(dos as varchar) +' '+ convert_unhook_time) as Unhook_Time,
			--			try_convert(time, convert_hookup_time),
			--			try_convert(time, convert_unhook_time),
						datepart(WEEKDAY,dos) as DayOfWeek,
						case	
							when datepart(WEEKDAY,dos) in (1,7) then 'Yes' 
							when try_convert(time, pro_time_start) < '06:00' then 'Yes'
							when try_convert(time, pro_time_start) >= '17:00' then 'Yes'
							when try_convert(time, pro_time_end) >= '18:00' then 'Yes'
							when datepart("D", pro_time_end) =2  then 'Yes'
							else '' end as OnCall_Time

							--After 5 PM and before 6 AM. = on call
							--If a case begins before 5 PM and extends into on call hours the time elapsed after 5 PM must exceed one hour.

FROM            dbo.case_report_3300 
					LEFT OUTER JOIN
                         dbo.TechRegionLookup ON dbo.TechRegionLookup.TECH = dbo.case_report_3300.Tech
					LEFT OUTER JOIN 
						insurancelookup as IL on IL.insurancecompany = case_report_3300.[Primary Insurance]
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl1 on dbo.case_report_3300.surgeon = sl1.surgeon 
								and dbo.case_report_3300.dos >= sl1.startdate  
								and dbo.case_report_3300.dos <= sl1.enddate
								and sl1.region = Region_Short_Name
								and sl1.payor = '* ANY *'
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl2 on dbo.case_report_3300.surgeon = sl2.surgeon 
								and dbo.case_report_3300.dos >= sl2.startdate  
								and dbo.case_report_3300.dos <= sl2.enddate
								and sl2.region = Region_Short_Name
								and sl2.payor = IL.InsuranceGroup

WHERE        (dbo.case_report_3300.Deleted <> 'Yes') AND (dbo.case_report_3300.Cancelled <> 'Yes')