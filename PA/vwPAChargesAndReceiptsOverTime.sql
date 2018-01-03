/*
select * from vwChargesandReceiptsOverTime where CollectioNDate is null
*/

ALTER VIEW vwPAChargesAndReceiptsOverTime as 

SELECT 		claim_id, 
			SUM(Amount) AS Amount, 
			ValueType,    -- Either Charges or Deposits
			DOS,    
			cast(CollectionDate as smalldatetime) as CollectionDate, 
			check_no,
			[Consolidated Payor],
			CorrectEntity,
			[Insurance Type],
			clm_billing_type
FROM (
		SELECT DISTINCT 
			 claim_id, 
			 DOS, 
			 cast(DOS as smalldatetime) as CollectionDate, 
			 ins_charged AS Amount, 
			 'Charge' AS ValueType, 
			 '' AS check_no,
			 [consolidated payor],
			 CorrectEntity,
			 [Insurance Type],
			 'Pro Only' as clm_billing_type

		FROM            
			vwPAMaster
		WHERE
			billstatus not like '%Unbillable%' and 
			clm_billing_type = 'Pro Only' 

	/*	UNION

				SELECT DISTINCT 
			 claim_id, 
			 DOS, 
			 cast(DOS as smalldatetime) as CollectionDate, 
			 ins_charged AS Amount, 
			 'Charge' AS ValueType, 
			 '' AS check_no,
			 [consolidated payer],
			 CorrectEntity,
			 [Insurance Type],
			 'Tech Only' as clm_billing_type

		FROM            
			vwPAMaster
		WHERE
			billstatus not like '%Unbillable%' and 
			clm_billing_type = 'Tech Only' 
		--	select * from vwPAMaster  */

		UNION
                          
		SELECT DISTINCT 
			ID.claim_seq as claim_id, 
			CAST(CR.dos AS smalldatetime) AS DOS, 
			CAST(ID.Date_Collected as smalldatetime) AS CollectionDate, 
			ID.Payment_Collected AS Amount, 
			'Deposit' AS ValueType,
			ID.check_no AS check_no,
			[consolidated payor],
			CorrectEntity,
			[Insurance Type],
			clm_billing_type
        FROM 
			dbo.Insurance_Deposits_3350 AS ID 
			LEFT OUTER JOIN dbo.case_report_3350 AS CR ON ID.Patient_ID = CR.PID 
			LEFT OUTER JOIN dbo.claim_entity_3350 AS CE ON ID.Patient_ID = CE.patient_id 
			LEFT OUTER JOIN dbo.claim_det_3350 AS CD ON ID.Patient_ID = CD.patient_id 
			--LEFT OUTER JOIN dbo.notes_3300 AS notes ON ID.Patient_ID = notes.Patient_ID
			LEFT OUTER JOIN vwPAMaster ON ID.claim_id = vwPAMaster.claim_id
        WHERE        
			--(CR.Biller IN ('Acquisition Billing Services', 'Medical Practice Solutions', '')) 
			 (CR.Deleted <> 'Yes') 
			AND (CR.Cancelled <> 'Yes') 
		--	AND (CD.method IS NULL OR CD.method = 'Electronic') 
			AND (CE.ins_folder IN ('Closed Billing Claims', 'Ongoing Insurance Billing'))
			AND payment_Collected <>0
			AND ID.Date_Collected is not null


		
		GROUP BY CE.claim_seq, ID.claim_seq, CR.dos, CE.claim_date, ID.Date_Collected, ID.Payment_Collected,
				CE.[Claim Total Charge],ID.check_no,
				[consolidated payor],
			CorrectEntity,
			[Insurance Type],
			clm_billing_type

		) as a 
		
		--where a.amount is not null and a.amount <>0
		
		GROUP BY a.claim_id, a.ValueType, a.dos, a.collectiondate, a.check_no,[consolidated payor],
			CorrectEntity,
			[Insurance Type],
			clm_billing_type
	

