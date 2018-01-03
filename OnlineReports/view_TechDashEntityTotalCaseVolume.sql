ALTER VIEW dbo.view_TechDashEntityTotalCaseVolume
AS
WITH Cases AS
(
    SELECT
      P.TechEntity       AS Entity,
      DATEPART(YEAR, P.DOS) AS Year,
      DATEPART(MONTH, DOS)  AS Month,
      COUNT(CASE WHEN P.InsuranceType = 'Private'
        THEN 1
            ELSE NULL END)  AS EligibleCases,
      COUNT(CASE WHEN P.InsuranceType = 'Other'
        THEN 1
            ELSE NULL END)  AS Other,
      rn = ROW_NUMBER()
      OVER ( PARTITION BY P.TechEntity
        ORDER BY P.TechEntity DESC, DATEPART(YEAR, P.DOS), DATEPART(MONTH, P.DOS) )
    FROM View_Payermix AS P
    WHERE (DOS >= DATEADD(MONTH, -14, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))
    GROUP BY P.TechEntity, DATEPART(MONTH, P.DOS), DATEPART(YEAR, P.DOS)
)
SELECT
  Entity,
  Year,
  Month,
  EligibleCases,
  Other
FROM Cases
WHERE rn <= 14
