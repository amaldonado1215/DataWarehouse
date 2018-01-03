alter view vwPatientInjuryRisk as 
select distinct cast(cr.dos as smalldatetime) as dos, ma.pid, ma.modality, ma.result, ma.alert, cr.hospital, cr.surgeon, 
	cr.[Primary Insurance], cr.reader, cr.tech,
	CASE
		WHEN  SL1.Proentity is not null THEN SL1.Proentity 
		WHEN  SL2.Proentity is not null THEN SL2.Proentity 
		ELSE SL1.Proentity
		END AS ProEntity,
	CASE 
		WHEN SL1.
	VM.billstatus
 from mod_alert_3300 as ma
	left outer join case_report_3300 as cr on cr.pid = ma.pid
	--left outer join surgeonlookup as sl on sl.surgeon = cr.surgeon and dos >= startdate and dos <= enddate
	left outer join claim_entity_3300 as ce on ce.patient_id = ma.pid
	LEFT OUTER JOIN dbo.InsuranceLookup AS IL ON IL.InsuranceCompany = CR.[Primary Insurance] 

	LEFT outer join vwMaster2 as VM on ma.pid = vm.pid
				LEFT OUTER JOIN dbo.SurgeonLookup2 AS SL1 ON CR.Surgeon = SL1.Surgeon 
						AND CR.DOS >= SL1.StartDate 
						AND CR.DOS <= SL1.EndDate 
						AND CR.Region_Short_Name = SL1.Region
						AND SL1.Payor = '* ANY *'
			LEFT OUTER JOIN dbo.SurgeonLookup2 as SL2 ON CR.Surgeon = SL2.Surgeon
						AND CR.DOS >= SL2.StartDate 
						AND CR.DOS <= SL2.EndDate 
						AND CR.Region_Short_Name = SL2.Region
						AND SL2.Payor = IL.InsuranceGroup
where cr.dos > '2013-01-01'
	and ma.alert = 'TRUE'
	and vm.billstatus <> 'Unbillable'
	--and (sl1.proentity like 'Austx%'
	--or sl2.proentity like 'Austx%'
