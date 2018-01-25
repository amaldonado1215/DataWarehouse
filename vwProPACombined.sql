alter view vwProPACombined as
SELECT        
		dbo.vwMaster2.PID, 
		dbo.vwMaster2.claim_id AS ProClaimID, 
		dbo.vwPAMaster.claim_id AS PAClaimID, 
		dbo.vwMaster2.DOS, 
        dbo.vwMaster2.client_name AS ProClientName, 
		dbo.vwPAMaster.client_name AS PAClientName, 
		dbo.vwMaster2.Surgeon AS ProSurgeon, 
        dbo.vwMaster2.Patient, 
		dbo.vwMaster2.CorrectEntity AS ProCorrectEntity, 
		dbo.vwMaster2.[Primary Insurance], 
        dbo.vwMaster2.ins_collcted AS ProInsCollected, 
		dbo.vwMaster2.ins_charged AS ProInsCharged, 
		dbo.vwMaster2.ins_writte_off AS ProInsWriteOff, 
        dbo.vwMaster2.claimbiller AS ProClaimBiller, 
		dbo.vwMaster2.OriginalClaimDate AS ProOriginalClaimDate, 
        dbo.vwMaster2.[First Collection] AS ProFirstCollection, 
		dbo.vwMaster2.[Total Collection] AS ProTotalCollection, 
		dbo.vwMaster2.Balance AS ProBalance, 
        dbo.vwMaster2.Box33 AS proBox33, 
		dbo.vwMaster2.Folder AS ProFolder, 
		dbo.vwMaster2.BillStatus AS ProBillStatus, 
        dbo.vwPAMaster.Surgeon AS pasurgeon, 
		dbo.vwPAMaster.CorrectEntity AS PACorrectEntity, 
		dbo.vwPAMaster.[Primary Insurance] AS PAPrimaryInsurance, 
        dbo.vwPAMaster.ins_collcted AS PAInsCollected, 
		dbo.vwPAMaster.ins_charged AS PAInsCharged, 
		dbo.vwPAMaster.ins_writte_off AS PAInsWriteOff, 
        dbo.vwPAMaster.claimbiller AS PAClaimBiller, 
		dbo.vwPAMaster.[Claim Date] AS PAOriginalClaimDate, 
		dbo.vwPAMaster.[First Collection] AS PAFirstCollection, 
        dbo.vwPAMaster.[Total Collection] AS PATotalCollection, 
		dbo.vwPAMaster.Balance AS PABalance, 
		dbo.vwPAMaster.Box33 AS PABox33, 
        dbo.vwPAMaster.Folder AS PAFolder, 
		dbo.vwPAMaster.BillStatus AS PABillStatus,
		dbo.vwPAMaster.GroupID
FROM  dbo.vwMaster2 
	INNER JOIN dbo.vwPAMaster ON dbo.vwMaster2.Surgeon = dbo.vwPAMaster.iomsurgeonname				--
									AND dbo.vwMaster2.DOS = dbo.vwPAMaster.DOS						--
									AND dbo.vwPAMaster.Patient = dbo.vwMaster2.Patient				--		ticket #40
WHERE dbo.vwMaster2.clm_billing_type = 'Pro Only'													--		see below
	AND dbo.vwPAMaster.CorrectEntity IN (	SELECT Entity											--
											FROM  dbo.PASurgeonLookup								--
											WHERE SurgeonOwnd = 'Yes')								--
	AND dbo.vwMaster2.Folder <> 'New Insurance Billing'												--
	AND dbo.vwPAMaster.Folder <> 'New Insurance Billing'											--

--		LEFT OUTER JOIN dbo.vwPAMaster ON dbo.vwMaster2.Surgeon = dbo.vwPAMaster.iomsurgeonname		=
--				AND dbo.vwMaster2.DOS = dbo.vwPAMaster.DOS											=
--				AND dbo.vwPAMaster.Patient = dbo.vwMaster2.Patient									=		looked at query 
--WHERE																								=		for ticket #40
--		(dbo.vwPAMaster.PID IS NOT NULL)															=		working as ex-
--				AND (dbo.vwMaster2.clm_billing_type = 'Pro Only')									=		pected but very
--				AND (dbo.vwPAMaster.CorrectEntity IN												=		slow. General 
--                             (SELECT        Entity												=		cleanup and
--                               FROM            dbo.PASurgeonLookup								=		optimization
--                               WHERE        (SurgeonOwnd = 'Yes')))								=
				--AND (dbo.vwMaster2.Folder NOT IN ('New Insurance Billing')) AND					=
--                         (dbo.vwPAMaster.Folder NOT IN ('New Insurance Billing'))					=