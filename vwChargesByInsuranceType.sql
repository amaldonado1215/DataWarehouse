SELECT        client_name, PID, DOS, insurance_type, COUNT(*) AS Expr1
FROM            dbo.patient_insurance_charges_3300
GROUP BY client_name, PID, DOS, insurance_type