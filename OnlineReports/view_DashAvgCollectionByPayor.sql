ALTER VIEW dbo.view_DashAvgCollectionByPayor
AS
SELECT TOP 5 dbo.vwMaster2.[consolidated payer] AS Payor, 
  AVG(ID.Payment_Collected) AS AvgCaseCollection, 
  SUM(ID.Payment_Collected) AS TotalReceipts, 
  COUNT(ID.Payment_Collected) AS TotalCases 
FROM  dbo.Insurance_Deposits_3300 AS ID 
  LEFT OUTER JOIN dbo.vwMaster2 ON dbo.vwMaster2.claim_id = ID.claim_seq
WHERE ID.Date_Collected >= DATEADD(MONTH, -12, GETDATE()) AND 
      ID.Payment_Collected IS NOT NULL AND ID.Payment_Collected <> 0
GROUP BY dbo.vwMaster2.[consolidated payer]
ORDER BY SUM(ID.Payment_Collected) DESC
