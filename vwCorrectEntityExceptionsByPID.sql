SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vwCorrectEntityExceptionsByPID] AS
--SELECT DISTINCT PID, CorrectEntity 
--FROM dbo.CorrectEntityExceptions
SELECT c.PID, 
	COALESCE(e.CorrectEntity,
	CASE
		WHEN c.PID IN (461920, 475127, 504144, 521290) AND SL1.Proentity IS NOT NULL THEN SL1.Proentity
		WHEN c.PID IN (347332, 354211, 354292, 347908, 298807, 711162, 701379) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN c.PID in (611878,611862,610905,607476,606867,606861,605579,605560,579985,606800,607477,682760) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN c.PID in (549577, 607480, 525878, 433968, 518238, 620998) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN c.PID in (529219,548266,530012) THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
		WHEN c.PID = 624536 THEN 'Alamo City Neurodiagnostics, PLLC'
		WHEN c.surgeon = 'Kevin James, M.D.' AND IL.InsuranceGroup = 'Aetna' AND c.[1st Insurance Category] = 'Private Insurance' AND c.dos > '2016-04-22' THEN 'Andaz Monitoring, PLLC'
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.Surgeon IN ('Mike Tyler, M.D.', 'Jason Highsmith, M.D.', 'Sabino D''Agostino, D.O. ', 'William Wilson, M.D.','Don Stovall, M.D.') AND c.DOS >= '2017-09-01' THEN SL1.Proentity 
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Mark Silver, M.D.' THEN SL1.Proentity
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Robert Urrea, M.D.' AND c.DOS >= '2016-09-21' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity 
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Michael Rimlawi, D.O.' THEN SL1.ProEntity
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Curtis MIna, M.D.' THEN SL1.ProEntity -- Ticket #1262
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Ram Vasudevan, M.D.' AND c.DOS >= '2016-11-30' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity  -- Ticket #1314
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Samir Parikh, M.D.' AND c.DOS >= '2016-10-03' AND SL1.proentity IS NOT NULL THEN SL1.ProEntity -- Ticket #1401
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Kendall Carll, M.D.' and c.DOS >= '2017-07-01' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity  -- Ticket #2209
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON = 'Lewis Frazier, M.D.' and c.DOS >= '2017-07-01' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity  -- Ticket #2209
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.SURGEON in ('Carl Bischoff, M.D.','David Cuellar, M.D.') and c.DOS >= '2017-11-14' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity  -- Ticket #63
		WHEN c.[1st Insurance Category] = 'Blue Cross Blue Shield' AND c.Surgeon = 'Richard Westmark, M.D.' AND c.DOS >= '2017-12-01' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity  -- 2018-01-03 JTB Per #6 Github Issue
		WHEN IL.InsuranceGroup = 'Blue Cross Blue Shield' AND  c.hospital IN ('The Spine Hospital of Louisiana ', 'Cypress Pointe Surgical Hospital ') AND c.Reader IN('David Adams, M.D.') THEN 'Pro Read, LLC'
		WHEN c.hospital = 'McBride Clinic Orthopedic Hospital' AND c.[Primary Insurance] LIKE '%kempton%' THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'		
		WHEN c.hospital_ID = 3597 AND c.[Primary Insurance] like '%Health%Choice%' and c.[1st Insurance Category] = 'Bundled' AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity -- #78 kta OK Spine Hosp
		WHEN c.[1st Insurance Category] IN ('Lein Case', 'Letter of Protection', 'Private Insurance', 'Aetna', 'Cigna') AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity -- Ticket #2186 Added Aetna as an Insurance category -- ticket 63 added Cigna
		WHEN c.[1st Insurance Category] IN ('Workmans Comp') AND Region_short_name IN ('Louisiana') AND SL1.Proentity IS NOT NULL THEN Sl1.Proentity 
		WHEN c.[1st Insurance Category] in ('TRICARE', 'CHAMPVA', 'Medicare Replacement Plan') AND c.DOS >= '2017-01-01' 
				AND h.[Contract Type] <> 'No Contract' AND c.Region_Short_Name not in ('Maryland', 'California')  THEN 'Neurodiagnostics & Neuromonitoring Institute, Inc.'  --#73 kta
		WHEN c.Region_Short_Name IN ('Louisiana','Mississippi - South') AND c.dos >'2017-04-01' then 'Neuroplexus, LLC'
		WHEN c.Region_Short_Name in ('Maryland', 'California') AND SL1.Proentity is not null THEN SL1.ProEntity
		WHEN c.Region_short_name in ('Arizona') AND DOS > '2017-06-01' Then 'AccuZone Diagnostics, LLC'
		WHEN c.Region_short_name in ('Ohio')  and DOS > '2017-06-01' Then 'One Care Monitoring, LLC'
		WHEN c.Region_short_name in ('South Carolina') and DOS > '2017-05-01' Then 'Radiant Neuromonitoring, LLC' 
		WHEN c.DOS <= '2014-08-31' THEN 'In-Site Surgical Monitoring Services'
		ELSE /*c.DOS > '2014-08-31' THEN*/ 'Neurodiagnostics & Neuromonitoring Institute, Inc.'	END ) as CorrectProEntity
FROM usmon_local.dbo.case_report_3300 c
	LEFT OUTER JOIN (	SELECT DISTINCT PID, CorrectEntity 
						FROM usmon_local.dbo.CorrectEntityExceptions) e on e.PID = c.PID
	LEFT OUTER JOIN usmon_local.dbo.insurancelookup AS IL ON IL.insurancecompany = c.[Primary Insurance]
	LEFT OUTER JOIN usmon_local.dbo.surgeonlookup2 sl1 ON c.surgeon = sl1.surgeon
                            AND c.dos between sl1.startdate and sl1.enddate
                            AND (sl1.region = Region_Short_Name)                                            
                            AND (sl1.payor = '* ANY *' or sl1.payor = IL.InsuranceGroup)
WHERE c.Deleted <> 'Yes' 
	AND c.Cancelled <> 'Yes' 
	AND c.Patient is NOT NULL 
	AND c.Patient not like '1, %' 
	AND c.Patient not like '2, %'
	AND c.Patient not LIKE 'test, %'
