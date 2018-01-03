ALTER VIEW dbo.view_DashAnnualCumulativeCollections
AS
SELECT TOP 24
  DATEPART(YEAR, Date_Collected)  AS Year,
  DATEPART(MONTH, Date_Collected) AS Month,
  SUM(Payment_Collected)          AS Amount
FROM dbo.vwInsuranceDeposits
WHERE DATEPART(YEAR, Date_Collected) = DATEPART(YEAR, DATEADD(YEAR, -1, GETDATE())) OR
      DATEPART(YEAR, Date_Collected) = DATEPART(YEAR, GETDATE())
GROUP BY DATEPART(YEAR, Date_Collected), DATEPART(MONTH, Date_Collected)
ORDER BY DATEPART(YEAR, Date_Collected), DATEPART(MONTH, Date_Collected)
