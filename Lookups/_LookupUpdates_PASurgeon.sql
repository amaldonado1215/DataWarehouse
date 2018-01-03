
﻿-- Work with Deborah onsite 12/15/15
drop table pasurgeonlookup
CREATE TABLE [dbo].[PASurgeonLookup] (
     [SurgeonID] INT        IDENTITY (1, 1) NOT NULL,
    [Surgeon]     NCHAR (50) NOT NULL,
    [Entity]      NCHAR (50) NOT NULL,
    [StartDate]   DATE       NOT NULL,
    [EndDate]     DATE       NULL,
    [Region]      NCHAR (50) NULL,
    [SurgeonOwnd]  NCHAR (3) NULL
    CONSTRAINT [PK_PASurgeonLookup] PRIMARY KEY CLUSTERED ([SurgeonID] ASC)
);

-- origin/Modifications

--select * from pasurgeonlookup

insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Irvin K Sahni, M.D.', 'Neuro Precision Assisting, PLLC', '2015-05-26', '2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Irvin Sahni, M.D.',	'Neuro Precision Assisting, PLLC',	'2015-05-26', '2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Melanie Kinchen, M.D.',	'BK Assist, PLLC',	'2015-02-05','2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Jean Louis Benae, M.D.',	'Horizon PA Services, PLLC',	'2015-01-15','2016-12-31',  'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Jean-Louise Benae, M.D.',	'Horizon PA Services, PLLC',	'2015-01-15','2016-12-31',  'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Kevin Richardson, D.O.',	'Reliable Assist, PLLC',	'2015-04-20','2016-12-31',  'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Charles Pipkin, M.D.',	'Ridgeback Assist, PLLC',	'2015-06-05', '2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Robert Josey, M.D.',	'Facilitate Surgical, PLLC',	'2015-06-04','2016-12-31',  'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Laurie Novosad, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Tiffany Jackson, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Grace Kumar, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Paul Vaughan, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('James Hayhurst, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Lomis Avramis, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Mark Norris, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Anup Pradhan, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Mustasim Rumi, M.D.',	'Accusist, PLLC',	'2015-09-14', '2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Michael David Dennis, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Anup Pradhan, M.D.',	'NPPA Services',	'2015-07-23','2016-12-31', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Adewale Adeniran, M.D.', 'Padeniran Corp, PLLC',	'2015-11-04', '2016-12-31', 'Yes')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Adewale Adeniran, M.D.', 'NPPA Services',	'2015-07-23','2016-11-03', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Anup Pradhan, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22','No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Charles Stuart Pipkin, III, M.D.', 'Ridgeback Assist, PLLC', '2015-06-05', '2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Grace Kumar, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('James Hayhurst, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Laurie Novosad, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Lomis Avramis, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Mark Norris, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Mustasim Rumi, M.D.', 'NPPA Services',	'2015-07-23','2015-09-13', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Paul Vaughan, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Robert Josey, M.D.', 'Precision Assist of San Antonio', '2015-01-01', '2015-07-22', 'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Tiffany Jackson, M.D.', 'Precision Assist of Dallas', '2015-01-01', '2015-07-22', 'No')
update pasurgeonlookup set enddate = '2015-06-03' where surgeonid = 32

-- ONSITE modifications with Deborah 1/5/16
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Juan Martin, M.D.', 'NPPA Services', '2015-07-23', '2016-12-31', 'No')

-- ONSITE Changes 1/12/16
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Kevin James, M.D.', 'Spine Surgical Services, PLLC', '2015-11-05', '2016-12-31', 'Yes')

-- ONSITE 2/9/16
update pasurgeonlookup set enddate = '2015-11-03' where surgeonid = '22'

-- ONSITE 2/23/16
update pasurgeonlookup set Entity = 'Accuist, PLLC' where surgeonid = '17'
update pasurgeonlookup set Startdate = '2015-05-28' where surgeonid = '8'
update pasurgeonlookup set enddate = '2015-05-27' where surgeonid = '32'

-- Ticket #460
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Charles Pipkin', 'Ridgeback Assist, PLLC',	'2016-06-05', '2016-12-31', 'Yes') 
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Irvin K Sahni', 'Neuro Precision Assisting, PLLC',	'2016-12-31',	'2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Jean Louis Benae', 'Horizon PA Services, PLLC', '2015-01-15',	'2016-12-31', 'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Paul Geibel, M.D.', 'NPPA Services', '2015-07-23'	,'2016-12-31',	'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Ram Vasudevan, M.D.', 'NPPA Services',	'2015-07-23'	,'2016-12-31',	'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Steven Remer', 'NPPA Services',	'2015-07-23'	,'2016-12-31',	'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Theodore Spinks, M.D.', 'NPPA Services',	'2015-07-23'	,'2016-12-31',	'No')


select * from pasurgeonlookup where surgeon in ('Charles Pipkin', 'Irvin K Sahni','Jean Louis Benae', 'Paul Geibel, M.D.', 'Ram Vasudevan, M.D.', 'Steven Remer', 'Theodore Spinks, M.D.')


--Ticket #499

update PASurgeonLookup set startdate = '2015-06-05' where surgeonid = 44

-- Ticket #510
update pasurgeonlookup set entity = 'Accusist, PLLC' where surgeonid = 17

--select * from pasurgeonlookup where surgeon like '%rumi%'
--Charles Pipkin	Ridgeback Assist, PLLC	6/5/2015	2016-12-31		Yes

-- Ticket #630
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Irvin K Sahni', 'Neuro Precision Assisting, PLLC',	'2015-05-26'	,'2016-12-31',	'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Michael Moghimi', 'NPPA Services',	'2015-07-23'	,'2016-12-31',	'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Samir Parikh, M.D.', 'NPPA Services',	'2015-07-23'	,'2016-12-31',	'No')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Sean Jones-Quaidoo, M.D.', 'Premier Physician Surgical Associates, PLLC',	'2016-05-05'	,'2016-12-31',	'Yes')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Adam Bruggeman, M.D.', 'ACME Assist, PLLC',	'2015-07-23'	,'2016-12-31',	'Yes')

select * from pasurgeonlookup where surgeon like '%sahni%'
delete from pasurgeonlookup where surgeonid = 38

select * from vwpamaster where surgeon like '%josey%' and dos < '2015-05-30'
select * from vwPAValidationCheckUnmatchedInsuranceLookup
select * from vwPAValidationCheckUnMatchedSurgeons

-- Ticket #725
select * from pasurgeonlookup where surgeon like '%Bruggeman%'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd) values ('Adam Bruggeman', 'ACME Assist, PLLC',	'2015-07-23'	,'2016-12-31',	'Yes')
update pasurgeonlookup set IOMSurgeonName = 'Adam Bruggeman, M.D.' where surgeonid = 51

