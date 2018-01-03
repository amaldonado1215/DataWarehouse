Alter view view_DashEntityTotalCaseVolume as 
SELECT      
	PA.DefaultEntity AS Entity, 
	DATEPART(YEAR, PA.DOS) AS Year, 
	DATEPART(MONTH, PA.DOS) AS Month, 
	COUNT(
			CASE 
				WHEN PA.[1st Insurance Category] = 'Private Insurance' 
					OR  (PA.[Primary Insurance] = 'Blue Cross Blue Shield' AND PA.Tech = 'Kimberly Stewart, MPAS, PA-C') THEN 1 
				
				ELSE NULL END) AS EligibleCases, 
	COUNT(
			CASE 

				WHEN PA.[1st Insurance Category] = 'Private Insurance' OR
						(PA.[Primary Insurance] = 'Blue Cross Blue Shield' AND PA.Tech = 'Kimberly Stewart, MPAS, PA-C') THEN NULL 
						 
				ELSE 1 END) AS Other, 
			rn = ROW_NUMBER() OVER (PARTITION BY PA.DefaultEntity ORDER BY PA.DefaultEntity DESC, DATEPART(YEAR, PA.DOS), DATEPART(MONTH, PA.DOS))
FROM            dbo.vwCases AS PA
WHERE        (DOS >= DATEADD(MONTH, - 14, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))

GROUP BY PA.DefaultEntity, DATEPART(MONTH, PA.DOS), DATEPART(YEAR, PA.DOS)

    SELECT        Entity, Year, Month, EligibleCases, Other
     FROM            Cases
     WHERE        rn <= 14