
-- TECH PRODUCTIVITY REPORT
alter view  vwTechProductivity as

select 
	region_short_name, TRL.techname, 
	datepart(year,dos) as DOS_YR, 
	datepart(week, dos) as DOS_WK,
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101)) as DOS_Period,
	count(*) as totalCases, count(distinct dos) as Days_Worked,
	(sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*))/35 as Utilization_Pct
from vwcases  	
	LEFT OUTER JOIN (SELECT Distinct TECH, TechName from TechRegionLookup) trl on trl.TECH = vwCases.Tech -- ticket #2329
where dos > '2015-01-01' and vwcases.Tech <> '* Unassigned *' -- ticket #2329
group by 
	region_short_name, 
	TRL.techname, 
	datepart(year,dos),
	datepart(week,dos),
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101))