-- Ticket #745
select * from pasurgeonlookup where surgeonid = 50
update pasurgeonlookup set entity = 'Precision NeuroSpine Assistants, PLLC' where surgeonid = 50

-- Ticket #758
select * from pasurgeonlookup where surgeon like '%Rosenstein%'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Jacob Rosenstein, M.D.', 'Exos Surgical Assist, PLLC',	'2016-07-11'	,'2016-12-31',	'Yes', 'Jacob Rosenstein, M.D.')


-- Ticket #822
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Marc Franklin, M.D.', 'NPPA Services',	'2015-07-23','2020-12-31',	'No', 'Gerald Franklin, M.D.')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Gerald Franklin', 'NPPA Services', '2015-07-23','2020-12-31',	'No', 'Gerald Franklin, M.D.') 

update pasurgeonlookup set enddate = '2016-07-31' where surgeonid = 40

insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Paul Geibel, M.D.', 'Blue Laser Surgical Company, PLLC', '2016-08-01', '2020-12-31',  'Yes', 'Paul Geibel, M.D.') 

--select * from pasurgeonlookup where surgeon in ('Marc Franklin, M.D.','Gerald Franklin','Paul Geibel, M.D.')

-- Ticket #1036
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Amanda Marshall, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31',  'No', 'Gerald Franklin, M.D.') 
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Gregory Barnes, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31',  'No', 'Gerald Franklin, M.D.') 
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Kevin Kaufman', 'NPPA Services', '2015-07-23', '2020-12-31',  'No', 'Paul Geibel, M.D.') 
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Stephen Neece, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31',  'No', 'Paul Geibel, M.D.') 

select * from pasurgeonlookup where surgeon in ('Amanda Marshall, M.D.','Gregory Barnes, M.D.',
				'Kevin Kaufman','Stephen Neece, M.D.')

-- Ticket #1035
update pasurgeonlookup set enddate = '2016-08-23' where surgeonid = 46
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Michael Moghimi', 'Facilitate Surgical, PLLC', '2016-08-24', '2020-12-31',  'Yes', 'Michael Moghimi') 

--select * from pasurgeonlookup where surgeon = 'Michael Moghimi'

--46	Michael Moghimi	NPPA Services	2015-07-23	8/23/2016	 	No	Michael Moghimi
--46			8/24/2016	future	 	Yes	Michael Moghimi


-- Ticket #1042
update pasurgeonlookup set enddate = '2016-09-01', IOMSurgeonName = 'Stephen Neece, M.D.' where surgeonid = 59
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Stephen Neece, M.D.', 'Frisco neuro Collaborations, PLLC', '2016-09-02', '2020-12-31',  'Yes', 'Stephen Neece, M.D.') 
update pasurgeonlookup set IOMSurgeonName = '' where surgeonid in (56,57)
update pasurgeonlookup set IOMSurgeonName = 'Kevin Kaufman, M.D.' where surgeonid = 58
select * from pasurgeonlookup where surgeon in ('Stephen Neece, M.D.', 'Amanda marshall, M.D.', 'Gregory Barnes, M.D.', 'Kevin Kaufman')

