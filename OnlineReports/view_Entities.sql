ALTER VIEW view_Entities
AS
SELECT TOP (1000) DefaultEntity AS Entity
FROM            dbo.View_PayerMix
  GROUP BY DefaultEntity
  ORDER BY DefaultEntity ASC
