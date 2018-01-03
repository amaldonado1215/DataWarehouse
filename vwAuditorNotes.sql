alter view vwAuditorNotes as 


select NOTES.*, vwCases.Tech, vwCases.Auditor, vwCases.DOS, vwCases.Region_Short_Name as Region
from notes_3300 as NOTES
	LEFT OUTER JOIN vwcases on vwCases.PID = NOTES.patient_id
where NOTES.note_type in ('Auditor Notes','PO Comments','QA Comments')


