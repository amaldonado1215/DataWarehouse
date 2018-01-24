-- vwPAMaster for company 3500
alter view vwPAMaster as 
select CR.PID, 
		cast(CR.DOS as smalldatetime) as DOS,  
		PIC.claim_id, 
		PIC.client_name, 
		CR.Patient, 
		CR.Surgeon, 
		rtrim(SL.Entity) as DefaultEntity,
		CR.Hospital, 
		CR.[Primary Insurance],
		CR.[1st Insurance Category] as [Insurance Type],
		CR.Tech,
		case 
			when PIC.ins_charged >= 0 
				and PIC.ins_charged <=.25 
				and (CE.ins_folder in('Ongoing Insurance Billing','Closed Billing Claims','Refile Claims'))  
				then 'CORRECTED CLAIM' --2016-04-18 to include all claims up to .25
			when PIC.ins_charged <= 100 and PIC.ins_charged > 0 then 'MED REC'
			when PIC.clm_billing_type is null then 'Pro Only'
			else PIC.clm_billing_type end as clm_billing_type,
		cr.[Procedure Type],
		PIC.ins_collcted, 
		PIC.ins_charged, 
		PIC.ins_writte_off,
		CE.claim_closed_date,
		CR.Region_Short_Name,
		CR.Reader,
		IL.insurancegroup  as [consolidated payor],
		HL7.GroupID,
		CR.biller, 
		CE.biller as claimbiller,
		SL.surgeonownd,
		sl.iomsurgeonname,
		cast(CE.claim_date as smalldatetime) as [Claim Date], 
		CAST(CDH.claim_date as smalldatetime) as [OriginalClaimDate],
		(select top 1 ID.Payer from Insurance_Deposits_3350 as ID where ID.claim_id= PIC.claim_id) as [Payor From],
		(select top 1 ID.Date_collected from Insurance_Deposits_3350 as ID where ID.claim_id= PIC.claim_id and payment_Collected <> 0 Order by ID.Date_Collected ASC) as [First Collection],
		(select top 1 ID.Date_collected from Insurance_Deposits_3350 as ID where ID.claim_id= PIC.claim_id and payment_Collected <> 0  Order by ID.Date_Collected DESC) as [Last Collection],
		case
			when (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2015) = 0 then null
			else (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2015)
			end
			as [2015 PYMT],
		case
			when (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2016) =0 then null
			else (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2016)
			end
			as [2016 PYMT],
		case
			when (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2017) =0 then null
			else (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2017)
			end
			as [2017 PYMT],
		case
			when (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2018) =0 then null  -- ticket 28 kta
			else (select sum(ID.Payment_Collected) from Insurance_deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and year(ID.Date_Collected) = 2018)
			end
			as [2018 PYMT],
		case
			when (select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID) = 0 then null
			else (select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID)
			end
		    as [Total Collection],
		(COALESCE (PIC.ins_charged,0) - COALESCE(PIC.ins_writte_off,0) - COALESCE ((select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID),0)) as [Balance],
		(select sum(eob) from collect_detail_3350 where claim_seq = PIC.claim_id) as AllowedAmt,
		
		CD.Box33 as Box33,
		CD.Method as ClaimMethod,
