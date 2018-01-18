ALTER PROCEDURE spEmailCheckInsuranceType
	
AS
BEGIN

DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'Insurance Type Validation'

SET @xml = CAST((	SELECT	PID AS 'td', '',
							CONVERT(VARCHAR(10),DOS,1) AS 'td', '',
							Region AS 'td', '', 
							[Primary Insurance] as 'td', '', 
							[1st Insurance Category] as 'td'
					FROM  vwValidationCheckInsuranceType
					ORDER BY DOS
			FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

if len(@xml) > 0

	BEGIN
	SET @body =	'<html><body><H3>Insurance Type Validation</H3>
				<table border = 1> 
				<tr>
					<th> PID </th>
					<th> DOS </th>
					<th> Region </th>
					<th> Primary Insurance </th>
					<th> 1st Insurance Category </th>
				</tr>'

	SET @body = @body + @xml +'</table></body></html>'
	END
ELSE
	BEGIN
		SET @body = 'No Insurance Type Validation'
	SET @subjectline = @subjectline + ' - NONE'
	END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', 
@body = @body,
@body_format ='HTML',
--@recipients = 'Deborah.Reinagel@md-management.net;Kim.Anderson@md-management.net;Matthew.Nartz@md-management.net',
@recipients = 'Deborah.Reinagel@md-management.net;Kim.Anderson@md-management.net',
@subject = @subjectline ;
	
END
GO