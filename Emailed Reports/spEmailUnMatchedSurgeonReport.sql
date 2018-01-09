

ALTER PROCEDURE spEmailUnMatchedSurgeons

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched Surgeons Report'


SET @xml = CAST(( SELECT [Surgeon] AS 'td','',region AS 'td'
	FROM  vwValidationCheckUnmatchedSurgeons ORDER BY surgeon
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Unmatched Surgeons Report</H3>
<table border = 1> 
<tr>
<th> Surgeon </th> <th>Region </th></tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
Else
BEGIN
SET @body = 'There are no Unmatched Surgeons'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;allie.robert@nationalneuro.net;lizette.morin@md-management.net;Bobby.Smith2@md-management.net;Henry.Hays@md-management.net;Angela.Leigh@nationalneuro.net;Brandi.Milligan@mpowerpractice.net;Matthew.Nartz@md-management.net', 
@subject = @subjectline;
