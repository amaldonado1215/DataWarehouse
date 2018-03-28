ALTER  procedure [dbo].[spRefreshDataFTP1_Afternoon] as 
	
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.case_report_3300) > 0
		drop table case_report_3300 ;
	select * INTO [USMON_Local].dbo.case_report_3300 from [dbconnect.usmon.com].[USMON].dbo.case_report_3300


	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3300) > 0
		drop table Insurance_Deposits_3300 ;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3300 from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3300

	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.case_report_3350) > 0
		drop table case_report_3350;
	select * INTO [USMON_Local].dbo.case_report_3350 from [dbconnect.usmon.com].[USMON].dbo.case_report_3350

	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3350) > 0
		drop table Insurance_Deposits_3350;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3350 from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3350

	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'invoice_history_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.invoice_history_3300) > 0
		drop table invoice_history_3300;
	select * INTO [USMON_Local].dbo.invoice_history_3300 from [dbconnect.usmon.com].[USMON].dbo.invoice_history_3300



	
--
	CREATE NONCLUSTERED INDEX IDX_CaseReport3300
	ON [dbo].[case_report_3300] ([PID],[DOS])
	INCLUDE ([Cancelled],[Deleted],[Region_Short_Name],[Surgeon],[Primary Insurance],[1st Insurance Category],[Hospital_ID])