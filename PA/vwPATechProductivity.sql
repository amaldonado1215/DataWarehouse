
-- PA TECH PRODUCTIVITY REPORT
alter view  vwPATechProductivity as

select 
	region_short_name, vwPACases.tech, 
	datepart(year,dos) as DOS_YR, 
	datepart(week, dos) as DOS_WK,
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101)) as DOS_Period,
	count(*) as totalCases, count(distinct dos) as Days_Worked,
	(sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*)/2)/35 as Utilization_Pct
from vwPAcases  
	LEFT OUTER JOIN techregionlookup as TRL ON TRL.tech = vwPAcases.tech
where dos > '2015-01-01' 
group by 
	region_short_name, 
	vwPACases.tech, 
	datepart(year,dos),
	datepart(week,dos),
	concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101))

-- select * from vwPATechProductivity
