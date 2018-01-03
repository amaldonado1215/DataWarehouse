
-- TECH DAILY PRODUCTIVITY REPORT
alter view  vwTechProductivityDaily as

select 
	region_short_name, TRL.techname, dos,
	count(*) as totalCases, count(distinct dos) as Days_Worked,
	sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) as total_tech_time,
	(sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*))/7 as Utilization_Pct
from vwcases  
	LEFT OUTER JOIN (SELECT Distinct TECH, TechName, [Assigned Region] from TechRegionLookup) trl on trl.TECH = vwCases.Tech -- ticket #2329
where dos > '2015-01-01' and vwcases.Tech <> '* Unassigned *' -- ticket #2329
group by 
	region_short_name, 
	TRL.techname,
	dos
	

