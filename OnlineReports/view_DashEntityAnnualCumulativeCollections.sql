ALTER VIEW dbo.view_DashEntityAnnualCumulativeCollections
AS
WITH Collections AS
(
    SELECT
      ID.entity                          AS Entity,
      DATEPART(YEAR, ID.Date_Collected)  AS Year,
      DATEPART(MONTH, ID.Date_Collected) AS Month,
      SUM(ID.Payment_Collected)          AS Amount,
      rn = ROW_NUMBER()
      OVER (PARTITION BY ID.entity
        ORDER BY ID.entity DESC, DATEPART(YEAR, ID.Date_Collected), DATEPART(MONTH, ID.Date_Collected))
    FROM dbo.vwInsuranceDeposits AS ID
    WHERE
      (ID.entity IS NOT NULL) AND ((DATEPART(YEAR, ID.Date_Collected) = DATEPART(YEAR, DATEADD(YEAR, -1, GETDATE()))) OR
      (DATEPART(YEAR, ID.Date_Collected) = DATEPART(YEAR, GETDATE())))
    GROUP BY ID.entity, DATEPART(YEAR, ID.Date_Collected), DATEPART(MONTH, ID.Date_Collected)
)
SELECT
  Entity,
  Year,
  Month,
  Amount
FROM Collections
WHERE rn <= 24
