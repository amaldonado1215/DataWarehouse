ALTER PROCEDURE spEmailUnmatchedReaders  AS 

DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)

SET @subjectline = 'UnMatched Readers Report'

SET @xml = CAST(( SELECT reader AS 'td', '', PID as 'td','', CONVERT(VARCHAR(10), dos, 1) as 'td', '', Region_Short_Name as 'td', '', DefaultEntity as 'td' 
		FROM  vwValidationCheckUnmatchedReaders ORDER BY dos ASC
		FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
			if len(@xml) > 0
				BEGIN

				SET @body ='<html><body><H3>Unmatched Reader to ReadersLookup Report</H3>
				<table border = 1> 
				<tr>
				<th> Reader </th> <th> PID </th> <th> DOS </th> <th> Region </th> <th> DefaultEntity </th></tr>'    
 
				SET @body = @body + @xml +'</table></body></html>'
				END
			Else
				BEGIN
				SET @body = 'There are no Unmatched Readers'
				SET @subjectline = @subjectline + ' - NONE'
				END

			EXEC msdb.dbo.sp_send_dbmail
			@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
			@body = @body,
			@body_format ='HTML',
			@recipients = 'Deborah.Reinagel@md-management.net;Angelica.Maldonado@md-management.net', 
			@subject = @subjectline;

			GO