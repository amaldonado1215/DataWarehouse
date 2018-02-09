alter view vwMaster2 as 
SELECT      CR.PID, 
			CAST(CR.DOS AS smalldatetime) AS DOS, 
			MONTH(CR.DOS) AS [DOS MO],
			YEAR(CR.DOS) AS [DOS YR],
			PIC.claim_id, 
			PIC.client_name, 
			CR.Patient, 
            CR.Surgeon, 
			CASE	
				WHEN SL1.Proentity is not null then SL1.SurgeonContract
				WHEN SL2.Proentity is not null then SL2.SurgeonContract
				ELSE ''
				END As SurgeonContract,
			CASE
				when EL2.S#C = 'No' or box33 = 'Neurodiagnostics & Neuromonitoring Institute, Inc.' or box33 = 'In-Site Surgical Monitoring Services' then ''
			--	when PIC.clm_billing_type = 'Pro Only' or EL.clm_billing_type = 'Pro Only' then 'Hit'

				WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') -- Ticket #2186 added Aetna
							AND SL1.Proentity is not null 
							AND (PIC.clm_billing_type = 'Pro Only' or EL.clm_billing_type = 'Pro Only' )
					THEN 
							substring((Select  distinct  ', '+rtrim(SL3.Surgeon)  AS [text()]
								From Surgeonlookup2 as SL3
								Where SL1.proentity = SL3.Proentity
							--	ORDER BY SL1.Surgeon
								For XML PATH ('')
							), 2, 1000) 
					
				WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') -- Ticket #2186 added Aetna
							AND SL2.Proentity is not null 
							AND (PIC.clm_billing_type = 'Pro Only' or EL.clm_billing_type = 'Pro Only' )
					THEN 
							substring((Select distinct ', '+rtrim(SL3.Surgeon)  AS [text()]
								From Surgeonlookup2 as SL3
								Where SL2.proentity = SL3.Proentity
							--	ORDER BY SL2.ProEntity
								For XML PATH ('')
							), 2, 1000) 

			/*	when PIC.clm_billing_type = 'Pro Only' or EL.clm_billing_type = 'Pro Only' then
					substring((Select  ', '+rtrim(SL2.Surgeon)  AS [text()]
									From Surgeonlookup2 as SL3
									Where SL2.proentity = SL3.Proentity
									ORDER BY SL2.ProEntity
									For XML PATH ('')
								), 2, 1000) */
				else ''
				END as [EntitySurgeons],
			CASE	
				WHEN CE.claim_seq = '654641' THEN 'RRV Neuromonitoring PLLC'  --Ticket #713
				WHEN CE.claim_seq = '779334' THEN 'Alamo City Neurodiagnostics, PLLC'  --Ticket #1566
				WHEN CR.surgeon = 'Kevin James, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.[1st Insurance Category]  = 'Private Insurance' and CR.surgeon = 'Kevin James, M.D.' 
						and cr.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC' 
				WHEN CR.surgeon = 'Melanie Kinchen, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.DOS >= '2016-06-28' then  'Wilcox Neuromonitoring, PLLC'
			--	WHEN CR.surgeon = 'Sean Jones-Quaidoo, M.D.' and IL.InsuranceGroup = 'Blue Cross Blue Shield' and CR.DOS >='2016-07-07' then 'Cerebral Axis, PLLC'
			--	WHEN Region_short_name in ('Texas - Houston') AND ins_folder not in ('Closed Billing Claims') and CE.claim_date >= '2017-06-01' Then 'Integrate Practice Management, LLC'
			--	When Region_short_name in ('Texas - Houston') AND ins_folder in ('New Insurance') Then 'Integrate Practice Management, LLC'

				WHEN SL1.ProEntity is not null then SL1.ProEntity
				WHEN SL2.ProEntity is not null then SL2.ProEntity
				ELSE 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
				END AS DefaultEntity, 
			CASE	
				WHEN CR.surgeon IN ('Vudhi Slabisak, M.D.', 'Saqib Siddiqui, M.D.') and CR.Region_Short_Name = 'Texas - DFW' THEN 'Synergy Neuromonitoring, LLC'
				ELSE RTEL.TechEntity 
				END AS DefaultTechEntity, 
			CR.Hospital,
			CR.hospital_id, 
			CR.[Primary Insurance], 
            CR.[1st Insurance Category] AS [Insurance Type], 
			HL7.GroupID, CR.Tech_Sign_Off_Date,
            (SELECT        TOP (1) [Signoff Date] 
					FROM dbo.Tech_sign_off_3300 AS TSO
                    WHERE        (patient_id = CR.PID)
                    ORDER BY [Signoff Date]) AS Tech_Sign_Off_Date_First,
			DATEDIFF(day, CR.DOS,
            (SELECT        TOP (1) [Signoff Date]
                    FROM            dbo.Tech_sign_off_3300 AS TSO
                    WHERE        (patient_id = CR.PID)
                    ORDER BY [Signoff Date])) AS Tech_Days_to_Sign_Off, 
			CR.Reader_Sign_Off_Date, 
			DATEDIFF(day, CR.DOS, CR.Reader_Sign_Off_Date) AS Reader_Days_to_Sign_Off, 
			CASE 
					WHEN CE.claim_date IS NOT NULL THEN DATEDIFF(day, CR.DOS, CDH.claim_date) 
					ELSE NULL END AS DaysToBill, 
            EL2.S#C AS [Surgeon Ownd], 
			CASE 
					WHEN PIC.ins_charged >= 0 AND PIC.ins_charged <= .25 AND CE.ins_folder IS NOT NULL THEN 'CORRECTED CLAIM'
					WHEN CE.claim_seq in (707365,701603) THEN  'CORRECTED CLAIM'
					WHEN PIC.clm_billing_type IS NULL THEN EL.clm_billing_type 
					ELSE PIC.clm_billing_type 
					END AS clm_billing_type, 
            CR.[Procedure Type], 
			CASE 
					WHEN PIC.ins_collcted IS NULL THEN 0 
					ELSE PIC.ins_collcted 
					END AS ins_collcted, 
			PIC.ins_charged, 
			PIC.ins_writte_off, 
			--ammount_allowed,
			claim_closed_date,
            CR.Region_Short_Name, 
			CR.Reader, 
			IL.InsuranceGroup AS [consolidated payor], 
			IL.InsuranceGroup AS [consolidated payer], 
			ITL.InsuranceGroup AS [Con ins type], 
			CR.Biller, 
			CE.biller AS claimbiller, 
            CAST(CE.claim_date AS smalldatetime) AS [Claim Date], 
			MONTH(CE.claim_date) AS [Claim Month], 
			YEAR(CE.claim_date) AS [Claim Yr],
			CAST(CDH.claim_date as smalldatetime) as [OriginalClaimDate],
		/*	0 AS [Payor From],
			0 AS [First Collection],
			0 AS [Last Collection],
			0 AS [2013 PYMT],
			0 as [2014 PYMT],
			0 as [2015 PYMT],
			0 as [2016 PYMT],
			0 AS [Total Collection],
			0 AS Balance,*/

            (SELECT        TOP (1) Payer
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id)) AS [Payor From], 
            (SELECT        TOP (1) Date_Collected
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id and payment_collected > 0)
					ORDER BY Date_Collected) AS [First Collection],
            (SELECT        TOP (1) Date_Collected
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id) AND (Payment_Collected <> 0)
					ORDER BY Date_Collected DESC) AS [Last Collection],
            (SELECT        SUM(Payment_Collected) AS Expr1
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id) AND (YEAR(Date_Collected) = 2013)) AS [2013 PYMT],
            (SELECT        SUM(Payment_Collected) AS Expr1
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id) AND (YEAR(Date_Collected) = 2014)) AS [2014 PYMT],
            (SELECT        SUM(Payment_Collected) AS Expr1
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id) AND (YEAR(Date_Collected) = 2015)) AS [2015 PYMT],
            (SELECT        SUM(Payment_Collected) AS Expr1
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id) AND (YEAR(Date_Collected) = 2016)) AS [2016 PYMT],
			(SELECT			SUM(Payment_Collected) As Expr1
					FROM			dbo.Insurance_Deposits_3300 as ID
					WHERE		(claim_id = PIC.claim_id) AND (YEAR(Date_Collected) = 2017)) AS [2017 PYMT],
            CASE
				WHEN
						(SELECT        SUM(Payment_Collected) AS Expr1
								FROM            dbo.Insurance_Deposits_3300 AS ID
								WHERE        (claim_id = PIC.claim_id) ) is not null then 
										(SELECT        SUM(Payment_Collected) AS Expr1
								FROM            dbo.Insurance_Deposits_3300 AS ID
								WHERE        (claim_id = PIC.claim_id) )
				Else 0
				END  AS [Total Collection], 
			CASE
				WHEN
						(SELECT        SUM(Payment_Collected) AS Expr1
								FROM            dbo.Insurance_Deposits_3300 AS ID
								WHERE        (claim_id = PIC.claim_id) ) is not null then 
				
				
								PIC.ins_charged - PIC.ins_writte_off -
									(SELECT        SUM(Payment_Collected) AS Expr1
									FROM            dbo.Insurance_Deposits_3300 AS ID
									WHERE        (claim_id = PIC.claim_id)) 
				Else PIC.ins_charged - PIC.ins_writte_off
				END AS Balance, 
			(select sum(eob) from collect_detail_3300 where claim_seq = PIC.claim_id) as AllowedAmt,
			CASE
				WHEN (select sum(eob) from collect_detail_3300 where claim_seq = CE.claim_seq) IS NOT null
					THEN
						(select sum(eob) from collect_detail_3300 where claim_seq = CE.claim_seq)
						- PIC.ins_writte_off  - (SELECT        SUM(Payment_Collected) AS Expr1
													FROM            dbo.Insurance_Deposits_3300 AS ID
													WHERE        (claim_id = PIC.claim_id)) 
			ELSE PIC.ins_charged - PIC.ins_writte_off - (SELECT        SUM(Payment_Collected) AS Expr1
													FROM            dbo.Insurance_Deposits_3300 AS ID
													WHERE        (claim_id = PIC.claim_id)) 
			END AS [A/R Balance], 
			CASE
					WHEN CD.Box33 = 'Frisco Neurosurgical, PLLC' then 'Frisco Neurosurgical Products, PLLC' -- Combining erroneous names
					ELSE CD.Box33
					END AS Box33, 
			CD.method AS ClaimMethod, 
			CASE 
					WHEN CD.Box33 = 'Frisco Neurosurgical, PLLC' then 'Frisco Neurosurgical Products, PLLC' -- Combining erroneous names 
					WHEN CE.ins_folder IN ('Ongoing Insurance Billing', 'Closed Billing Claims') THEN CD.Box33 
					WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') THEN SL1.Proentity -- Ticket #2186 added Aetna
					WHEN CR.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services' 
					WHEN CR.DOS > '2014-08-31' THEN 'NNI' 
					ELSE SL1.Proentity 
					END AS Entity, 
			CASE 
					WHEN CE.claim_seq = '515996' THEN 'ABV Neuromonitoring, PLLC' 
					WHEN CE.claim_seq = '779334' THEN 'Alamo City Neurodiagnostics, PLLC'
					WHEN CE.claim_seq in ('617825', '630007', '654641') THEN 'RRV Neuromonitoring PLLC'  -- Ticket #702
					WHEN CE.claim_seq in (367261) AND SL1.Proentity is not null THEN SL1.Proentity
					WHEN CE.Claim_seq in (367261) AND SL2.Proentity is not null THEN SL2.Proentity
					WHEN CE.Claim_seq IN ('347332', '354211', '354292', '347908', '298807','735450','735444','735435','735443','742160','777073','777855','778171','778298','778276','788164','793966') THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.' 
					WHEN CE.Claim_seq IN ('773616', '765268', '697524', '593754', '701429','774622') THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.' 
					WHEN CR.PID IN ('521290') THEN SL1.Proentity
					WHEN CR.PID IN ('525542', '527117') THEN 'RRV Neuromonitoring PLLC'
					When CE.Claim_seq in(711162,701379,695792,711224,703082) then 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
					WHEN CE.claim_seq in (864147,855841,855838,855824,855772,855760,853806,853801,853799,763832,764047,838040) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'

					WHEN CEE.claimID is not null then CEE.CorrectEntity
					
		-- #30	kta	WHEN CR.surgeon = 'Kevin James, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.[1st Insurance Category]  = 'Private Insurance' and CR.surgeon = 'Kevin James, M.D.' and cr.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC' 
					WHEN CR.surgeon = 'Kevin James, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.[1st Insurance Category]  in ('Private Insurance', 'Aetna') and CR.surgeon = 'Kevin James, M.D.' and cr.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC' 
					WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' and CR.[Primary Insurance] like '%kempton%' then 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		--			WHEN CR.surgeon = 'Melanie Kinchen, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.DOS >= '2016-06-28' then  'Wilcox Neuromonitoring, PLLC'
		--			WHEN CR.surgeon = 'Sean Jones-Quaidoo, M.D.' and IL.InsuranceGroup = 'Blue Cross Blue Shield' and CR.DOS >='2016-07-07' then 'Cerebral Axis, PLLC'
		--ticket 2284 lauren: Palmetto Axon Neuromonitoring, LLC will begin billing for BCBS (1st Insurance Type)  for all encounters >=DOS 9/1/2017
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.Surgeon IN ('Mike Tyler, M.D.', 'Jason Highsmith, M.D.', 'Sabino D''Agostino, D.O. ', 'William Wilson, M.D.','Don Stovall, M.D.') AND CR.DOS >= '2017-09-01' THEN SL1.Proentity
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Mark Silver, M.D.' THEN SL1.Proentity 
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Michael Rimlawi, D.O.' THEN SL1.Proentity
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Robert Urrea, M.D.' and CR.DOS >= '2016-09-21' THEN SL1.Proentity
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Michael Rimlawi, D.O.' THEN SL1.ProEntity 
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Curtis MIna, M.D.' THEN SL1.ProEntity  -- Ticket #1262
					WHEN cr.[1st Insurance Category] = 'Blue Cross Blue Shield' AND cr.SURGEON = 'Ram Vasudevan, M.D.' AND cr.DOS >= '2016-11-30' and SL1.proentity is not null THEN SL1.ProEntity -- Ticket #1314
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Samir Parikh, M.D.' AND CR.DOS >= '2016-10-03' and SL1.proentity is not null THEN SL1.ProEntity -- Ticket #1401
					--ticket 2469 lauren
					--WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.Surgeon IN ('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')  and SL1.proentity is not null and CR.DOS < '2017-08-30' then SL1.ProEntity -- (Grand Canyon Neurology, PLLC)  Ticket #1652
					--WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.Surgeon IN ('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')  and SL1.proentity is not null and CR.DOS >= '2017-08-30' then 'AccuZone Diagnostics, LLC' --Ticket #2411
					
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Kendall Carll, M.D.' and CR.DOS >= '2017-07-01' THEN SL1.Proentity -- Ticket #2209
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Lewis Frazier, M.D.' and CR.DOS >= '2017-07-01' THEN SL1.Proentity -- Ticket #2209
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.Surgeon = 'Richard Westmark, M.D.' AND CR.DOS >= '2017-12-01' THEN SL1.Proentity  -- 2018-01-03 JTB Per #6 Github Issue
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND Region_Short_Name = 'Maryland' then SL1.ProEntity

					WHEN Region_Short_Name in ('Maryland', 'California') AND SL1.Proentity is not null THEN SL1.ProEntity
					WHEN Region_short_name in ('Maryland', 'California') AND SL2.Proentity is not null then SL2.ProEntity
					
					-- Ticket #1217 When the Surgeon is Michael Rimlawi, D.O. and the "Insurance Type column is = Blue Cross Blue Shield then the "CorrectEntity" should be his Neuroguide IOM, PLLC (SL2)					
					WHEN IL.InsuranceGroup = 'Blue Cross Blue Shield' AND  CR.hospital IN ('The Spine Hospital of Louisiana ', 'Cypress Pointe Surgical Hospital ') AND Reader IN('David Adams, M.D.') THEN 'Pro Read, LLC'
					WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') AND SL1.Proentity is not null THEN SL1.Proentity -- Ticket #2186 added Aetna
					WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna') AND SL2.Proentity is not null THEN SL2.Proentity -- Ticket #2186 added Aetna
					WHEN CR.[1st Insurance Category] IN ('Workmans Comp') AND Region_short_name IN ('Louisiana') AND SL1.Proentity is not null THEN SL1.Proentity 
					WHEN CR.[1st Insurance Category] IN ('Workmans Comp') AND Region_short_name IN ('Louisiana') AND SL2.Proentity is not null THEN SL2.Proentity	
					WHEN Region_short_name in ('Louisiana', 'Mississippi - South') AND CE.ins_folder not in ('Closed Billing Claims') AND CE.claim_date >'2017-04-01' THEN 'Neuroplexus, LLC'	
					WHEN CR.Region_Short_Name IN ('Louisiana', 'Mississippi - South') AND CE.ins_folder IN ('New Insurance') THEN 'Neuroplexus, LLC'
					WHEN Region_short_name in ('Arizona') AND ins_folder not in ('Closed Billing Claims') and CE.claim_date > '2017-06-01' Then 'AccuZone Diagnostics, LLC'
					When Region_short_name in ('Arizona') AND ins_folder in ('New Insurance') Then 'AccuZone Diagnostics, LLC'
					WHEN Region_short_name in ('Ohio') AND ins_folder not in ('Closed Billing Claims') and CE.claim_date > '2017-06-01' Then 'One Care Monitoring, LLC'
					When Region_short_name in ('Ohio') AND ins_folder in ('New Insurance') Then 'One Care Monitoring, LLC'
					WHEN Region_short_name in ('South Carolina') and CR.DOS > '2017-05-01' Then 'Radiant Neuromonitoring, LLC' 
				--	When Region_short_name in ('South Carolina') Then 'Radiant Neuromonitoring, LLC'
					WHEN CR.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services' 
					WHEN CR.DOS > '2014-08-31' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
                    ELSE SL1.Proentity 
					END AS CorrectEntity, 
			CEE.CorrectEntity as ExceptionCorrectEntity,
			CE.ins_folder AS Folder, 
			HL.contract_status as ContractType, 
		CASE	
					WHEN CR.[1st Insurance Category] IN ('Medicaid', 'Medicare', 'Uninsured', 'Self Pay','Federal Plan', 'Medicaid Advantage Plan') THEN 'Unbillable' --#26 kta added federal plan, map
					WHEN CR.PID IN (652556,679177) THEN 'Unbillable: Pro Bono'
					WHEN CR.DOS < '2013-05-01' THEN 'Appealed' 
					WHEN CR.Reader IN ('* Unassigned *', 'Jane Doe') THEN 'Unbillable' 
					WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' THEN 'Unbillable'
					--WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' and CR.[Primary Insurance] like '%Health Choice%' AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable' -- ticket #26 kta
					--WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' and CR.[Primary Insurance] like '%kempton%' AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable'       -- commenting out
					--WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital'  AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case'                                    -- these 4 lines
					--WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case'                                     -- replace w/ 1 below
					WHEN CR.hospital_ID = 3403 AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable Bundled Case' --ticket #26 kta
					--WHEN CR.hospital = 'Dublin Surgery Center' THEN 'Unbillable: Bundled Case' -- kta see line below
					WHEN CR.hospital_ID in (4457,4550) THEN 'Unbillable: Bundled Case' --#26 added 4450 kta
					--WHEN CR.[1st Insurance Category] = 'Medicare Replacement Plan' AND CR.Reader IN ('William High, M.D.', 'William High, M.D., Ph.D.') and cr.dos >= '2016-06-01' THEN 'Unbillable' -- #26 kta see line below
					WHEN READERFEES.Fee1 = 0 THEN 'Unbillable: ReaderFee' -- ticket #26 kta

					WHEN HL7.[SecondaryGroupID] = 'PB' AND  CR.Reader = 'William VanNess, M.D.' THEN 'Unbillable' -- ticket #22 kta
					--WHEN (Select top 1 BillingCompany from readerfees as rf where rf.readername = CR.Reader and rf.[1st Insurance Category] = CR.[1st Insurance Category] and CR.DOS >= startdate and CR.DOS <= enddate) <> 'ABS' THEN 'Unbillable'	
					WHEN ins_folder NOT IN ('New Insurance Billing') AND (PIC.clm_billing_type = 'Tech Only' OR EL.clm_billing_type = 'Tech Only') THEN 'Unbillable' 
					WHEN CE.ins_folder = 'Closed Billing Claims' THEN 'Closed' 
					WHEN CR.biller = '' AND CE.biller IS NULL AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Closed' 
					WHEN (PIC.ins_charged - PIC.ins_writte_off - (SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID)) <= 0 THEN 'Appealed' 
					WHEN PIC.ins_collcted > 0 AND   CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
					WHEN (SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID) > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
					WHEN PIC.ins_charged > 0 AND ins_folder NOT IN ('New Insurance Billing', 'Pending Clearinghouse') THEN 'Billed' 
					ELSE 'Not Billed' 
					END AS BillStatus,
            CASE 
					-- STEP 1
					WHEN CR.DOS < '2013-05-01' THEN 'Archived' 
					WHEN CR.DOS > getdate() THEN 'Future Case' 

					-- STEP 2
					WHEN CR.PID IN (652556,679177) THEN 'Unbillable: Pro Bono'
					WHEN CR.[1st Insurance Category] IN ('Medicare', 'Medicaid', 'Medicaid Advantage Plan', 'Blue Cross Blue Shield')  THEN 'Unbillable: MC/MAP' 
					WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan','Federal Plan') AND CR.DOS >= '2017-01-01' THEN 'Unbillable: TRI-MRP-CHAMPVA'
					When CR.[Primary Insurance] like '%Aetna%' AND CR.DOS >= '2017-01-01' THEN 'Unbillable: Aetna'
					WHEN CR.[1st Insurance Category] = 'OTHER' AND CR.[Primary Insurance] LIKE '%Indigent%' THEN 'Unbillable: INDIGENT' 
					WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' and CR.[Primary Insurance] like '%kempton%' then 'Unbillable'
					WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital'  AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case' 
					WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case'
					WHEN CR.hospital = 'Dublin Surgery Center' THEN 'Unbillable: Bundled Case'
					WHEN PIC.clm_billing_type IN ('Pro Only') OR EL.clm_billing_type = 'Pro Only' THEN 'Unbillable: Pro' 
					WHEN HL.contract_status = 'Services' AND CIM.contract_status = HL.contract_status AND HL.Expire_date IS NULL THEN 'Unbillable: Insurance Contract Matrix' 
					WHEN HL.contract_status = 'Services' AND CIM.contract_status = HL.contract_status AND CR.DOS > HL.Expire_date THEN 'Unbillable: Insurance Contract Matrix' 
					WHEN CR.Region_Short_Name IN ('Alaska-Homer') AND  CR.Tech = 'Kimberly olson' THEN 'Unbillable: Alaska-Home/Olson' 
					WHEN CR.surgeon IN ('Arnold Vardiman, M.D.') AND reader IN ('Jane Doe', '* Unassigned *') THEN 'Unbillable: Vardiman No Reader'
					WHEN CR.Hospital IN ('HonorHealth Deer Valley Medical Center', 'Scottsdale Shea Medical Center') THEN 'Unbillable: Ticket#1723'
					WHEN CR.Hospital IN ('University of Maryland Baltimore Washington Medical Center', 'Torrance Memorial Medical Center')  then 'Unbillable facilitycontract' -- Ticket #1778
					WHEN CR.Hospital_ID IN (4550) AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: PI Case per Contract'   -- ticket #55
					-- STEP 3
					WHEN CE.ins_folder = 'Closed Billing Claims' THEN 'Closed' 

					-- STEP 4
					WHEN PIC.ins_collcted > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
					
					-- STEP 5
					WHEN PIC.ins_charged > 0 AND  ins_folder NOT IN ('New Insurance Billing', 'Pending Clearinghouse') THEN 'Billed' 
					WHEN 
						(SELECT        SUM(ID.Payment_Collected)
							FROM            Insurance_Deposits_3300 AS ID
							WHERE        ID.Claim_id = PIC.claim_ID) = 0 
						AND PIC.ins_charged > 0 
						AND ins_folder IN ('Ongoing Insurance Billing') THEN 'Billed' 

					WHEN (PIC.ins_charged - PIC.ins_writte_off - 
							(SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID)) <= 0 THEN 'Billed' 

					WHEN
						(SELECT        SUM(ID.Payment_Collected)
							FROM            Insurance_Deposits_3300 AS ID
							WHERE        ID.Claim_id = PIC.claim_ID) > 0 
								AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
					WHEN CR.[1st Insurance Category] = 'OTHER' AND  CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Not Billed' 
					ELSE 'Not Billed' 
					END AS BillStatusTech,
			CAST(CASE													--added cast on Surgeon Ranking due to change on surgeonlookup2
				WHEN SL1.Ranking is not null then SL1.Ranking
				WHEN SL2.Ranking is not null then SL2.Ranking
				ELSE '' 
				END  as varchar(50)) AS SurgeonRanking,
			DEL.proentitydefault,
			DEL.techentitydefault,
			TCL.Techentity as SurgeonLookupTechEntity,
			EntityLookup2.IsPMCompany



