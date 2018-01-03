
alter view vwReaderPayroll as 
select vwCases.reader, 
		Readers.ReaderGroup, 
		vwCases.[1st Insurance Category], 
		Readers.PayrollType,
		Case	
			when vwCases.[1st Insurance Category] in ('Lein Case','Letter of Protection','Private Insurance') then DefaultEntity
			else 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
			end as PayingEntity,
		count(*)  as CaseCount,
		year(dos) as Year,
		month(dos) as Month,
		vwReaderBillableCasesByMonth.CaseCount as TotalMonthCases,
		Case	
			When vwReaderBillableCasesByMonth.CaseCount <= Fee1Max then Fee1
			When vwReaderBillableCasesByMonth.CaseCount <= Fee2Max then Fee2
			else fee3
		end as FeeAmount,
		Case	
			When vwReaderBillableCasesByMonth.CaseCount <= Fee1Max then Fee1 * count(*)
			When vwReaderBillableCasesByMonth.CaseCount <= Fee2Max then Fee2 * count(*)
			else fee3 * count(*)
		end as PayrollAmount  
	from vwCases 
		LEFT OUTER JOIN READERFEES ON vwCases.Reader = READERFEES.ReaderName and vwCases.[1st Insurance Category] = READERFEES.[1st Insurance Category]
		LEFT OUTER JOIN vwReaderBillableCasesByMonth ON vwReaderBillableCasesByMonth.Reader = vwCases.READER 
			and vwReaderBillableCasesByMonth.Month = month(vwCases.DOS) and vwReaderBillableCasesByMonth.Year = year(vwCases.DOS)
		LEFT OUTER JOIN READERS ON vwCases.Reader = READERS.READERNAME
	where year(dos) = 2016 and dos < getdate()
	group  by vwCases.reader, readers.readergroup, vwCases.[1st Insurance Category], vwReaderBillableCasesByMonth.CaseCount, year(dos), 
		month(dos), Defaultentity, PayrollType, Fee1Max, Fee1, Fee2Max, Fee2, Fee3
--	order by vwCases.reader