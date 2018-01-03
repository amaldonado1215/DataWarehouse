--Refresh Claims Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Claims') 
		drop table SHS_Claims ;
	create table SHS_Claims (
		[Key] int not null,
		ClaimId int not null,
		ClaimType varchar(10) not null,
		Balance money null,
		ChargeTotal money null,
		TotalPayments money null,
		[Status] varchar(50) null,
		DateOfService smalldatetime null,
		Patient varchar(100) null,
		PatientId int null,
		Entity varchar(100) null,
		Insurance varchar(100) null,
		Folder varchar(100) null,
		DateSubmittedToCarrier smalldatetime null,
		ClaimBillingType varchar(100) null)
	Go	
	insert into SHS_Claims ([Key],ClaimId,Balance,ChargeTotal,TotalPayments,[Status],DateSubmittedToCarrier,Entity,
		Insurance,Folder,Patient,PatientId,ClaimType,DateOfService,ClaimBillingType) 	
	select 	
		case 
			when ClaimBillingType = 'Pro Only' then CAST(CONCAT('1',ClaimId) as int)		
			when CLaimBillingType = 'Tech Only' then CAST(CONCAT('2',ClaimId) as int) 
			else CAST(CONCAT('3',ClaimId) as int) end,	
		ClaimId,Balance,ChargeTotal,TotalPayments,[Status],DateSubmittedToCarrier,Entity,Payor,Folder,Patient,patient_id,ClaimType,
		DateOfService,ClaimBillingType
	from vwSHS_Claims 
	GO	
	insert into SHS_Claims ([Key],ClaimId,Balance,ChargeTotal,TotalPayments,[Status],Entity,Insurance,Patient,PatientId,
		ClaimType,DateOfService) 	
	select 
		CAST(CONCAT('4',ClaimId) as int),ClaimId,balance,ChargeTotal,TotalPayments,[status],Entity,Payor,Patient,patient_id,
		ClaimType,DateOfService
	from vwSHS_Invoices 
	GO
	insert into SHS_Claims ([Key],ClaimId,Balance,ChargeTotal,TotalPayments,[Status],DateSubmittedToCarrier,Entity,Insurance,Folder,Patient,
		PatientId,ClaimType,DateOfService,ClaimBillingType) 	
	select 
		case 
			when ClaimBillingType = 'Pro Only' then CAST(CONCAT('5',ClaimId) as int)		
			when CLaimBillingType = 'Tech Only' then CAST(CONCAT('6',ClaimId) as int) 
			else CAST(CONCAT('7',ClaimId) as int) end,	
		ClaimId,Balance,ChargeTotal,TotalPayments,[Status],DateSubmittedToCarrier,Entity,Insurance,Folder,Patient,patient_id,ClaimType,
		DateOfService,ClaimBillingType	
	from vwSHS_PAClaims 
	GO

--Refresh ClaimCharges Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_ClaimCharges') 
		drop table SHS_ClaimCharges ;
	create table SHS_ClaimCharges (
		ClaimId int not null,
		CPT varchar(20) null,
		Units int null,
		Charged numeric null,
		Seq int null)		
	Go	
	insert into SHS_ClaimCharges (ClaimId,CPT,Units,Charged,Seq) 	
	select claim_seq,CPT,Units,Charged,Seq
	from vwSHS_ClaimCharges 
	GO	
	insert into SHS_ClaimCharges (ClaimId,Units,Charged) 	
	select ClaimId,Units,Charged
	from vwSHS_InvoiceCharges 
	GO
	

--Refresh Entities Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Entities') 
		drop table SHS_Entities ;
	select * into SHS_Entities from vwSHS_Entities
	GO

	--Refresh Encounters Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Encounters') 
		drop table SHS_Encounters ;
	select * into SHS_Encounters from vwSHS_Encounters
	GO

	--Refresh Locations Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Locations') 
		drop table SHS_Locations ;
	select * into SHS_Locations from vwSHS_Locations
	GO

	--Refresh Participants Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Participants') 
		drop table SHS_Participants ;
	select * into SHS_Participants from vwSHS_Participants
	GO
		
	--Refresh Patients Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Patients') 
		drop table SHS_Patients ;
	select * into SHS_Patients from vwSHS_Patients
	GO

	--Refresh Payments Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_Payments') 
		drop table SHS_Payments ;
	select * into SHS_Payments from vwSHS_Payments
	GO

	--Refresh PaymentItems Table
	if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'SHS_PaymentItems') 
		drop table SHS_PaymentItems ;
	select * into SHS_PaymentItems from vwSHS_PaymentItems
	GO