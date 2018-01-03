-- ==============================================
-- RegionTechEntityLookup

drop table regiontechentitylookup 
create table RegionTechEntityLookup  (RegionID int NOT NULL IDENTITY(1,1), RegionName varchar(150) not null, TechEntity nchar(50) not null, StartDate date, EndDate date, PRIMARY KEY(RegionID))

--insert into regiontechentityLookup (RegionName,TechEntity) values ('Alaska-Homer','')
--insert into regiontechentityLookup (RegionName,TechEntity) values ('Arizona','')
--insert into regiontechentityLookup (RegionName,TechEntity) values ('California - Central','')
--insert into regiontechentityLookup (RegionName,TechEntity) values ('Georgia-North','')
--insert into regiontechentityLookup (RegionName,TechEntity) values ('Louisiana','')
--insert into regiontechentityLookup (RegionName,TechEntity) values ('National Neuromonitoring - Houston','')
--insert into regiontechentityLookup (RegionName,TechEntity) values ('Oklahoma-OKC','')

insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) values ('Austin','Neurophysiologic Interpretive Services, LLC','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) values ('Colorado Springs','Cortico Spinal Diagnostics, LLC','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) values ('National Neuromonitoring - DFW','Physiologic Diagnostic Service LLC','2013-04-07','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) values ('South Texas Neuromonitoring','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) values ('Tri-Cities','Neuro Wave Physiology, LLC','2015-01-01','2020-12-31')

update regiontechentitylookup set startdate = '2009-07-09' where regionid = 4

<<<<<<< HEAD
-- Onsite 5/3/16
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Arizona', 'LoneStar Diagnostics, LLC','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Oklahoma', 'Neurassure, LLC','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Houston', 'Synergy Neuromonitoring LLC','2015-01-01','2020-12-31')

select * from regiontechentitylookup
update regiontechentitylookup set TechEntity = 'Physiologic Diagnostic Services' where regionid = 3
update regiontechentitylookup set techentity = 'Neurophysiologic Interpretive Services LLC' where regionid = 1
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('San Antonio','South Texas Neuromonitoring','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Old', 'National Neuromonitoring - DFW','2015-01-01','2020-12-31')

select * from regiontechentitylookup

insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('National Neuromonitoring - Houston', 'Synergy Neuromonitoring LLC','2015-01-01','2020-12-31')

insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('California - Central', 'National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Alaska-Homer', 'National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Ohio', 'National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Georgia-North', 'National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Washington', 'National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Oklahoma-OKC', 'National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Louisiana', 'National Neuromonitoring Services','2015-01-01','2020-12-31')

update regiontechentitylookup set Techentity = 'Neuro Wave Physiology, LLC' where regionid = 16


--Ticket #851
select * from RegionTechEntityLookup where regionname like '%oklahoma%'
update regiontechentitylookup set enddate = '2016-03-31' where regionid=17
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Oklahoma-OKC', 'Red River Neurodiagnostics, LLC','2016-04-01','2020-12-31')


-- 1657 Christy
select * from RegionTechEntityLookup where regionid in (19, 17, 12, 13)
update regiontechentitylookup set RegionName = 'Oklahoma' where regionid in (19, 17)
update regiontechentitylookup set RegionName = 'California' where regionid = 12
update regiontechentitylookup set RegionName = 'Alaska' where regionid = 13

insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Maryland','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Mississippi - South','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Missouri','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Nevada - Las Vegas','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Oregon','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Pennsylvania','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('South Carolina','National Neuromonitoring Services','2015-01-01','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Texas - West Texas','National Neuromonitoring Services','2015-01-01','2020-12-31')

-- Ticket #1664
select * from RegionTechEntityLookup where regionname = 'oklahoma'
update regiontechentitylookup set startdate = '2017-01-01' where regionid = 7
update regiontechentitylookup set enddate = '2016-12-31' where regionid = 19





select * from RegionTechEntityLookup where regionid in (18,22)
update regiontechentitylookup set enddate = '2017-03-28' where regionid = 18
update regiontechentitylookup set enddate = '2017-03-09' where regionid = 22

select * from RegionTechEntityLookup where regionname in ('Missouri','Louisiana')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Louisiana','Laser Accurate IOM, LLC','2017-03-29','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Missouri','Acadian IOM, LLC','2017-03-10','2020-12-31')

--ticket 1866 Lauren

select * from RegionTechEntityLookup where regionname in ('Nevada - Las Vegas','Maryland', 'California')

insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Nevada - Las Vegas','Neon Diagnostics, LLC','2016-07-19','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('Maryland','Illuminate Monitoring Resources, LLC','2016-11-29','2020-12-31')
insert into regiontechentityLookup (RegionName,TechEntity,StartDate,EndDate) 
	values ('California','CareSource IOM, LLC','2016-11-29','2020-12-31')

select * from RegionTechEntityLookup where regionid in (23,20,12)
update regiontechentitylookup set enddate = '2016-07-18' where regionid = 23
update regiontechentitylookup set enddate = '2016-11-28' where regionid = 20
update regiontechentitylookup set enddate = '2016-11-28' where regionid = 12









