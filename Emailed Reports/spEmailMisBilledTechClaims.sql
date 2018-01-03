alter procedure spEmailMisBilledTechClaims as 

DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)

SET @subjectline = 'Misbilled Tech Claims'

SET @xml = CAST(( SELECT CONVERT(VARCHAR(10),claimdate,1) AS 'td','', CONVERT(VARCHAR(10),DOS,1) AS 'td','',
       PID AS 'td','', Surgeon as 'td','', [Insurance Type] as 'td','',box33 as 'td','',defaulttechentity AS 'td','',DaysClaimed as 'td'
FROM  vwTechMisbilledClaims where DaysClaimed <30 ORDER BY DaysClaimed ASC
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>MisBilled Tech Claims Report < 30 days</H3>
<table border = 1> 
<tr>
<th> ClaimDate </th> <th>DOS </th> <th> PID </th> <th> Surgeon </th><th>InsuranceType</th> <th> box33 </th> <th>Default Tech Entity</th><th>DaysClaimed</th></tr>'    

SET @body = @body + @xml +'</table></body></html>'
END
ELSE
BEGIN

SET @body = 'There are no MisBilled Tech Claims in the last 30 days.'
SET @subjectline = @subjectline + ' - NONE'
END


EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net', -- replace with your email address
@subject = @subjectline ;


