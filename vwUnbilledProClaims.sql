-- UNBILLED PRO CLAIMS -- 
alter view vwUnbilledProClaims as
select distinct vwBillableCasesCalculation.PID, 
		vwBillableCasesCalculation.DOS,
		vwBillableCasesCalculation.Patient,
		vwBillableCasesCalculation.Region_short_name,
		vwBillableCasesCalculation.Hospital,
		vwBillableCasesCalculation.surgeon,
		vwBillableCasesCalculation.closed as CaseClosed,
		vwBillableCasesCalculation.Tech,
		vwBillableCasesCalculation.PrimaryInsurance,
		vwBillableCasesCalculation.[1st Insurance Category],
		vwBillableCasesCalculation.Biller,
		vwBillableCasesCalculation.CorrectEntity,
		vwBillableCasesCalculation.Proclaims,
		vwBillableCasesCalculation.BillableStatus as BillableStatusPro,
		vwMaster2.folder,
		vwMaster2.BillStatus as BillStatusPro,
		vwBillableCasesCalculation.Reader
from vwBillableCasesCalculation 
	LEFT OUTER JOIN vwMaster2 on vwBillableCasesCalculation.PID = vwMaster2.PID  -- and clm_billing_type = 'Pro Only' and vwMaster2.billstatus <> 'Closed'
Where 
	(vwMaster2.clm_billing_type = 'Pro Only' or vwMaster2.clm_billing_type is null)
	and vwMaster2.billstatus  <> 'Closed'
	and ((vwBillableCasesCalculation.BillableStatus = 'Billable' and (ProClaims = 0 or ProClaims is null))
		or (vwBillableCasesCalculation.BillableStatus = 'Billable' 
			and vwMaster2.folder not in ('Closed Billing Claims','Ongoing Insurance Billing','PCA')))
	and vwBillableCasesCalculation.dos >= '2015-01-01' 
	--and vwBillableCasesCalculation.dos < '2016-01-01'
/*=======
		vwMaster2.BillStatus as BillStatusPro
from vwBillableCasesCalculation 
	LEFT OUTER JOIN vwMaster2 on vwBillableCasesCalculation.PID = vwMaster2.PID  and clm_billing_type = 'Pro Only' and vwMaster2.billstatus <> 'Closed'
Where 
	(vwBillableCasesCalculation.BillableStatus = 'Billable'
		and ProClaims = 0 )
	or (vwBillableCasesCalculation.BillableStatus = 'Billable' and vwMaster2.folder not in ('Closed Billing Claims','Ongoing Insurance Billing'))
	and vwBillableCasesCalculation.dos >= '2015-01-01' 
	and vwBillableCasesCalculation.dos < '2016-01-01'
>>>>>>> origin/Modifications*/

