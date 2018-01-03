alter view view_ReaderSignOffDays as
select defaultentity, dos, reader_days_to_signoff from vwCases
