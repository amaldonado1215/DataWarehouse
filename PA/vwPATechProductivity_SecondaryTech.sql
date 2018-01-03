
-- TECH PRODUCTIVITY REPORT
alter view vwPATechProductivity_SecondaryTech as

select 
	region_short_name, vwPACases.tech, TRL.[Assigned Region],  
	datepart(year,dos) as DOS_YR, 
	datepart(week, dos) as DOS_WK,
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101)) as DOS_Period,
	count(*) as totalCases, count(distinct dos) as Days_Worked,
	(sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*)/2)/35 as Utilization_Pct
from vwPAcases  
	LEFT OUTER JOIN techregionlookup as TRL on vwPAcases.tech2 = TRL.tech
where dos > '2015-01-01' 
group by 
	region_short_name, 
	vwPACases.tech, TRL.[Assigned Region], datepart(year,dos),
	datepart(week,dos),
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101))


	--select * from vwTechProductivity where dos_yr = 2016
/*
	alter view vwTechProductivity_SecondaryTech as

select 
	region_short_name, vwcases.tech2, TRL.[Assigned Region],  
	datepart(year,dos) as DOS_YR, 
	datepart(week, dos) as DOS_WK,
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101)) as DOS_Period,
	count(*) as totalCases, count(distinct dos) as Days_Worked,
	(sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*))/35 as Utilization_Pct
from vwcases  
	LEFT OUTER JOIN techregionlookup as TRL on vwcases.tech2 = TRL.tech
where dos > '2015-01-01' and tech2 <> '* Unassigned *'
group by 
	region_short_name, 
	vwcases.tech2, TRL.[Assigned Region], datepart(year,dos),
	datepart(week,dos),
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101))
*/