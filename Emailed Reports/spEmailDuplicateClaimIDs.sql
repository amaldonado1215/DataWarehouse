CREATE PROCEDURE spEmailDuplicateClaimIDs

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'Duplicate Claim IDs Report'


SET @xml = CAST(( SELECT [Claim_id] AS 'td'
	FROM  vw_validationVwMaster2DuplicatesClaimids ORDER BY Claim_id
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Duplicate Claim IDs Report</H3>
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
@recipients = 'Deborah.Reinagel@md-management.net;Angelica.Maldonado@md-management.net', 
@subject = @subjectline;

GO