--		Case
--				when CE.ins_folder in ('Ongoing Insurance Billing','Closed Billing Claims') then  CD.Box33
--				when CR.[1st Insurance Category] in ('Lein Case','Letter of Protection','Private Insurance') then SL.Entity
--				when CR.DOS <'2015-07-23' then 'NPPA Services'
--				when CR.DOS >='2015-07-23' then 'Precision Assist'
--				else SL.Entity
--				end
--				as Entity,
		Case
				-- ***** IMPORTANT ****** MUST MAKE CHANGES ON vwPACases as well !!!! 
				-- *****			   ** AND COPY TO SHS-DB1 VIEWS !!
				when clm_billing_type = 'Med Rec' then 'Acquisition Billing Services'
				WHEN PIC.claim_id = 832753 THEN 'NPPA Services' -- Ticket 2319 lauren
				WHEN PIC.claim_id in( 715321,838148, 842859) then 'NPPA Services'
				WHEN PIC.claim_id in (842862) THEN 'Facilitate Surgical, PLLC'
				WHEN PIC.claim_id in (421133,434599,421134,424849,424854,424857,424858,436028,447142,447148,447149,447152,
										447684,458992,459036,460676,460678,460682,460690,460694,460713,460796,460802,473130,
										473128,473125,473123,473119) THEN 'NPPA Services'	-- added w/ DR no ticket

				when cr.dos > '2016-12-31' and (cr.tech like '%CSFA%' or cr.tech like '%LSA%') then 'Precision Assist of Dallas'--ticket 18 kta  
				when cr.DOS > '2016-12-31'  and cr.Tech like 'Steve Greer%' or cr.Tech like 'Jerold Greer%' then 'Precision Assist of Dallas'

				WHEN sl.ContractType = 'Hybrid' and cr.[1st Insurance Category] = 'Blue Cross Blue Shield'  and RL.Status = 'SurgeonPA' then rtrim(SL.Entity)  --#30 kta
				
				when cr.surgeon = 'Sean Jones-Quaidoo, M.D.' and cr.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity)
				When cr.surgeon = 'Josue Gabriel, M.D.' and cr.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity)
				when cr.tech = 'Jose Fuentez, PA-C'and cr.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity) --ticket 2375 lauren
		--ticket 2271 lauren: For all encounters in this year, when the surgeon is Adam Bruggeman, M.D. 
		--and the Tech is Kim Stewart, and the 1st ins type = BCBS then the case defers to SL  else NPPA (current default)
	
		--#30 kta		when CR.DOS >= '2017-01-01' and CR.Surgeon = 'Adam Bruggeman, M.D.' and cr.tech in ('Kim Stewart, PA-C','Kimberly Stewart, MPAS, PA-C') and CR.[1st Insurance Category] = 'Blue Cross Blue Shield' then rtrim(SL.Entity) --ticket 2402
				when cr.dos < '2017-01-01' and CR.Surgeon = 'Adam Bruggeman, M.D.' and CR.[1st Insurance Category] = 'Blue Cross Blue Shield' then SL.Entity --ticket 2491 lauren
				when CR.Surgeon = 'Mark Parrella, M.D.' and CR.[1st Insurance Category] = 'Blue Cross Blue Shield' then SL.Entity
				when ins_charged < 100 and box33 = 'Acquisition Billing Services' then 'Acquisition Billing Services'
				
				when CR.DOS <'2017-10-01' and CR.surgeon = 'Edward Seade, M.D.' and cr.[1st Insurance Category] = 'Letter of Protection'  then 'NPPA Services' --ticket 2386 lauren
		--ticket 2246 lauren: If the surgeon = Adam Bruggeman, M.D. and the Insurance Type = Letter of Protection,
		--and the Tech does not equal "Kim Stewart, PA-C" then the correct entity is NPPA Services
				when cr.surgeon = 'Adam Bruggeman, M.D.' and cr.[1st Insurance Category] = 'Letter of Protection' and cr.tech <> 'Kim Stewart, PA-C' then 'NPPA Services'
				--when CE.claim_date > '2017-01-31' then 'NPPA Services'
				when CR.[1st Insurance Category] in ('Lein Case','Letter of Protection','Private Insurance') then rtrim(SL.Entity)--ticket 2354 un-do 2320
				--when CR.[1st Insurance Category] in ('Lein Case','Private Insurance') then rtrim(SL.Entity)
				--when CR.[1st Insurance Category] = 'Letter of Protection' and CR.DOS < '2017-07-07' then rtrim(SL.Entity)
				--when CR.DOS >='2017-07-07' and CR.[1st Insurance Category] = 'Letter of Protection' then 'NPPA Services' --ticket 2320 lauren
				when CR.DOS <'2015-07-23' and CR.Region_Short_Name = 'PA - South Texas' then 'Precision Assist of San Antonio'
				when CR.DOS <'2015-07-23' and CR.Region_Short_Name = 'PA - Austin' then 'Precision Assist of San Antonio'
				when CR.DOS <'2015-07-23' and CR.Region_Short_Name = 'PA - DFW' then 'Precision Assist of Dallas'
				when CR.DOS >='2015-07-23' then 'NPPA Services'
				else rtrim(SL.Entity)
				end
				as CorrectEntity,

		CE.ins_folder as Folder,
		case 
				when CE.ins_folder = 'Closed Billing Claims' then 'Closed'
				when (PIC.ins_charged - PIC.ins_writte_off - (select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID)) < 0 Then 'Over Paid'
				when (PIC.ins_charged - PIC.ins_writte_off - (select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID)) = 0 Then 'Paid'
				when PIC.ins_collcted > 0 and  CE.ins_folder = 'Ongoing Insurance Billing' then 'Partially Paid'  
				when (select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID) > 0 and CE.ins_folder = 'Ongoing Insurance Billing' then 'Partially Paid'  
				when PIC.ins_charged > 0  and ins_folder not in ('New Insurance Billing', 'Pending Clearinghouse') then 'Billed' 
				when CR.[1st Insurance Category] = 'Medicare' AND CR.DOS >= '2016-01-01' THEN 'Billable'
				when CR.[1st Insurance Category] in ('Medicaid','Medicaid Advantage Plan') then 'Unbillable'
			--	WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' THEN 'Unbillable: TRI-MRP-CHAMPVA'
				when PIC.clm_billing_type = 'Tech Only' then 'Unbillable'
				when CR.DOS > getdate() then 'Future'
				else 'Not Billed' 
				end
				as BillStatus,

		case 
				when CE.ins_folder = 'Closed Billing Claims' then 'Closed' 
				when CE.ins_folder = 'Ongoing Insurance Billing' and CR.[1st Insurance Category] not in ('Medicaid','Medicare')then 'Open' 
				when PIC.ins_charged > 0  and ins_folder not in ('New Insurance Billing', 'Pending Clearinghouse') then 'Billed' 
				when CR.[1st Insurance Category] = 'Medicare' AND CR.DOS >= '2016-01-01' THEN 'Billable'
				when CR.[1st Insurance Category] in ('Medicaid','Medicaid Advantage Plan') then 'Unbillable'
			--	WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' THEN 'Unbillable: TRI-MRP-CHAMPVA'
				when PIC.clm_billing_type = 'Tech Only' then 'Unbillable'
				when CE.ins_folder = 'Ongoing Insurance Billing'  then 'Open'
				when CR.DOS > getdate() then 'Future'
				else 'UnBilled' 
				end
				as BillStatusDisplay,
	--   Amount Aging Buckets
		IIF ( -datediff(day, getdate(),CE.claim_date) < 31 ,PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and payment_collected>0),0) ,  0 ) AS [0-30Days],
		IIF ( -datediff(day, getdate(),CE.claim_date) < 61 and -datediff(day, getdate(),CE.claim_date) >= 31 ,PIC.ins_charged - PIC.ins_writte_off - isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and payment_collected>0),0) ,  0 ) AS [31-60Days],
		IIF ( -datediff(day, getdate(),CE.claim_date) < 91 and -datediff(day, getdate(),CE.claim_date) >= 61 ,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and payment_collected>0),0) ,  0 ) AS [61-90Days],
		IIF ( -datediff(day, getdate(),CE.claim_date) > 90,PIC.ins_charged - PIC.ins_writte_off -  isnull((select sum(ID.Payment_Collected) from Insurance_Deposits_3350 as ID where ID.Claim_id=PIC.claim_ID and payment_collected>0),0) ,  0 ) AS [90+Days],
	--  Count Aging Buckets		
		IIF ( -datediff(day, getdate(),CE.claim_date) < 31 , 1,  0 ) AS [0-30DaysCnt],
		IIF ( -datediff(day, getdate(),CE.claim_date) >= 31 and -datediff(day, getdate(),CE.claim_date) <= 38 ,1,  0) AS [31-38DaysCnt],
		IIF ( -datediff(day, getdate(),CE.claim_date) >= 39 and -datediff(day, getdate(),CE.claim_date) < 121 ,1,  0) AS [39-120DaysCnt],
		IIF ( -datediff(day, getdate(),CE.claim_date) >= 121 ,1, 0 ) AS [120+DaysCnt],
	--	(select top 1 note from notes_3350 where notes_3350.patient_id = ce.claim_seq order by initialdate desc) as LastClaimNote,
		(select top 1 note from notes_3350 where notes_3350.patient_id = CR.PID order by initialdate desc) as LastPatientNote,
		(select top 1 note_type from notes_3350 where notes_3350.patient_id = CR.PID order by initialdate desc) as LastPatientNoteType,
		(select max(initialdate) from notes_3350 where notes_3350.patient_id = CE.patient_id) as LastPatientNoteDate,
		(select min(initialdate) from notes_3350 where notes_3350.patient_id = CE.patient_id and Note_Type IN ('Claim Moved','Clearing House')) as InitialDate

