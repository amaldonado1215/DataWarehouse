CREATE VIEW dbo.vw_SYN_BillableCasesCalculation
as
SELECT b.Region_Short_Name,
	b.Hospital,
	b.Surgeon,
	b.Reader,
	b.Tech,
	b.Closed,
	c.OR_Procedure,
	b.BillableStatusTech,
	b.PID,b.DOS,
	b.Patient,
	b.PrimaryInsurance,
	b.[1st Insurance Category],
	i.InsuranceGroup as [Consolidated Payor]
FROM vwBillableCasesCalculation b
    INNER JOIN vw_SYN_SurgeonLookup2 s on s.surgeon = b.Surgeon and b.dos between s.StartDate and s.EndDate
	LEFT JOIN vwCases c	ON b.PID=c.PID
	LEFT JOIN InsuranceLookup i ON b.PrimaryInsurance=i.InsuranceCompany
WHERE b.PID NOT IN ('795374','658810','629181','720161','729687')
