ALTER VIEW dbo.view_TechEntities
AS
SELECT TOP (1000) DefaultTechEntity AS Entity
FROM dbo.vwMaster2
WHERE (DefaultTechEntity IS NOT NULL)
GROUP BY DefaultTechEntity
ORDER BY DefaultTechEntity ASC