-- Ticket #1154
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Jean-Louis Benae, M.D.', 'Horizon PA Services, PLLC', '2015-01-15', '2016-12-31',  'Yes', 'Stephen Neece, M.D.') 
select * from vwPAMaster where surgeon like '%benae%' and dos < '2016-10-14'         

select * from pasurgeonlookup where surgeon  ='Jean-Louis Benae, M.D.' 
select * from pasurgeonlookup where surgeon like '%benae%'      

 -- Ticket #1182

insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Gerald Franklin, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', 'No', 'Gerald Franklin, M.D.')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Andrew Indresano, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', 'No', 'Andrew Indresano, M.D.')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Kevin Kaufman, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', 'No', 'Kevin Kaufman, M.D.')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Michael Jones, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', 'No', '')	
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Michael Moghimi, M.D.', 'Facilitate Surgical, PLLC', '2016-08-24', '2020-12-31', 'Yes', 'Michael Moghimi, M.D.')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Stephen Neece', 'Frisco neuro Collaborations, PLLC', '2016-09-02', '2020-12-31', 'Yes', 'Stephen Neece, M.D.')

select * from pasurgeonlookup where surgeon in ('Gerald Franklin, M.D.','Andrew Indresano, M.D.','Kevin Kaufman, M.D.','Michael Jones, M.D.','Michael Moghimi, M.D.','Stephen Neece')

-- Ticket #1189


insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Stephen Neece', 'NPPA Services', '2015-07-23', '2016-09-01', 'No', 'Stephen Neece, M.D.')

select * from pasurgeonlookup where surgeon in ('Stephen Neece')

-- Ticket #1208

insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Andrew Bowser, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', 'No', '')	
insert into pasurgeonlookup (surgeon, entity, startdate, enddate,  surgeonownd, IOMSurgeonName) 
	values ('Michael O''Brien, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', 'No', '')

select * from pasurgeonlookup where surgeon in ('Andrew Bowser, M.D.','Michael O''Brien, M.D.', '')

-- Ticket #1232

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Hongbo Lui, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', '', 'No', '')
update pasurgeonlookup set IOMSurgeonname = 'Hongbo Lui, M.D.' where surgeonid = 72
	select * from pasurgeonlookup where surgeon in ('Hongbo Liu, M.D.')

-- Ticket #1246

Update pasurgeonlookup set Surgeon = 'Hongbo Liu, M.D.', IOMSurgeonName = 'Hongbo Liu, M.D.' where surgeonid = 72
--Hongbo Liu, M.D.	NPPA Services	2015-07-23	future		No	Hongbo Liu, M.D.


