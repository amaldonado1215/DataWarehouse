Alter view vwHospitalBillings as 

SELECT      dbo.vwCases.PID, 
			dbo.vwCases.DOS, 
			dbo.vwCases.Patient, 
			dbo.vwCases.Region_Short_Name, 
			HL.hospital_id as Hospital_ID,
			(SELECT TOP (1) hospital_nbr FROM HospitalLookup h
				WHERE h.USMon_Id = HL.hospital_Id ) as Hospital_Nbr, --Ticket #2457
			dbo.vwCases.Hospital, 
			dbo.vwCases.Surgeon, 
            dbo.vwCases.[Primary Insurance], 
			dbo.vwCases.[1st Insurance Category], 
			HL.Contract_status as ContractType, 
			dbo.vwCases.Closed, 
			CASE 
				WHEN [Invoice #] = 0 THEN NULL 
                ELSE [Invoice #] END AS Invoice_No, 
			CAST(Inv_Hist.invoice_date AS smalldatetime) as invoice_date, 

			Inv_Hist.invoice_amount, 
			Inv_Hist.amt_recieved AS PaidAmount, 
			INV_Hist.invoice_amount - isnull(Inv_Hist.amt_recieved,0) - isnull(INV_Hist.Adjustment,0) - isnull(Inv_hist.discount,0) - isnull(Inv_hist.refund,0) AS Balance,
            CAST(Inv_Hist.[Date Paid] AS smalldatetime)  AS DatePaid, 
			DATEDIFF(day, dbo.vwCases.DOS, Inv_Hist.invoice_date) AS DaysToBill, 
			DATEDIFF(day, Inv_Hist.invoice_date, 
            Inv_Hist.[Date Paid]) AS DaysToCollect, 
            CASE 
				WHEN HL.Contr_Effictive_date > vwCases.DOS THEN 'No'
				WHEN HL.contract_status = 'Exp' THEN 'No'
				WHEN vwcases.hospital in ('Cypress Pointe Surgical Hospital') and vwcases.DOS < '2016-04-22' THEN 'No'
				WHEN vwcases.hospital like '%Forest Park%' or vwcases.hospital like '%Victory%' Then 'No'
				WHEN HL.contract_status = 'Equipment' THEN 'Yes' 
				WHEN HL.contract_status = 'Services' AND CIM.Contract_status = HL.contract_status THEN 'Yes' 
				WHEN HL.contract_status = 'Services' THEN 'No' 
				ELSE 'No' 
				END AS IsBillable,
			CASE	
				WHEN HL.contract_status = 'Exp' THEN 'No'
				WHEN HL.contr_Effictive_date > vwCases.DOS THEN 'No'
				WHEN vwcases.hospital in ('Cypress Pointe Surgical Hospital') and vwcases.DOS < '2016-04-22' THEN 'No'
				WHEN vwcases.hospital like '%Forest Park%'  or vwcases.hospital like '%Victory%' Then 'No'
				WHEN HL.useExternalSupplier = 1 THEN 'No'
				WHEN (select count(*)  from supplies_track_3300 as ST where ST.pid = vwCases.PID 
							and hospital not in ('Foundation Surgical Hospital of San Antonio', 'CHRISTUS Santa Rosa Ambulatory Surgery Center - New Braunfels ')
							and HL.chargeforsupplies = 1
							and ST.is_specialty_item = 1) > 0 Then 'Yes'
				ELSE 'No'
				END AS IsBillableSupplies,

			vwCases.ORTime,
			InsuranceRoundedUnits,
			CIM.contract_status as CIMcontractstatus,
			HL.chargeforsupplies, 
			HL.contr_effictive_date as ContractEffectiveDate,
			--IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 31,Inv_Hist.balance,0) AS [0-30Days],
			--IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 61 and -datediff(day, getdate(),Inv_Hist.invoice_date) >=31 ,Inv_Hist.balance, 0 ) AS [31-60Days],
			--IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 91 and -datediff(day, getdate(),Inv_Hist.invoice_date) >=61 ,Inv_Hist.balance, 0 ) AS [61-90Days],
			--IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 121 and -datediff(day, getdate(), Inv_Hist.invoice_date) >=91, Inv_Hist.balance, 0) AS [91-120Days],
			--IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) >= 121, Inv_Hist.balance, 0) as [120+Days]
			IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 31, INV_Hist.invoice_amount - isnull(Inv_Hist.amt_recieved,0) - isnull(INV_Hist.Adjustment,0) - isnull(Inv_hist.discount,0) - isnull(Inv_hist.refund,0) ,0) AS [0-30Days],
			IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 61 and -datediff(day, getdate(),Inv_Hist.invoice_date) >=31 ,INV_Hist.invoice_amount - isnull(Inv_Hist.amt_recieved,0) - isnull(INV_Hist.Adjustment,0) - isnull(Inv_hist.discount,0) - isnull(Inv_hist.refund,0) , 0 ) AS [31-60Days], --added refund to calc for ticket# 2257
			IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 91 and -datediff(day, getdate(),Inv_Hist.invoice_date) >=61 ,INV_Hist.invoice_amount - isnull(Inv_Hist.amt_recieved,0) - isnull(INV_Hist.Adjustment,0) - isnull(Inv_hist.discount,0) - isnull(Inv_hist.refund,0) , 0 ) AS [61-90Days], --added refund to calc for ticket# 2257
			IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) < 121 and -datediff(day, getdate(), Inv_Hist.invoice_date) >=91, INV_Hist.invoice_amount - isnull(Inv_Hist.amt_recieved,0) - isnull(INV_Hist.Adjustment,0) - isnull(Inv_hist.discount,0) - isnull(Inv_hist.refund,0) , 0) AS [91-120Days], --added refund to calc for ticket# 2257
			IIF ( -datediff(day, getdate(),Inv_Hist.invoice_date) >= 121, INV_Hist.invoice_amount - isnull(Inv_Hist.amt_recieved,0) - isnull(INV_Hist.Adjustment,0) - isnull(Inv_hist.discount,0) - isnull(Inv_hist.refund,0) , 0) as [120+Days] --added refund to calc for ticket# 2257

	
	
