create table DefaultEntityLookup  ( 
					DefaultEntityLookupID int NOT NULL IDENTITY(1,1), 
					Region varchar(50) not null, 
					TechEntityDefault varchar(150) not null, 
					ProEntityDefault varchar(150) not null) 


select * from defaultentitylookup

INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Alaska','Neuro Wave Physiology, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Arizona','Lonestar, LLC','AccuZone Diagnostics, LLC')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('California','No Tech Billing','No Pro Billing')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Colorado','Cortico Spinal Diagnostics, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Georgia-North','Gemini Health, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Louisiana','Laser Accurate, LLC','Neuroplexus, LLC')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Maryland','No Tech Billing','No Pro Billing')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Mississippi - South','Core Diagnostics, LLC','Neuroplexus, LLC')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Missouri','Monument Diagnostics','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Nevada - Las Vegas','Neon Diagnostics, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Ohio','Over the Horizon IOM, LLC','One Care Monitoring, LLC')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Oklahoma','Cortex Neuromonitoring, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Oregon','Neuro Wave Physiology, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Pennsylvania','Frontline Healthcare, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('South Carolina','Alpha Monitoring, LLC','Radiant Neuromonitoring, LLC')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Texas - Austin','Delta Neuromonitoring, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Texas - DFW','Neurite Monitoring, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Texas - Houston','Apex Health Monitoring, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Texas - South Texas','Mission Diagnostics, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Texas - West Texas','El Paso Monitoring, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Washington','Neuro Wave Physiology, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Kansas','National Neuromonitoring Services, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Virginia ','National Neuromonitoring Services, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')

--ticket 2291 lauren
select * from defaultentitylookup where DefaultEntityLookupID = 22
update DefaultEntityLookup set TechEntityDefault = 'Arch Diagnostics, LLC' where DefaultEntityLookupID = 22

--ticket 2291 lauren
select * from defaultentitylookup where DefaultEntityLookupID = 24
select * from defaultentitylookup where region = 'Michigan'
INSERT INTO DEFAULTENTITYLOOKUP (Region, TechEntityDefault, ProEntityDefault) VALUES('Michigan','National Neuromonitoring Services, LLC','Neurodiagonostics & Neuromonitoring Institute, Inc.')

--BEGIN Ticket #2455
update DefaultEntityLookup set TechEntityDefault = 'LoneStar Diagnostics, LLC'		   where DefaultEntityLookupID = '2'
update DefaultEntityLookup set TechEntityDefault = 'Laser Accurate IOM, LLC'		   where DefaultEntityLookupID = '6'
update DefaultEntityLookup set TechEntityDefault = 'Core Neurodiagnostics, LLC'		   where DefaultEntityLookupID = '8'
update DefaultEntityLookup set TechEntityDefault = 'National Neuromonitoring Services' where DefaultEntityLookupID = '23'
update DefaultEntityLookup set TechEntityDefault = 'National Neuromonitoring Services' where DefaultEntityLookupID = '24'
----------------------------------
update TechCompanyLookup set TechEntity = 'Core Neurodiagnostics, LLC'		  where TechEntityLookupID IN ('18')
update TechCompanyLookup set TechEntity = 'Laser Accurate IOM, LLC'			  where TechEntityLookupID IN ('13','14','15','16','180','181','182','183')
update TechCompanyLookup set TechEntity = 'LoneStar Diagnostics, LLC'		  where TechEntityLookupID IN ('3','4','5','6','7','8','9')
update TechCompanyLookup set TechEntity = 'National Neuromonitoring Services' where TechEntityLookupID IN ('142','143','146','147','148','149','150','154','155','161','165','170')
update TechCompanyLookup set TechEntity = 'Physiologic Diagnostic Services'	  where TechEntityLookupID IN ('83','85','86','100','108','111','118','124','186','187','188','189')
update TechCompanyLookup set TechEntity = 'Synergy Neuromonitoring LLC'		  where TechEntityLookupID IN ('119','126','130','132','133','134','135','137','138','139','140','141','162')
--END Ticket #2455