-- Ticket #1273

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Frank Kuwamura, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31', '', 'Noinsert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values (Frank Kuwamura, M.D.')

select * from pasurgeonlookup where surgeon in ('Frank Kuwamura, M.D.')

-- Ticket #1370 Christy

select * from pasurgeonlookup where surgeon in ('Josue Gabriel, M.D.')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Josue Gabriel, M.D.', 'Surgical Fusion, LLC', '2016-11-02', '2020-12-31', '', 'Yes', 'Josue Gabriel, M.D.')

-- Ticket #1411 Christy

select * from pasurgeonlookup where SurgeonID in (21, 39, 62, 4, 14, 36, 6, 43)

Update PASurgeonLookup set EndDate = '2017-12-31' where SurgeonID in (21, 39, 62, 4, 14, 36, 6, 43)

-- Ticket #1429 Christy

select * from pasurgeonlookup where surgeon in ('Manish Patel, M.D.')
select * from pasurgeonlookup where SurgeonID in (1,2,3,4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 24, 34, 35, 36, 39, 42, 43, 44, 45, 47, 48, 49, 51, 52, 62)
Update PASurgeonLookup set EndDate = '2017-12-31' where SurgeonID in (1,2,3,4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 24, 34, 35, 36, 39, 42, 43, 44, 45, 47, 48, 49, 51, 52, 62)

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Manish Patel, M.D.', 'NPPA Services', '2015-07-23', '2017-12-31', '', 'No', 'Manish Patel, M.D.')


-- Ticket #1440 Christy

select * from pasurgeonlookup where surgeon in ('Reginald Baptiste, M.D.')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Reginald Baptiste, M.D.', 'NPPA Services', '2015-07-23', '2017-12-31', '', 'No', 'Reginald Baptiste, M.D.')

-- Ticket #1502 Christy

select * from pasurgeonlookup where surgeon in ('Joshua James, M.D.')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Joshua James, M.D.', 'NPPA Services', '2015-07-23', '2017-12-31','', 'No', 'Joshua James, M.D.')


-- Ticket #1565

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Andrew Ebert, M.D.', 'NPPA Services', '2015-07-23', '2017-12-31','', 'No', 'Andrew Ebert, M.D.')

select * from pasurgeonlookup where surgeon in ('Andrew Ebert, M.D.')


-- Ticket #1623 Christy

select * from pasurgeonlookup where surgeonid = 42
Update PASurgeonLookup set IOMSurgeonName= 'Steven Remer, M.D.' where SurgeonID =42

select * from pasurgeonlookup where surgeon in ('Desh Sahni, M.D.','Edward Seade, M.D.')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Desh Sahni, M.D.', 'NPPA Services', '2015-07-23', '2017-12-31','', 'No', 'Desh Sahni, M.D.')                              	
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Edward Seade, M.D.', 'NPPA Services', '2015-07-23', '2017-12-31','', 'No','')

-- 1749 Christy
select * from pasurgeonlookup where surgeonid = 73
Update pasurgeonlookup set Enddate= '2017-03-31' where SurgeonID =73

select * from pasurgeonlookup where surgeon = 'Frank Kuwamura, M.D.'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Frank Kuwamura, M.D.', 'Pinnacle Assist, PLLC', '2017-04-01', '2020-12-31','', 'Yes', 'Frank Kuwamura, M.D.')

-- 1799 Christy

select * from pasurgeonlookup where surgeon = 'Hongbo Liu, M.D.'
Update pasurgeonlookup set Enddate= '2017-02-28' where SurgeonID =72
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Hongbo Liu, M.D.', 'SurgAlliance, PLLC', '2017-03-01', '2020-12-31','','Yes', 'Hongbo Liu, M.D.')

-- 1847 lauren

select * from pasurgeonlookup where surgeon = 'Samir Parikh, M.D.'

Update pasurgeonlookup set Enddate= '2016-12-31' where SurgeonID =47

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Samir Parikh, M.D.','SXA, PLLC','2017-01-01','2020-12-31','','No','Samir Parikh, M.D.')

-- 1878 lauren

select * from pasurgeonlookup where surgeon = 'Mark Parrella, M.D.'

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Mark Parrella, M.D.','Sustainable Assist, PLLC','2017-03-29','2020-12-31','','Yes','')

-- 2019 lauren

select * from pasurgeonlookup where surgeon like '%Adewale Adeniran%'
Update pasurgeonlookup set Enddate= '2017-04-28' where SurgeonID = 21
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Adewale Adeniran, M.D.','NPPA Services','2017-04-29','2020-12-31','','No','Adewale Adeniran, M.D.')

-- 2061 lauren

select * from pasurgeonlookup where surgeon like '%Edward Seade%'
Update pasurgeonlookup set Enddate= '2017-05-11' where SurgeonID = 80
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Edward Seade, M.D','Facilitate Surgical, PLLC','2017-05-12','2020-12-31','','Yes','Edward Seade, M.D.')

-- 2062 lauren

select * from pasurgeonlookup where surgeon like '%Shaun Maloney%'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName) 
	values ('Shaun Maloney, M.D.','NPPA Services','2015-07-23','2017-12-31','','No','Shaun Maloney, M.D.')

-- 2062 lauren, update from deborah

select * from pasurgeonlookup where surgeon like '%Shaun Maloney%'
Update pasurgeonlookup set Enddate= '2020-12-31' where SurgeonID = 87

--ticket 2099, correct ticket 2061

select * from pasurgeonlookup where surgeonid = 86
Update pasurgeonlookup set surgeon = 'Edward Seade, M.D.' where SurgeonID = 86

