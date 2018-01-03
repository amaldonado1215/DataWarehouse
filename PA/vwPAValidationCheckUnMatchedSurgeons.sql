alter view vwPAValidationCheckUnMatchedSurgeons As
SELECT DISTINCT Surgeon
FROM            dbo.vwPAMaster
WHERE        (DefaultEntity IS NULL) AND (DOS > '2015-01-01')