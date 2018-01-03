-- Billable Cases By Month By Reader
alter view vwReaderBillableCasesByMonth as 
select reader, count(*)  as CaseCount, year(dos) as Year, month(dos) as Month
	from vwCases 
	LEFT OUTER JOIN READERFEES ON vwCases.Reader = READERFEES.ReaderName and vwCases.[1st Insurance Category] = READERFEES.[1st Insurance Category]
	where -- dos >= '2016-01-01' and dos < '2017-01-01' and
	 fee1 > 0
	and dos < getdate()
	group  by reader, month(dos), year(dos)
	--order by reader