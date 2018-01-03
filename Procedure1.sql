USE [USMON_Local]
GO
/****** Object:  StoredProcedure [dbo].[spRefreshData]    Script Date: 9/8/2015 11:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spRefreshData]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>

-- case_report_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3300')
		drop table case_report_3300 ;
	select * INTO [USMON_Local].dbo.case_report_3300 from [usmon.com].[USMON].dbo.case_report_3300
END TRY BEGIN CATCH END CATCH

-- claim_det_33300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_det_33300')
		drop table claim_det_33300 ;
	select * INTO [USMON_Local].dbo.claim_det_33300 from [usmon.com].[USMON].dbo.claim_det_33300
END TRY BEGIN CATCH END CATCH

-- claim_entity_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_entity_3300')
		drop table claim_entity_3300 ;
	select * INTO [USMON_Local].dbo.claim_entity_3300 from [usmon.com].[USMON].dbo.claim_entity_3300
END TRY BEGIN CATCH END CATCH

-- history_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'history_3300')
		drop table history_3300 ;
	select * INTO [USMON_Local].dbo.history_3300 from [usmon.com].[USMON].dbo.history_3300  
		where date_changed < '2015-09-02' or date_changed > '2015-09-03'
END TRY BEGIN CATCH END CATCH

-- Insurance_Deposits_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3300')
		drop table Insurance_Deposits_3300 ;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3300 from [usmon.com].[USMON].dbo.Insurance_Deposits_3300
END TRY BEGIN CATCH END CATCH

-- notes_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'notes_3300')
		drop table notes_3300;
	select * INTO [USMON_Local].dbo.notes_3300 from [usmon.com].[USMON].dbo.notes_3300
END TRY BEGIN CATCH END CATCH

-- patient_insurance_charges_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_insurance_charges_3300')
		drop table patient_insurance_charges_3300;
	select * INTO [USMON_Local].dbo.patient_insurance_charges_3300 from [usmon.com].[USMON].dbo.patient_insurance_charges_3300
END TRY BEGIN CATCH END CATCH

-- Tech_sign_off_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Tech_sign_off_3300')
		drop table Tech_sign_off_3300;
	select * INTO [USMON_Local].dbo.Tech_sign_off_3300 from [usmon.com].[USMON].dbo.Tech_sign_off_3300
END TRY BEGIN CATCH END CATCH

-- mod_alert_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'mod_alert_3300')
		drop table mod_alert_3300;
	select * INTO [USMON_Local].dbo.mod_alert_3300 from [usmon.com].[USMON].dbo.mod_alert_3300
END TRY BEGIN CATCH END CATCH



END




