ALTER VIEW dbo.view_DashEntityAvgPrevPatientInjuryRisk
AS
WITH Risks AS
(
    SELECT
      R.proentity            AS Entity,
      DATEPART(YEAR, R.dos)  AS Year,
      DATEPART(MONTH, R.dos) AS Month,
      COUNT(R.dos)           AS Count,
      rn = ROW_NUMBER()
      OVER (PARTITION BY R.proentity
        ORDER BY R.proentity DESC, DATEPART(YEAR, R.dos), DATEPART(MONTH, R.dos))
    FROM vwPatientInjuryRisk AS R
    WHERE (dos >= DATEADD(MONTH, -12, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))
    GROUP BY R.proentity, DATEPART(YEAR, R.dos), DATEPART(MONTH, R.dos)
)
SELECT
  Entity,
  Year,
  Month,
  Count
FROM Risks
WHERE rn <= 13
