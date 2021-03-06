﻿ALTER VIEW dbo.view_DashTechAvgPrevPatientInjuryRisk
AS
  SELECT TOP (12)
    DATEPART(YEAR, dos)  AS Year,
    DATEPART(MONTH, dos) AS Month,
    COUNT(alert)         AS Count
  FROM dbo.vwPatientInjuryRisk
  WHERE (dos >= DATEADD(MONTH, -12, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))
  GROUP BY DATEPART(MONTH, dos), DATEPART(YEAR, dos)
  ORDER BY Year, Month