-- ticket #2110 
ALTER TABLE pasurgeonlookup ADD SurgeonNo smallint;
ALTER TABLE pasurgeonlookup alter column surgeonno int;
UPDATE PASurgeonLookup SET SurgeonNo = 40006 Where SurgeonID = 1
UPDATE PASurgeonLookup SET SurgeonNo = 40006 Where SurgeonID = 2
UPDATE PASurgeonLookup SET SurgeonNo = 40002 Where SurgeonID = 3
UPDATE PASurgeonLookup SET SurgeonNo = 40000 Where SurgeonID = 4
UPDATE PASurgeonLookup SET SurgeonNo = 40004 Where SurgeonID = 6
UPDATE PASurgeonLookup SET SurgeonNo = 40012 Where SurgeonID = 7
UPDATE PASurgeonLookup SET SurgeonNo = 40008 Where SurgeonID = 8
UPDATE PASurgeonLookup SET SurgeonNo = 30002 Where SurgeonID = 9
UPDATE PASurgeonLookup SET SurgeonNo = 30058 Where SurgeonID = 10
UPDATE PASurgeonLookup SET SurgeonNo = 30050 Where SurgeonID = 11
UPDATE PASurgeonLookup SET SurgeonNo = 30020 Where SurgeonID = 12
UPDATE PASurgeonLookup SET SurgeonNo = 30054 Where SurgeonID = 13
UPDATE PASurgeonLookup SET SurgeonNo = 30038 Where SurgeonID = 14
UPDATE PASurgeonLookup SET SurgeonNo = 30000 Where SurgeonID = 15
UPDATE PASurgeonLookup SET SurgeonNo = 30026 Where SurgeonID = 16
UPDATE PASurgeonLookup SET SurgeonNo = 40016 Where SurgeonID = 17
UPDATE PASurgeonLookup SET SurgeonNo = 30030 Where SurgeonID = 18
UPDATE PASurgeonLookup SET SurgeonNo = 40018 Where SurgeonID = 21
UPDATE PASurgeonLookup SET SurgeonNo = 40018 Where SurgeonID = 22
UPDATE PASurgeonLookup SET SurgeonNo = 30026 Where SurgeonID = 23
UPDATE PASurgeonLookup SET SurgeonNo = 40012 Where SurgeonID = 24
UPDATE PASurgeonLookup SET SurgeonNo = 30050 Where SurgeonID = 25
UPDATE PASurgeonLookup SET SurgeonNo = 30054 Where SurgeonID = 26
UPDATE PASurgeonLookup SET SurgeonNo = 30002 Where SurgeonID = 27
UPDATE PASurgeonLookup SET SurgeonNo = 30038 Where SurgeonID = 28
UPDATE PASurgeonLookup SET SurgeonNo = 30000 Where SurgeonID = 29
UPDATE PASurgeonLookup SET SurgeonNo = 40016 Where SurgeonID = 30
UPDATE PASurgeonLookup SET SurgeonNo = 30020 Where SurgeonID = 31
UPDATE PASurgeonLookup SET SurgeonNo = 40008 Where SurgeonID = 32
UPDATE PASurgeonLookup SET SurgeonNo = 30058 Where SurgeonID = 33
UPDATE PASurgeonLookup SET SurgeonNo = 40000 Where SurgeonID = 34
UPDATE PASurgeonLookup SET SurgeonNo = 30006 Where SurgeonID = 35
UPDATE PASurgeonLookup SET SurgeonNo = 40020 Where SurgeonID = 36
UPDATE PASurgeonLookup SET SurgeonNo = 40000 Where SurgeonID = 39
UPDATE PASurgeonLookup SET SurgeonNo = 40028 Where SurgeonID = 40
UPDATE PASurgeonLookup SET SurgeonNo = 40024 Where SurgeonID = 41
UPDATE PASurgeonLookup SET SurgeonNo = 30028 Where SurgeonID = 42
UPDATE PASurgeonLookup SET SurgeonNo = 30018 Where SurgeonID = 43
UPDATE PASurgeonLookup SET SurgeonNo = 40012 Where SurgeonID = 44
UPDATE PASurgeonLookup SET SurgeonNo = 40006 Where SurgeonID = 45
UPDATE PASurgeonLookup SET SurgeonNo = 40030 Where SurgeonID = 46
UPDATE PASurgeonLookup SET SurgeonNo = 30014 Where SurgeonID = 47
UPDATE PASurgeonLookup SET SurgeonNo = 40022 Where SurgeonID = 48
UPDATE PASurgeonLookup SET SurgeonNo = 40014 Where SurgeonID = 49
UPDATE PASurgeonLookup SET SurgeonNo = 40024 Where SurgeonID = 50
UPDATE PASurgeonLookup SET SurgeonNo = 40014 Where SurgeonID = 51
UPDATE PASurgeonLookup SET SurgeonNo = 40026 Where SurgeonID = 52
UPDATE PASurgeonLookup SET SurgeonNo = 30034 Where SurgeonID = 53
UPDATE PASurgeonLookup SET SurgeonNo = 30044 Where SurgeonID = 54
UPDATE PASurgeonLookup SET SurgeonNo = 40028 Where SurgeonID = 55
UPDATE PASurgeonLookup SET SurgeonNo = 30012 Where SurgeonID = 56
UPDATE PASurgeonLookup SET SurgeonNo = 30042 Where SurgeonID = 57
UPDATE PASurgeonLookup SET SurgeonNo = 30048 Where SurgeonID = 58
UPDATE PASurgeonLookup SET SurgeonNo = 40032 Where SurgeonID = 59
UPDATE PASurgeonLookup SET SurgeonNo = 40030 Where SurgeonID = 60
UPDATE PASurgeonLookup SET SurgeonNo = 40032 Where SurgeonID = 61
UPDATE PASurgeonLookup SET SurgeonNo = 40000 Where SurgeonID = 62
UPDATE PASurgeonLookup SET SurgeonNo = 30044 Where SurgeonID = 63
UPDATE PASurgeonLookup SET SurgeonNo = 30056 Where SurgeonID = 64
UPDATE PASurgeonLookup SET SurgeonNo = 30048 Where SurgeonID = 65
UPDATE PASurgeonLookup SET SurgeonNo = 30046 Where SurgeonID = 66
UPDATE PASurgeonLookup SET SurgeonNo = 40030 Where SurgeonID = 67
UPDATE PASurgeonLookup SET SurgeonNo = 40032 Where SurgeonID = 68
UPDATE PASurgeonLookup SET SurgeonNo = 40032 Where SurgeonID = 69
UPDATE PASurgeonLookup SET SurgeonNo = 30036 Where SurgeonID = 70
UPDATE PASurgeonLookup SET SurgeonNo = 30004 Where SurgeonID = 71
UPDATE PASurgeonLookup SET SurgeonNo = 30010 Where SurgeonID = 72
UPDATE PASurgeonLookup SET SurgeonNo = 30008 Where SurgeonID = 73
UPDATE PASurgeonLookup SET SurgeonNo = 40034 Where SurgeonID = 74
UPDATE PASurgeonLookup SET SurgeonNo = 30024 Where SurgeonID = 75
UPDATE PASurgeonLookup SET SurgeonNo = 30040 Where SurgeonID = 76
UPDATE PASurgeonLookup SET SurgeonNo = 30052 Where SurgeonID = 77
UPDATE PASurgeonLookup SET SurgeonNo = 30032 Where SurgeonID = 78
UPDATE PASurgeonLookup SET SurgeonNo = 30022 Where SurgeonID = 79
UPDATE PASurgeonLookup SET SurgeonNo = 30016 Where SurgeonID = 80
UPDATE PASurgeonLookup SET SurgeonNo = 30008 Where SurgeonID = 81
UPDATE PASurgeonLookup SET SurgeonNo = 30010 Where SurgeonID = 82
UPDATE PASurgeonLookup SET SurgeonNo = 30014 Where SurgeonID = 83
UPDATE PASurgeonLookup SET SurgeonNo = 40036 Where SurgeonID = 84
UPDATE PASurgeonLookup SET SurgeonNo = 40018 Where SurgeonID = 85
UPDATE PASurgeonLookup SET SurgeonNo = 30016 Where SurgeonID = 86
UPDATE PASurgeonLookup SET SurgeonNo = 40038 Where SurgeonID = 87

