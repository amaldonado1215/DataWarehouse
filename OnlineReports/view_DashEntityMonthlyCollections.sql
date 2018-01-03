ALTER VIEW dbo.view_DashEntityMonthlyCollections
AS
WITH Collections AS (
    SELECT
      C.entity                          AS Entity,
      DATEPART(YEAR, C.Date_Collected)  AS Year,
      DATEPART(MONTH, C.Date_Collected) AS Month,
      SUM(C.Payment_Collected)          AS Amount,
      rn = ROW_NUMBER()
      OVER (PARTITION BY C.entity
        ORDER BY C.entity DESC, DATEPART(YEAR, C.Date_Collected), DATEPART(MONTH, C.Date_Collected))
    FROM vwInsuranceDeposits AS C
    WHERE
      entity IS NOT NULL AND (Date_Collected >= DATEADD(MONTH, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))
    GROUP BY C.entity, DATEPART(YEAR, Date_Collected), DATEPART(MONTH, Date_Collected)
)
SELECT 
  Entity,
  Year,
  Month,
  Amount
FROM Collections
WHERE rn <= 2
