ALTER VIEW vwContractInsuranceMatrix as
SELECT        hosp.Hospital, hosp.Contract_status, hi.Insurance_Type, hosp.hospital_id, CAST(contr_effictive_date AS SMALLDATETIME) AS contract_effective_date	
FROM            dbo.hospitals_3300 AS hosp 	
		LEFT OUTER JOIN dbo.hosp_ins_3000 AS hi ON hi.Hospital_ID = hosp.hospital_id
WHERE 
		(hosp_disable is null or hosp_disable <> 1)

/*
select * from vwContractInsuranceMatrix where hospital = 'Northwest Hills Surgical Hospital'

select * from hospitals_3300 where hospital = 'Northwest Hills Surgical Hospital'
select * from hospitallookup where hospital = 'Northwest Hills Surgical Hospital'
select * from hosp_ins_3000 where hospital_id = 1552

-- 2 hospitals with same name in USMON
select * from dbo.hospitals_3300 where hospital = 'St. Francis Medical Center'

--hospital disable flag set
select * from dbo.hospitals_3300 where hospital = 'Humble Surgical Hospital'
select * from hosp_ins_3000 where hospital_id in (517,1266)
select * from dbo.hospitals_3300 where hospital = 'Methodist Stone Oak Hospital'

--Duplicate "Insurance Types" in Hospital setup
--*Self Pay
select * from dbo.hospitals_3300 where hospital = 'St. David''s Medical Center'
select * from hosp_ins_3000 where hospital_id = 802
--* TRICARE
select * from dbo.hospitals_3300 where hospital = 'CHRISTUS Santa Rosa - Children''s Hospital'
select * from hosp_ins_3000 where hospital_id = 391
--* Uninsured
select * from dbo.hospitals_3300 where hospital = 'Elite Surgery Center, an ITH Affiliate'
select * from hosp_ins_3000 where hospital_id = 2054

select * from hosp_ins_3000 
select * from hospitallookup where  

*/