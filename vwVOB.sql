
  --  dbo_patient_deduct_3300 = USMON_Local{[Schema="dbo",Item="patient_deduct_3300"]}[Data],
   -- #"Removed Blank Rows" = Table.SelectRows(dbo_patient_deduct_3300, each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null}))),
  --  #"Removed Blank Rows1" = Table.SelectRows(#"Removed Blank Rows", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null}))),
  --  #"Removed Blank Rows2" = Table.SelectRows(#"Removed Blank Rows1", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null}))),
  --  #"Filtered Rows" = Table.SelectRows(#"Removed Blank Rows2", each [effective_from] <> null),
  --  #"Merged Queries" = Table.NestedJoin(#"Filtered Rows",{"pid"},hl7_raw_data_3300,{"patient_id"},"NewColumn",JoinKind.LeftOuter),
   -- #"Expanded NewColumn" = Table.ExpandTableColumn(#"Merged Queries", "NewColumn", {"Primary Policy, Group ID/Secondary ID No"},
			--{"NewColumn.Primary Policy, Group ID/Secondary ID No"}),
    --#"Renamed Columns" = Table.RenameColumns(#"Expanded NewColumn",{{"NewColumn.Primary Policy, Group ID/Secondary ID No", "GroupID"}}),
 --   #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"oon_benefits", type text}}),
    --#"Replaced Value" = Table.ReplaceValue(#"Changed Type","true","Yes",Replacer.ReplaceText,{"oon_benefits"}),
    --#"Replaced Value1" = Table.ReplaceValue(#"Replaced Value","false","No",Replacer.ReplaceText,{"oon_benefits"}),
    --#"Changed Type1" = Table.TransformColumnTypes(#"Replaced Value1",{{"author_onfile", type text}}),
    --#"Replaced Value2" = Table.ReplaceValue(#"Changed Type1","false","No",Replacer.ReplaceText,{"author_onfile"}),
    --#"Replaced Value3" = Table.ReplaceValue(#"Replaced Value2","true","Yes",Replacer.ReplaceText,{"author_onfile"})

	--  select * from vwVOB


ALTER VIEW vwVOB AS 
	SELECT
			PD.PID,
			-- PD.effective_from,
			-- PD.cal_yr,
			PD.timely_filling,
			-- PD.rapl_benefits,
			-- PD.network_coins_plan,
			CASE oon_benefits
				WHEN 1 THEN 'YES'
				WHEN 0 THEN  'NO'
				ELSE null
				END AS oon_benefits,
			PD.deduct_cross,
			PD.network_outpocket_amt,
			PD.network_outpocket_met,
			-- PD.oon_coins_plan,
			PD.network_deduct_amt,
			PD.network_deduct_met,
			PD.oon_outpocket_amt,
			PD.oon_outpocket_met,
			PD.oon_deduct_amt,
			PD.oon_deduct_met,
			-- PD.policy_type,
			PD.is_self_fund,
			PD.prior_auth,
			-- PD.author_onfile,
			-- HL7.[Primary Policy Name] AS HL7PrimaryPolicyName, 
			HL7.[Primary Policy, Group ID/Secondary ID No] AS HL7PrimaryPolicyGroupID, 
			-- HL7.[Primary Policy, Policy ID/Certificate No] AS HL7PrimaryPolicyIDCertificateNo,
			-- HL7.[Secondary Policy Name] AS HL7SecondaryPolicyName,
			-- HL7.[Secondary Policy, Group ID/Secondary ID No] AS HL7SecondaryGroupID, 
			-- HL7.[Secondary Policy, Policy ID/Certificate No] AS HL7SecondaryPolicyID, 
			/*CASE author_onfile
				WHEN 1 THEN 'YES'
				WHEN 0 THEN 'NO'
				ELSE NULL
				END AS author_onfileYN */
			vwCases.DOS,
			vwCases.patient,
			vwCases.Region_Short_Name,
			vwCases.Hospital,
			vwCases.Surgeon,
			vwCases.Reader,
			vwCases.[Primary Insurance],
			vwCases.[1st Insurance Category],
			PD.comments,
			datediff(day, getdate(),vwCases.DOS) as Age,
			PD.author_onfile

		 
	FROM dbo.patient_deduct_3300 AS PD
		LEFT OUTER JOIN HL7_raw_data_3300 AS HL7 ON  patient_id = PD.pid
		LEFT OUTER JOIN vwCases ON vwCases.PID = PD.pid
	WHERE --effective_from IS NOT null
		--AND  
		--datediff(day, getdate(),vwCases.DOS) > -31 and datediff(day, getdate(),vwCases.DOS) <= 0
		--ticket 2238 lauren, change to pull in data from 90 days, not the current 30
		datediff(day, getdate(),vwCases.DOS) > -91 and datediff(day, getdate(),vwCases.DOS) <= 0
