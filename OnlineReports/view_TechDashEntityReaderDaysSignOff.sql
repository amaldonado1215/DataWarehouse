ALTER VIEW dbo.view_TechDashEntityReaderDaysSignOff
AS
WITH Days AS
(
    SELECT
      C.TechEntity                                         AS Entity,
      DATEPART(YEAR, DOS)                                  AS Year,
      DATEPART(MONTH, DOS)                                 AS Month,
      ROUND(AVG(CAST(Reader_Days_to_SignOff AS FLOAT)), 3) AS Average,
      rn = ROW_NUMBER()
      OVER ( PARTITION BY C.TechEntity
        ORDER BY C.TechEntity DESC, DATEPART(YEAR, C.DOS), DATEPART(MONTH, C.DOS) )
    FROM vwCases AS C
    WHERE
      Reader_Days_to_SignOff IS NOT NULL AND
      DOS >= DATEADD(MONTH, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0))
    GROUP BY C.TechEntity, DATEPART(YEAR, DOS), DATEPART(MONTH, DOS)
)
SELECT
  Entity,
  Year,
  Month,
  Average
FROM Days
WHERE rn <= 2
