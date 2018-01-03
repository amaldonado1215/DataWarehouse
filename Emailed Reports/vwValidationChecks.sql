
--- Unmatching Surgeons (no valid surgeon and/or Valid Dates in SurgeonLookup)
alter view vwValidationCheckUnMatchedSurgeons as 
/*select distinct surgeon from vwCases where defaultentity is null and dos > '2015-01-01' */
select distinct vwcases.surgeon, vwcases.region_short_name as region --, vwcases.region_short_name, vwcases.surgeon, vwcases.specialty, dos, defaultentity, [consolidated payor] 
		from vwcases 
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl1 on vwcases.surgeon = sl1.surgeon 
								and vwcases.dos >= sl1.startdate  
								and vwcases.dos <= sl1.enddate
								and sl1.region = Region_Short_Name
								and sl1.payor = '* ANY *'
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl2 on vwcases.surgeon = sl2.surgeon 
								and vwcases.dos >= sl2.startdate  
								and vwcases.dos <= sl2.enddate
								and sl2.region = Region_Short_Name
								and sl2.payor =  vwcases.[consolidated payor]
					LEFT OUTER JOIN 
						dbo.surgeonlookup2 sl3 on vwcases.surgeon = sl3.surgeon 
								and vwcases.dos >= sl3.startdate  
								and vwcases.dos <= sl3.enddate
								and sl3.payor = '* ANY *'
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl4 on vwcases.surgeon = sl4.surgeon 
								and vwcases.dos >= sl4.startdate  
								and vwcases.dos <= sl4.enddate
								and sl4.payor =  vwcases.[consolidated payor]
		where (SL1.Proentity is null 
				AND SL2.proentity is null
				AND SL3.proentity is null
				AND SL4.proentity is null)
				and dos > '2015-01-01'
			--	and vwcases.surgeon like '%kinchen%'
		 



--- Unmatching Cases (no valid surgeon and/or valid dates in SurgeonLookup)
create view vwValidationCheckUnMatchedSurgeonDates as 
select * from vwCases where defaultentity is null and dos > '2015-01-01'

---- Multiple Surgeon Matches   (a single entry finds multiple valid date ranges for that surgeon)

