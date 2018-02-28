ALTER VIEW	vw_SYN_Cases	as 			
SELECT c.PID,
	c.DOS,
	c.Surgeon,
	c.Specialty,
	c.[Procedure Type],
	c.OR_Procedure,
	c.[consolidated payor],
	c.[1st Insurance Category]						
FROM vwCases c	
	INNER JOIN vw_SYN_SurgeonLookup2 s on s.surgeon  = c.surgeon and c.dos between s.StartDate and s.EndDate
