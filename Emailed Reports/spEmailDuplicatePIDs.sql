ALTER PROCEDURE spEmailDuplicatePIDs

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'Duplicate PIDs Report'


SET @xml = CAST(( SELECT [PID] AS 'td'
	FROM  vw_validationVwcasesPIDsDuplicates ORDER BY PID
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Duplicate PIDs Report</H3>
<table border = 1> 
<tr>
<th> Surgeon </th> </tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
Else
BEGIN
SET @body = 'There are no duplicates'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;Angelica.Maldonado@md-management.net;Matthew.Nartz@md-management.net', 
@subject = @subjectline;

GO
