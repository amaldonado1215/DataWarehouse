alter procedure spEmailMisBilledClaimsIOMABS_DFW as 

DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)

SET @subjectline = 'Misbilled IOM Claims ABS-DFW Report'

SET @xml = CAST(( SELECT CONVERT(VARCHAR(10),claimdate,1) AS 'td','', CONVERT(VARCHAR(10),DOS,1) AS 'td','',
       PID AS 'td','', Surgeon as 'td','', [Insurance Type] as 'td','',box33 as 'td','',correctentity AS 'td','',DaysClaimed as 'td'
FROM  vwMisbilledIOMClaimsABS_DFW where DaysClaimed <30 ORDER BY DaysClaimed ASC
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>MisBilled IOM Claims ABS-DFW Report < 30 days</H3>
<table border = 1> 
<tr>
<th> ClaimDate </th> <th>DOS </th> <th> PID </th> <th> Surgeon </th><th>InsuranceType</th> <th> box33 </th> <th>Correct Entity</th><th>DaysClaimed</th></tr>'    

SET @body = @body + @xml +'</table></body></html>'
END
ELSE
BEGIN

SET @body = 'There are no MisBilled IOM Claims in the last 30 days.'
SET @subjectline = @subjectline + ' - NONE'
END


EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;angelica.maldonado@md-management.net;terry.lee@acquisitionbilling.com;Timothy.DeLong@Acquisitionbilling.com;michelle.silva@Acquisitionbilling.com;lisa.mitchell@acquisitionbilling.com;Matthew.Nartz@md-management.net', -- replace with your email address
@subject = @subjectline ;

--ticket 1936, add kierra.baker@acquisitionbilling.com
--ticket 1995, add Timothy.DeLong@Acquisitionbilling.com,  michelle.silva@Acquisitionbilling.com
--ticket 2341, remove kierra.baker@acquisitionbilling.com


