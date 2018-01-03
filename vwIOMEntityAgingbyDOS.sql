alter view vwIOMEntityAgingbyDOS as 

select 
	CE.patient_id, claim_seq, CE.dos, First_Name, Last_Name, [Claim Total Charge], CE.Entity, company1_id, Payer as Payor, claim_date, ins_folder,
	-datediff(day, getdate(),CE.DOS) as DaysOutstandingDOS,
/*	case 
		when PIC.clm_billing_type is null then EL.clm_billing_type 
		else PIC.clm_billing_type end 
	as clm_billing_type,*/
	CASE 
			WHEN PIC.ins_charged >= 0 AND PIC.ins_charged <= .25 AND CE.ins_folder IS NOT NULL THEN 'CORRECTED CLAIM'
			WHEN PIC.clm_billing_type IS NULL THEN EL.clm_billing_type ELSE PIC.clm_billing_type 
			END AS clm_billing_type, 
	CR.Surgeon,
	CD.Box33, 
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
	CASE
		WHEN (select sum(eob) from collect_detail_3300 where claim_seq = CE.claim_seq) IS NOT null
			THEN
				(select sum(eob) from collect_detail_3300 where claim_seq = CE.claim_seq)
				- PIC.ins_writte_off 
				- (SELECT        SUM(Payment_Collected) AS Expr1
									FROM            dbo.Insurance_Deposits_3300 AS ID
									WHERE        (claim_id = PIC.claim_id)) 
			ELSE 0
		END AS [A/R Balance], 
	CD.Method,
	IIF ( -datediff(day, getdate(),CE.DOS) < 31 ,PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [0-30Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 61 and -datediff(day, getdate(),CE.DOS) >= 31 ,PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [31-60Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 91 and -datediff(day, getdate(),CE.DOS) >= 61 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [61-90Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 121 and -datediff(day, getdate(),CE.DOS) >= 91 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [91-120Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 151 and -datediff(day, getdate(),CE.DOS) >= 121 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [121-150Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 181 and -datediff(day, getdate(),CE.DOS) >= 151 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [151-180Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 211 and -datediff(day, getdate(),CE.DOS) >= 181 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [181-210Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 241 and -datediff(day, getdate(),CE.DOS) >= 211 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [211-240Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 271 and -datediff(day, getdate(),CE.DOS) >= 241 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [241-270Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 301 and -datediff(day, getdate(),CE.DOS) >= 271 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [271-300Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 331 and -datediff(day, getdate(),CE.DOS) >= 301 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [301-330Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 361 and -datediff(day, getdate(),CE.DOS) >= 331 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [331-360Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 721 and -datediff(day, getdate(),CE.DOS) >= 361 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [361-721Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 1082 and -datediff(day, getdate(),CE.DOS) >= 721 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [722-1082Days],
	IIF ( -datediff(day, getdate(),CE.DOS) > 1083,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3300 as ID where ID.Claim_id=PIC.claim_ID),0) ,  0 ) AS [1083+Days],
	IIF ( -datediff(day, getdate(),CE.DOS) < 31 , 1,  0 ) AS [0-30DaysCnt],
	IIF ( -datediff(day, getdate(),CE.DOS) >= 31 and -datediff(day, getdate(),CE.DOS) <= 38 ,1,  0) AS [31-38DaysCnt],
	IIF ( -datediff(day, getdate(),CE.DOS) >= 39 and -datediff(day, getdate(),CE.DOS) < 121 ,1,  0) AS [39-120DaysCnt],
	IIF ( -datediff(day, getdate(),CE.DOS) >= 121 ,1, 0 ) AS [120+DaysCnt],
	nt.initialdate,
	nt.note_type,
	nt.note,
	nt.clm, 
	(select max(initialdate) from notes_3300 where notes_3300.patient_id = CE.patient_id) as LastPatientNoteDate,
	datediff(day, (select max(initialdate) from notes_3300 where notes_3300.patient_id = CE.patient_id),getdate()) as DaysSinceLastPatientNote


from claim_entity_3300 as CE
	LEFT OUTER JOIN patient_insurance_charges_3300 as PIC on ce.claim_seq = pic.claim_id
	LEFT OUTER JOIN entitylookup as EL on PIC.client_name = EL.client_name
	LEFT OUTER JOIN case_report_3300 as CR on CE.patient_id = CR.PID
	LEFT OUTER JOIN claim_det_33300 as CD on CD.claim_id = CE.claim_seq
	LEFT OUTER JOIN insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
	LEFT OUTER JOIN vwhl7_Raw as HL7 on HL7.patient_id = CR.PID
	LEFT OUTER JOIN notes_3300 as nt on nt.billing_notes_id = 
			(select top 1 billing_notes_id from notes_3300  where notes_3300.patient_id = ce.patient_id  order by initialdate desc)
	
where ins_folder = 'Ongoing Insurance Billing'
	and CE.DOS is not null
	and CE.DOS >= '2013-01-01'

--order by DaysOutstanding desc

--select * from vwIOMEntityAging