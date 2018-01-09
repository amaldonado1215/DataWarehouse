

ALTER PROCEDURE spEmailUnMatchedInsuranceLookup

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched Insurance Lookup Report'


SET @xml = CAST(( SELECT [primary insurance] AS 'td', '', [Insurance Type] as 'td'
	FROM  vwValidationCheckUnmatchedInsuranceLookup ORDER BY [primary insurance]
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Unmatched Insurance Lookup</H3>
<table border = 1> 
<tr>
<th> Primary Insurance </th> <th> Insurance Type </th> </tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
Else
BEGIN
SET @body = 'There are no Unmatched Insurance Companies'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid',
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;Timothy.DeLong@Acquisitionbilling.com;Angelica.Maldonado@md-management.net;michelle.silva@acquisitionbilling.com;Matthew.Nartz@md-management.net', 
@subject = @subjectline;

GO
--ticket 1952 lauren
--add matthew.huizar@acquisitionbilling.com
--ticket 2341 lauren, add michelle, remove matthew