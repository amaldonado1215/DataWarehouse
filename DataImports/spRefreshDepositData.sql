USE [USMON_Local]
GO
/****** Object:  StoredProcedure [dbo].[spRefreshData]    Script Date: 1/5/2016 8:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRefreshDepositData]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
	DECLARE @ErrorLogID int;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>

-- case_report_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3300') and (select count(*) from 72.52.135.204.[USMON].dbo.case_report_3300) > 0
		drop table case_report_3300 ;
	select * INTO [USMON_Local].dbo.case_report_3300 from 72.52.135.204.[USMON].dbo.case_report_3300
END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

-- Insurance_Deposits_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3300') and (select count(*) from 72.52.135.204.[USMON].dbo.Insurance_Deposits_3300) > 0
		drop table Insurance_Deposits_3300 ;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3300 from 72.52.135.204.[USMON].dbo.Insurance_Deposits_3300
END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3350') and (select count(*) from 72.52.135.204.[USMON].dbo.Insurance_Deposits_3350) > 0
		drop table Insurance_Deposits_3350;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3350 from 72.52.135.204.[USMON].dbo.Insurance_Deposits_3350
END TRY BEGIN CATCH END CATCH

-- collect_detail_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'collect_detail_3300') and (select count(*) from 72.52.135.204.[USMON].dbo.collect_detail_3300) > 0
		drop table collect_detail_3300;
	select * INTO [USMON_Local].dbo.collect_detail_3300 from 72.52.135.204.[USMON].dbo.collect_detail_3300
END TRY BEGIN CATCH END CATCH

-- collect_detail_3350
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'collect_detail_3350') and (select count(*) from 72.52.135.204.[USMON].dbo.collect_detail_3350) > 0
		drop table collect_detail_3350;
	select * INTO [USMON_Local].dbo.collect_detail_3350 from 72.52.135.204.[USMON].dbo.collect_detail_3350
END TRY
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH
END
