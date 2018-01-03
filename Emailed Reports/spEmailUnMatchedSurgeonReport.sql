

ALTER PROCEDURE spEmailUnMatchedSurgeons

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched Surgeons Report'


SET @xml = CAST(( SELECT [Surgeon] AS 'td'
	FROM  vwValidationCheckUnmatchedSurgeons ORDER BY surgeon
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Unmatched Surgeons Report</H3>
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
@recipients = 'Deborah.Reinagel@md-management.net;allie.robert@nationalneuro.net;lizette.morin@md-management.net;Bobby.Smith2@md-management.net;Henry.Hays@md-management.net;Angela.Leigh@nationalneuro.net;Brandi.Milligan@mpowerpractice.net', 
@subject = @subjectline;

GO

--ticket 2075 lauren: remove rodrigo and angelica, but rodrigo not on it?
--ticket 2113 lauren: remove elizabeth young
--ticket 2116 lauren: add lizette.morin@md-management.net
--ticket 2156 lauren: add Bobby.Smith2@md-management.net Henry.Hays@md-management.net Angela.Leigh@nationalneuro.net
--ticket 2394 lauren: add Brandi.Milligan@mpowerpractice.net