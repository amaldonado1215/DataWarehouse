SELECT        patient_id, claim_seq, CAST(dos AS smalldatetime) AS dos, First_Name, Last_Name, [Claim Total Charge], Entity, company1_id, Payer, 
                         CAST(claim_date AS smalldatetime) AS claim_date, ins_folder AS Folder
FROM            dbo.claim_entity_3300