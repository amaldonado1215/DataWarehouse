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
ALTER PROCEDURE [dbo].[spRefreshData]
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
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.case_report_3300) > 0
		drop table case_report_3300 ;
	select * INTO [USMON_Local].dbo.case_report_3300 from [dbconnect.usmon.com].[USMON].dbo.case_report_3300
END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

-- claim_det_33300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_det_33300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.claim_det_33300) > 0
		drop table claim_det_33300 ;
	select * INTO [USMON_Local].dbo.claim_det_33300 from [dbconnect.usmon.com].[USMON].dbo.claim_det_33300
END TRY BEGIN CATCH END CATCH

-- claim_entity_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_entity_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.claim_entity_3300) > 0
		drop table claim_entity_3300 ;
	select * INTO [USMON_Local].dbo.claim_entity_3300 from [dbconnect.usmon.com].[USMON].dbo.claim_entity_3300
END TRY BEGIN CATCH END CATCH

-- history_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'history_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.history_3300) > 0
		drop table history_3300 ;
	select * INTO [USMON_Local].dbo.history_3300 from [dbconnect.usmon.com].[USMON].dbo.history_3300  
		where date_changed < '2015-09-02' or date_changed > '2015-09-03'
END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

-- Insurance_Deposits_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3300) > 0
		drop table Insurance_Deposits_3300 ;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3300 from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3300
END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

-- notes_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'notes_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.notes_3300) > 0
		drop table notes_3300;
	select * INTO [USMON_Local].dbo.notes_3300 from [dbconnect.usmon.com].[USMON].dbo.notes_3300
END TRY BEGIN CATCH END CATCH

-- patient_insurance_charges_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_insurance_charges_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_insurance_charges_3300) > 0
		drop table patient_insurance_charges_3300;
	select * INTO [USMON_Local].dbo.patient_insurance_charges_3300 from [dbconnect.usmon.com].[USMON].dbo.patient_insurance_charges_3300
END TRY
 BEGIN CATCH 
 EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
END CATCH

-- Tech_sign_off_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Tech_sign_off_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Tech_sign_off_3300) > 0
		drop table Tech_sign_off_3300;
	select * INTO [USMON_Local].dbo.Tech_sign_off_3300 from [dbconnect.usmon.com].[USMON].dbo.Tech_sign_off_3300
END TRY BEGIN CATCH END CATCH

-- mod_alert_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'mod_alert_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.mod_alert_3300) > 0
		drop table mod_alert_3300;
	select * INTO [USMON_Local].dbo.mod_alert_3300 from [dbconnect.usmon.com].[USMON].dbo.mod_alert_3300
END TRY BEGIN CATCH END CATCH

-- clm_charges_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_charges_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.claim_charges_3300) > 0
		drop table claim_charges_3300;
	select * INTO [USMON_Local].dbo.claim_charges_3300 from [dbconnect.usmon.com].[USMON].dbo.claim_charges_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hl7_raw_data_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hl7_raw_data_3300) > 0
		drop table hl7_raw_data_3300;
	select * INTO [USMON_Local].dbo.hl7_raw_data_3300 from [dbconnect.usmon.com].[USMON].dbo.hl7_raw_data_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hl7_raw_data_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hl7_raw_data_3350) > 0
		drop table hl7_raw_data_3350;
	select * INTO [USMON_Local].dbo.hl7_raw_data_3350 from [dbconnect.usmon.com].[USMON].dbo.hl7_raw_data_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.case_report_3350) > 0
		drop table case_report_3350;
	select * INTO [USMON_Local].dbo.case_report_3350 from [dbconnect.usmon.com].[USMON].dbo.case_report_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_charges_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.claim_charges_3350) > 0
		drop table claim_charges_3350;
	select * INTO [USMON_Local].dbo.claim_charges_3350 from [dbconnect.usmon.com].[USMON].dbo.claim_charges_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_det_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.claim_det_3350) > 0
		drop table claim_det_3350;
	select * INTO [USMON_Local].dbo.claim_det_3350 from [dbconnect.usmon.com].[USMON].dbo.claim_det_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_entity_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.claim_entity_3350) > 0
		drop table claim_entity_3350;
	select * INTO [USMON_Local].dbo.claim_entity_3350 from [dbconnect.usmon.com].[USMON].dbo.claim_entity_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3350) > 0
		drop table Insurance_Deposits_3350;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3350 from [dbconnect.usmon.com].[USMON].dbo.Insurance_Deposits_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_insurance_charges_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_insurance_charges_3350) > 0
		drop table patient_insurance_charges_3350;
	select * INTO [USMON_Local].dbo.patient_insurance_charges_3350 from [dbconnect.usmon.com].[USMON].dbo.patient_insurance_charges_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hospitals_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hospitals_3300) > 0
		drop table hospitals_3300;
	select * INTO [USMON_Local].dbo.hospitals_3300 from [dbconnect.usmon.com].[USMON].dbo.hospitals_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hospitals_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hospitals_3350) > 0
		drop table hospitals_3350;
	select * INTO [USMON_Local].dbo.hospitals_3350 from [dbconnect.usmon.com].[USMON].dbo.hospitals_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hosp_ins_3000') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hosp_ins_3000) > 0
		drop table hosp_ins_3000;
	select * INTO [USMON_Local].dbo.hosp_ins_3000 from [dbconnect.usmon.com].[USMON].dbo.hosp_ins_3000
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'invoice_history_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.invoice_history_3300) > 0
		drop table invoice_history_3300;
	select * INTO [USMON_Local].dbo.invoice_history_3300 from [dbconnect.usmon.com].[USMON].dbo.invoice_history_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'supplies_track_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.supplies_track_3300) > 0
		drop table supplies_track_3300;
	select * INTO [USMON_Local].dbo.supplies_track_3300 from [dbconnect.usmon.com].[USMON].dbo.supplies_track_3300
