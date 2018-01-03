ALTER VIEW dbo.view_DashEntityRecentReceipts
AS
WITH Receipts AS
(
    SELECT
      R.entity            AS Entity,
      R.ConsolidatedPayer AS Payor,
      R.Date_Collected    AS Date,
      R.Payment_Collected AS Amount,
      rn = ROW_NUMBER()
      OVER (PARTITION BY R.entity
        ORDER BY R.Date_Collected DESC, R.Payment_Collected DESC)
    FROM dbo.vwInsuranceDeposits AS R
    WHERE (R.entity IS NOT NULL) AND (R.Payment_Collected IS NOT NULL) AND (R.Payment_Collected <> 0)
)
SELECT
  Entity,
  Payor,
  Date,
  Amount
FROM Receipts
WHERE rn <= 5
