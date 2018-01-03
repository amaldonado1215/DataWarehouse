USE [USMON_Local]
GO
/****** Object:  StoredProcedure [dbo].[spRefreshData]    Script Date: 8/9/2016 11:41:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spRefreshDataDB1FromFTP]
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
	DECLARE @ErrorMessage NVARCHAR(4000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;


BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3300')
    drop table case_report_3300 ;
	select * INTO [USMON_Local].dbo.case_report_3300 from [FTP1].[USMON_Local].dbo.case_report_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_det_33300')
	drop table claim_det_33300 ;
	select * INTO [USMON_Local].dbo.claim_det_33300 from [FTP1].[USMON_Local].dbo.claim_det_33300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_entity_3300')
	drop table claim_entity_3300 ;
	select * INTO [USMON_Local].dbo.claim_entity_3300 from [FTP1].[USMON_Local].dbo.claim_entity_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'history_3300q')
	drop table history_3300 ;
	select * INTO [USMON_Local].dbo.history_3300 from [FTP1].[USMON_Local].dbo.history_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3300')
	drop table Insurance_Deposits_3300 ;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3300 from [FTP1].[USMON_Local].dbo.Insurance_Deposits_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'notes_3300')
	drop table notes_3300;
	select * INTO [USMON_Local].dbo.notes_3300 from [FTP1].[USMON_Local].dbo.notes_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_insurance_charges_3300')
	drop table patient_insurance_charges_3300;
	select * INTO [USMON_Local].dbo.patient_insurance_charges_3300 from [FTP1].[USMON_Local].dbo.patient_insurance_charges_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'EntityLookup')
		drop table EntityLookup;
		select * INTO [USMON_Local].dbo.EntityLookup from [FTP1].[USMON_Local].dbo.EntityLookup
	END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'HospitalLookup')
		drop table HospitalLookup;
		select * INTO [USMON_Local].dbo.HospitalLookup from [FTP1].[USMON_Local].dbo.HospitalLookup
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'TechRegionLookup')
		drop table TechRegionLookup;
		select * INTO [USMON_Local].dbo.TechRegionLookup from [FTP1].[USMON_Local].dbo.TechRegionLookup
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Tech_sign_off_3300')
		drop table Tech_sign_off_3300;
		select * INTO [USMON_Local].dbo.Tech_sign_off_3300 from [FTP1].[USMON_Local].dbo.Tech_sign_off_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'DenialCodeLookup')
		drop table DenialCodeLookup;
		select * INTO [USMON_Local].dbo.DenialCodeLookup from [FTP1].[USMON_Local].dbo.DenialCodeLookup
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'InsuranceLookup')
		drop table InsuranceLookup;
		select * INTO [USMON_Local].dbo.InsuranceLookup from [FTP1].[USMON_Local].dbo.InsuranceLookup
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'InsuranceTypeLookup')
		drop table InsuranceTypeLookup;
		select * INTO [USMON_Local].dbo.InsuranceTypeLookup from [FTP1].[USMON_Local].dbo.InsuranceTypeLookup
END TRY BEGIN CATCH END CATCH
/*
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'mod_alert_3300')
		drop table mod_alert_3300;
		select * INTO [USMON_Local].dbo.mod_alert_3300 from [FTP1].[USMON_Local].dbo.mod_alert_3300
END TRY BEGIN CATCH END CATCH
*/
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'surgeonlookup2')
		drop table surgeonlookup2;
		select * INTO [USMON_Local].dbo.surgeonlookup2 from [FTP1].[USMON_Local].dbo.surgeonlookup2
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hospitals_3300')
		drop table hospitals_3300;
		select * INTO [USMON_Local].dbo.hospitals_3300 from [FTP1].[USMON_Local].dbo.hospitals_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hosp_ins_3000')
		drop table hosp_ins_3000;
		select * INTO [USMON_Local].dbo.hosp_ins_3000 from [FTP1].[USMON_Local].dbo.hosp_ins_3000
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'regiontechentitylookup')
		drop table regiontechentitylookup;
		select * INTO [USMON_Local].dbo.regiontechentitylookup from [FTP1].[USMON_Local].dbo.regiontechentitylookup
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'case_report_3350') and (select count(*) from [FTP1].[USMON_Local].dbo.case_report_3350) > 0
		drop table case_report_3350;
	select * INTO [USMON_Local].dbo.case_report_3350 from [FTP1].[USMON_Local].dbo.case_report_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_charges_3350') and (select count(*) from [FTP1].[USMON_Local].dbo.claim_charges_3350) > 0
		drop table claim_charges_3350;
	select * INTO [USMON_Local].dbo.claim_charges_3350 from [FTP1].[USMON_Local].dbo.claim_charges_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_det_3350') and (select count(*) from [FTP1].[USMON_Local].dbo.claim_det_3350) > 0
		drop table claim_det_3350;
	select * INTO [USMON_Local].dbo.claim_det_3350 from [FTP1].[USMON_Local].dbo.claim_det_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claim_entity_3350') and (select count(*) from [FTP1].[USMON_Local].dbo.claim_entity_3350) > 0
		drop table claim_entity_3350;
	select * INTO [USMON_Local].dbo.claim_entity_3350 from [FTP1].[USMON_Local].dbo.claim_entity_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Insurance_Deposits_3350') and (select count(*) from [FTP1].[USMON_Local].dbo.Insurance_Deposits_3350) > 0
		drop table Insurance_Deposits_3350;
	select * INTO [USMON_Local].dbo.Insurance_Deposits_3350 from [FTP1].[USMON_Local].dbo.Insurance_Deposits_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'patient_insurance_charges_3350') and (select count(*) from [FTP1].[USMON_Local].dbo.patient_insurance_charges_3350) > 0
		drop table patient_insurance_charges_3350;
	select * INTO [USMON_Local].dbo.patient_insurance_charges_3350 from [FTP1].[USMON_Local].dbo.patient_insurance_charges_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'PASURGEONLOOKUP') and (select count(*) from [FTP1].[USMON_Local].dbo.PASURGEONLOOKUP) > 0
		drop table PASURGEONLOOKUP;
	select * INTO [USMON_Local].dbo.PASURGEONLOOKUP from [FTP1].[USMON_Local].dbo.PASURGEONLOOKUP
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'hl7_raw_data_3300') and (select count(*) from [FTP1].[USMON_Local].dbo.hl7_raw_data_3300) > 0
		drop table hl7_raw_data_3300;
	select * INTO [USMON_Local].dbo.hl7_raw_data_3300 from [FTP1].[USMON_Local].dbo.hl7_raw_data_3300
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claimdatehistory') and (select count(*) from [FTP1].[USMON_Local].dbo.claimdatehistory) > 0
		drop table claimdatehistory;
	select * INTO [USMON_Local].dbo.claimdatehistory from [FTP1].[USMON_Local].dbo.claimdatehistory
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'claimdatehistorypa') and (select count(*) from [FTP1].[USMON_Local].dbo.claimdatehistorypa) > 0
		drop table claimdatehistorypa;
	select * INTO [USMON_Local].dbo.claimdatehistorypa from [FTP1].[USMON_Local].dbo.claimdatehistorypa