FROM         dbo.vwCases
			--LEFT OUTER JOIN dbo.HospitalLookup AS HL ON dbo.vwCases.Hospital = HL.Hospital and vwCases.Region_Short_Name = HL.Region
			LEFT OUTER JOIN dbo.hospitals_3300 as HL 
					ON vwCases.hospital_id = HL.hospital_id
			LEFT OUTER JOIN dbo.invoice_history_3300 AS Inv_Hist 
					ON Inv_Hist.invoice_number = dbo.vwCases.[Invoice #] 
						AND dbo.vwCases.PID = Inv_Hist.patient_id 
			LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM 
					ON dbo.vwCases.Hospital_id = CIM.hospital_id
					AND dbo.vwCases.[1st Insurance Category] = CIM.insurance_type
--WHERE PID = 684951
/**=======

SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'vwCases' order by column_name

SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'hospitallookup'
SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'invoice_history_3300' 
SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'hospitals_3300'
>>>>>>> origin/Modifications

select * from vwcases
select top 100 * from case_report_3300
select * from hospitals_3300

select * from vwhospitalbillings

select distinct contract_status from hospitals_3300


--<<<<<<< HEAD
 ALTER VIEW vwHospitalBillings as 
=======
﻿ALTER VIEW vwHospitalBillings as 
>>>>>>> origin/Modifications
select 
	PID, 
	vwCases.DOS, 
	patient, 
	Region_short_Name, 
	vwCases.Hospital, 
	Surgeon, 
	[Primary Insurance], 
	[1st Insurance Category], 
<<<<<<< HEAD
	contracttype, 
=======
	HL.contracttype, 
>>>>>>> origin/Modifications
	case
		when [Invoice #] = 0 then null
		else [Invoice #] end as Invoice_No, 
	invoice_date,
	invoice_amount, 
	amt_recieved as PaidAmount,
	balance,  
	[date paid] as DatePaid,
	DATEDIFF(day, vwCases.DOS, invoice_date) AS DaysToBill,
<<<<<<< HEAD
	DATEDIFF(day, invoice_date, [date paid]) AS DaysToCollect
from vwCases
LEFT OUTER JOIN hospitallookup as HL on  vwCases.hospital = HL.Hospital
LEFT OUTER JOIN invoice_history_3300 as Inv_Hist on Inv_Hist.invoice_Number = vwCases.[Invoice #] and vwCases.PID = Inv_Hist.patient_id


=======
	DATEDIFF(day, invoice_date, [date paid]) AS DaysToCollect,
	case	
		when HL.contracttype = 'No Contract' then 'No'
		when HL.contracttype = 'Equipment' then 'Yes'
		when HL.contracttype = 'Technical Services' and CIM.Contracttype = HL.contracttype then 'Yes'
		when HL.contracttype = 'Technical Services' then 'No'
		else 'Unknown' end as IsBillable
from vwCases
	LEFT OUTER JOIN hospitallookup as HL on  vwCases.hospital = HL.Hospital
	LEFT OUTER JOIN invoice_history_3300 as Inv_Hist on Inv_Hist.invoice_Number = vwCases.[Invoice #] and vwCases.PID = Inv_Hist.patient_id
	LEFT OUTER JOIN vwContractInsuranceMatrix as CIM on vwCases.hospital = CIM.hospital and vwCases.[1st Insurance Category] = CIM.Insurance_Type


select contracttype, isbillable, count(*) from vwHospitalbillings group by contracttype, isbillable order by contracttype
select * from vwhospitalbillings where isbillable = 'Unknown'

>>>>>>> origin/Modifications

select top 100 * from vwCases
select * from invoice_history_3300

select * from vwHospitalBillings where invoice_no = '3752'
select PID, count(*)
  from vwHospitalBillings
  group by PID
  having count(*) > 1

<<<<<<< HEAD
select * from vwHospitalBillings
SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'vwCases'
SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'hospitallookup'
SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'invoice_history_3300' 

*/