

ALTER PROCEDURE spEmailUnMatchedPASurgeons

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched PA Surgeons Report'


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
SET @body = 'There are no Unmatched PA Surgeons'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;Tatjana.rosic@md-management.net;Kim.Anderson@md-management.net;Roshan.Shah@precisionassist.us', 
@subject = @subjectline;

GO
--NOT THE CURRENT SP FOR THIS!  LOOK AT PAUNMATCHEDSURGEONREPORT
--ticket 2030 Lauren, per Deborah, add Kim.Anderson@md-management.net; Roshan.Shah@precisionassist.us
--ticket 2181 lauren, remove Rodrigo.Rosiles@md-management.net