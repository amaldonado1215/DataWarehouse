/* 
select * from vwLatePatientInsuranceChanges where date_changed > '2017-01-01'
*/

alter view vwLatePatientInsuranceChanges as 

select distinct patient_id, dos, convert_hookup_time, CAST(date_changed AS datetime2(0)) as date_changed, cuser_name, tech, hospital, [1st Insurance Category] 
from history_3300 
	LEFT OUTER JOIN case_report_3300 on history_3300.patient_id = case_report_3300.pid
where field_changed = 'Insurance Type' 
	and date_changed > (cast(case_report_3300.dos as datetime) + cast(case_report_3300.convert_hookup_time as datetime))

order by dos desc