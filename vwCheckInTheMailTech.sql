﻿alter view vwCheckINtheMailTech as 
select notes_3300.patient_id, 
		note_type, 
		note, 
		max(initialdate) as initialdate, 
		tblmaster2.dos, 
		tblmaster2.claim_id, 
		tblmaster2.[consolidated payor], 
		tblmaster2.claimbiller, 
		tblmaster2.box33, 
		tblmaster2.folder,
		(select top 1 date_collected 
				from vwInsuranceDeposits2 
				where vwInsuranceDeposits2.claim_seq = tblmaster2.claim_Id  and payment_collected > 0 
				order by date_collected desc) as date_collected,
		(select top 1 dailycollected 
				from (select claim_seq, patient_id dos, date_collected, sum(payment_collected) as DailyCollected 
						from vwInsuranceDeposits2 
						group by claim_seq, patient_id, dos, date_collected) b 
						where b.claim_seq = tblmaster2.claim_id and dailycollected > 0 order by date_collected desc ) as Payment_amount
from notes_3300 
	left outer join tblmaster2 on tblmaster2.pid = notes_3300.patient_id
where note_type = 'Check in mail-Tech'
group by
	notes_3300.patient_id,
	note_type,
	note,
	tblmaster2.dos, 
	tblmaster2.claim_id, 
	tblmaster2.[consolidated payor], 
	tblmaster2.claimbiller, 
	tblmaster2.box33, 
	tblmaster2.folder



