--Hospital validation checks
-- Try to find cases where hospital has a service contract, and a bill was setn and a tech claim was sent
alter view vwHospitalTechBillingValidation as 
select 
	vwmaster2.dos, 
	vwmaster2.pid, 
	inv_facility, 
	invoice_amount, 
	billstatustech, 
	ins_charged, 
	biller,
	claimbiller, 
	folder, 
	[Insurance Type],
	invoice_number,
	invoice_date,
	amt_recieved,
	[Date paid],
	vwmaster2.region_short_name,
	vwmaster2.originalclaimdate,
	vwmaster2.claim_id,
	vwmaster2.[last collection],
	vwmaster2.[total collection]
	
from invoice_history_3300  as IH
			LEFT OUTER JOIN dbo.hospitals_3300 as HL 
					ON  HL.hospital_id = IH.hospital_id
			LEFT OUTER JOIN vwmaster2 
					ON vwmaster2.pid = IH.patient_id
			LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM 
					ON IH.hospital_id = CIM.hospital_id
					AND vwmaster2.[Insurance Type] = CIM.insurance_type

where  HL.contract_status = 'Services'  
		and  CIM.Contract_status = 'Services'
		and invoice_amount > 0 
		and vwmaster2.clm_billing_type = 'Tech Only' 
		and ins_charged > 0 
		and vwmaster2.dos > '2015-01-01'
		and folder <> 'New Insurance Billing'
		and claimbiller not in ('Dr. High')