from case_report_3350 as CR
	LEFT OUTER JOIN claim_entity_3350 as CE on CE.patient_id = CR.PID
	LEFT OUTER JOIN claim_det_3350 as CD on CD.claim_id = CE.claim_seq
	LEFT OUTER JOIN patient_insurance_charges_3350 as PIC on ce.claim_seq = pic.claim_id
	LEFT OUTER JOIN insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
	LEFT OUTER JOIN PAsurgeonlookup as SL on CR.surgeon = SL.Surgeon and CR.dos >= sl.startdate and CR.dos<= sl.enddate
	LEFT OUTER JOIN vwPA_hl7_Raw as HL7 on HL7.patient_id = CR.PID
	LEFT OUTER JOIN (select claim_seq, min(claim_date) as claim_date from claimdatehistorypa group by  claim_seq) cdh on cdh.claim_seq =  CE.claim_seq 
	LEFT OUTER JOIN PARegionLookup as RL on RL.PA = CR.Tech  --#30 kta

/*	LEFT OUTER JOIN notes_3350 as nt on nt.billing_notes_id = 
		(select top 1 billing_notes_id from notes_3350 where notes_3350.clm = ce.claim_seq order by initialdate desc)
	LEFT OUTER JOIN notes_3350 as nt2 on nt.billing_notes_id = 
		(select top 1 billing_notes_id from notes_3350 where notes_3350.patient_id = ce.patient_id order by initialdate desc)
*/
where CR.dos > '2015-01-01' 
	and CR.Cancelled <> 'Yes'
	and CR.Deleted <> 'Yes'
	and ( CE.ins_folder <> 'Deleted Claims' or CE.ins_folder is null)

--ticket 2196 lauren
--comment out WHEN CR.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND CR.DOS >= '2017-01-01' THEN 'Unbillable: TRI-MRP-CHAMPVA'
-- in billstatus field also:
--for DOS 01-01-2016 when (1st Insurance Category) in ("Medicare") the case is now billable, so add:
--when CR.[1st Insurance Category] = 'Medicare' and AND CR.DOS >= '2016-01-01' THEN 'Billable' and take Medicare out of:
--when CR.[1st Insurance Category] in ('Medicaid','Medicare','Medicaid Advantage Plan') then 'Unbillable' and make it just:
--when CR.[1st Insurance Category] in ('Medicaid','Medicaid Advantage Plan') then 'Unbillable'