alter View vwPACases as 
SELECT        CR.PID, 
						 CAST(CR.DOS AS smalldatetime) AS DOS, 
						 CR.Patient, 
                         CR.Region_Short_Name, 
						 rl.AssignedRegion,
						 CR.Hospital, 
						 CR.Surgeon, 
						 CR.Closed, 
						 sl.entity as DefaultEntity,
                         CR.Tech, 
						 CR.Tech2, 
                         CR.Tech_Sign_Off_Date,
						 DATEDIFF(day, CR.DOS, CR.Reader_Sign_Off_Date) AS Reader_Days_to_SignOff, 
						 CR.TechTime, 
                         CR.ORTime, 
						 CR.ProTime, 
						 CR.[Procedure Type], 
						 CR.OR_Procedure, 
                         CR.[Primary Insurance], CR.[1st Insurance Category], CR.[Secondary Insurance], 
                         CR.[2nd Insurance Category], 
						 CR.Biller, 
						 CR.[Second Biller], CR.[Invoice #], 
                         CR.Convert_hookup_time, 
						 CR.Convert_unhook_time,
						 IL.insurancegroup  as [ConsolidatedPayor],
				Case
					WHEN CR.PID = 682891 THEN 'NPPA Services' -- Ticket 2319 lauren
					when CR.DOS <'2017-10-01' and CR.surgeon = 'Edward Seade, M.D.' and cr.[1st Insurance Category] = 'Letter of Protection'  then 'NPPA Services' --ticket 2386 lauren
					WHEN sl.ContractType = 'Hybrid' and cr.[1st Insurance Category] = 'Blue Cross Blue Shield'  and RL.Status = 'SurgeonPA' then rtrim(SL.Entity)  --#30 kta
				--ticket 2246 lauren: If the surgeon = Adam Bruggeman, M.D. and the Insurance Type = Letter of Protection,
				--and the Tech does not equal "Kim Stewart, PA-C" then the correct entity is NPPA Services
				    when cr.surgeon = 'Adam Bruggeman, M.D.' and cr.[1st Insurance Category] = 'Letter of Protection' and cr.tech <> 'Kim Stewart, PA-C' then 'NPPA Services'
					when cr.surgeon = 'Sean Jones-Quaidoo, M.D.' and cr.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity)
					when cr.tech = 'Jose Fuentez, PA-C'and cr.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity) --ticket 2375 lauren
				--	when ins_charged < 100 and box33 = 'Acquisition Billing Services' then 'Acquisition Billing Services'
				--ticket 2271 lauren: For all encounters in this year, when the surgeon is Adam Bruggeman, M.D. 
				--and the Tech is Kim Stewart, and the 1st ins type = BCBS then the case defers to SL  else NPPA (current default)
					--when cr.dos > '2016-12-31' and cr.tech in ('Steve Greer, LSA','Jerold Greer') then 'Precision Assist of Dallas'--ticket 2373 lauren -- remove ticket 18 kta
					when cr.dos > '2016-12-31' and (cr.tech like '%CSFA%' or cr.tech like '%LSA%') then 'Precision Assist of Dallas'--ticket 18 kta
				-- #30 kta	when CR.DOS >= '2017-01-01' and CR.Surgeon = 'Adam Bruggeman, M.D.' and cr.tech in ('Kim Stewart, PA-C','Kimberly Stewart, MPAS, PA-C') and CR.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity) --ticket 2402 
					when cr.dos < '2017-01-01' and CR.Surgeon = 'Adam Bruggeman, M.D.' and CR.[1st Insurance Category] = 'Blue Cross Blue Shield' then SL.Entity --ticket 2491 lauren
					when CR.[1st Insurance Category] in ('Lein Case','Letter of Protection','Private Insurance') then rtrim(SL.Entity)--ticket 2354 un-do 2320
					--when CR.[1st Insurance Category] in ('Lein Case','Private Insurance') then rtrim(SL.Entity)
					--when CR.[1st Insurance Category] = 'Letter of Protection' and CR.DOS < '2017-07-07' then rtrim(SL.Entity) 
					--when CR.DOS >='2017-07-07' and CR.[1st Insurance Category] = 'Letter of Protection' then 'NPPA Services' --ticket 2320 lauren
					when CR.DOS <'2015-07-23' and CR.Region_Short_Name = 'PA - South Texas' then 'Precision Assist of San Antonio'
					when CR.DOS <'2015-07-23' and CR.Region_Short_Name = 'PA - Austin' then 'Precision Assist of San Antonio'
					when CR.DOS <'2015-07-23' and CR.Region_Short_Name = 'PA - DFW' then 'Precision Assist of Dallas'
					when CR.DOS >='2015-07-23' then 'NPPA Services'
					else rtrim(SL.Entity)
					end
					as CorrectEntity
FROM            dbo.case_report_3350 as CR
					LEFT OUTER JOIN
						dbo.pasurgeonlookup sl on CR.surgeon = sl.surgeon and CR.dos >= sl.startdate  and CR.dos <= sl.enddate
					LEFT OUTER JOIN 
						insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
					LEFT OUTER JOIN
						PARegionLookup rl ON rl.PA = CR.Tech 

WHERE        (CR.Deleted <> 'Yes') AND (CR.Cancelled <> 'Yes')
