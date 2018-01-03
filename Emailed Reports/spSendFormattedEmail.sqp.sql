
DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)


SET @xml = CAST(( SELECT [ClaimDate] AS 'td','', [DOS] AS 'td','',
       [PID] AS 'td','', [Surgeon] AS 'td'
FROM  vwTechProductivity ORDER BY tech, DOS_YR,DOS_WK 
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))


SET @body ='<html><body><H3>Tech Productivity Report</H3>
<table border = 1> 
<tr>
<th> Tech </th> <th>Week </th> <th> Total Cases </th> <th> Utilization Pct </th></tr>'    

 
SET @body = @body + @xml +'</table></body></html>'


EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'johnb@simplicityhealthsystems.com', -- replace with your email address
@subject = 'E-mail in Tabular Format' ;



select * from vwMisBilledClaims where daysclaimed < 30