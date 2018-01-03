alter view vwUnbilledTechClaims as
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
		RTEL.TechEntity as DefaultTechEntity,
		vwBillableCasesCalculation.Techclaims,
		vwBillableCasesCalculation.BillableStatusTech,
		vwMaster2.folder,
		vwMaster2.BillStatusTech,
		vwMaster2.ContractType as HospitalContractType,
		vwMaster2.[Consolidated Payor],
		vwBillableCasesCalculation.Reader
from vwBillableCasesCalculation 
	LEFT OUTER JOIN vwMaster2 
		on vwBillableCasesCalculation.PID = vwMaster2.PID  
			and clm_billing_type = 'Tech Only'  
			and ( vwMaster2.billstatus <> 'Closed' or vwMaster2.billstatus is null)
	LEFT OUTER JOIN regiontechentitylookup as RTEL 
		on RTEL.RegionName = vwBillableCasesCalculation.Region_Short_Name 
			and vwBillableCasesCalculation.dos >= RTEL.startdate 
			and vwBillableCasesCalculation.dos<= RTEL.enddate
Where 
	((vwBillableCasesCalculation.BillableStatusTech = 'Billable' and TechClaims = 0 )
		or (vwBillableCasesCalculation.BillableStatusTech = 'Billable' and vwMaster2.folder not in ('Closed Billing Claims','Ongoing Insurance Billing')))
	and 
		vwBillableCasesCalculation.dos >= '2015-01-01' 
	and
		vwMaster2.folder not in ('Closed Billing Claims','Ongoing Insurance Billing','PCA')


	--and (vwMaster2.BillStatusTech = 'Not Billed' or vwMaster2.BillStatusTech is null)
	--and folder is not null
/*=======
﻿alter view vwUnbilledTechClaims as
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
		vwBillableCasesCalculation.Techclaims,
		vwBillableCasesCalculation.BillableStatusTech,
		vwMaster2.folder,
		vwMaster2.BillStatusTech
from vwBillableCasesCalculation 
	LEFT OUTER JOIN vwMaster2 on vwBillableCasesCalculation.PID = vwMaster2.PID  and clm_billing_type = 'Tech Only' and ( vwMaster2.billstatus <> 'Closed' or vwMaster2.billstatus is null)
Where 
	(vwBillableCasesCalculation.BillableStatusTech = 'Billable' and TechClaims = 0 )
	or (vwBillableCasesCalculation.BillableStatusTech = 'Billable' and vwMaster2.folder not in ('Closed Billing Claims','Ongoing Insurance Billing'))
	and vwBillableCasesCalculation.dos >= '2015-01-01' 



>>>>>>> origin/Modifications */
