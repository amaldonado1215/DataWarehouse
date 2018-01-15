--select * from vwHospInsTypeChanges

ALTER VIEW vwHospInsTypeChanges AS

SELECT DISTINCT
	h.patient_id AS PatientId,
	FORMAT(h.date_changed, 'yyyy-MM-dd') AS DateChanged,	
	h.field_changed AS FieldChanged,
	h.cuser_name AS CuserName,
	h.old_val AS OldVal,
	h.new_val AS NewVal,
	c.Hospital,
	c.[Invoice #] AS InvoiceNumber,
	hosp.po_status AS POStatus,
	hosp.[Hourly Or Flat Fee] AS HourlyOrFlatFee,
	hosp.Rate,
	hp.invoice_amount AS InvoiceAmount,
	c.DOS
FROM
	history_3300 AS h 
LEFT OUTER JOIN	
	vwcases c ON h.patient_id = c.PID
LEFT OUTER JOIN
	hospitals_3300 hosp ON hosp.hospital_id = c.hospital_id 
LEFT OUTER JOIN
	vwHospitalBillings hp ON hp.PID = h.patient_id 
--WHERE LTRIM(RTRIM(h.field_changed)) = 'Insurance Type' AND h.old_val <> '0' AND YEAR(h.date_changed) = YEAR(GETDATE())
WHERE LTRIM(RTRIM(h.field_changed)) = 'Insurance Type' AND h.old_val <> '0' AND YEAR(h.date_changed) = YEAR(GETDATE())-1