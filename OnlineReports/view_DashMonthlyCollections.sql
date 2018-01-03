ALTER VIEW dbo.view_DashMonthlyCollections
AS
SELECT
  DATEPART(YEAR, Date_Collected)  AS Year,
  DATEPART(MONTH, Date_Collected) AS Month,
  SUM(Payment_Collected)          AS Amount
FROM dbo.vwInsuranceDeposits
WHERE
  (Date_Collected >= DATEADD(MONTH, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))
GROUP BY DATEPART(YEAR, Date_Collected), DATEPART(MONTH, Date_Collected)
