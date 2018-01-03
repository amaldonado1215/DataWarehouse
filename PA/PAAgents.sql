alter view paagents as 
SELECT DISTINCT cuser_name AS agent, changed_by AS id
FROM          dbo.history_3350
--WHERE        (changed_by IN (6457,7040,7039))


--select * from history_3350 where cuser_name like '%Patillo%'

--ticket 1940 lauren
--select * from history_3350 where cuser_name like '%aretha%'