END TRY BEGIN CATCH END CATCH

-- charges_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'charges_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.charges_3300) > 0
		drop table charges_3300;
	select * INTO [USMON_Local].dbo.charges_3300 from [dbconnect.usmon.com].[USMON].dbo.charges_3300
END TRY BEGIN CATCH END CATCH

-- collect_detail_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'collect_detail_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.collect_detail_3300) > 0
		drop table collect_detail_3300;
	select * INTO [USMON_Local].dbo.collect_detail_3300 from [dbconnect.usmon.com].[USMON].dbo.collect_detail_3300
END TRY BEGIN CATCH END CATCH

-- collect_detail_3350
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'collect_detail_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.collect_detail_3350) > 0
		drop table collect_detail_3350;
	select * INTO [USMON_Local].dbo.collect_detail_3350 from [dbconnect.usmon.com].[USMON].dbo.collect_detail_3350
END TRY BEGIN CATCH END CATCH


-- history_3350
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'history_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.history_3350) > 0
		drop table history_3350 ;
	select * INTO [USMON_Local].dbo.history_3350 from [dbconnect.usmon.com].[USMON].dbo.history_3350  
		where date_changed < '2015-09-02' or date_changed > '2015-09-03'
END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

-- patient_deduct_3350 & patient_deduct_3300 
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_deduct_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_deduct_3350) > 0
		drop table patient_deduct_3350 ;
	select * INTO [USMON_Local].dbo.patient_deduct_3350 from [dbconnect.usmon.com].[USMON].dbo.patient_deduct_3350 

END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_deduct_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_deduct_3300) > 0
		drop table patient_deduct_3300 ;
	select * INTO [USMON_Local].dbo.patient_deduct_3300 from [dbconnect.usmon.com].[USMON].dbo.patient_deduct_3300

END TRY 
	BEGIN CATCH 
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH

-- notes_3350
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'notes_3350') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.notes_3350) > 0
		drop table notes_3350;
	select * INTO [USMON_Local].dbo.notes_3350 from [dbconnect.usmon.com].[USMON].dbo.notes_3350
END TRY BEGIN CATCH END CATCH

-- users_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.users_3300) > 0
		drop table users_3300;
	select * INTO [USMON_Local].dbo.users_3300 from [dbconnect.usmon.com].[USMON].dbo.users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[hosp_credentials_users_3300]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hosp_credentials_users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hosp_credentials_users_3300) > 0
		drop table hosp_credentials_users_3300;
	select * INTO [USMON_Local].dbo.hosp_credentials_users_3300 from [dbconnect.usmon.com].[USMON].dbo.hosp_credentials_users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[assigned_auditor_techs_users_3300]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'assigned_auditor_techs_users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.assigned_auditor_techs_users_3300) > 0
		drop table assigned_auditor_techs_users_3300;
	select * INTO [USMON_Local].dbo.assigned_auditor_techs_users_3300 from [dbconnect.usmon.com].[USMON].dbo.assigned_auditor_techs_users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[im_users_3300]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'im_users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.im_users_3300) > 0
		drop table im_users_3300;
	select * INTO [USMON_Local].dbo.im_users_3300 from [dbconnect.usmon.com].[USMON].dbo.im_users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[li_users_3300]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'li_users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.li_users_3300) > 0
		drop table li_users_3300;
	select * INTO [USMON_Local].dbo.li_users_3300 from [dbconnect.usmon.com].[USMON].dbo.li_users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[re_users_3300]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 're_users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.re_users_3300) > 0
		drop table re_users_3300;
	select * INTO [USMON_Local].dbo.re_users_3300 from [dbconnect.usmon.com].[USMON].dbo.re_users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[t_users_3300]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 't_users_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.t_users_3300) > 0
		drop table t_users_3300;
	select * INTO [USMON_Local].dbo.t_users_3300 from [dbconnect.usmon.com].[USMON].dbo.t_users_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[[Hospital_Supply_Items_3300]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Hospital_Supply_Items_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Hospital_Supply_Items_3300) > 0
		drop table Hospital_Supply_Items_3300;
	select * INTO [USMON_Local].dbo.Hospital_Supply_Items_3300 from [dbconnect.usmon.com].[USMON].dbo.Hospital_Supply_Items_3300
