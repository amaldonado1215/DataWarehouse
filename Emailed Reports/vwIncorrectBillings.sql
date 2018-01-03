alter view vwIncorrectBillings as 
	select * from vwMaster2 where 
		correctentity <> Box33 and clm_billing_type ='Pro Only' and DOS > '2014-01-01' and BillStatus <> 'Unbillable' 
		and biller in ('Acquisition Billing Services','Acquisition Billing Services') 
	