--ticket 2168 lauren

ALTER TABLE PASurgeonLookup
  ADD CoAbbr VARCHAR(20);
 
UPDATE PASurgeonLookup SET CoAbbr = 'ACC' where entity = 'Accusist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'AMA' where entity = 'ACME Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'BKA' where entity = 'BK Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'BLS' where entity = 'Blue Laser Surgical Company, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'ESA' where entity = 'Exos Surgical Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'FAC' where entity = 'Facilitate Surgical, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'FNC' where entity = 'Frisco neuro Collaborations, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'HPA' where entity = 'Horizon PA Services, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'NPA' where entity = 'Neuro Precision Assisting, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = '' where entity = 'NPPA Services'
UPDATE PASurgeonLookup SET CoAbbr = 'PDN' where entity = 'Padeniran Corp, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'PIA' where entity = 'Pinnacle Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = '' where entity = 'Precision Assist of Dallas'
UPDATE PASurgeonLookup SET CoAbbr = '' where entity = 'Precision Assist of San Antonio'
UPDATE PASurgeonLookup SET CoAbbr = 'PNA' where entity = 'Precision NeuroSpine Assistants, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'PPS' where entity = 'Premier Physician Surgical Associates, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'REL' where entity = 'Reliable Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'RDB' where entity = 'Ridgeback Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'SSS' where entity = 'Spine Surgical Services, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'SAL' where entity = 'SurgAlliance, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'SGF' where entity = 'Surgical Fusion, LLC'
UPDATE PASurgeonLookup SET CoAbbr = 'SUS' where entity = 'Sustainable Assist, PLLC'
UPDATE PASurgeonLookup SET CoAbbr = 'SXA' where entity = 'SXA, PLLC'

select * from pasurgeonlookup

--ticket 2172 lauren

select * from pasurgeonlookup where surgeonid in (22,85,56,70,78,64,16,79,80,73,54,63,11,57,72,13,77,35,58,65,9,14,75,53,15,18,66,46,71,30,40,12,
	41,76,47,87,69,59,42,43,10)

UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 22
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 85
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 56
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 70
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 78
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 64
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 16
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 79
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 80
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 73
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 54
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 63
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 11
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 57
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 72
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 13
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 77
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 35
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 58
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 65
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 9
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 14
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 75
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 53
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 15
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 18
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 66
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 46
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 71
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 30
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 40
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 12
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 41
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 76
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 47
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 87
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 69
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 59
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 42
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 43
UPDATE PASurgeonLookup SET CoAbbr = 'NPP' where surgeonid = 10

