

ALTER PROCEDURE spEmailHospitalTechBillingValidation

AS 


DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)
DECLARE @subjectline NVARCHAR(50)
SET @subjectline = 'Duplicate Billing Alert: Hosp & Tech in Last 7 Days'


SET @xml = CAST(( SELECT pid AS 'td', '', dos as 'td', '', [insurance type] as 'td', '', invoice_number as 'td', '',
		 invoice_date as 'td', '', claim_id as 'td', '', originalclaimdate as 'td', '', claimbiller as 'td'
	FROM  vwHospitalTechBillingValidation 
	 where DATEDIFF(DAY,  DATEADD(day, -1, invoice_date), GETDATE()) < 7
			or DATEDIFF(DAY,  DATEADD(day, -1, originalclaimdate), GETDATE()) < 7
	ORDER BY pid
	FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

if len(@xml) > 0
	BEGIN

	SET @body ='<html><body><H3>Duplication Billing Alert: Hospital & Tech in last 7 days</H3>
	<table border = 1> 
	<tr>
	<th> PID </th> <th> DOS </th> <th> Insurance Type </th> <th> Invoice_number </th> <th> invoice_date</th><th>claim_id</th><th>originalclaimdate</th> <th>claimbiller</th></tr>'    

 
	SET @body = @body + @xml +'</table></body></html>'
	END
Else
	BEGIN
	SET @body = 'There are no recent duplicate billings to hospital & tech'
	SET @subjectline = @subjectline + ' - NONE'
END

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'SendGrid', -- replace with your SQL Database Mail Profile 
@body = @body,
@body_format ='HTML',
@recipients = 'Mireille.Carrillo@md-management.net; scott@nationalneuro.net; alla@md-management.net; Makeba.Potter@md-management.net; michelle.silva@acquisitionbilling.com; Timothy.DeLong@Acquisitionbilling.com;Deborah.Reinagel@md-management.net;Matthew.Nartz@md-management.net;allie.robert@nationalneuro.net;Samuel.Dillon@md-management.net', 
@subject = @subjectline;

GO

---ticket 2015 lauren
-- add scott@nationalneuro.net, alla@md-management.net, Makeba.Potter@md-management.net, michelle.silva@acquisitionbilling.com, Timothy.DeLong@Acquisitionbilling.com

--ticket 2080 lauren
--add deborah

--ticket 2173 lauren
-- add allie.robert@nationalneuro.net

--ticket 2421 lauren
--add Samuel.Dillon@md-management.net