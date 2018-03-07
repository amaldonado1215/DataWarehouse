CREATE VIEW vw_Sage_SurgeonMonth
AS
SELECT d.CompanyId, 
	c.Name as CompanyName,
	bl.Name as BusinessLine,
	Coalesce(acc.Name, 'None') as Accountant,
	d.AccountId, 
	a.Name as AccountName,
    [ContractId],
	dateadd(month,datediff(month,0,d.PostingDate),0) as PostingMth,
    sum([DebitAmount]) as DebitAmount,
    sum([CreditAmount]) as CreditAmount
--FROM [MDM-SAGE].[Cube].[dbo].[SageMonth] d
FROM [MDM-SAGE].[Cube].[dbo].[SageDetailCache] d
	INNER JOIN [MDM-SAGE].[Cube].[dbo].[ACCOUNT] a on a.id = d.AccountId
	INNER JOIN [MDM-SAGE].[Cube].[dbo].[Company] c on c.Id = d.CompanyId
	LEFT JOIN [MDM-SAGE].[Cube].[dbo].[CompanyAccountant] acc on acc.id = c.CompanyAccountantId
	INNER JOIN [MDM-SAGE].[Cube].[dbo].[CompanyBusinessLine] bl on bl.Id = c.CompanyBusinessLineId
WHERE bl.Name = 'Surgeon'
	and d.PostingDate >= '1/1/2016'
GROUP BY d.CompanyId, c.Name, bl.Name, Coalesce(acc.Name, 'None'), 	d.AccountId, a.Name,  [ContractId],	dateadd(month,datediff(month,0,d.PostingDate),0)

/*
SELECT d.CompanyId, 
	c.Name as CompanyName,
	bl.Name as BusinessLine,
	Coalesce(acc.Name, 'None') as Accountant,
	d.AccountId, 
	a.Name as AccountName,
    [ContractId],
	Date as PostingMth,
    [DebitAmount],
    [CreditAmount]
FROM [MDM-SAGE].[Cube].[dbo].[SageMonth] d
	INNER JOIN [MDM-SAGE].[Cube].[dbo].[ACCOUNT] a on a.id = d.AccountId
	INNER JOIN [MDM-SAGE].[Cube].[dbo].[Company] c on c.Id = d.CompanyId
	LEFT JOIN [MDM-SAGE].[Cube].[dbo].[CompanyAccountant] acc on acc.id = c.CompanyAccountantId
	INNER JOIN [MDM-SAGE].[Cube].[dbo].[CompanyBusinessLine] bl on bl.Id = c.CompanyBusinessLineId
WHERE bl.Name = 'Surgeon'
	and d.Date >= '1/1/2016'*/
GO