END TRY BEGIN CATCH END CATCH

BEGIN TRY
if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'notes_3350')
	drop table notes_3350;
	select * INTO [USMON_Local].dbo.notes_3350 from [FTP1].[USMON_Local].dbo.notes_3350
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'readerfees')
		drop table readerfees;
		select * INTO [USMON_Local].dbo.readerfees from [FTP1].[USMON_Local].dbo.readerfees
END TRY BEGIN CATCH END CATCH

BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'holidaylookup')
		drop table holidaylookup;
		select * INTO [USMON_Local].dbo.holidaylookup from [FTP1].[USMON_Local].dbo.holidaylookup
END TRY BEGIN CATCH END CATCH

-- collect_detail_3300
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'collect_detail_3300') and (select count(*) from [FTP1].[USMON_Local].dbo.collect_detail_3300) > 0
		drop table collect_detail_3300;
	select * INTO [USMON_Local].dbo.collect_detail_3300 from  [FTP1].[USMON_Local].dbo.collect_detail_3300
END TRY BEGIN CATCH END CATCH

-- collect_detail_3350
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'collect_detail_3350') and (select count(*) from  [FTP1].[USMON_Local].dbo.collect_detail_3350) > 0
		drop table collect_detail_3350;
	select * INTO [USMON_Local].dbo.collect_detail_3350 from  [FTP1].[USMON_Local].dbo.collect_detail_3350
