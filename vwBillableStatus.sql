USE USMON_Local
GO
CREATE VIEW vwBillableStatus
as
SELECT CE.claim_seq,
	CASE	WHEN CR.[1st Insurance Category] IN ('Medicaid', 'Medicare', 'Uninsured', 'Self Pay','Federal Plan', 'Medicaid Advantage Plan') THEN 'Unbillable' --#26 kta added federal plan, map
			WHEN CR.PID IN (652556,679177) THEN 'Unbillable: Pro Bono'
			WHEN CR.PID IN (867659, 62885, 852057, 794804, 826029, 776057) THEN 'Unbillable: SimplifyStudy'		--#64 kta
			WHEN CR.hospital_ID = 4550 AND CR.[1st Insurance Category] = 'Other' then 'Unbillable HospContract'	--#64 kta
			WHEN CR.DOS < '2013-05-01' THEN 'Appealed' 
			WHEN CR.Reader IN ('* Unassigned *', 'Jane Doe') THEN 'Unbillable' 
			WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' 
				AND HL.[Contract Type] <> 'No Contract' and CR.Region_Short_Name not in ('California','Maryland')THEN 'Unbillable: TRI-MRP-CHAMPVA'  --#73 kta
			WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' THEN 'Unbillable'
			WHEN CR.hospital_ID = 3403 AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable Bundled Case' 
			WHEN CR.hospital_ID in (4457,4550) THEN 'Unbillable: Bundled Case' 
			WHEN rf.Fee1 = 0 THEN 'Unbillable: ReaderFee' 
			WHEN HL7.[SecondaryGroupID] = 'PB' AND  CR.Reader = 'William VanNess, M.D.' THEN 'Unbillable' 
			WHEN ins_folder NOT IN ('New Insurance Billing') AND (PIC.clm_billing_type = 'Tech Only' OR EL.clm_billing_type = 'Tech Only') THEN 'Unbillable' 
			WHEN CE.ins_folder = 'Closed Billing Claims' THEN 'Closed' 
			WHEN CR.biller = '' AND CE.biller IS NULL AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Closed' 
			WHEN (PIC.ins_charged - PIC.ins_writte_off - (SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID)) <= 0 THEN 'Appealed' 
			WHEN PIC.ins_collcted > 0 AND   CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
			WHEN ip.Payment_Collected > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
			WHEN PIC.ins_charged > 0 AND ins_folder NOT IN ('New Insurance Billing', 'Pending Clearinghouse') THEN 'Billed' 
			ELSE 'Not Billed' 
		END AS BillStatusPro,
		CASE 
		-- STEP 1	
			WHEN CR.DOS < '2013-05-01' THEN 'Archived' 
			WHEN CR.DOS > getdate() THEN 'Future Case' 
		-- STEP 2
			WHEN CR.PID IN (652556,679177) THEN 'Unbillable: Pro Bono'
			WHEN CR.PID IN (867659, 62885, 852057, 794804, 826029, 776057) THEN 'Unbillable: SimplifyStudy'		--#64 kta
			WHEN CR.hospital_ID = 4550 AND CR.[1st Insurance Category] = 'Other' then 'Unbillable HospContract'	--#64 kta
			WHEN CR.[1st Insurance Category] IN ('Medicare', 'Medicaid', 'Medicaid Advantage Plan', 'Blue Cross Blue Shield')  THEN 'Unbillable: MC/MAP' 
			WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' 
				AND HL.[Contract Type] <> 'No Contract' and CR.Region_Short_Name not in ('California','Maryland')THEN 'Unbillable: TRI-MRP-CHAMPVA'  --#73 kta
			WHEN CR.[Primary Insurance] like '%Aetna%' AND CR.DOS >= '2017-01-01' THEN 'Unbillable: Aetna'
			When CR.[1st Insurance Category] = 'Cigna' and CR.DOS >='2018-02-01' then 'Unbillable: Cigna'		--#64 kta
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
			WHEN CR.Hospital_ID IN (4550) AND CR.[1st Insurance Category] = 'Other' THEN 'Unbillable: PI Case per Contract' 
		-- STEP 3
			WHEN CE.ins_folder = 'Closed Billing Claims' THEN 'Closed' 
		-- STEP 4
			WHEN PIC.ins_collcted > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 
		-- STEP 5
			WHEN PIC.ins_charged > 0 AND  ins_folder NOT IN ('New Insurance Billing', 'Pending Clearinghouse') THEN 'Billed' 
			WHEN isnull(ip.Payment_Collected, 0) = 0 AND PIC.ins_charged > 0 AND ins_folder IN ('Ongoing Insurance Billing') THEN 'Billed'
			WHEN PIC.ins_charged - PIC.ins_writte_off - isnull(ip.Payment_Collected, 0) <= 0 THEN 'Billed' 
			WHEN isnull(ip.Payment_Collected, 0) > 0 AND CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed'
			WHEN CR.[1st Insurance Category] = 'OTHER' AND  CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Not Billed' 
			ELSE 'Not Billed' 
		END AS BillStatusTech
FROM dbo.case_report_3300 AS CR 
	LEFT OUTER JOIN dbo.claim_entity_3300 AS CE ON CE.patient_id = CR.PID
	LEFT OUTER JOIN READERFEES rf ON CR.Reader = rf.ReaderName 
				AND CR.[1st Insurance Category] = rf.[1st Insurance Category]
				AND CR.DOS between rf.startdate and rf.enddate
	LEFT OUTER JOIN dbo.Hospitals_3300 AS HL ON HL.Hospital_id = CR.Hospital_id
	LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM ON CR.Hospital_id = CIM.Hospital_id AND CR.[1st Insurance Category] = CIM.Insurance_Type 
	LEFT OUTER JOIN dbo.vwHL7_Raw AS HL7 ON HL7.patient_id = CR.PID 
	LEFT OUTER JOIN dbo.patient_insurance_charges_3300 AS PIC ON CE.claim_seq = PIC.claim_id
	LEFT OUTER JOIN dbo.EntityLookup AS EL ON PIC.client_name = EL.client_name
	LEFT OUTER JOIN (	SELECT claim_id, sum(Payment_Collected) as Payment_Collected
								FROM dbo.Insurance_Deposits_3300
								WHERE Payment_Collected <> 0
								GROUP BY claim_id) ip on ip.claim_id = CE.claim_seq 
WHERE CE.claim_seq is not NULL
