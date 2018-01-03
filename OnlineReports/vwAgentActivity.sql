ALTER VIEW vwAgentActivity as 
SELECT DISTINCT dbo.Agents.agent, dbo.notes_3300.InitialDate AS NoteDate, dbo.notes_3300.Patient_ID
FROM            dbo.notes_3300 LEFT OUTER JOIN
                         dbo.Agents ON dbo.notes_3300.web_id = dbo.Agents.id
GROUP BY dbo.Agents.agent, dbo.notes_3300.InitialDate, dbo.notes_3300.Patient_ID

/*select distinct agent from vwAgentActivity where notedate > '2015-10-01'

select distinct field_changed from history_3300 where date_changed > '2015-10-01' and field_changed not like '%Claim#%'

select * from agents

select distinct cuser_name, changed_by from history_3300 where cuser_name like '%Guerr%'
select * from agents

select top 10 * from history_3300
-- ===================================================
Alter View Agents as
SELECT DISTINCT cuser_name AS agent, changed_by AS id
FROM            dbo.history_3300
WHERE        (changed_by IN (3287, 1490, 2918, 2946, 5450,5980,6012,6195,5807,5340,5905,6076,6273,5755))
*/



