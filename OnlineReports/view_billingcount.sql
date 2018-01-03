alter view view_billingcount as
SELECT        BillStatus, CorrectEntity, COUNT(BillStatus) AS count
FROM  (SELECT DISTINCT PID, 
						CorrectEntity,
						BillStatus
        FROM            dbo.vwMaster2
        WHERE        (BillStatus <> 'paid') 
						AND (BillStatus <> 'unbillable') 
						AND (clm_billing_type = 'Pro Only' OR clm_billing_type IS NULL) 
						AND (Folder <> 'Closed Billing Claims' OR Folder IS NULL) 
						AND (DOS < getutcdate())) AS bs
GROUP BY CorrectEntity, BillStatus
/*
select * from view_billingcount where correctentity like '%austx%'

select DISTINCT PID, 
						CorrectEntity,
						BillStatus
        FROM            dbo.vwMaster2
        WHERE        (BillStatus <> 'paid') 
						AND (BillStatus <> 'unbillable') 
						AND (clm_billing_type = 'Pro Only' OR clm_billing_type IS NULL) 
						AND (Folder <> 'Closed Billing Claims' OR Folder IS NULL) 
						AND (DOS < getutcdate()) 
						AND correctentity like '%austx%'
						and billstatus = 'Appealed'



SELECT        CorrectEntity AS Entity, COUNT(CASE BS.BillStatus WHEN 'Billed' THEN 1 ELSE NULL END) AS Billed, COUNT(CASE BS.BillStatus WHEN 'Not Billed' THEN 1 ELSE NULL END) AS NotBilled, 
                         COUNT(CASE BS.BillStatus WHEN 'Appealed' THEN 1 ELSE NULL END) AS Appealed
FROM            (SELECT DISTINCT PID, CorrectEntity, BillStatus
                          FROM            dbo.vwMaster2
                          WHERE        (BillStatus <> 'paid') AND (BillStatus <> 'unbillable') AND (clm_billing_type <> 'Tech Only' OR
                                                    clm_billing_type IS NULL) AND (Folder <> 'Closed Billing Claims' OR
                                                    Folder IS NULL) AND (DOS < GETUTCDATE())) AS BS
							GROUP BY CorrectEntity


select  DISTINCT PID, CorrectEntity, BillStatus
                          FROM            dbo.vwMaster2
                          WHERE        (BillStatus <> 'paid') 
									AND (BillStatus <> 'unbillable') 
									AND (clm_billing_type <> 'Tech Only' OR clm_billing_type IS NULL) 
									AND (Folder <> 'Closed Billing Claims' OR Folder IS NULL) 
									AND (DOS < GETUTCDATE()) 
							
							AND correctentity like '%austx%'
							and billstatus = 'Appealed'

*/