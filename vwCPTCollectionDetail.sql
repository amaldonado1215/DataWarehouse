alter view vwCPTCollectionDetail as 

select distinct
	CR.PID,
	CR.DOS,
	IL.InsuranceGroup AS [consolidated payor],
	CR.Biller, 
	CR.[1st Insurance Category] AS [Insurance Type], 
	CASE 
		WHEN PIC.ins_charged >= 0 AND PIC.ins_charged <= .25 AND CE.ins_folder IS NOT NULL THEN 'CORRECTED CLAIM'
		WHEN PIC.clm_billing_type IS NULL THEN EL.clm_billing_type ELSE PIC.clm_billing_type 
		END AS clm_billing_type,
	CD.box33,
	--Case
	--when CC.Units is null then 
	--	cast( CC.Unit_Charge as money)
	--else cast(CC.Units * CC.Unit_Charge as money) end
	--as ClaimTotalCharge,
	Coll_Det.claim_seq as claim_id,
	Coll_Det.proc_code, 
	Coll_Det.collected,
	Coll_Det.eob as amount_allowed,
	Coll_Det.check_no, 
	Coll_Det.collected_date,
	Coll_Det.comment as DenialCode,
	dcl.reason as DenialReason,
	CR.hospital,
	CR.[Primary Insurance],
	HL7.GroupID,
	CR.Region_Short_Name

from collect_detail_3300 as Coll_Det
	
	LEFT OUTER JOIN dbo.claim_entity_3300 AS CE ON Coll_det.claim_seq = CE.claim_seq
	LEFT OUTER JOIN dbo.case_report_3300 AS CR ON CE.patient_id = CR.PID 
	LEFT OUTER JOIN dbo.claim_det_33300 AS CD ON CD.claim_id = Coll_Det.claim_seq 
	--LEFT OUTER JOIN dbo.claim_charges_3300 AS CC ON CC.claim_seq = Coll_Det.claim_seq
	--												AND CC.proc_code = Coll_Det.proc_code
	LEFT OUTER JOIN dbo.patient_insurance_charges_3300 AS PIC ON Coll_Det.claim_seq = PIC.claim_id
	LEFT OUTER JOIN dbo.InsuranceLookup AS IL ON IL.InsuranceCompany = CR.[Primary Insurance] 
	LEFT OUTER JOIN dbo.EntityLookup AS EL ON PIC.client_name = EL.client_name 
	LEFT OUTER JOIN dbo.vwHL7_Raw AS HL7 ON HL7.patient_id = CR.PID 
	LEFT OUTER JOIN dbo.denialcodelookup as DCL on coll_det.comment = dcl.auth

-- where collected > 0
