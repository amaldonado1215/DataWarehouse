alter view vwMaster3 as 
SELECT      CR.PID, 
			CAST(CR.DOS AS smalldatetime) AS DOS, 
			MONTH(CR.DOS) AS [DOS MO],
			YEAR(CR.DOS) AS [DOS YR],
			PIC.claim_id, 
			PIC.client_name, 
			CR.Patient, 
            CR.Surgeon, 
			CASE
				when EL2.S#C = 'No' or box33 = 'Neurodiagnostics & Neuromonitoring Institute, Inc.' or box33 = 'In-Site Surgical Monitoring Services' then ''
			--	when PIC.clm_billing_type = 'Pro Only' or EL.clm_billing_type = 'Pro Only' then 'Hit'

				WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
							AND SL1.Proentity is not null 
							AND (PIC.clm_billing_type = 'Pro Only' or EL.clm_billing_type = 'Pro Only' )
					THEN 
							substring((Select  distinct  ', '+rtrim(SL3.Surgeon)  AS [text()]
								From Surgeonlookup2 as SL3
								Where SL1.proentity = SL3.Proentity
							--	ORDER BY SL1.Surgeon
								For XML PATH ('')
							), 2, 1000) 
					
				WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
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
				WHEN CR.surgeon = 'Kevin James, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.[1st Insurance Category]  = 'Private Insurance' and CR.surgeon = 'Kevin James, M.D.' 
						and cr.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC' 
				WHEN CR.surgeon = 'Melanie Kinchen, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.DOS >= '2016-06-28' then  'Wilcox Neuromonitoring, PLLC'
			--	WHEN CR.surgeon = 'Sean Jones-Quaidoo, M.D.' and IL.InsuranceGroup = 'Blue Cross Blue Shield' and CR.DOS >='2016-07-07' then 'Cerebral Axis, PLLC'
				WHEN SL1.ProEntity is not null then SL1.ProEntity
				ELSE SL2.ProEntity
				END AS DefaultEntity, 
			RTEL.TechEntity AS DefaultTechEntity, 
			CR.Hospital, 
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
					WHEN PIC.clm_billing_type IS NULL THEN EL.clm_billing_type ELSE PIC.clm_billing_type 
					END AS clm_billing_type, 
            CR.[Procedure Type], 
			CASE 
					WHEN PIC.ins_collcted IS NULL THEN 0 
					ELSE PIC.ins_collcted 
					END AS ins_collcted, 
			PIC.ins_charged, 
			PIC.ins_writte_off, 
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
            (SELECT        SUM(Payment_Collected) AS Expr1
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id) )  AS [Total Collection], 
			PIC.ins_charged - PIC.ins_writte_off -
					(SELECT        SUM(Payment_Collected) AS Expr1
					FROM            dbo.Insurance_Deposits_3300 AS ID
					WHERE        (claim_id = PIC.claim_id)) AS Balance, 
			CASE
					WHEN CD.Box33 = 'Frisco Neurosurgical, PLLC' then 'Frisco Neurosurgical Products, PLLC' -- Combining erroneous names
					ELSE CD.Box33
					END AS Box33, 
			CD.method AS ClaimMethod, 
			CASE 
					WHEN CD.Box33 = 'Frisco Neurosurgical, PLLC' then 'Frisco Neurosurgical Products, PLLC' -- Combining erroneous names 
					WHEN CE.ins_folder IN ('Ongoing Insurance Billing', 'Closed Billing Claims') THEN CD.Box33 
					WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') THEN SL1.Proentity 
					WHEN CR.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services' 
					WHEN CR.DOS > '2014-08-31' THEN 'NNI' 
					ELSE SL1.Proentity 
					END AS Entity, 
			CASE 
					WHEN CE.claim_seq = '515996' THEN 'ABV Neuromonitoring, PLLC' 
					WHEN CE.claim_seq in ('617825', '630007', '654641') THEN 'RRV Neuromonitoring PLLC'  -- Ticket #702
					WHEN CR.PID IN ('347332', '354211', '354292', '347908', '298807') THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.' 
					WHEN CR.PID IN ('521290') THEN SL1.Proentity
					WHEN CR.surgeon = 'Kevin James, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.[1st Insurance Category]  = 'Private Insurance' and CR.surgeon = 'Kevin James, M.D.' and cr.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC' 
		--			WHEN CR.surgeon = 'Melanie Kinchen, M.D.' and IL.InsuranceGroup = 'Aetna' and CR.DOS >= '2016-06-28' then  'Wilcox Neuromonitoring, PLLC'
		--			WHEN CR.surgeon = 'Sean Jones-Quaidoo, M.D.' and IL.InsuranceGroup = 'Blue Cross Blue Shield' and CR.DOS >='2016-07-07' then 'Cerebral Axis, PLLC'
					WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.SURGEON = 'Mark Silver, M.D.' THEN SL1.Proentity 
					WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
							AND SL1.Proentity is not null THEN SL1.Proentity 
					WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
							AND SL2.Proentity is not null THEN SL2.Proentity 
					WHEN [1st Insurance Category] IN ('Workmans Comp') 
							AND Region_short_name IN ('Louisiana') 
							AND SL1.Proentity is not null THEN SL1.Proentity 
					WHEN [1st Insurance Category] IN ('Workmans Comp') 
							AND Region_short_name IN ('Louisiana') 
							AND SL2.Proentity is not null THEN SL2.Proentity 
					WHEN CR.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services' 
					WHEN CR.DOS > '2014-08-31' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
                    ELSE SL1.Proentity 
					END AS CorrectEntity, 
			CE.ins_folder AS Folder, 
			HL.contract_status as ContractType, 
		CASE	
					WHEN CE.ins_folder = 'Closed Billing Claims' THEN 'Closed' 
					WHEN CR.biller = '' AND CE.biller IS NULL AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Closed' 
					WHEN CR.[1st Insurance Category] IN ('Medicaid', 'Medicare', 'Uninsured', 'Self Pay') THEN 'Unbillable' 
					WHEN CR.DOS < '2013-05-01' THEN 'Appealed' 
					WHEN CR.Reader IN ('* Unassigned *', 'Jane Doe') THEN 'Unbillable' 
					WHEN CR.[1st Insurance Category] = 'Medicare Replacement Plan' AND CR.Reader IN ('William High, M.D.', 'William High, M.D., Ph.D.') and cr.dos >= '2016-06-01' THEN 'Unbillable' 
					WHEN (Select BillingCompany from readerfees as rf where rf.readername = CR.Reader and rf.[1st Insurance Category] = CR.[1st Insurance Category] and CR.DOS >= startdate and CR.DOS <= enddate) <> 'ABS' THEN 'Unbillable'	
					WHEN ins_folder NOT IN ('New Insurance Billing') AND (PIC.clm_billing_type = 'Tech Only' OR EL.clm_billing_type = 'Tech Only') THEN 'Unbillable' 
					WHEN (PIC.ins_charged - PIC.ins_writte_off - (SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID)) <= 0 THEN 'Appealed' 
					WHEN PIC.ins_collcted > 0 AND   CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
					WHEN (SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID) > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
					WHEN PIC.ins_charged > 0 AND ins_folder NOT IN ('New Insurance Billing', 'Pending Clearinghouse') THEN 'Billed' 
					ELSE 'Not Billed' 
					END AS BillStatus,
            CASE 
					WHEN CR.DOS < '2013-05-01' THEN 'Paid' 
					WHEN CR.DOS > getdate() THEN 'Future Case' 

					WHEN CR.[1st Insurance Category] IN ('Medicare', 'Medicaid', 'Medicaid Advantage Plan', 'Blue Cross Blue Shield')  THEN 'Unbillable: MC/MAP' 
					WHEN CR.[1st Insurance Category] = 'OTHER' AND CR.[Primary Insurance] LIKE '%Indigent%' THEN 'Unbillable: INDIGENT' 

					WHEN CE.ins_folder = 'Closed Billing Claims' THEN 'Closed' 
					WHEN PIC.ins_charged > 0 AND  ins_folder NOT IN ('New Insurance Billing', 'Pending Clearinghouse') THEN 'Billed' 
					WHEN PIC.clm_billing_type IN ('Pro Only') OR EL.clm_billing_type = 'Pro Only' THEN 'Unbillable: Pro' 
					
		--			WHEN CR.[1st Insurance Category] IN ('Blue Cross Blue Shield', 'CHAMPVA',  'TRICARE') AND HL.ContractType <> 'Technical Services' AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Unbillable:BVBS/CHAMPVA/TRICARE NoTechContract' 
		--			WHEN CR.[1st Insurance Category] IN ('Blue Cross Blue Shield', 'CHAMPVA', 'TRICARE') AND  HL.contracttype = 'Technical Services' THEN 'Unbillable:BCBS/CHAMPVA/TRICARE TechContract' 

					WHEN HL.contract_status = 'Services' AND CIM.contract_status = HL.contract_status AND HL.Expire_date IS NULL THEN 'Unbillable: Insurance Contract Matrix' 
					WHEN HL.contract_status = 'Services' AND CIM.contract_status = HL.contract_status AND CR.DOS > HL.Expire_date THEN 'Unbillable: Insurance Contract Matrix' 
					WHEN CR.Region_Short_Name IN ('Alaska-Homer') AND  CR.Tech = 'Kimberly olson' THEN 'Unbillable: Alaska-Home/Olson' 
					WHEN CR.surgeon IN ('Arnold Vardiman, M.D.') AND reader IN ('Jane Doe', '* Unassigned *') THEN 'Unbillable: Vardiman No Reader' 
					WHEN (PIC.ins_charged - PIC.ins_writte_off - 
							(SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID)) <= 0 THEN 'Paid' 
					WHEN PIC.ins_collcted > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Partially Paid' 
				WHEN
						(SELECT        SUM(ID.Payment_Collected)
							FROM            Insurance_Deposits_3300 AS ID
							WHERE        ID.Claim_id = PIC.claim_ID) > 0 
								AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Partially Paid' 
					WHEN CR.[1st Insurance Category] = 'OTHER' AND  CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Not Billed' 
					ELSE 'Not Billed' 
					END AS BillStatusTech

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
WHERE        (CR.DOS > '2013-01-01') 
				AND (CR.Cancelled <> 'Yes') 
				AND (CR.Deleted <> 'Yes') 
				AND (CE.ins_folder <> 'Deleted Claims' 
				OR CE.ins_folder IS NULL)