ALTER VIEW dbo.view_TechDashEntityClaimStatus
AS
SELECT
  DefaultTechEntity    AS Entity,
  COUNT(CASE BS.BillStatus
        WHEN 'Billed'
          THEN 1
        ELSE NULL END) AS Billed,
  COUNT(CASE BS.BillStatus
        WHEN 'Not Billed'
          THEN 1
        ELSE NULL END) AS NotBilled,
  COUNT(CASE BS.BillStatus
        WHEN 'Appealed'
          THEN 1
        ELSE NULL END) AS Appealed
FROM (SELECT DISTINCT
        PID,
        DefaultTechEntity,
        BillStatus
      FROM dbo.vwMaster2
      WHERE (BillStatus <> 'paid') AND (BillStatus <> 'unbillable') AND (clm_billing_type <> 'Tech Only' OR
                                                                         clm_billing_type IS NULL) AND
            (Folder <> 'Closed Billing Claims' OR
             Folder IS NULL) AND (DOS < GETUTCDATE())) AS BS
GROUP BY DefaultTechEntity
