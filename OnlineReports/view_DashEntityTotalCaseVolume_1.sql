ALTER VIEW dbo.view_DashEntityTotalCaseVolume
AS
With Cases as (
SELECT      DefaultEntity AS Entity, 
			DATEPART(YEAR,  vwcases.DOS) AS Year, 
			DATEPART(MONTH,  vwcases.DOS) AS Month, 
			COUNT(
					CASE 
						WHEN vwcases.defaultentity in ('Neuroservice of Maryland, PC', 'Neuroservice of California, PC', 'Neuro DPM, Inc.') 
								AND vwBillableCasesCalculation.BillableStatus = 'Billable' THEN 1
						WHEN  vwcases.[1st Insurance Category] = 'Private Insurance' OR
									vwcases.[1st Insurance Category] = 'Letter of Protection' OR
									vwcases.[1st Insurance Category] = 'Lein Case'
								OR  ( vwcases.[Primary Insurance] = 'Blue Cross Blue Shield' AND  vwcases.Tech = 'Kimberly Stewart, MPAS, PA-C') THEN 1 
						WHEN  vwcases.Surgeon = 'Adam Bruggeman, M.D.' and vwcases.[1st Insurance Category] = 'Blue Cross Blue Shield' then 1 
					ELSE NULL END) AS EligibleCases, 
			COUNT(
					CASE 
						WHEN vwcases.defaultentity in ('Neuroservice of Maryland, PC', 'Neuroservice of California, PC', 'Neuro DPM, Inc.') 
									AND vwBillableCasesCalculation.BillableStatus = 'Billable' THEN NULL
						WHEN  vwcases.[1st Insurance Category] = 'Private Insurance' OR
									vwcases.[1st Insurance Category] = 'Letter of Protection' OR
									vwcases.[1st Insurance Category] = 'Lein Case'
								OR ( vwcases.[Primary Insurance] = 'Blue Cross Blue Shield' AND  vwcases.Tech = 'Kimberly Stewart, MPAS, PA-C') THEN NULL 
						WHEN  vwcases.Surgeon = 'Adam Bruggeman, M.D.' and vwcases.[1st Insurance Category] = 'Blue Cross Blue Shield' then NULL
					ELSE 1 END) AS Other, 
			rn = ROW_NUMBER() OVER (PARTITION BY  vwcases.DefaultEntity ORDER BY  vwcases.DefaultEntity DESC, DATEPART(YEAR,  vwcases.DOS), DATEPART(MONTH,  vwcases.DOS))
FROM            dbo.vwCases
LEFT OUTER JOIN vwBillableCasesCalculation on vwcases.pid = vwbillablecasescalculation.pid
WHERE        (vwcases.DOS >= DATEADD(MONTH, - 14, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)))

GROUP BY  vwcases.DefaultEntity, DATEPART(MONTH,  vwcases.DOS), DATEPART(YEAR,  vwcases.DOS))

    SELECT        Entity, Year, Month, EligibleCases, Other
     FROM            Cases
     WHERE        rn <= 14
