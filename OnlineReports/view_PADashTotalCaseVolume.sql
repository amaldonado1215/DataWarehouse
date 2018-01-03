ALTER VIEW dbo.view_PADashTotalCaseVolume
AS
SELECT TOP 12
  DATEPART(YEAR, DOS)  AS Year,
  DATEPART(MONTH, DOS) AS Month,
  COUNT(CASE
        WHEN PA.[1st Insurance Category] = 'Private Insurance' OR
             (PA.[Primary Insurance] = 'Blue Cross Blue Shield' AND PA.Tech = 'Kimberly Stewart, MPAS, PA-C')
          THEN 1
        ELSE NULL END) AS EligibleCases,
  COUNT(CASE
        WHEN PA.[1st Insurance Category] = 'Private Insurance' OR
             (PA.[Primary Insurance] = 'Blue Cross Blue Shield' AND PA.Tech = 'Kimberly Stewart, MPAS, PA-C')
          THEN NULL
        ELSE 1 END)    AS Other
FROM dbo.vwPACases AS PA
WHERE (DOS >= DATEADD(MONTH, -11, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))
GROUP BY DATEPART(MONTH, DOS), DATEPART(YEAR, DOS)
ORDER BY DATEPART(YEAR, DOS), DATEPART(MONTH, DOS)
