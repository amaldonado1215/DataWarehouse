alter  procedure spRefreshDataFTP1_Afternoon as 
	
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3300') and (select count(*) from [72.52.135.204].[USMON].dbo.case_report_3300) > 0
		drop table case_report_3300 ;
	select * INTO [USMON_Local].dbo.case_report_3300 from [72.52.135.204].[USMON].dbo.case_report_3300


	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3300') and (select count(*) from [72.52.135.204].[USMON].dbo.Insurance_Deposits_3300) > 0
		drop table Insurance_Deposits_3300 ;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3300 from [72.52.135.204].[USMON].dbo.Insurance_Deposits_3300

	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3350') and (select count(*) from [72.52.135.204].[USMON].dbo.case_report_3350) > 0
		drop table case_report_3350;
	select * INTO [USMON_Local].dbo.case_report_3350 from [72.52.135.204].[USMON].dbo.case_report_3350

	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3350') and (select count(*) from [72.52.135.204].[USMON].dbo.Insurance_Deposits_3350) > 0
		drop table Insurance_Deposits_3350;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3350 from [72.52.135.204].[USMON].dbo.Insurance_Deposits_3350

