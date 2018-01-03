

ALTER PROCEDURE spEmailUnmatchedTechRegionLookup

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched Tech Report'


SET @xml = CAST(( SELECT [tech] AS 'td'
	FROM  vwValidationCheckUnmatchedTechRegionLookup ORDER BY tech
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

if len(@xml) > 0
	BEGIN

	SET @body ='<html><body><H3>Unmatched Tech to RegionLookup Report</H3>
	<table border = 1> 
	<tr>
	<th> Tech </th> </tr>'    

 
	SET @body = @body + @xml +'</table></body></html>'
	END
Else
	BEGIN
	SET @body = 'There are no Unmatched Techs'
	SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Deborah.Reinagel@md-management.net;Monica.Gomez@nationalneuro.net;Kim.Anderson@md-management.net;Samantha.Girgis@md-management.net', 
@subject = @subjectline;

GO

--ticket 2147 add kim anderson
--ticket 2182 add Samantha Girgis