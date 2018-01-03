ALTER VIEW view_payermix AS
SELECT
  CASE
  WHEN Surgeon IN ('Dr. C Gilberto Brito, M.D.', 'Kendrick Thomas, M.D.', 'Joshua Levy, D.O.', 'Jeffrey Wingate, M.D.')
       AND [1st Insurance Category] = 'Blue Cross Blue Shield'
    THEN 'Private'
  WHEN Region_short_name = 'Louisiana' AND [1st Insurance Category] = 'Workmans Comp'
    THEN 'Private'
  WHEN Surgeon = 'Mark Silver, M.D.' AND DefaultEntity = 'Texoma IOM, PLLC' AND
       [1st Insurance Category] = 'Blue Cross Blue Shield'
    THEN 'Private'
  WHEN Surgeon = 'Ram Vasudevan, M.D.' AND pid IN (461920, 475127, 504144, 521290)
    THEN 'Private'
  WHEN Surgeon = 'Samir Parikh, M.D.' AND [1st Insurance Category] = 'Blue Cross Blue Shield'
    THEN 'Private'
  WHEN DefaultEntity = 'Premier Physician Surgical Associates, PLLC' AND
       [1st Insurance Category] = 'Blue Cross Blue Shield'
    THEN 'Private'
  WHEN [1st Insurance Category] = 'Private Insurance'
       OR [1st Insurance Category] = 'Letter of Protection'
       OR [1st Insurance Category] = 'Lein Case'
    THEN 'Private'
  --WHEN Surgeon = 'Sean Jones-Quaidoo, M.D.'
  --	AND [1st Insurance Category] = 'Blue Cross Blue Shield'
  --	AND DOS >='2016-07-07' then 'Private'
  WHEN DefaultEntity = 'Neuroguide IOM, PLLC'
       AND [1st insurance Category] = 'Blue Cross Blue Shield'
    THEN 'Private'
  ELSE 'Other'
  END AS InsuranceType,
  DOS,
  DefaultEntity,
  TechEntity
FROM dbo.vwCases
WHERE (DOS BETWEEN DATEADD(M, DATEDIFF(M, 0, GETDATE()) - 13, 0) AND GETDATE())
