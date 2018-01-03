ALTER VIEW dbo.view_DashRecentReceipts
AS
SELECT TOP 5
  ConsolidatedPayer AS Payor, 
  Date_Collected    AS Date,
  Payment_Collected AS Amount
FROM dbo.vwInsuranceDeposits
ORDER BY Date DESC, Amount DESC
