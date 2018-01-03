
alter view vwTechProductivityCombined as

SELECT 
	region_short_name, 
	tech, 
	[Assigned Region],  
	datepart(year,dos) as DOS_YR, 
	datepart(week, dos) as DOS_WK,
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101)) as DOS_Period,
	count(*) as totalCases, count(distinct dos) as Days_Worked,
	(sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*))/35 as Utilization_Pct

FROM
(
		select 
			region_short_name, 
			TRL.techname as tech, 
			TRL.[Assigned Region], 
			DOS,
			techtime
		from vwcases  
			LEFT OUTER JOIN (SELECT Distinct TECH, TechName, [Assigned Region], StartDate, EndDate from TechRegionLookup) trl 
				on trl.TECH = vwCases.Tech -- ticket #2329
				and dos between trl.StartDate and trl.EndDate
		where dos > '2015-01-01' and vwcases.Tech <> '* Unassigned *' -- ticket #2329

		UNION

		Select
			region_short_name, 
			TRL.techname as tech, 
			TRL.[Assigned Region], 
			DOS,
			techtime
		from vwcases  
			LEFT OUTER JOIN (SELECT Distinct TECH, TechName, [Assigned Region], StartDate, EndDate from TechRegionLookup) trl 
				on trl.TECH = vwCases.Tech2 -- ticket #2329
				and dos between trl.StartDate and trl.EndDate
		where dos > '2015-01-01' and vwcases.Tech <> '* Unassigned *' -- ticket #2329

		--	LEFT OUTER JOIN techregionlookup as TRL on vwcases.tech2 = TRL.tech 
		--where dos > '2015-01-01'
		--	and tech2 <> '* Unassigned *'

		) As C
	
group by 
	C.region_short_name, 
	C.tech, 
	C.[Assigned Region], 
	datepart(year,dos),
	datepart(week,dos),
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), 
			(DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101))
