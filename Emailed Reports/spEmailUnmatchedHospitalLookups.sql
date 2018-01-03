

--<<<<<<< HEAD
--Alter PROCEDURE spEmailUnmatchedHospitalLookups
--=======
ALter PROCEDURE spEmailUnmatchedHospitalLookups
-->>>>>>> origin/Modifications

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'UnMatched Hospital Lookup Report'


SET @xml = CAST(( SELECT [Hospital] AS 'td'
	FROM  vwValidationCheckUnMatchedHospitals ORDER BY hospital
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
if len(@xml) > 0
BEGIN

SET @body ='<html><body><H3>Unmatched Hospital Lookup Report</H3>
<table border = 1> 
<tr>
<th> Hospital </th> </tr>'    

 
SET @body = @body + @xml +'</table></body></html>'
END
Else
BEGIN
SET @body = 'There are no Unmatched Hospitals'
SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
--<<<<<<< HEAD
@recipients = 'Deborah.Reinagel@md-management.net; Kim.Anderson@md-management.net; Angelica.Maldonado@md-management.net; Cynthia.Ramirez@md-management.net', 
@subject = @subjectline;

GO
--=======
--@recipients = 'johnb@simplicityhealthsystems.com;Deborah.Reinagel@md-management.net,Rhonda.Brown@nationalneuro.net', 
--@subject = @subjectline;

--GO
-->>>>>>> origin/Modifications

--ticket 2316 lauren
--make recipients: Deborah.Reinagel@md-management.net; Kim.Anderson@md-management.net; Angelica.Maldonado@md-management.net

--ticket 2409 lauren Cynthia.Ramirez@md-management.net
