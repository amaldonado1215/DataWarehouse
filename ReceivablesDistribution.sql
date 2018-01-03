ALTER VIEW ReceivablesDistribution as 

SELECT DISTINCT TOP (100) PERCENT 
			claim_seq, 
			SUM(Amount) AS Amount, 
			ValueType, 
			ClaimDate, 
			CollectionDate, 
			check_no, 
			method
FROM            
		(SELECT DISTINCT 
			 CE.claim_seq, 
			 CAST(CE.claim_date AS smalldatetime) AS ClaimDate, 
			 CE.claim_date AS CollectionDate, 
			 CE.[Claim Total Charge] AS Amount, 
			 'Charge' AS ValueType, 
			 '' AS check_no, 
			 'Electronic' AS method
          FROM            
			dbo.patient_insurance_charges_3300 AS PIE 
				LEFT OUTER JOIN  dbo.case_report_3300 ON PIE.PID = dbo.case_report_3300.PID 
				LEFT OUTER JOIN  dbo.claim_det_33300 ON PIE.claim_id = dbo.claim_det_33300.claim_id 
				LEFT OUTER JOIN  dbo.claim_entity_3300 AS CE ON PIE.PID = CE.patient_id
          WHERE        
				(dbo.case_report_3300.Biller IN ('Acquisition Billing Services', 'Medical Practice Solutions', '')) 
					AND (dbo.case_report_3300.Deleted <> 'Yes') 
					AND (dbo.case_report_3300.Cancelled <> 'Yes') 
					AND (CE.ins_folder IN ('Closed Billing Claims', 'Ongoing Insurance Billing')) 
					AND (dbo.claim_det_33300.method IS NULL OR dbo.claim_det_33300.method = 'Electronic')
           GROUP BY CE.claim_seq, CE.claim_date, PIE.clm_billing_type, CE.[Claim Total Charge]

           UNION
           
		   SELECT DISTINCT 
				CE.claim_seq, CAST(CE.claim_date AS smalldatetime) AS ClaimDate, 
				CE.claim_date AS CollectionDate, 
				MAX(CE.[Claim Total Charge]) AS Amount, 
                'Charge' AS ValueType, '' AS check_no, 
				claim_det_33300_1.method

           FROM
			 dbo.patient_insurance_charges_3300 AS PIE 
					LEFT OUTER JOIN  dbo.case_report_3300 AS case_report_3300_1 ON PIE.PID = case_report_3300_1.PID 
					LEFT OUTER JOIN  dbo.claim_det_33300 AS claim_det_33300_1 ON PIE.claim_id = claim_det_33300_1.claim_id 
					LEFT OUTER JOIN  dbo.claim_entity_3300 AS CE ON PIE.PID = CE.patient_id
            WHERE        
				(case_report_3300_1.Biller IN ('Acquisition Billing Services', 'Medical Practice Solutions', '')) 
				AND (case_report_3300_1.Deleted <> 'Yes') 
				AND (case_report_3300_1.Cancelled <> 'Yes') 
				AND (claim_det_33300_1.method = 'Paper') 
				AND (CE.ins_folder IN ('Closed Billing Claims', 'Ongoing Insurance Billing'))
             GROUP BY CE.claim_seq, CE.claim_date, claim_det_33300_1.method

             UNION
                          
			 SELECT DISTINCT 
				ID.claim_seq, 
				CAST(CE.claim_date AS smalldatetime) AS ClaimDate, 
				ID.Date_Collected AS CollectionDate, 
				ID.Payment_Collected AS Amount, 
                'Deposit' AS ValueType, ID.check_no, 
				CD.method
             FROM 
				dbo.Insurance_Deposits_3300 AS ID 
				LEFT OUTER JOIN dbo.case_report_3300 AS CR ON ID.Patient_ID = CR.PID 
				LEFT OUTER JOIN dbo.claim_entity_3300 AS CE ON ID.Patient_ID = CE.patient_id 
				LEFT OUTER JOIN dbo.claim_det_33300 AS CD ON ID.Patient_ID = CD.patient_id 
				LEFT OUTER JOIN dbo.notes_3300 AS notes ON ID.Patient_ID = notes.Patient_ID
              WHERE        
				(CR.Biller IN ('Acquisition Billing Services', 'Medical Practice Solutions', '')) 
					AND (CR.Deleted <> 'Yes') 
					AND (CR.Cancelled <> 'Yes') 
					AND (CD.method IS NULL OR CD.method = 'Electronic') 
					AND (CE.ins_folder IN ('Closed Billing Claims', 'Ongoing Insurance Billing'))
                          
			UNION
                      
			SELECT DISTINCT 
				ID.claim_seq, CAST(CE.claim_date AS smalldatetime) AS ClaimDate, 
				ID.Date_Collected AS CollectionDate, 
				ID.Payment_Collected AS Amount, 
                'Deposit' AS ValueType, 
				ID.check_no, 
				CD.method
             
			 FROM 
				dbo.Insurance_Deposits_3300 AS ID 
					LEFT OUTER JOIN dbo.case_report_3300 AS CR ON ID.Patient_ID = CR.PID 
					LEFT OUTER JOIN dbo.claim_entity_3300 AS CE ON ID.Patient_ID = CE.patient_id 
					LEFT OUTER JOIN dbo.claim_det_33300 AS CD ON ID.Patient_ID = CD.patient_id 
					LEFT OUTER JOIN dbo.notes_3300 AS notes ON ID.Patient_ID = notes.Patient_ID
              
			  WHERE        
				(CR.Biller IN ('Acquisition Billing Services', 'Medical Practice Solutions', '')) 
					AND (CR.Deleted <> 'Yes') 
					AND (CR.Cancelled <> 'Yes') 
					AND (CD.method = 'Paper') 
					AND (CE.ins_folder IN ('Closed Billing Claims', 'Ongoing Insurance Billing'))
              
			  GROUP BY ID.claim_seq, CE.claim_date, ID.Date_Collected, ID.Payment_Collected, ID.check_no, CD.method) AS a

GROUP BY claim_seq, ValueType, ClaimDate, CollectionDate, check_no, method