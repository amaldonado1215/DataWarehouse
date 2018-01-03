CREATE TABLE [dbo].[ClaimDateHistory]
(
	[Id] INT IDENTITY(1,1) NOT NULL  PRIMARY KEY , 
    [claim_seq] INT NOT NULL, 
    [patient_id] INT NOT NULL, 
    [claim_date] DATE NOT NULL
)

drop table claimdatehistory

--select * from claim_entity_3300

insert into claimdatehistory (claim_seq, patient_id, claim_date) 
	select distinct claim_seq, patient_id, claim_date 
	from claim_entity_3300 
	where claim_seq is not null and patient_id is not null and claim_date is not null


alter procedure spUpdateClaimDateHistory as 

insert into claimdatehistory (claim_seq, patient_id, claim_date) 
	select ce.claim_seq, ce.patient_id, ce.claim_date
	from claim_entity_3300 ce
	left join claimdatehistory cdh on ce.claim_seq = cdh.claim_seq and ce.patient_id = cdh.patient_id and ce.claim_date = cdh.claim_date
	where cdh.claim_seq is null 
		and ce.claim_date is not null
		and ins_folder = 'Ongoing Insurance Billing'

		select * from claimdatehistory


-- ClaimDate FIxes
select * from claim_entity_3300
-- Ticket #659

select * from claimdatehistory where patient_ID in (324901,367426,214469,367457,306999,367341,336915,378386)
order by patient_id, claim_date



/******************************
*** PA CLAIM HISTORY  
***
***
********************************/

CREATE TABLE [dbo].[ClaimDateHistoryPA]
(
	[Id] INT IDENTITY(1,1) NOT NULL  PRIMARY KEY , 
    [claim_seq] INT NOT NULL, 
    [patient_id] INT NOT NULL, 
    [claim_date] DATE NOT NULL
)

drop table claimdatehistoryPA

--select * from claim_entity_3300

insert into claimdatehistoryPA (claim_seq, patient_id, claim_date) 
	select distinct claim_seq, patient_id, claim_date 
	from claim_entity_3350 
	where claim_seq is not null and patient_id is not null and claim_date is not null


create procedure spUpdateClaimDateHistoryPA as 

insert into claimdatehistoryPA (claim_seq, patient_id, claim_date) 
	select ce.claim_seq, ce.patient_id, ce.claim_date
	from claim_entity_3350 ce
	left join claimdatehistorypa cdh on ce.claim_seq = cdh.claim_seq and ce.patient_id = cdh.patient_id and ce.claim_date = cdh.claim_date
	where cdh.claim_seq is null 
		and ce.claim_date is not null
		and ins_folder = 'Ongoing Insurance Billing'

		select * from claimdatehistorypa


-- ClaimDate FIxes
select * from claim_entity_3350
-- Ticket #659

select * from claimdatehistorypa where patient_ID in (324901,367426,214469,367457,306999,367341,336915,378386)
order by patient_id, claim_date

