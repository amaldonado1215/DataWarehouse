ALTER VIEW vwSHS_ClaimCharges AS

SELECT TOP (100) PERCENT CC.claim_seq, 
		CC.patient_id, 
		CC.proc_code AS CPT, 
		CC.units AS Units, 
		CC.Unit_Charge * CC.units AS Charged, 
		CC.Unit_Charge, 
        CLAIMS.DateSubmittedToCarrier, 
		CAST(CC.claim_seq AS varchar(15)) + CAST(CC.patient_id AS varchar(15)) + CC.proc_code AS synccol, 
        CC.sort_order AS Seq
	FROM dbo.vwSHS_Claims AS CLAIMS 
			INNER JOIN dbo.claim_charges_3300 AS CC ON CLAIMS.ClaimId = CC.claim_seq

UNION

SELECT  CC.claim_seq, 
		CC.patient_id, 
		CC.proc_code AS CPT, 
		CC.units AS Units, 
		CC.Unit_Charge * CC.units AS Charged, 
		CC.Unit_Charge, 
        CLAIMS.DateSubmittedToCarrier, 
		CAST(CC.claim_seq AS varchar(15)) + CAST(CC.patient_id AS varchar(15)) + CC.proc_code AS synccol, 
        CC.sort_order AS Seq
	FROM dbo.vwSHS_PAClaims AS CLAIMS 
			INNER JOIN dbo.claim_charges_3350 AS CC ON CLAIMS.ClaimId = CC.claim_seq