alter VIEW AgentHistory as
SELECT  
	(select top 1 dos from insurance_Deposits_3300 where notes_3300.patient_id = dbo.insurance_deposits_3300.patient_id) as DOS,
	--dbo.Insurance_Deposits_3300.DOS, 
	(select top 1 payer from insurance_deposits_3300 where notes_3300.patient_id = dbo.insurance_deposits_3300.patient_id) as Payer,
	--dbo.Insurance_Deposits_3300.Payer, 
	(select top 1 biller from insurance_deposits_3300 where notes_3300.patient_id = dbo.insurance_deposits_3300.patient_id) as Biller,
	--dbo.Insurance_Deposits_3300.Biller, 
	--(select top 1  claim_seq from dbo.insurance_deposits_3300 where notes_3300.patient_id = dbo.Insurance_deposits_3300.patient_id) AS Claim, 
	--FLOOR(RAND()*(1000000-1)+1) as Claim, 
	dbo.notes_3300.clm as claim,
	dbo.notes_3300.note_type,
	dbo.notes_3300.Note AS Comments, 
    dbo.notes_3300.Patient_ID AS PatientId, 
	dbo.Agents.agent, 
	dbo.Agents.id AS AgentId, 
	dbo.notes_3300.InitialDate AS CommentDate

FROM dbo.notes_3300 
	LEFT OUTER JOIN dbo.Agents ON dbo.Agents.id  = dbo.notes_3300.web_id 
--	LEFT OUTER JOIN dbo.Insurance_Deposits_3300 ON dbo.notes_3300.Patient_ID = dbo.Insurance_Deposits_3300.Patient_ID
WHERE notes_3300.web_id is not null


GO 
alter view agenthistory2 as 
SELECT     (SELECT        TOP (1) DOS
					FROM            dbo.Insurance_Deposits_3300
					WHERE        (dbo.notes_3300_recent.Patient_ID = Patient_ID)) AS DOS,
           (SELECT        TOP (1) Payer
					FROM            dbo.Insurance_Deposits_3300
					WHERE        (dbo.notes_3300_recent.Patient_ID = Patient_ID)) AS Payer,
           (SELECT        TOP (1) Biller
					FROM            dbo.Insurance_Deposits_3300
					WHERE        (dbo.notes_3300_recent.Patient_ID = Patient_ID)) AS Biller, 
			dbo.notes_3300_recent.clm, 
			dbo.notes_3300_recent.Note_Type, 
			dbo.notes_3300_recent.Note AS Comments, 
			dbo.notes_3300_recent.Patient_ID AS PatientId, 
			dbo.Agents.agent, 
			dbo.Agents.id AS AgentId, 
			dbo.notes_3300_recent.InitialDate AS CommentDate
FROM dbo.notes_3300_recent 
		LEFT OUTER JOIN  dbo.Agents ON dbo.Agents.id = dbo.notes_3300_recent.web_id
--WHERE        (dbo.notes_3300.web_id IS NOT NULL) and dbo.notes_3300.InitialDate >= '2016-01-01' 

create view notes_3300_recent as 
select * from notes_3300
where initialDate >='2016-01-01' and web_id is not null

