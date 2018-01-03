alter view vwHospitalBillingsStatus as 
select *,
	CASE	
		WHEN (IsBillable = 'Yes' OR IsBillableSupplies = 'Yes') AND Invoice_date is null THEN 'Unbilled'
		WHEN balance > 0 Then 'Open'
		WHEN balance < 0 Then 'OverPaid'
		WHEN invoice_date is not null THEN 'Billed'
		ELSE 'Billable'
	END AS HospitalBillStatus


from vwHospitalBillings 

where 
	ContractEffectiveDate <= DOS
	AND (IsBillable = 'Yes' OR IsBillableSupplies = 'Yes')
		


	--contr_effective_date