-- InsuranceLookups (Insurance companies that are not found in the insurance lookup table
alter view vwValidationCheckUnmatchedInsuranceLookup as
select distinct [primary insurance],  [consolidated payor], [Insurance Type] from vwMaster2 where [consolidated payor] is null  




-- Tech Region Lookup is missing
alter view vwValidationCheckUnmatchedTechRegionLookup as
select distinct tech from vwCases where TechRegion is null and dos >= '2013-01-01' and tech <> '* Unassigned *'


-- MisBilled Claims 
alter view  vwMisbilledClaims as

select PID, cast (DOS as smalldatetime) as DOS, claim_id, clm_billing_type, cast([claim date] as smalldatetime) as [ClaimDate],
		surgeon, [Primary Insurance], [Insurance Type], biller, box33, Correctentity, 
		DATEDIFF(day, [Claim Date], getdate()) as DaysClaimed 
		from vwMaster2 
		where box33 <> correctentity 
			and clm_billing_type = 'Pro Only' 
			and Folder in ('Ongoing Insurance Billing') 
			and biller in ('Acquisition Billing Services', 'Medical Practice Solutions') 
			and ins_charged > 0.25
			and [Insurance Type] <> 'Patient Responsibility'

-- Misbilled Claims - DFW
alter view  vwMisbilledIOMClaimsABS_DFW as

select PID, cast (DOS as smalldatetime) as DOS, claim_id, clm_billing_type, cast([claim date] as smalldatetime) as [ClaimDate],
		surgeon, [Primary Insurance], [Insurance Type], biller, box33, Correctentity, 
		DATEDIFF(day, [Claim Date], getdate()) as DaysClaimed 
		from vwMaster2 
		where box33 <> correctentity 
			and clm_billing_type = 'Pro Only' 
			and Folder in ('Ongoing Insurance Billing') 
			and biller in ('Acquisition Billing Services -DFW')
			and ins_charged > 0.25
			and [Insurance Type] <> 'Patient Responsibility'
			 

/*=======
select PID, cast (DOS as smalldatetime) as DOS, claim_id, cast([claim date] as smalldatetime) as [ClaimDate], 
		surgeon, [Primary Insurance], [Insurance Type], biller, box33, Correctentity, claimmethod, 
		DATEDIFF(day, [Claim Date], getdate()) as DaysClaimed , ins_charged, balance
from vwMaster2 
		where box33 <> correctentity and clm_billing_type = 'Pro Only' 
			and Folder in ('Ongoing Insurance Billing') 
			and biller in ('Acquisition Billing Services', 'Medical Practice Solutions') 
			and ins_charged > 0 

>>>>>>> origin/Modifications */

			and  surgeon in ('Keith Preston, M.D.','Frank Kuwamura, M.D.','Daniel Peterson, M.D.')
order by daysclaimed

-- Unmatched Hospital (missing hospitals on hospital lookup)
alter view vwValidationCheckUnMatchedHospitals as
select  distinct vwcases.hospital from vwCases LEFT OUTER JOIN hospitallookup as HL on  vwCases.hospital = HL.Hospital  where HL.hospital is null


--- =================================================
--- PA
--- =================================================

-- InsuranceLookups (Insurance companies that are not found in the insurance lookup table
alter view vwPAValidationCheckUnmatchedInsuranceLookup as
select distinct [primary insurance],  [consolidated payor] from vwPAMaster where [consolidated payor] is null  



--- Unmatching Surgeons (no valid surgeon and/or Valid Dates in SurgeonLookup)
create view vwPAValidationCheckUnMatchedSurgeons as 
select distinct surgeon from vwPAMaster where defaultentity is null and dos > '2015-01-01'

select * from vwPAValidationCheckUnMatchedSurgeons

-- Misbilled PA Claims
alter view vwPAMisbilledClaims as 
select PID, DOS, claim_id, [claim date], surgeon, [Primary Insurance], [Insurance Type], biller, box33, 
			Correctentity, DATEDIFF(day, [Claim Date], getdate()) as DaysClaimed 
	from vwPAMaster 
	where box33 <> correctentity and Folder in ('Ongoing Insurance Billing') 
		and biller not in ('Anesthesia Services, Ltd') 
		and ins_charged > 0.25
		and [Insurance Type] <> 'Patient Responsibility'

-- Misbilled Tech Claims
alter view vwTechMisbilledClaims as
select PID, cast (DOS as smalldatetime) as DOS, claim_id, cast([claim date] as smalldatetime) as [ClaimDate], surgeon, 
		[Primary Insurance], [Insurance Type], biller, box33, DefaultTechEntity, claimmethod, DATEDIFF(day, [Claim Date], getdate()) as DaysClaimed , 
		ins_charged, balance
from vwMaster2 
where 
		clm_billing_type = 'Tech Only' 
		and box33 <> 'Synergy Neuromonitoring LLC' 
		and Region_short_name = 'National Neuromonitoring - Houston'
		and Folder in ('Ongoing Insurance Billing') 
		and claimbiller in ('Acquisition Billing Services', 'Medical Practice Solutions') and ins_charged > 0 
		and [Insurance Type] <> 'Patient Responsibility'

-- Missing Readers
alter view vwValidationCheckUnmatchedReaders as
select  reader, pid, dos, region_short_name, defaultentity from vwMaster2 where reader not in (select readerName from Readers) and dos >= '2015-01-01'


-- Current Month Cases with Entities without PayrollId 
alter view vwValidationCheckCurrentCaseEntitiesWithoutPayroll as 
select distinct(correctproentity) 
from vwCases 
where correctproentity not in (select entity from vwPayrollEntities) 
		and dos >= dateadd(d, -30, getdate())
order by correctproentity



-- Validation Duplication Check for Claim Ids
create view vw_validationVwMaster2DuplicatesClaimids as
SELECT claim_id, COUNT(*) as NumClaims FROM
    vwmaster2
	where claim_id is not null
GROUP BY
    claim_id
HAVING 
    COUNT(*) > 1

-- Validation Duplication Check for PIDs
create view vw_validationVwcasesPIDsDuplicates as
SELECT PID, COUNT(*) as NumPIDs FROM
    vwcases
GROUP BY
    PID
HAVING 
    COUNT(*) > 1







