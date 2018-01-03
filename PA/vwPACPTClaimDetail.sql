create view  vwPACPTClaimDetail as 

select CC.patient_id,
	CC.claim_seq,
	CC.proc_code as CPT,
	CC.Unit_Charge,
	Case
		when CC.Units is null then 1
		else CC.Units end
		as Units,
	Case
		when CC.Collected is null then 0
		else CC.Collected 
		end
		as Collected, 
	Case
		when CC.Units is null then 
			cast( CC.Unit_Charge as money)
		else cast(CC.Units * CC.Unit_Charge as money) end
		as TotalCharge,
	Case	
		when CC.Collected is null then 
			cast((CC.Units * CC.Unit_Charge) as money)
		when CC.Units is null then
			cast(CC.Unit_Charge - CC.Collected as money)
		when CC.Units is null and CC.Collected is null then 
			cast (CC.Unit_Charge as money)
		else
			cast((CC.Units * CC.Unit_Charge) - CC.Collected as money) end as RemainingBalance,
	VM2.clm_billing_type, 
	VM2.DOS, 
	VM2.Biller, 
	VM2.Box33,
	VM2.BillStatus,
	VM2.Region_Short_Name, 
	VM2.[Consolidated Payor], 
	VM2.[Insurance Type],
	VM2.[Claim Date],
	--CDH.[Claim_Date] as [First Claim Date],
	VM2.folder,
	VM2.[SurgeonOwnd],
	VM2.[Procedure Type]

from claim_charges_3350 as CC
INNER JOIN vwPAmaster as VM2 on CC.patient_id = VM2.PID and CC.claim_seq = vm2.claim_id


	