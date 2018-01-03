/*******PRO QUERY**********************/
ALTER VIEW vwAppealNotesPro as 
select distinct bn.*, vwcases.dos, vwcases.region_short_name as region, vwcases.defaultentity, [primary insurance], 
	[1st insurance category], CorrectProEntity, notes_3300.initialdate, notes_3300.note, notes_3300.note_type
from 
	(
	select distinct max(billing_notes_id) as billing_notes_id, patient_id
	from notes_3300 
	where note_type in ('First Level Appeal Pro', 'Second Level Appeal Pro', 'Third Level  Appeal Pro')
	group by patient_id 
	) bn 
LEFT OUTER JOIN vwcases on vwcases.pid = bn.patient_id
LEFT OUTER JOIN notes_3300 on notes_3300.billing_notes_id = bn.billing_notes_id
/*******TECH QUERY**********************/
ALTER VIEW vwAppealNotesTech as 
select distinct bn.*, vwcases.dos, vwcases.region_short_name as region, vwcases.defaultentity, [primary insurance], 
	[1st insurance category], CorrectProEntity, notes_3300.initialdate, notes_3300.note, notes_3300.note_type
from 
	(
	select distinct max(billing_notes_id) as billing_notes_id, patient_id
	from notes_3300 
	where note_type in ('First Level Appeal Tech', 'Second Level Appeal Tech', 'Third Level  Appeal Tech')
	group by patient_id 
	) bn 
LEFT OUTER JOIN vwcases on vwcases.pid = bn.patient_id
LEFT OUTER JOIN notes_3300 on notes_3300.billing_notes_id = bn.billing_notes_id

/*********PA QUERY************************/
ALTER VIEW vwAppealNotesPA as 
select distinct bn.*, vwPAcases.dos, vwPAcases.region_short_name as region, vwPAcases.defaultentity, [primary insurance], 
	[1st insurance category], CorrectEntity, notes_3350.initialdate, notes_3350.note, notes_3350.note_type
from 
	(
	select distinct max(billing_notes_id) as billing_notes_id, patient_id
	from notes_3350 
	where note_type like '%Appeal%' --in ('First Level Appeal Tech', 'Second Level Appeal Tech', 'Third Level  Appeal Tech')
	group by patient_id 
	) bn 
LEFT OUTER JOIN vwPAcases on vwPAcases.pid = bn.patient_id
LEFT OUTER JOIN notes_3350 on notes_3350.billing_notes_id = bn.billing_notes_id