FROM            dbo.case_report_3300 AS CR 
			LEFT OUTER JOIN dbo.claim_entity_3300 AS CE ON CE.patient_id = CR.PID 
			LEFT OUTER JOIN dbo.claim_det_33300 AS CD ON CD.claim_id = CE.claim_seq 
			LEFT OUTER JOIN dbo.patient_insurance_charges_3300 AS PIC ON CE.claim_seq = PIC.claim_id 
			LEFT OUTER JOIN dbo.EntityLookup AS EL ON PIC.client_name = EL.client_name 
			LEFT OUTER JOIN dbo.EntityLookup AS EL2 ON CD.Box33 = EL2.client_name 
			LEFT OUTER JOIN dbo.InsuranceTypeLookup AS ITL ON ITL.InsuranceType = PIC.insurance_type 
			LEFT OUTER JOIN dbo.InsuranceLookup AS IL ON IL.InsuranceCompany = CR.[Primary Insurance] 
			LEFT OUTER JOIN dbo.Hospitals_3300 AS HL ON HL.Hospital_id = CR.Hospital_id
			LEFT OUTER JOIN dbo.SurgeonLookup2 AS SL1 ON CR.Surgeon = SL1.Surgeon 
						AND CR.DOS >= SL1.StartDate 
						AND CR.DOS <= SL1.EndDate 
						AND CR.Region_Short_Name = SL1.Region
						AND SL1.Payor = '* ANY *'
			LEFT OUTER JOIN dbo.SurgeonLookup2 as SL2 ON CR.Surgeon = SL2.Surgeon
						AND CR.DOS >= SL2.StartDate 
						AND CR.DOS <= SL2.EndDate 
						AND CR.Region_Short_Name = SL2.Region
						AND SL2.Payor = IL.InsuranceGroup
			LEFT OUTER JOIN dbo.vwHL7_Raw AS HL7 ON HL7.patient_id = CR.PID 
			LEFT OUTER JOIN dbo.RegionTechEntityLookup AS RTEL ON RTEL.RegionName = CR.Region_Short_Name 
									AND CR.DOS >= RTEL.StartDate 
									AND CR.DOS <= RTEL.EndDate
			LEFT OUTER JOIN (select claim_seq, min(claim_date) as claim_date from claimdatehistory group by  claim_seq) cdh on cdh.claim_seq =  CE.claim_seq 
			LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM ON CR.Hospital_id = CIM.Hospital_id AND CR.[1st Insurance Category] = CIM.Insurance_Type 
			LEFT OUTER JOIN TechCompanyLookup as TCL on CR.Surgeon = TCL.Surgeon
						AND CR.DOS >= TCL.startdate
						AND CR.DOS <= TCL.enddate
						AND CR.Region_Short_Name = TCL.Region
			LEFT OUTER JOIN DefaultEntityLookup as DEL on CR.Region_Short_Name = DEL.Region
			LEFT OUTER JOIN ENTITYLOOKUP2 on CD.Box33 = EntityLookup2.entity
			LEFT OUTER JOIN correctentityexceptions as CEE on PIC.claim_id = CEE.claimid
			LEFT OUTER JOIN READERFEES ON 	CR.Reader = READERFEES.ReaderName 
				AND CR.[1st Insurance Category] = READERFEES.[1st Insurance Category]
				AND Cr.DOS > READERFEES.startdate 
				and CR.DOS < READERFEES.enddate
WHERE        (CR.DOS > '2013-01-01') 
				AND (CR.Cancelled <> 'Yes') 
				AND (CR.Deleted <> 'Yes') 
				AND (CE.ins_folder <> 'Deleted Claims' 
				OR CE.ins_folder IS NULL)

				-- Test change.