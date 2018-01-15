SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kim Anderson>
-- Create date: <2018-1-11>
-- Description:	<Last Month & YTD Claims Billed, Amt Billed Amt Collected, Billed Amt, Collected Pct by Entity>
-- exec spEntityPriorMonthEndSummary
-- =============================================
CREATE PROCEDURE dbo.spEntityPriorMonthEndSummary

AS
BEGIN
SET NOCOUNT ON;

declare @datefirst date
declare @datelast date
declare @datefirstyear date

set @datefirst = dateadd(month, -1,dateadd(month,datediff(month,0,getdate()),0))
set @datelast = dateadd(day, -1, dateadd(month,datediff(month,0,getdate()),0))
set @datefirstyear = dateadd(year,datediff(year,0,@datefirst),0)
--select @datefirst, @datelast, @datefirstyear

CREATE Table #tempentity
	(	proentity					varchar(50), 
		Surgeons					nvarchar(max), 
		[Formation Date]			date,
		[MTD Claims Billed]			int,
		[MTD Amount Billed]			numeric(18,2),
		[MTD Amount Collected]		money,
		[MTD Collected Billed Amt]	numeric(18,2),
		[MTD Pct Collected]			numeric(18,8),
		[YTD Claims Billed]			int,
		[YTD Amount Billed]			numeric(18,2),
		[YTD Amount Collected]		money,
		[YTD Collected Billed Amt]	numeric(18,2),
		[YTD Pct Collected]			numeric(18,8)		)

-- proentity, surgeons, formation date
INSERT INTO #tempentity(proentity, Surgeons, [Formation Date])
SELECT Distinct proentity,   
		substring(
			(
				SELECT ', '+rtrim(SL2.Surgeon)  AS [text()]
				FROM Surgeonlookup2 as SL2
				WHERE SL.proentity = SL2.Proentity
				ORDER BY SL.ProEntity
				FOR XML PATH ('')
			), 2, 1000) [Surgeons],
		min(startdate) as [Formation Date]
FROM SurgeonLookup2 SL 
	LEFT JOIN [dbo].[EntityLookup] EL on EL.Entity = SL.ProEntity 
WHERE proentity not in (	SELECT distinct Entity 
							FROM [USMON_Local].[dbo].[EntityLookup]
							WHERE clm_billing_type = 'Pro Only' and [S#C] = 'No')
GROUP BY proentity

-- mtd claims billed, mtd amount billed
UPDATE t
SET t.[MTD Claims Billed] = m1.[MTD Claims Billed], t.[MTD Amount Billed] = m1.[MTD Amount Billed]
FROM #tempentity t
	LEFT JOIN (	SELECT m.box33,
					[MTD Claims Billed] = count(*) , 
					[MTD Amount Billed] = sum(ins_charged)
				FROM vwMaster2 m 
				WHERE [OriginalClaimDate] between @datefirst and @datelast
					AND folder <> ('New Insurance Billing')
				GROUP BY box33) m1 on m1.box33 = t.proentity

-- mtd amount collected, mtd billed amount, mtd pct collected
UPDATE t 
SET t.[MTD Amount Collected] = i1.[MTD Amount Collected],
	t.[MTD Collected Billed Amt] = i1.[MTD Collected Billed Amt],	
	t.[MTD Pct Collected] = i1.[MTD Pct Collected]
FROM #tempentity t
	LEFT JOIN(	select box33,
			[MTD Amount Collected] = sum(q1.Payment_Collected),
			[MTD Collected Billed Amt] = sum(q1.[Claim Total Charge]),
			[MTD Pct Collected] = sum(q1.Payment_Collected)/sum(q1.[Claim Total Charge])
		FROM (		SELECT i.box33 , i.Claim_seq,
						Payment_Collected = sum(Payment_Collected),
						[Claim Total Charge] = max([Claim Total Charge])
					FROM dbo.vwInsuranceDeposits i
					WHERE i.date_collected between @datefirst and @datelast
							AND i.Payment_Collected <> 0
					GROUP BY i.box33 ,i.claim_seq	) q1
		GROUP BY box33) i1 on i1.box33 = t.proentity

-- ytd claims billed, ytd amount billed
UPDATE t
SET t.[YTD Claims Billed] = m2.[YTD Claims Billed], t.[YTD Amount Billed] = m2.[YTD Amount Billed]
FROM #tempentity t
	LEFT JOIN (	SELECT m.box33,
					[YTD Claims Billed] = count(*) , 
					[YTD Amount Billed] = sum(ins_charged)
				FROM vwMaster2 m 
				WHERE [OriginalClaimDate] between @datefirstyear and @datelast
					AND folder <> ('New Insurance Billing')
				GROUP BY box33) m2 on m2.box33 = t.proentity

-- ytd amount collected, ytd billed amount, ytd pct collected
UPDATE t 
SET t.[YTD Amount Collected] = i1.[YTD Amount Collected],
	t.[YTD Collected Billed Amt] = i1.[YTD Collected Billed Amt],	
	t.[YTD Pct Collected] = i1.[YTD Pct Collected]
FROM #tempentity t
	LEFT JOIN(	select box33,
			[YTD Amount Collected] = sum(q1.Payment_Collected),
			[YTD Collected Billed Amt] = sum(q1.[Claim Total Charge]),
			[YTD Pct Collected] = sum(q1.Payment_Collected)/sum(q1.[Claim Total Charge])
		FROM (		SELECT i.box33 , i.Claim_seq,
						Payment_Collected = sum(Payment_Collected),
						[Claim Total Charge] = max([Claim Total Charge])
					FROM dbo.vwInsuranceDeposits i
					WHERE i.date_collected between @datefirstyear and @datelast
							AND i.Payment_Collected <> 0
					GROUP BY i.box33 ,i.claim_seq	) q1
		GROUP BY box33) i1 on i1.box33 = t.proentity

select * from #tempentity

drop table #tempentity
END
GO