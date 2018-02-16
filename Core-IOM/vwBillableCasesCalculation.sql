alter view vwBillableCasesCalculation as 

SELECT DISTINCT 
    CR.PID, 
	CAST(CR.DOS AS smalldatetime) AS DOS, 
	CR.Patient, 
	CR.Region_Short_Name, 
	CR.Hospital, 
	CR.Surgeon, 
	CR.Closed, 
	CR.Tech, 
    CR.[Primary Insurance] AS PrimaryInsurance, 
	CR.[1st Insurance Category], 
	CR.Biller, 
	CASE 
		WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' and CR.[Primary Insurance] like '%kempton%' then 'diagnostics & Neuromonitoring Institute, Inc.'
	--	WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
	--			AND SL1.Proentity is not null THEN SL1.Proentity 
	--	WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance') 
	--			AND SL2.Proentity is not null THEN SL2.Proentity 
		WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Cigna', 'Aetna')	--ticket 63 kta
				AND SL1.Proentity is not null THEN SL1.Proentity 
		WHEN CR.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Cigna', 'Aetna') 
				AND SL2.Proentity is not null THEN SL2.Proentity	
		WHEN CR.[1st Insurance Category] IN ('Workmans Comp') 
				AND Region_short_name IN ('Louisiana') 
				AND SL1.Proentity is not null THEN SL1.Proentity 
		WHEN CR.[1st Insurance Category] IN ('Workmans Comp') 
				AND Region_short_name IN ('Louisiana') 
				AND SL2.Proentity is not null THEN SL2.Proentity 
		WHEN CR.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services' 
		WHEN CR.DOS > '2014-08-31' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		ELSE SL1.Proentity END AS CorrectEntity,

     (SELECT        COUNT(*) AS Expr1
			FROM            dbo.patient_insurance_charges_3300 AS PIC
			WHERE        (PID = CR.PID) AND (clm_billing_type = 'Pro Only' or clm_billing_type is null) AND (ins_charged > 0)) AS ProClaims,
     
	 (SELECT        COUNT(*) AS Expr1
        FROM  dbo.patient_insurance_charges_3300 AS PIC
        WHERE (PID = CR.PID) AND (clm_billing_type = 'Tech Only') AND (ins_charged > 0)) AS TechClaims,
	
	CASE 
		WHEN CR.DOS > getdate() THEN 'Future Case' 
		WHEN CR.PID IN (652556,679177) THEN 'Unbillable: Pro Bono' --#26 kta added 679177
		WHEN CR.[1st Insurance Category] IN ('Medicaid', 'Medicare', 'Medicaid Advantage Plan', 'Uninsured', 'Self Pay','Federal Plan') THEN 'Unbillable: Insurance' --#26 kta added federal plan 
		WHEN CR.Reader IN ('* Unassigned *', 'Jane Doe') THEN 'Unbillable: Reader' 
		
		-- Replace with Neuro Fee Table calculation
		WHEN READERFEES.Fee1 = 0 THEN 'Unbillable: ReaderFee'
		--WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case' --#26 kta commented out, joined on hospitalID below
		WHEN CR.hospital_ID = 3403 AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case' 
		--WHEN CR.hospital = 'Dublin Surgery Center' THEN 'Unbillable: Bundled Case'  --#26 kta commented out, joined on hospitalID below
		WHEN CR.hospital_ID in (4457,4550) THEN 'Unbillable: Bundled Case' --#26 added 4450
		WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND DOS >= '2017-01-01' THEN 'Unbillable: TRI-MRP-CHAMPVA' --#26 kta removed federal plan
		WHEN HL7.[SecondaryGroupID] = 'PB' AND  CR.Reader = 'William VanNess, M.D.' THEN 'Unbillable' -- ticket #22 kta
	/*	WHEN CR.[1st Insurance Category] = 'TRICARE' AND CR.Reader NOT IN ('Bjorn Krane, M.D.', 'Bruce Katuna, M.D.', 'Badreldin Ibrahim, M.D.', 
					'Chuong Le, M.D.', 'Peter Tarbox, M.D.', 'Craig Carroll, D.O.') THEN 'Unbillable: TRICARE/Docs' 
		WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.Reader IN ('William High, M.D.', 'William High, M.D., Ph.D.') THEN 'Unbillable: BCBS/High' 
		-- As of 7/1/16 Dr. High is now billable for BCBS
		WHEN CR.[1st Insurance Category] = 'Blue Cross Blue Shield' AND CR.Reader = 'Bjorn Krane, M.D.' AND CR.DOS < '2015-12-01' THEN 'Unbillable: BCBS/Krane' 
		WHEN CR.[1st Insurance Category] = 'Medicare Replacement Plan' AND CR.Reader IN ('William High, M.D.', 'William High, M.D., Ph.D.') and dos >= '2016-06-01' THEN 'Unbillable: MRP/High' 
	*/	ELSE 'Billable' 
		END AS BillableStatus, 

    CASE 
		WHEN CR.DOS > getdate() THEN 'Future Case' 
		WHEN CR.PID IN (652556) THEN 'Unbillable: Pro Bono'
		WHEN CR.[1st Insurance Category] IN ('Medicare', 'Medicaid', 'Medicaid Advantage Plan', 'Blue Cross Blue Shield') THEN 'Unbillable: Disqualifying Insurance' 
		WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan','Federal Plan') AND DOS >= '2017-01-01' THEN 'Unbillable: TRI-MRP-CHAMPVA'
	-- #2034	WHEN ([Primary Insurance] like '%Blue Cross Blue Shield%' or [Primary Insurance] like '%BCBS%') THEN 'Unbillable: Disqualifying Insurance'
		WHEN CR.[Primary Insurance] like '%Aetna%' AND DOS >= '2017-01-01' THEN 'Unbillable: Aetna'
		--WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' and CR.[Primary Insurance] like '%kempton%' then 'Unbillable: mcbride/Kempton'
		WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital'  AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case' 
		WHEN CR.hospital = 'McBride Clinic Orthopedic Hospital' AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: Bundled Case'
		WHEN CR.hospital = 'Dublin Surgery Center' THEN 'Unbillable: Bundled Case'
		WHEN CR.[1st Insurance Category] = 'OTHER' AND CR.[Primary Insurance] LIKE '%Indigent%' THEN 'Unbillable: Indigent' 
		WHEN HL.contract_status = 'Services' AND CIM.contract_status = HL.contract_status AND HL.expire_date IS NULL THEN 'Unbillable: Insurance Contract Matrix' 
		WHEN HL.contract_status = 'Services' AND CIM.contract_status = HL.contract_status THEN 'Unbillable: Insurance Contract Matrix' 
		WHEN CR.Region_Short_Name IN ('Alaska') AND CR.Tech = 'Kimberly olson' THEN 'Unbillable: Alaska/Olson' 
		WHEN CR.surgeon IN ('Arnold Vardiman, M.D.') AND reader IN ('Jane Doe', '* Unassigned *') THEN 'Unbillable: Vardiman No Reader' 
		WHEN Region_Short_Name in ('California', 'Maryland') THEN 'Unbillable: Region'
		
		ELSE 'Billable' 
		END AS BillableStatusTech, 
		
	CR.Reader

FROM            dbo.case_report_3300 AS CR 

		LEFT OUTER JOIN dbo.hospitals_3300 as HL ON HL.hospital_id = CR.hospital_id
		LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM ON CR.Hospital_id = CIM.Hospital_id
				AND CR.[1st Insurance Category] = CIM.Insurance_Type 
		LEFT OUTER JOIN dbo.InsuranceLookup AS IL ON IL.InsuranceCompany = CR.[Primary Insurance] 
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
		LEFT OUTER JOIN READERFEES ON 	CR.Reader = READERFEES.ReaderName 
				AND CR.[1st Insurance Category] = READERFEES.[1st Insurance Category]
				AND Cr.DOS > READERFEES.startdate 
				and CR.DOS < READERFEES.enddate
		LEFT OUTER JOIN dbo.vwHL7_Raw AS HL7 ON HL7.patient_id = CR.PID -- ticket #22 kta



WHERE        (CR.DOS > '2013-01-01') 
				AND (CR.Cancelled <> 'Yes') 
				AND (CR.Deleted <> 'Yes') 


