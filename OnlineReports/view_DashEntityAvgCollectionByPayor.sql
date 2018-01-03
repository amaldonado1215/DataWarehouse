ALTER VIEW dbo.view_DashEntityAvgCollectionByPayor
AS
WITH Collections AS
(
    SELECT
      M.Entity                    AS Entity,
      M.[consolidated payer]      AS Payor,
      AVG(ID.Payment_Collected)   AS AvgCaseCollection,
      SUM(ID.Payment_Collected)   AS TotalReceipts,
      COUNT(ID.Payment_Collected) AS TotalCases,
      rn = ROW_NUMBER()
      OVER (PARTITION BY M.Entity
        ORDER BY SUM(ID.Payment_Collected) DESC)
    FROM dbo.Insurance_Deposits_3300 AS ID
      LEFT OUTER JOIN dbo.vwMaster2 AS M
        ON M.claim_id = ID.claim_seq
    WHERE M.Entity IS NOT NULL AND
          ID.Date_Collected >= DATEADD(MONTH, -12, GETDATE())
          AND ID.Payment_Collected IS NOT NULL
          AND ID.Payment_Collected <> 0
    GROUP BY M.Entity, M.[consolidated payer]
)
SELECT
  Entity,
  Payor,
  AvgCaseCollection,
  TotalReceipts,
  TotalCases
FROM Collections
WHERE rn <= 5
