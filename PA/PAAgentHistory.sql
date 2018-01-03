alter VIEW PAAgentHistory as
SELECT  
	(select top 1 dos from insurance_Deposits_3350 where notes_3350.patient_id = dbo.insurance_deposits_3350.patient_id) as DOS,
	--dbo.Insurance_Deposits_3350.DOS, 
	(select top 1 payer from insurance_deposits_3350 where notes_3350.patient_id = dbo.insurance_deposits_3350.patient_id) as Payer,
	--dbo.Insurance_Deposits_3350.Payer, 
	(select top 1 biller from insurance_deposits_3350 where notes_3350.patient_id = dbo.insurance_deposits_3350.patient_id) as Biller,
	--dbo.Insurance_Deposits_3350.Biller, 
	--(select top 1  claim_seq from dbo.insurance_deposits_3350 where notes_3350.patient_id = dbo.Insurance_deposits_3350.patient_id) AS Claim, 
	--FLOOR(RAND()*(1000000-1)+1) as Claim, 
	dbo.notes_3350.clm as claim,
	dbo.notes_3350.note_type,
	dbo.notes_3350.Note AS Comments, 
    dbo.notes_3350.Patient_ID AS PatientId, 
	dbo.paAgents.agent, 
	dbo.paAgents.id AS AgentId, 
	dbo.notes_3350.InitialDate AS CommentDate

FROM dbo.notes_3350 
	LEFT OUTER JOIN dbo.PAAgents ON dbo.paAgents.id  = dbo.notes_3350.web_id 
--	LEFT OUTER JOIN dbo.Insurance_Deposits_3350 ON dbo.notes_3350.Patient_ID = dbo.Insurance_Deposits_3350.Patient_ID
WHERE notes_3350.web_id is not null