END TRY BEGIN CATCH END CATCH

-- CorrectEntityException
BEGIN TRY
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'CorrectEntityExceptions') and (select count(*) from  [FTP1].[USMON_Local].dbo.CorrectEntityExceptions) > 0
		drop table CorrectEntityExceptions;
	select * INTO [USMON_Local].dbo.CorrectEntityExceptions from  [FTP1].[USMON_Local].dbo.CorrectEntityExceptions
END TRY 

BEGIN CATCH 


	SELECT 
		@ErrorMessage = ERROR_MESSAGE(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE();

	-- Use RAISERROR inside the CATCH block to return error
	-- information about the original error that caused
	-- execution to jump to the CATCH block.
	RAISERROR (@ErrorMessage, -- Message text.
           @ErrorSeverity, -- Severity.
           @ErrorState -- State.
           );

END CATCH




BEGIN TRY
CREATE INDEX IX_ClaimEntity_patient_id 
    ON claim_entity_3300(patient_id);
CREATE INDEX IX_CaseReport_PID
	ON case_report_3300(PID);
CREATE INDEX IX_PatientInsuranceCharges_ClaimID
	on patient_Insurance_charges_3300(Claim_ID)
CREATE INDEX IX_EntityLookup_ClientName
	on entitylookup(client_name)
CREATE INDEX IX_insurancelookup_InsuranceCompany
	on insurancelookup(InsuranceCompany)
CREATE INDEX IX_surgeonlookup_surgeon
	on surgeonlookup(surgeon)

	--  New Stuff
CREATE INDEX IX_insurancetypelookup_InsuranceType
	on insurancetypelookup(insurancetype)
CREATE INDEX IX_hospitallookup_hospital
	on hospitallookup(hospital)
CREATE NONCLUSTERED INDEX IX_case_report_DOS_Cancelled_Deleted
	ON [dbo].[case_report_3300] ([DOS],[Cancelled],[Deleted])
	INCLUDE ([PID],[Region_Short_Name],[Surgeon],[Tech],[1st Insurance Category])
CREATE NONCLUSTERED INDEX IX_case_report_DOS
	ON [dbo].[case_report_3300] ([DOS])
	INCLUDE ([PID],[Hospital],[Surgeon],[Tech],[Reader],[Primary Insurance])
CREATE NONCLUSTERED INDEX [IDX_CaseReport3300]
	ON [dbo].[case_report_3300] ([DOS],[Cancelled],[Deleted])
INCLUDE ([PID],[Patient],[Region_Short_Name],[Hospital],[Surgeon],[Closed],[Tech],[Reader],[Primary Insurance],[1st Insurance Category],[Biller],[hospital_id])

CREATE NONCLUSTERED INDEX [IDX_Insurance_Deposits_3300]
	ON [dbo].[Insurance_Deposits_3300] ([claim_id])
CREATE NONCLUSTERED INDEX [IDX_care_report_DOS_Cancelled_Deleted]
	ON [dbo].[case_report_3300] ([DOS],[Cancelled],[Deleted])
INCLUDE ([PID],[Region_Short_Name],[Hospital],[Surgeon],[Reader],[Primary Insurance],[1st Insurance Category],[Biller])

END TRY
BEGIN CATCH
	SELECT 
		@ErrorMessage = ERROR_MESSAGE(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE();

	-- Use RAISERROR inside the CATCH block to return error
	-- information about the original error that caused
	-- execution to jump to the CATCH block.
	RAISERROR (@ErrorMessage, -- Message text.
           @ErrorSeverity, -- Severity.
           @ErrorState -- State.
           );
END CATCH

END