

ALTER PROCEDURE spEmailPAUnMatchedSurgeons

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched Surgeons Report'


SET @xml = CAST(( SELECT [Surgeon] AS 'td'
	FROM  vwPAValidationCheckUnMatchedSurgeons ORDER BY surgeon
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Unmatched PA Surgeons Report</H3>
<table border = 1> 
<tr>
<th> Surgeon </th> </tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
Else
BEGIN
SET @body = 'There are no Unmatched Surgeons'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;Angelica.Maldonado@md-management.net;Kim.Anderson@md-management.net;Roshan.Shah@precisionassist.us', --;Alissa.Fisher@md-management.net;allie.robert@nationalneuro.net', 
@subject = @subjectline;

GO
--ticket 2382 remove rodrigo, ryan, christy and add kim and roshan