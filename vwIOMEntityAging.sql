alter view vwIOMEntityAging as 

select 
	CE.patient_id, 
	CE.claim_seq, 
	CE.dos, 
	First_Name, 
	Last_Name, 
	[Claim Total Charge], 
	CE.Entity, 
	company1_id, 
	Payer as Payor, 
	CE.claim_date, 
	CAST(CDH.claim_date as smalldatetime) as [OriginalClaimDate],
	ins_folder,
	-datediff(day, getdate(),CDH.claim_date) as DaysOutstanding,
	/*case 
		when PIC.clm_billing_type is null then EL.clm_billing_type 
		else PIC.clm_billing_type end 
	as clm_billing_type,*/
	CASE 
			WHEN PIC.ins_charged >= 0 AND PIC.ins_charged <= .25 AND CE.ins_folder IS NOT NULL THEN 'CORRECTED CLAIM'
			WHEN PIC.clm_billing_type IS NULL THEN EL.clm_billing_type ELSE PIC.clm_billing_type 
			END AS clm_billing_type, 
	CR.Surgeon,
	CD.Box33, 
	vwmaster2.correctentity,
	CR.Biller,
	CR.[1st Insurance Category] as [InsuranceType],
	HL7.GroupID,
	(PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0)) as [Balance],
	(select top 1 ID.Date_collected from Insurance_Deposits_3300 as ID where ID.claim_id= PIC.claim_id Order by ID.Date_Collected ASC) as [First Collection],
	(select top 1 ID.Date_collected from Insurance_Deposits_3300 as ID where ID.claim_id= PIC.claim_id Order by ID.Date_Collected DESC) as [Last Collection],
	PIC.ins_collcted, 
	PIC.ins_charged, 
	PIC.ins_writte_off,
	el.[S#C] as [Surgeon Ownd],
	CR.Region_Short_Name,
	IL.insurancegroup  as [consolidated payor],
	(select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID) as TOTALCOLLECTED,
	CD.Method,
	IIF ( -datediff(day, getdate(),CE.claim_date) < 31 ,PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [0-30Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 61 and -datediff(day, getdate(),CE.claim_date) >= 31 ,PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [31-60Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 91 and -datediff(day, getdate(),CE.claim_date) >= 61 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [61-90Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 121 and -datediff(day, getdate(),CE.claim_date) >= 91 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [91-120Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 151 and -datediff(day, getdate(),CE.claim_date) >= 121 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [121-150Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 181 and -datediff(day, getdate(),CE.claim_date) >= 151 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [151-180Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 211 and -datediff(day, getdate(),CE.claim_date) >= 181 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [181-210Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 241 and -datediff(day, getdate(),CE.claim_date) >= 211 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [211-240Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 271 and -datediff(day, getdate(),CE.claim_date) >= 241 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [241-270Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 301 and -datediff(day, getdate(),CE.claim_date) >= 271 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [271-300Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 331 and -datediff(day, getdate(),CE.claim_date) >= 301 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [301-330Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 361 and -datediff(day, getdate(),CE.claim_date) >= 331 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [331-360Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 721 and -datediff(day, getdate(),CE.claim_date) >= 361 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [361-721Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 1082 and -datediff(day, getdate(),CE.claim_date) >= 721 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [722-1082Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) > 1083,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [1083+Days],
	IIF ( -datediff(day, getdate(),CE.claim_date) < 31 , 1,  0 ) AS [0-30DaysCnt],
	IIF ( -datediff(day, getdate(),CE.claim_date) >= 31 and -datediff(day, getdate(),CE.claim_date) <= 38 ,1,  0) AS [31-38DaysCnt],
	IIF ( -datediff(day, getdate(),CE.claim_date) >= 39 and -datediff(day, getdate(),CE.claim_date) < 121 ,1,  0) AS [39-120DaysCnt],
	IIF ( -datediff(day, getdate(),CE.claim_date) >= 121 ,1, 0 ) AS [120+DaysCnt],
	(select max(initialdate) from notes_3300 where notes_3300.clm = CE.claim_seq) as LastClaimNoteDate,
	datediff(day, (select max(initialdate) from notes_3300 where notes_3300.clm = CE.claim_seq),getdate()) as DaysSinceLastClaimNote,
	nt.initialdate,
	nt.note_type,
	nt.note,
	nt.clm, 
/*	nt2.initialdate as LastPatientOnlyNoteDate,
	nt2.note as LastPatientOnlyNote,*/
	(select max(initialdate) from notes_3300 where notes_3300.patient_id = CE.patient_id) as LastPatientNoteDate,
	datediff(day, (select max(initialdate) from notes_3300 where notes_3300.patient_id = CE.patient_id),getdate()) as DaysSinceLastPatientNote

from claim_entity_3300 as CE
	LEFT OUTER JOIN patient_insurance_charges_3300 as PIC on ce.claim_seq = pic.claim_id
	LEFT OUTER JOIN entitylookup as EL on PIC.client_name = EL.client_name
	LEFT OUTER JOIN case_report_3300 as CR on CE.patient_id = CR.PID
	LEFT OUTER JOIN claim_det_33300 as CD on CD.claim_id = CE.claim_seq
	LEFT OUTER JOIN insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
	LEFT OUTER JOIN vwhl7_Raw as HL7 on HL7.patient_id = CR.PID
	LEFT OUTER JOIN (select claim_seq, min(claim_date) as claim_date from claimdatehistory group by claim_seq) cdh on cdh.claim_seq =  CE.claim_seq 
	LEFT OUTER JOIN notes_3300 as nt on nt.billing_notes_id = 
			(select top 1 billing_notes_id 
			from notes_3300 
			where notes_3300.patient_id = ce.patient_id 
				AND note is not null
			--	AND (clm is null or clm = 0)
				order by initialdate desc)
	LEFT OUTER JOIN vwMaster2 on ce.claim_seq = vwmaster2.claim_id
	/*LEFT OUTER JOIN notes_3300 as nt2 on nt.billing_notes_id = 
			(select top 1 billing_notes_id 
			from notes_3300 
			where notes_3300.clm = ce.claim_seq 
				AND note is not null
			--	AND clm = 0
				order by initialdate desc)*/

where ins_folder = 'Ongoing Insurance Billing'
	and CE.claim_date is not null
	and CE.claim_date >= '2013-01-01'

	/*
	select  max(initialdate), clm from notes_3300 group by clm
	select * from vwIOMEntityAging
select * from claim_entity_3300 as ce 
	left outer join notes_3300 on notes_3300.billing_notes_id = (
    select top 1 billing_notes_id from notes_3300
    where notes_3300.clm = ce.claim_seq
    order by initialdate desc
)

select top 1 * from notes_3300
select * from users join widgets on widgets.id = (
    select id from widgets
    where widgets.user_id = users.id
    order by initialdate desc
    limit 1

	select count(*) from notes_3300 where clm is null
	select count(*) from notes_3300 where clm = 0   =''
)*/
