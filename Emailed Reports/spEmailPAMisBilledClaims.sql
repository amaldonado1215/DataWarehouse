alter procedure spEmailPAMisBilledClaims as 

DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'Misbilled PA Claims Report'


SET @xml = CAST(( SELECT CONVERT(VARCHAR(10),[claim date],1) AS 'td','', CONVERT(VARCHAR(10),DOS,1) AS 'td','',
       PID AS 'td','', Surgeon as 'td','', [Insurance Type] as 'td','',box33 as 'td','',correctentity AS 'td','',DaysClaimed as 'td'
FROM  vwPAMisbilledClaims where DaysClaimed <30 ORDER BY DaysClaimed ASC
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

if len(@xml) > 0
BEGIN


SET @body ='<html><body><H3>MisBilled PA Claims Report</H3>
<table border = 1> 
<tr>
<th> Claim Date </th> <th>DOS </th> <th> PID </th> <th> Surgeon </th><th>InsuranceType</th> <th> box33 </th> <th>Correct Entity</th><th>DaysClaimed</th></tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
ELSE
BEGIN

SET @body = 'There are no MisBilled PA Claims'
SET @subjectline = @subjectline + ' - NONE'
END


EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;Kim.Anderson@md-management.net;Matthew.Nartz@md-management.net;Ryan.LaRoque@precisionassist.us;lisa.weldon@acquisitionbilling.com;roshan.shah@precisionassist.net;michelle.silva@acquisitionbilling.com;sandra.garcia@acquisitionbilling.com;Angelica.Maldonado@mpowerpractice.net',
@subject = @subjectline ;

--@recipients = 'alla.kosova@md-management.net;scott@nationalneuro.net;Ryan.LaRoque@nationalneuro.net;angelica.maldonado@md-management.net;thomas.herrera@acquisitionbilling.com;sandra.garcia@acquisitionbilling.com;michelle.silva@acquisitionbilling.com;Makeba.Potter@md-management.net;Bill.Murray@md-management.net;Kim.Anderson@md-management.net;Roshan.Shah@precisionassist.us;Deborah.Reinagel@md-management.net;lisa.weldon@acquisitionbilling.com', 
--@recipients = 'Deborah.Reinagel@md-management.net;Kim.Anderson@md-management.net;Matthew.Nartz@md-management.net', -- removed ticket  #39 kta
--ticket 2030 Lauren, per Deborah, add Kim.Anderson@md-management.net; Roshan.Shah@precisionassist.us
--ticket 2044, and kim and deborah.  but kim already on?  changing to be all one line again and see if that solves it
--ticket 2063, lauren, adding lisa.weldon@acquisitionbilling.com
--@recipients = 'Deborah.Reinagel@md-management.net;Kim.Anderson@md-management.net;Matthew.Nartz@md-management.net;Ryan.LaRoque@precisionassist.us;lisa.weldon@acquisitionbilling.com;roshan.shah@precisionassist.net;michelle.silva@acquisitionbilling.com;sandra.garcia@acquisitionbilling.com',