END TRY BEGIN CATCH END CATCH

--[dbo].[[hospital_history_3300]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hospital_history_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.hospital_history_3300 ) > 0
		drop table hospital_history_3300 ;
	select * INTO [USMON_Local].dbo.hospital_history_3300  from [dbconnect.usmon.com].[USMON].dbo.hospital_history_3300 
END TRY BEGIN CATCH END CATCH

--[dbo].[[patient_mods_3300]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_mods_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_mods_3300 ) > 0
		drop table patient_mods_3300 ;
	select * INTO [USMON_Local].dbo.patient_mods_3300  from [dbconnect.usmon.com].[USMON].dbo.patient_mods_3300 
END TRY BEGIN CATCH END CATCH

--[dbo].[[patient_muscles_3300]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_muscles_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_muscles_3300 ) > 0
		drop table patient_muscles_3300 ;
	select * INTO [USMON_Local].dbo.patient_muscles_3300  from [dbconnect.usmon.com].[USMON].dbo.patient_muscles_3300 
END TRY BEGIN CATCH END CATCH

--[dbo].[[patient_other_muscles_3300]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_other_muscles_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.patient_other_muscles_3300 ) > 0
		drop table patient_other_muscles_3300 ;
	select * INTO [USMON_Local].dbo.patient_other_muscles_3300  from [dbconnect.usmon.com].[USMON].dbo.patient_other_muscles_3300 
END TRY BEGIN CATCH END CATCH

--[dbo].[[Pedicle_33]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Pedicle_33') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.Pedicle_33 ) > 0
		drop table Pedicle_33 ;
	select * INTO [USMON_Local].dbo.Pedicle_33  from [dbconnect.usmon.com].[USMON].dbo.Pedicle_33 
END TRY BEGIN CATCH END CATCH

--[dbo].[[TO4_33]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'TO4_33') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.TO4_33 ) > 0
		drop table TO4_33 ;
	select * INTO [USMON_Local].dbo.TO4_33  from [dbconnect.usmon.com].[USMON].dbo.TO4_33 
END TRY BEGIN CATCH END CATCH

--[dbo].[[clinc33]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'clinc33') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.clinc33 ) > 0
		drop table clinc33 ;
	select * INTO [USMON_Local].dbo.clinc33  from [dbconnect.usmon.com].[USMON].dbo.clinc33 
END TRY BEGIN CATCH END CATCH

--[dbo].[[inv_pay_3300]]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'inv_pay_3300') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.inv_pay_3300 ) > 0
		drop table inv_pay_3300 ;
	select * INTO [USMON_Local].dbo.inv_pay_3300  from [dbconnect.usmon.com].[USMON].dbo.inv_pay_3300 
END TRY BEGIN CATCH END CATCH

--[dbo].[audit_details_33]
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'audit_details_33') and (select count(*) from [dbconnect.usmon.com].[USMON].dbo.audit_details_33 ) > 0
		drop table audit_details_33 ;
	select * INTO [USMON_Local].dbo.audit_details_33  from [dbconnect.usmon.com].[USMON].dbo.audit_details_33 
END TRY BEGIN CATCH END CATCH

-- Indexes

--
BEGIN TRY
	CREATE NONCLUSTERED INDEX IX_ClaimEntity_patient_id
	ON [dbo].[notes_3300] ([Billing_Notes_ID])
	INCLUDE ([Note_Type],[Note],[InitialDate])
END TRY
	BEGIN CATCH
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH


--
BEGIN TRY
	CREATE NONCLUSTERED INDEX IX_ClaimEntity_patient_id
	ON [dbo].[notes_3350] ([Billing_Notes_ID])
	INCLUDE ([Note_Type],[Note],[InitialDate])
END TRY
	BEGIN CATCH
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH
END

--

BEGIN TRY
	CREATE NONCLUSTERED INDEX IDX_CaseReport3300
	ON [dbo].[case_report_3300] ([PID],[DOS])
	INCLUDE ([Cancelled],[Deleted],[Region_Short_Name],[Surgeon],[Primary Insurance],[1st Insurance Category],[Hospital_ID])
END TRY
	BEGIN CATCH
		EXECUTE dbo.spLogError @ErrorLogID = @ErrorLogID OUTPUT;
	END CATCH