-- ticket 2206 lauren
select * from pasurgeonlookup
select * from pasurgeonlookup where surgeon like '%Claude-Jean Langevin%'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName, surgeonno, coabbr) 
	values ('Claude-Jean Langevin, M.D.','NPPA Services','2015-07-23','2020-12-31','','No','Claude-Jean Langevin, M.D.',40040,'NPP')

--ticket 2318 lauren
select * from PASurgeonLookup where surgeonid = 83
update PASurgeonLookup set SurgeonOwnd = 'Yes' where surgeonid = 83

--ticket 2323 lauren
select * from PASurgeonLookup where Surgeonid =  1
select * from PASurgeonLookup where Surgeonid =  2
select * from PASurgeonLookup 
select * from PASurgeonLookup where surgeon = 'Mustasim Rumi, M.D.'

UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 1
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 2
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 3
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 4
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 6
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 7
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 45
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 8
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 32
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 9
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 27
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 10
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 33
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 11
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 25
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 12
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 31
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 17
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 30
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 13
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 26
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 41
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 50
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 14
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 28
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 15
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 29
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 16
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 23
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 43
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 18
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 21
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 22
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 57
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 24
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 39
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 36
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 34
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 35
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 47
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 48
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 40
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 55
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 42
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 49
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 44
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 56
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 46
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 60
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 51
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 52
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 53
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 54
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 58
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 59
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 61
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 62
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 63
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 64
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 65
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 66
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 67
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 68
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 69
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 70
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 71
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 72
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 73
UPDATE PASurgeonLookup SET Region = 'Ohio'  WHERE SurgeonID = 74
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 75
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 76
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 77
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 78
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 79
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 80
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 81
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 82
UPDATE PASurgeonLookup SET Region = 'PA - DFW'  WHERE SurgeonID = 83
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 84
UPDATE PASurgeonLookup SET Region = 'PA - South Texas'  WHERE SurgeonID = 85
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 86
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 87
UPDATE PASurgeonLookup SET Region = 'PA - Austin'  WHERE SurgeonID = 88


-- ticket 2346 naz 
select * from pasurgeonlookup
select * from pasurgeonlookup where surgeon like '%Sandeep Mistry, M.D.%'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName, surgeonno, coabbr) 
 values ('Sandeep Mistry, M.D.','NPPA Services','2015-07-23','2020-12-31','PA - Austin','No','','40042','NPP')

 --ticket 2364 lauren
 select * from PASurgeonLookup where SurgeonID = 36
 update PASurgeonLookup	set enddate = '2020-12-31' where SurgeonID = 36

 -- ticket 2383 naz

select * from pasurgeonlookup where surgeon like '%Michael Albrecht, M.D.%'
select * from pasurgeonlookup where surgeon like '%Marc A. Letellier%'

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName, surgeonno, coabbr)
 values ('Michael Albrecht, M.D.','NPPA Services','2015-07-23','2020-12-31','PA - Austin','No','',40044,'NPP')
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName, surgeonno, coabbr)
 values ('Marc A. Letellier','Panduga Surgical Care, PLLC','2017-09-06','2020-12-31','Arizona','Yes','',40048,'PSC')

 -- ticket 2390 naz

select * from pasurgeonlookup where surgeon like '%Jana Schrier, M.D.%'
insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName, surgeonno, coabbr)
 values ('Jana Schrier, M.D.','NPPA Services','2015-07-23','2020-12-31','PA - Austin','No','',40050,'NPP')

 -- Ticket 2417 naz

select * from pasurgeonlookup where surgeon in ('Michael Burris, M.D.','Stephanie Stephens, M.D.')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName,SurgeonNo,CoAbbr)
	values ('Michael Burris, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31','PA - Austin', 'No','',40052,'NPP')

insert into pasurgeonlookup (surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName,SurgeonNo,CoAbbr)
	values ('Stephanie Stephens, M.D.', 'Ideal Assist, PLLC', '2017-11-01', '2020-12-31','PA - DFW', 'Yes','',40054,'IDA')

--ticket 2428 lauren

select * from pasurgeonlookup where surgeonid in (51,54,34,58,60,59,61)
delete from pasurgeonlookup where surgeonid = 51
delete from pasurgeonlookup where surgeonid = 54
delete from pasurgeonlookup where surgeonid = 34
delete from pasurgeonlookup where surgeonid = 58
delete from pasurgeonlookup where surgeonid = 60
delete from pasurgeonlookup where surgeonid = 59
delete from pasurgeonlookup where surgeonid = 61

--ticket 2432 lauren

select * from PASurgeonLookup
select * from PASurgeonLookup where surgeonid = 23
select * from PASurgeonLookup where surgeonid = 17

ALTER TABLE pasurgeonlookup
  ADD SOS_Date DATE;
 
ALTER TABLE pasurgeonlookup
  ADD MngFee decimal(5,4);
  
ALTER TABLE pasurgeonlookup
  ADD BillingFee decimal(5,4);

UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 23
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 25
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 26
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 27
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 28
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 29
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 31
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 32
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-01', MngFee = null,  BillingFee = null WHERE Surgeonid = 33
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-09-14', MngFee = 0.38,  BillingFee = 0.08 WHERE Surgeonid = 17
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-05-05', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 49
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-02-05', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 3
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-08-03', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 55
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-07-11', MngFee = null,  BillingFee = 0.08 WHERE Surgeonid = 52
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-06-04', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 86
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-06-04', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 67
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-06-04', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 8
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-09-02', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 68
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-15', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 39
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-15', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 4
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-01-15', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 62
UPDATE PASURGEONLOOKUP SET SOS_Date = null, MngFee = null,  BillingFee = 0.08 WHERE Surgeonid = 94
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-05-26', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 45
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-05-26', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 1
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-05-26', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 2
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 22
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 85
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 56
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 70
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 78
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 64
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 16
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 88
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 79
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 80
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 73
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 63
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 11
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 57
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 72
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.35,  BillingFee = null WHERE Surgeonid = 13
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.35,  BillingFee = null WHERE Surgeonid = 92
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 77
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 35
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 65
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 9
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 14
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 75
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 53
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 15
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 90
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.35,  BillingFee = null WHERE Surgeonid = 93
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 18
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 66
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 46
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 71
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 30
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 40
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-09-02', MngFee = 0.35,  BillingFee = null WHERE Surgeonid = 12
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 41
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 76
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 47
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 89
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 87
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 69
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 42
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.38,  BillingFee = null WHERE Surgeonid = 43
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-07-23', MngFee = 0.3,  BillingFee = null WHERE Surgeonid = 10
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-11-04', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 21
UPDATE PASURGEONLOOKUP SET SOS_Date = '2017-04-05', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 81
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-05-26', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 50
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-05-05', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 48
UPDATE PASURGEONLOOKUP SET SOS_Date = null, MngFee = null,  BillingFee = 0.08 WHERE Surgeonid = 91
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-06-05', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 44
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-06-05', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 7
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-06-05', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 24
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-04-20', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 6
UPDATE PASURGEONLOOKUP SET SOS_Date = '2017-03-20', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 82
UPDATE PASURGEONLOOKUP SET SOS_Date = '2016-11-02', MngFee = 0.15,  BillingFee = 0.08 WHERE Surgeonid = 74
UPDATE PASURGEONLOOKUP SET SOS_Date = '2015-11-05', MngFee = 0.3,  BillingFee = 0.08 WHERE Surgeonid = 36
UPDATE PASURGEONLOOKUP SET SOS_Date = '2017-03-29', MngFee = 0.15,  BillingFee = 0.08 WHERE Surgeonid = 84
UPDATE PASURGEONLOOKUP SET SOS_Date = '2017-01-31', MngFee = 0.35,  BillingFee = 0.08 WHERE Surgeonid = 83

--ticket 2495 
select * from PASurgeonLookup where SurgeonID = 95
update PASurgeonLookup set coabbr = 'ASA' where SurgeonID = 95

--ticket 2507 lauren
select * from PASurgeonLookup where surgeon in ('Jack Seaquist, M.D.','Robert Graham, M.D.','Troy Thompson, M.D.')
insert into PASurgeonLookup	(surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName,SurgeonNo,CoAbbr,sos_date,mngfee,billingfee,
				firstdos,firstcollection)
	values ('Jack Seaquist, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31','PA - Austin', 'No','Jack Seaquist, M.D.',
			30060,'NPP','2015-07-23',.35,.08,'2015-07-24','2015-12-04')
insert into PASurgeonLookup	(surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName,SurgeonNo,CoAbbr,sos_date,mngfee,billingfee,
				firstdos,firstcollection)
	values ('Robert Graham, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31','PA - Austin', 'No','Robert Graham, M.D.',
			30062,'NPP','2015-07-23',.35,.08,'2015-07-24','2015-12-04')
insert into PASurgeonLookup	(surgeon, entity, startdate, enddate, region, surgeonownd, IOMSurgeonName,SurgeonNo,CoAbbr,sos_date,mngfee,billingfee,
				firstdos,firstcollection)
	values ('Troy Thompson, M.D.', 'NPPA Services', '2015-07-23', '2020-12-31','PA - Austin', 'No','Troy Thompson, M.D.',
			30064,'NPP','2015-07-23',.35,.08,'2015-07-24','2015-12-04')
			
			
-- ticket #1 JTB
select * from pasurgeonlookup where surgeon like '%dryer%'
select * from pasurgeonlookup where surgeonid = 101
UPDATE PASurgeonlookup SET startdate = '2017-11-28' where surgeonid = 101

-- ticket #5 JTB
select surgeonid, surgeon, coabbr, mngfee from pasurgeonlookup where surgeonid in (110,111)
update pasurgeonlookup set coabbr = 'NHA', MngFee = .35 where surgeonid in (110,111)

