--must create a view to grant permissions to it.
create view vwHospitals3300 as 
select * from hospitals_3300
go

--Ticket #2449
create view vwInvoiceHistory3300 as 
select * from invoice_history_3300
go
create view vwInvPay3300 as 
select * from inv_pay_3300
go

--Ticket #2458
create view vwCaseReport3300 as 
select * from case_report_3300
go
create view vwHistory3300 as 
select * from history_3300
go
create view vwHL7RawData3300 as 
select * from hl7_raw_data_3300
go
create view vwHospitalHistory3300 as 
select * from hospital_history_3300
go
create view vwNotes3300 as 
select * from notes_3300
go
create view vwPatientMuscles3300 as 
select * from patient_muscles_3300
go
create view vwPatientOtherMuscles3300 as 
select * from patient_other_muscles_3300
go
create view vwChargeableSupply3300 as 
select * from chargeable_supply_3300
go