ALTER VIEW dbo.view_DashReaderDaysSignOff
AS
SELECT
  DATEPART(YEAR, DOS)                                  AS Year,
  DATEPART(MONTH, DOS)                                 AS Month,
  ROUND(AVG(CAST(Reader_Days_to_SignOff AS FLOAT)), 3) AS Average
FROM vwCases
WHERE Reader_Days_to_SignOff IS NOT NULL AND DOS >= DATEADD(MONTH, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0))
GROUP BY DATEPART(YEAR, DOS), DATEPART(MONTH, DOS)
