

ALTER PROCEDURE spEmailCurrentMonthEntitiesWithoutPayroll

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'Current Month Entities Without Payroll ID Report'


SET @xml = CAST(( SELECT [correctproentity] AS 'td'
	FROM  vwValidationCheckCurrentCaseEntitiesWithoutPayroll ORDER BY [correctproentity]
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Entities Without Payroll Setup</H3>
<table border = 1> 
<tr>
<th> CorrectProEntity </th>  </tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
Else
BEGIN
SET @body = 'There are no Entities without Payroll ID Setup This Month'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
--@recipients = 'johnb@simplicityhealthsystems.com',
@recipients = 'Deborah.Reinagel@md-management.net;Angelica.Maldonado@md-management.net', 
@subject = @subjectline;

GO