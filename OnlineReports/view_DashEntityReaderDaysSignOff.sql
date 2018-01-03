ALTER VIEW dbo.view_DashEntityReaderDaysSignOff
AS
WITH Days AS
(
    SELECT
    C.DefaultEntity                                      AS Entity,
      DATEPART(YEAR, DOS)                                  AS Year,
      DATEPART(MONTH, DOS)                                 AS Month,
      ROUND(AVG(CAST(Reader_Days_to_SignOff AS FLOAT)), 3) AS Average,
      rn = ROW_NUMBER()
      OVER (PARTITION BY C.DefaultEntity
        ORDER BY C.DefaultEntity DESC, DATEPART(YEAR, C.DOS), DATEPART(MONTH, C.DOS))
    FROM vwCases AS C
    WHERE
      Reader_Days_to_SignOff IS NOT NULL AND DOS >= DATEADD(MONTH, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0))
    GROUP BY C.DefaultEntity, DATEPART(YEAR, DOS), DATEPART(MONTH, DOS)
)
SELECT
  Entity,
  Year,
  Month,
  Average
FROM Days
WHERE rn <= 2
