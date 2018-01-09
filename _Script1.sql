-- 1/8/18
select count(*) from vwmaster2 where [Claim Date] >= '2017-01-01' and [claim Date] < '2018-01-01'

-- 1/3/18
select * from vw_validationVwMaster2DuplicatesClaimids

select * from vwmaster2 where claim_id = 1033560
select * from surgeonlookup2 where surgeon like '%jeffrey shall%'

-- 1/2/18
select * from vwpavalidationcheckunmatchedsurgeons
select * from vwpacases where surgeon like '%dryer%'
select * from pasurgeonlookup
Randall Dryer, M.D.
Randall Dryer, M.D.

select * from vwPAMaster where defaultentity is null and dos > '2015-01-01'
select * from pasurgeonlookup where surgeon like '%dryer%'

spEmailPAMisBilledClaims
spEmailUnmatchedHospitalLookups
spEmailUnMatchedInsuranceLookup

select * from vwpacases where surgeon like '%dryer%'
select * from vwpavalidationcheckunmatchedsurgeons
select * from pasurgeonlookup where surgeon like '%dryer%'
Randall Dryer, M.D.
Randall Dryer, M.D.
Randall Dryer, M.D.
Randall Dryer, M.D.                               
Randall Dryer, M.D.                               
update pasurgeonlookup set surgeon = ltrim(rtrim(surgeon))
Randall Dryer, M.D.

select * from vwpavalidationcheckunmatchedsurgeons

select * from vwvalidationcheckunmatchedsurgeons
vwValidationCheckUnMatchedSurgeons


-- 10/27/17
select * from vwTechProductivitycombined where tech like '%voss%'

-- 10/23/17

select count(*) from history_3300 where date_changed > '2017-03-01'and field_changed like '%insurance type%'
select * from history_3300 where date_changed > '2017-03-01'and field_changed like '%insurance type%' 

-- 10/12/17


--- *****
select * from entitylookup
select * from surgeonlookup2 order by surgeonid asc


select 
    region_short_name, TRL.techname, TRL.[assigned region],  
    datepart(year,dos) as DOS_YR, 
    datepart(week, dos) as DOS_WK,
    concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101)) as DOS_Period,
    count(*) as totalCases, count(distinct dos) as Days_Worked,
    (sum( cast(datepart(hour, techtime)+datepart(minute, techtime) / 60.00 as decimal(7,4))) + count(*))/35 as Utilization_Pct
from vwcases  
    LEFT OUTER JOIN (SELECT Distinct TECH, [assigned region], TechName from TechRegionLookup) trl on trl.TECH = vwCases.Tech -- ticket #2329
where dos > '2015-01-01' and vwcases.Tech <> '* Unassigned *' -- ticket #2329
group by 
    region_short_name, 
    TRL.techname, TRL.[Assigned Region], datepart(year,dos),
    datepart(week,dos),
    concat (CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos) - 6, dos)), 101), ' - ', CONVERT(varchar(50), (DATEADD(dd, @@DATEFIRST - DATEPART(dw, dos), dos)), 101))

	select [assigned region] from techregionlookup


-- 9/25/17

SELECT column_name FROM information_schema.columns WHERE table_name = 'vwmaster2' order by ordinal_position

--9/21/17
select * from TechCompanyLookup where techentity like '%arch%'
select * from DefaultEntityLookup
sp_who2 active
select count(*) from vwmaster2
-- 9/20/17
select * from vwmaster2 where entity like '%Neuro DPM%'
select * from vwmaster2 where pid  = 209709
select * from patient_insurance_charges_3300 where pid = 209709

select * from vwTechProductivity
select * from 

spTechUtilization 

select * from vwmaster2 where correctentity like '%Neuro DPM%'

select * from view_DashEntityTotalCaseVolume where entity like '%tejas%'




select sum(eob) from collect_detail_3300 where claim_seq = 382042
select sum(eob) from collect_detail_3300 where claim_seq = 382043

select * from collect_detail_3300 where claim_seq in ('382042', '382043')  and proc_code = '95870/59'

select count(*) from vwCases --45438

select * from vwcases where correctproentity <> exceptioncorrectentity

select * from CorrectEntityExceptions where claimID is null
select count(*) from vwmaster2
select * from vwmaster2 where correctentity <> ExceptionCorrectEntity

select claim_id, pid from vwmaster2 where claim_id in (515996,779334,617825,630007,654641,367261,357332,354211,354292,347908,298807,735450,735444,735435,
735443,742160,777073,777855,778171,778298,778276,788164,793966,773616,765268,697524,593754,701429,774622,675342,
677257,683545,711162,701379,695792,711224,703082,864147,855841,855838,855824,855772,855760,853806,853801,853799,
763832,764047,838040,908716,908697,910821,908581,908566,894105)

UPDATE CorrectEntityExceptions SET PID = 212458 WHERE claimid = 367261
select * from correctentityexceptions where claimid = 367261

select * from vwmaster2 where claim_id  in (357332,
354211,
354292,
347908,
298807)

select * from patient_insurance_charges_3300 where PID in (357332,
354211,
354292,
347908,
298807)

UPDATE correctentityexceptions set PID = claimID, claimID = null where PID is null

select claimid, count(*) from correctentityexceptions group by claimid order by count(*) desc

select correctentity, pid, claim_id  from vwmaster2 where claim_id = 894105
----
select * from claimdatehistorypa
select * from vwpamaster
select * from vwbillablecasescalculation where correctentity like '%Maryland%'
select * from vwcases where defaultentity like '%maryland%'
--
--Neuroservice of Maryland, in Feb, for example, should be 7 'eligible' cases and 13 'Other'.  
--                                            Mar= 5 'Eligable' and 16 'Other'
select * from vwBillableCasesCalculation

select * from vwcases where defaultentity = 'Neuroservice of Maryland, PC' and dos >= '2017-02-01' and dos < '2017-03-01'
select * from vwcases where defaultentity = 'Neuroservice of Maryland, PC' and dos >= '2017-03-01' and dos < '2017-04-01'

select * from vwmaster2 where correctentity like '%Neuroservice of Maryland, PC%' 

select * from view_DashEntityTotalCaseVolume where entity like '%Maryland%'

select * from claim_det_33300 where claim_id = 382042
select * from  collect_detail_3300 where claim_seq = 382043 --382042

select * from vwmaster2 where claim_id = 382043   --382042




select * from claim_entity_3300 where patient_id = 209709


select * from tblMaster2

select * from surgeonlookup2


-- 8/14/17
select count(*) from agenthistory2

select pid, surgeon,invoice_no, invoice_amount, balance from vwHospitalBillings where pid in (750195,750185, 750415, 750426)

-- 8/11/2017
select pid, surgeon, correctentity, [insurance type], clm_billing_type from vwpamaster where surgeon like '%seade%' and [insurance type] like 'letter of%'
select surgeon, [1st insurance category] from vwpacases where surgeon like '%seade%' and [1st Insurance Category] like '%letter of%'

select balance, balance_new, * from vwhospitalbillings where balance <> balance_new
select * from invoice_history_3300

select * from Hospitallookup
-- 8/3/2017
select * from PAsurgeonlookup

select * from vwMisbilledClaims where [insurance type] like '%patient%'
select * from vwMisbilledIOMClaimsABS_DFW where [insurance type] like '%patient%'
select * from vwPAMisbilledClaims where [insurance type] like '%patient%'

select * from vwmaster2 where [insurance type] like '%patient%'

-- 7/28/2017
select count(*) from vwmaster2

SELECT sys.objects.object_id, sys.schemas.name AS [Schema], sys.objects.name AS Object_Name, sys.objects.type_desc AS [Type]
FROM sys.sql_modules (NOLOCK) 
INNER JOIN sys.objects (NOLOCK) ON sys.sql_modules.object_id = sys.objects.object_id 
INNER JOIN sys.schemas (NOLOCK) ON sys.objects.schema_id = sys.schemas.schema_id
WHERE
    sys.sql_modules.definition COLLATE SQL_Latin1_General_CP1_CI_AS LIKE '%client_name%' ESCAPE '\'
ORDER BY sys.objects.type_desc, sys.schemas.name, sys.objects.name

select * from entitylookup


-- 7/24/17 JTB
select * from users_3300
update entitylookup set payroll_ID2 = payroll_ID

-- 7/21/17 JTB
 select * from users_3300
 select * from techRegionLookup order by tech
 select * from entitylookup
 
 select * from vwpayrollentities

-- 7/17/17 JTB
select count(*) from vwmaster2  --58614


-- 7/13/17 JTB
select * from vwmaster2
select * from vwCollectionsReportTechSurgeonEntity

select correctentity, box33, * from vwmaster2 where pid = 623468

-- 7/10/2017 JTB
select billstatustech, * from vwmaster2 where pid in (625571,625567,621312,716915,716988)

--7/7/2017
select pid,claim_id,correctentity from vwMaster2 where pid in (529219,548266,530012)
select * from vwmaster2 where correctentity like '%AINeurology, PLLC%'

-- 7/5/2017
select * from surgeonlookup2 where proentity like '%nppa%'
select * from vwmisbilledclaims where claim_id =  838040
select correctentity, box33,pid from vwmaster2 where claim_id = 838040

select * from notes_3300 where patient_id = 378754 order by initialdate desc
select distinct note_type from notes_3300 where note_type like '%refund%'

select * from 

CREATE VIEW dbo.vwSHS_PaymentItems
AS
SELECT        dbo.claim_charges_3300.units, dbo.tblMaster2.AllowedAmt, dbo.tblMaster2.Balance, dbo.collect_detail_3300.comment AS DenialCode, 
              dbo.claim_entity_3300.[Claim Total Charge], dbo.collect_detail_3300.collected, dbo.claim_charges_3300.claim_seq, dbo.collect_detail_3300.proc_code

FROM            dbo.claim_charges_3300 
		LEFT OUTER JOIN dbo.tblMaster2 ON dbo.claim_charges_3300.claim_seq = dbo.tblMaster2.claim_id 
		LEFT OUTER JOIN dbo.claim_entity_3300 ON dbo.claim_charges_3300.claim_seq = dbo.claim_entity_3300.claim_seq 
		LEFT OUTER JOIN dbo.collect_detail_3300 ON dbo.claim_charges_3300.claim_seq = dbo.collect_detail_3300.claim_seq 
				AND dbo.claim_charges_3300.proc_code = dbo.collect_detail_3300.proc_code
GO

select * from claim_charges_3300
select * from collect_detail_3300

select count(*) from collect_detail_3300 where check_no is not null
select count(*) from collect_detail_3300 
select count(*) from vwCPTCollectionDetail where check_no is not null
select * from vwCPTCollectionDetail where check_no is null and collected is not null and collected > 0

select * from  claim_charges_3300

---------
drop view agents
select * from agents
select top 100 * from history_3300
ALTER VIEW AGENTS AS 
/* This view determines which agents and agent activity appears in the Agent Activity Report
*/
SELECT DISTINCT cuser_name AS agent, changed_by AS id
FROM          dbo.history_3300
WHERE        (changed_by IN (6381,  1490, 6457, 5905, 6558, 6979, 6559, 6711, 6862, 6382, 5755, 6629, 6631, 6012, 2946, 6076, 6670, 6825, 3287,
                         6593, 6535, 6968, 6757, 6875, 6575, 6518, 5807, 5450, 5890, 7042, 7043,6458, 2918, 7205, 6611,  5980, 7022, 
                         7206, 7040, 7229, 7039,7308,7313,7307,7311,7306,7312,7309, 7317, 7319, 7318, 7481, 7318, 7317, 7219, 6457, 7040,7039, 5905,
                         7358, 7668, 7632, 7633, 7631, 7360, 7632,7311, 7308, 7306, 7633, 7631, 7312, 7360, 7358, 7219, 6457, 7039, 7668, 
                         7768, 7767, 7766, 7765, 7874, 7768, 7305, 7871, 7870, 7956, 7957, 7955, 8060, 8063, 8062, 8061, 8010, 8011, 8012, 8013, 8149,
                         8143,8137,8136,8283,8284,8285,8286,8287,8290,8289,8198,8199,8347))

select sum(eob) from collect_detail_3300 where patient_id = 209709

select * from collect_detail_3300 as cd left outer join claim_entity_3300 as ce on ce.claim_seq = cd.claim_seq where ce.patient_id = 209709
select * from claim_entity_3300 where patient_id = 209709

-- 6/29/17
select * from vwinsurancedeposits
select * from vwmaster2
select * from vwmaster2 where box33 <> correctentity and folder like '%ongoing%' 

select * from vwcases
select * from HL7_raw_data_3300

select * from vwVOB

select * from vwhospitaltechbillingvalidation where claimbiller not in ('Dr. High')

select count(*) from vwhospitaltechbillingvalidation where claimbiller like '%high%'



-- 6/23/17
select * from vwcptClaimDetail
select * from vwCPTCollectionDetail

-- 6/19/17
select * from vwunbilledTechClaims where PID = 414624
select * from vwBillableCasesCalculation where techclaims = 0 and billablestatustech = 'Billable' and Closed = 'Yes'

--6/15/17
select * from view_payermix where defaultentity like '%neuroservice of mary%'  and dos >= '2017-02-01' and dos < '2017-03-01'
select * from view_dashentityTotalCaseVOlume where entity like '%neuroservice of mary%'

select * from vwmaster2 where defaultentity like '%neuroservice of mary%' and dos >= '2017-02-01' and dos < '2017-03-01'

select claim_id,correctentity,PID,* from vwmaster2 where claim_ID in (864147,855841,855838,855824,855772,855760,853806,853801,853799)
select claim_id,correctentity,PID,* from vwmaster2 where claim_ID in (763832,764047)

select * from vw_validationVwMaster2DuplicatesClaimids

select distinct client_name from vwmaster2 where claim_id in(287248,669420,486644,289638,
627949,285010,567860,629746,438071,627946,512231,607886,669311,718754,734498,381967,695717,819541,718746,711066,
686124,872793,495736,744936,870640,791923,225011,719139,567292,287241,393086,616566,623602,761412,349594,581773,
646642,509682,786198,835810,245149,608042,486642,617929,535636,623227,285057,529745,563456,701289,225017,646648,
474010,701183,646631,693478,336748,617889,220847,364107,521831,573550,616415,699853,433307,748746,873478,677234,
719166,607985,301511,701298,363990,512296,662048,315457,723651,349752,550862,842061,740965,811702,297628,567852,
676265,512298,716299,327406,434628,535638,381890,581781,567589,676322,666472,761420,690019,761414,718738,228511,
608027,699803,660020,567901,866222,658125,658110,646629,632832,725335,790104,710954,676267,714389,593894,244612,
336402,331333,225007,381995,697675,512300,382021,774538,364331,535640,718734,627877,349607,393777,761834,778597,
748893,818239,774536,523582,523751,349499,512310,844337,690005,699849,755484,336452,718736,648935,703098,776929,
755501,649095,719145,778641,363929,802872,761767,718750,803075,693472,699815,519011,865937,863608,676478,297604,
695711,349640,495030,676269,623231,761410,509070,607954,581768,523583,786067,648944,734620,26630,512302,262350,
224989,349523,321803,634051,649110,280615,252363,645025,786694,714357,761842,376304,786070,742180,693464,832364,
321371,658127,611832,509076,374667,563450,512286,393082,364086,367320,293008,438017,740985,287243,699817,637547,
573511,382019,829572,617948,865862,761617,766532,336254,512278,779828,831971,596926,562800,220285,561672,492873,
873685,349739,856645,653196,623255,735715,856213,739499,315564,616511,748842,512292,811304,397748)

select * from surgeonlookup2 where surgeon = 'Irvin K Sahni, M.D.'
select * from entitylookup where entity = 'River Valley Neurophysiology, PLLC'

-- 6/13/17
WHEN Region_short_name in ('Texas - Houston') AND ins_folder not in ('Closed Billing Claims') and CE.claim_date >= '2017-06-01' Then 'Integrate Practice Management, LLC'
     When Region_short_name in ('Texas - Houston') AND ins_folder in ('New Insurance') Then 'Integrate Practice Management, LLC'

select * from vwmaster2 where region_short_name like '%texas - houston%'

select region_short_name, correctentity, surgeon, * from vwmaster2 where region_short_name like '%california%' 
select * from surgeonlookup2 where surgeon like '%Rogers%'

select billstatustech, * from vwmaster2 where [Primary Insurance] like '%Aetna%' AND DOS >= '2017-01-01' --THEN 'Unbillable: Aetna

--6/10/17
select * from agents order by agent

-- 6/6/17

select * from vwHospitalBillingsStatus where pid = 684951


--5/26/17
SELECT * FROM dbo.case_report_3300 where date_changed IS NULL OR date_changed = 0

SELECT YEAR(dos), COUNT(patient_id) 
		FROM claim_entity_3300 
		WHERE last_save IS NULL AND dos <= '2017-05-26' AND ins_folder NOT IN ('Deleted Claims','New Insurance Billing') 
		GROUP BY YEAR(Dos) 
SELECT * FROM claim_entity_3300 WHERE last_save IS NULL AND dos > '2017-01-01' ORDER BY dos

SELECT * FROM dbo.claim_entity_3300 where last_save IS NULL AND date_claim_created IS NOT null

SELECT COUNT(*) FROM claim_entity_3300 WHERE  dos > '2017-01-01'

SELECT DISTINCT (ins_folder) from claim_entity_3300 

---
SELECT * FROM PAAgentHistory WHERE agentid = 8067
SELECT * from paagents WHERE id = 8067


SELECT TOP 100 * FROM dbo.notes_3350 WHERE web_id IN (8067,8065)

SELECT billstatustech, * from vwmaster2 WHERE pid IN (444552,'411452',112502,75875,522303) AND clm_billing_type = 'tech only'
SELECT billstatustech, * from vwmaster2 WHERE pid = 112502

-- 5/17/17
SELECT * FROM dbo.vwContractInsuranceMatrix

SELECT * FROM dbo.vwCPTCollectionDetail WHERE pid = 540838 AND proc_code = '95999'


select distinct
	CR.PID, CR.DOS, 
	 IL.InsuranceGroup AS [consolidated payor], 
	CR.Biller, CR.[1st Insurance Category] AS [Insurance Type], 
	CASE 
		WHEN PIC.ins_charged >= 0 AND PIC.ins_charged <= .25 AND CE.ins_folder IS NOT NULL THEN 'CORRECTED CLAIM'
		WHEN PIC.clm_billing_type IS NULL THEN EL.clm_billing_type ELSE PIC.clm_billing_type 
		END AS clm_billing_type,
	CD.box33,
	--Case
	--	when CC.Units is null then 
	--		cast( CC.Unit_Charge as money)
	--	else cast(CC.Units * CC.Unit_Charge as money) end
	--as ClaimTotalCharge,
	Coll_Det.claim_seq as claim_id, Coll_Det.proc_code, Coll_Det.collected, Coll_Det.eob as amount_allowed,
	Coll_Det.check_no, Coll_Det.collected_date, Coll_Det.comment as DenialCode, 
	 dcl.reason as DenialReason, 
	CR.hospital,
	CR.[Primary Insurance], 
	HL7.GroupID,
	CR.Region_Short_Name
from collect_detail_3300 as Coll_Det
	LEFT OUTER JOIN dbo.claim_entity_3300 AS CE ON Coll_det.claim_seq = CE.claim_seq
	LEFT OUTER JOIN dbo.case_report_3300 AS CR ON CE.patient_id = CR.PID 
	LEFT OUTER JOIN dbo.claim_det_33300 AS CD ON CD.claim_id = Coll_Det.claim_seq 
	--LEFT OUTER JOIN dbo.claim_charges_3300 AS CC ON CC.claim_seq = Coll_Det.claim_seq
	--												AND CC.proc_code = Coll_Det.proc_code
	LEFT OUTER JOIN dbo.patient_insurance_charges_3300 AS PIC ON Coll_Det.claim_seq = PIC.claim_id
	LEFT OUTER JOIN dbo.InsuranceLookup AS IL ON IL.InsuranceCompany = CR.[Primary Insurance] 
	LEFT OUTER JOIN dbo.EntityLookup AS EL ON PIC.client_name = EL.client_name 
	LEFT OUTER JOIN dbo.vwHL7_Raw AS HL7 ON HL7.patient_id = CR.PID 
	LEFT OUTER JOIN dbo.denialcodelookup as DCL on coll_det.comment = dcl.auth
WHERE CR.PID = 540838 AND coll_det.proc_code = '95999'

SELECT * FROM claim_charges_3300 where patient_id = 540838 AND proc_code = '95999'
SELECT * FROM collect_detail_3300 where pid = 540838

-- 5/9/17


SELECT TOP 100 * FROM history_3300

SELECT * FROM dbo.notes_3300

SELECT * FROM dbo.DenialCodeLookup ORDER BY auth
SELECT DISTINCT(comment) FROM dbo.Insurance_Deposits_3300 WHERE comment IS NOT NULL ORDER BY comment 

SELECT * from insurance_deposits_3300

SELECT * FROM collect_detail_3300

SELECT * FROM dbo.case_report_3300

SELECT * FROM notes_3300


SELECT * FROM dbo.InsuranceTypeLookup
SELECT * FROM insurancelookup

SELECT * FROM vwmaster2 WHERE correctentity = 'Neuroplexus, LLC' 
SELECT correctentity, box33, folder, surgeon, * FROM vwmaster2 WHERE surgeon = 'Kevin McCarthy, M.D.'

SELECT * FROM surgeonlookup2 WHERE surgeon LIKE '%mccart%' OR surgeon LIKE '%overland%' OR surgeon = 'Pierce Nunley, M.D.'

SELECT * FROM dbo.surgeonlookup2 WHERE surgeon LIKE '%kinchen%'

SELECT correctentity, box33, * FROM vwmaster2 WHERE pid = 658700

SELECT * FROM vwValidationCheckUnmatchedSurgeons

select * --, vwcases.region_short_name, vwcases.surgeon, vwcases.specialty, dos, defaultentity, [consolidated payor] 
		from vwcases 
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl1 on vwcases.surgeon = sl1.surgeon 
								and vwcases.dos >= sl1.startdate  
								and vwcases.dos <= sl1.enddate
								and sl1.region = Region_Short_Name
								and sl1.payor = '* ANY *'
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl2 on vwcases.surgeon = sl2.surgeon 
								and vwcases.dos >= sl2.startdate  
								and vwcases.dos <= sl2.enddate
								and sl2.region = Region_Short_Name
								and sl2.payor =  vwcases.[consolidated payor]
					LEFT OUTER JOIN 
						dbo.surgeonlookup2 sl3 on vwcases.surgeon = sl3.surgeon 
								and vwcases.dos >= sl3.startdate  
								and vwcases.dos <= sl3.enddate
								and sl3.payor = '* ANY *'
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl4 on vwcases.surgeon = sl4.surgeon 
								and vwcases.dos >= sl4.startdate  
								and vwcases.dos <= sl4.enddate
								and sl4.payor =  vwcases.[consolidated payor]
		where (SL1.Proentity is null 
				AND SL2.proentity is null
				AND SL3.proentity is null
				AND SL4.proentity is null)
				and dos > '2015-01-01'


-- 5/8/17
select distinct correctentity, count(*) from vwmaster2 group by correctentity
select count(*) from vwmaster2 where correctentity like '%neuroplex%'
select count(*) from vwcases where correctproentity like '%neuroplex%'

select * from vwmaster2


-- 5/1/17

select * from vwCPTCollectionDetail

select * from collect_detail_3300

select distinct techentity from regiontechentitylookup
select * from surgeonlookup2 where surgeon like'%silver%'

-- 4/28/17
select * from vwpatientinjuryrisk where proentity like '%Synergy%'   -- "Tech Entity" is not included in the view for the graph, current view looks up surgeon via surgeon lookup to find entity

select * from vwInsurancedeposits where entity like '%synergy%' order by date_collected desc

select * from surgeonlookup2 order by proentity, surgeon, startdate

select * from vwmaster2 order by region_short_name 

select distinct payor from surgeonlookup2

select distinct insurancegroup from insurancelookup

select ProEntity, count(*) from surgeonlookup2 where enddate > '2017-05-01' group by proentity


-- 4/27/17


select * from vwmaster2

select surgeon, region_short_name, defaulttechentity,* from vwmaster2 where surgeon IN ('Vudhi Slabisak, M.D.', 'Saqib Siddiqui, M.D.') and Region_Short_Name = 'Texas - DFW' 

select  * from tblAgenthistory2 where agentid = 7956

--4/26/17

select pid, surgeon, region_short_name,box33,correctentity,clm_billing_type,  * from vwmaster2 where pid in ( 653565, 683739) and clm_billing_type = 'Pro Only'
select * from surgeonlookup2 where surgeon like '%owusu%'
select * from vwMisbilledClaims where pid in ( 653565, 683739) 

select claim_id, surgeon, region_short_name,box33,correctentity,clm_billing_type,  * from vwmaster2 where claim_id in (735450, 735444, 735435, 735443) and clm_billing_type = 'Pro Only'



select * from surgeonlookup2 where surgeon = 'Melanie Kinchen, M.D.' order by startdate, payor
select top 100 * from vwmaster2


-- Demo Prep for Chad's Addison demo 4/23/17
select distinct billstatus, count(*) from vwmaster2 group by billstatus

select distinct billablestatuspro, count(*) from vwunbilledproclaims group by billablestatuspro
select billstatuspro, billablestatuspro, * from vwunbilledproclaims 
select distinct billablestatus, count(*) from vwbillablecasescalculation group by billablestatus

select billstatus, * from vwmaster2 

select distinct surgeon from surgeonlookup2 order by surgeon
select distinct surgeon from case_report_3300 order by surgeon

select  patient from case_report_3300  where patient = 'Aase, Julie' order by patient
select 'Patient ' + left(patient,2) + ' ' + convert(varchar,ABS(CHECKSUM(NewId())) % 1000) from case_report_3300 order by patient

update case_report_3300 set patient = 'Patient ' + left(patient,2) + ' ' + convert(varchar,ABS(CHECKSUM(NewId())) % 1000) 


select distinct biller from case_report_3300

select distinct reader from case_report_3300 order by reader
select * from readerlookup

select distinct proentity from vwpatientinjuryrisk
select distinct proentity from surgeonlookup2 order by proentity
select distinct correctentity from vwMaster2 order by correctentity
select distinct surgeon from surgeonlookup2 order by surgeon
select distinct surgeon from case_report_3300 order by surgeon

select * from vwmaster2 where correctentity like 'A Enim%'
select * from surgeonlookup2 where surgeon like '%Darius%'

select distinct entity from vwInsuranceDeposits order by entity
select distinct biller from insurance_deposits_3300

select entity, correctentity from vwmaster2
select entity from case_report_3300

select * from __MigrationHistory

select distinct company from cases
select distinct company from payments

select * from importdates
select * from imports

update cases set company = 'Santiago PLLC' where company = 'SPINE WORKS MANAGEMENT PLLC'
update cases set company = 'Melchizedek PLLC' where company = 'TROPHY ANESTHESIA PLLC'
update cases set company = 'Paulo Coelho PLLC' where company = 'GRAPEVINE ANESTHESIA PLLC'
update cases set company = 'Fatima PLLC' where company = 'KAJT, PLLC'


update payments set company = 'Santiago PLLC' where company = 'SPINE WORKS MANAGEMENT PLLC'
update payments set company = 'Melchizedek PLLC' where company = 'TROPHY ANESTHESIA PLLC'
update payments set company = 'Paulo Coelho PLLC' where company = 'GRAPEVINE ANESTHESIA PLLC'
update payments set company = 'Fatima PLLC' where company = 'KAJT, PLLC'

select distinct [referring doctor] from cases order by [referring doctor]
select distinct [refering doctor] from payments order by [refering doctor]

UPDATE cases set [referring doctor] = 'Dr. Rosalyn Warren' WHERE [referring doctor] = 'GIBSON DO, SCOTT'
UPDATE cases set [referring doctor] = 'Dr. Shafira Moore' WHERE [referring doctor] = 'HANSEN MD, THOMAS ERIC'
UPDATE cases set [referring doctor] = 'Dr. Xena Hampton' WHERE [referring doctor] = 'HANSSEN MD, CHRISTOPHER'
UPDATE cases set [referring doctor] = 'Dr. Odessa Potter' WHERE [referring doctor] = 'HAY MD, JAMES R'
UPDATE cases set [referring doctor] = 'Dr. Marah Dale' WHERE [referring doctor] = 'HAY MD, JOSHUA C'
UPDATE cases set [referring doctor] = 'Dr. Vivien Copeland' WHERE [referring doctor] = 'HRNACK MD, SCOTT A'
UPDATE cases set [referring doctor] = 'Dr. Chloe Michael' WHERE [referring doctor] = 'IAGULLI MD, NICOLAS D'
UPDATE cases set [referring doctor] = 'Dr. Adena Ball' WHERE [referring doctor] = 'KESANI MD, ANIL'
UPDATE cases set [referring doctor] = 'Dr. Jasmine Meadows' WHERE [referring doctor] = 'KHAN MD, AMIR M'
UPDATE cases set [referring doctor] = 'Dr. Carolyn Hickman' WHERE [referring doctor] = 'KHUBCHANDANI MD, ZUBIN G'
UPDATE cases set [referring doctor] = 'Dr. Naida Alvarado' WHERE [referring doctor] = 'KJELDGAARD DO, LARRY'
UPDATE cases set [referring doctor] = 'Dr. Zenaida Schroeder' WHERE [referring doctor] = 'MYLES MD, ROBERT'
UPDATE cases set [referring doctor] = 'Dr. Hedy Turner' WHERE [referring doctor] = 'PHELPS MD, JEFFREY B'
UPDATE cases set [referring doctor] = 'Dr. Vanna Mcintyre' WHERE [referring doctor] = 'ROZIER MD, ANTONIO'
UPDATE cases set [referring doctor] = 'Dr. Rhoda Silva' WHERE [referring doctor] = 'TISDALE DO, LEE'
UPDATE cases set [referring doctor] = 'Dr. Doris Pugh' WHERE [referring doctor] = 'WENGER MD, SCOTT'

UPDATE payments set [refering doctor] = 'Dr. Rosalyn Warren' WHERE [refering doctor] = 'GIBSON DO, SCOTT'
UPDATE payments set [refering doctor] = 'Dr. Shafira Moore' WHERE [refering doctor] = 'HANSEN MD, THOMAS ERIC'
UPDATE payments set [refering doctor] = 'Dr. Xena Hampton' WHERE [refering doctor] = 'HANSSEN MD, CHRISTOPHER'
UPDATE payments set [refering doctor] = 'Dr. Odessa Potter' WHERE [refering doctor] = 'HAY MD, JAMES R'
UPDATE payments set [refering doctor] = 'Dr. Marah Dale' WHERE [refering doctor] = 'HAY MD, JOSHUA C'
UPDATE payments set [refering doctor] = 'Dr. Vivien Copeland' WHERE [refering doctor] = 'HRNACK MD, SCOTT A'
UPDATE payments set [refering doctor] = 'Dr. Chloe Michael' WHERE [refering doctor] = 'IAGULLI MD, NICOLAS D'
UPDATE payments set [refering doctor] = 'Dr. Adena Ball' WHERE [refering doctor] = 'KESANI MD, ANIL'
UPDATE payments set [refering doctor] = 'Dr. Jasmine Meadows' WHERE [refering doctor] = 'KHAN MD, AMIR M'
UPDATE payments set [refering doctor] = 'Dr. Carolyn Hickman' WHERE [refering doctor] = 'KHUBCHANDANI MD, ZUBIN G'
UPDATE payments set [refering doctor] = 'Dr. Naida Alvarado' WHERE [refering doctor] = 'KJELDGAARD DO, LARRY'
UPDATE payments set [refering doctor] = 'Dr. Zenaida Schroeder' WHERE [refering doctor] = 'MYLES MD, ROBERT'
UPDATE payments set [refering doctor] = 'Dr. Hedy Turner' WHERE [refering doctor] = 'PHELPS MD, JEFFREY B'
UPDATE payments set [refering doctor] = 'Dr. Vanna Mcintyre' WHERE [refering doctor] = 'ROZIER MD, ANTONIO'
UPDATE payments set [refering doctor] = 'Dr. Rhoda Silva' WHERE [refering doctor] = 'TISDALE DO, LEE'
UPDATE payments set [refering doctor] = 'Dr. Doris Pugh' WHERE [refering doctor] = 'WENGER MD, SCOTT'

UPDATE insurance_Deposits_3300 SET BILLER = 'Lectus Sit Amet Incorporated' WHERE BILLER = 'Houston Neurology Institute'
UPDATE insurance_Deposits_3300 SET BILLER = 'Curae; Donec Corporation' WHERE BILLER = 'Dr. Krane'
UPDATE insurance_Deposits_3300 SET BILLER = 'Nec Foundation' WHERE BILLER = 'Gulf Coast Billing'
UPDATE insurance_Deposits_3300 SET BILLER = 'Libero Nec Ligula Incorporated' WHERE BILLER = 'Medical Practice Solutions'
UPDATE insurance_Deposits_3300 SET BILLER = 'Sed Eget Corporation' WHERE BILLER = 'Real Time Neuromonitoring (RTNA)'
UPDATE insurance_Deposits_3300 SET BILLER = 'Eu LLC' WHERE BILLER = 'NULL'
UPDATE insurance_Deposits_3300 SET BILLER = 'Erat Vivamus Associates' WHERE BILLER = 'Dr. Halsell'
UPDATE insurance_Deposits_3300 SET BILLER = 'Egestas Blandit Nam LLP' WHERE BILLER = ''
UPDATE insurance_Deposits_3300 SET BILLER = 'Feugiat LLC' WHERE BILLER = 'Dr. High'
UPDATE insurance_Deposits_3300 SET BILLER = 'Quis Inc.' WHERE BILLER = 'The Pain and Rehab Institute'
UPDATE insurance_Deposits_3300 SET BILLER = 'Iaculis Nec Eleifend Company' WHERE BILLER = 'H&PCS, INC.'
UPDATE insurance_Deposits_3300 SET BILLER = 'A Malesuada Id Company' WHERE BILLER = 'Dr. Mitchell'
UPDATE insurance_Deposits_3300 SET BILLER = 'Elit Corp.' WHERE BILLER = 'Dr. Gulledge'
UPDATE insurance_Deposits_3300 SET BILLER = 'Mi Duis Risus Industries' WHERE BILLER = 'Acquisition Billing Services'
UPDATE insurance_Deposits_3300 SET BILLER = 'Mauris Ut PC' WHERE BILLER = 'Acquisition Billing Services -DFW'
UPDATE insurance_Deposits_3300 SET BILLER = 'Ridiculus Mus Proin Company' WHERE BILLER = 'Rocky Mountain Neurodiagnostics'
UPDATE insurance_Deposits_3300 SET BILLER = 'Est Tempor Associates' WHERE BILLER = 'Colorado Center of Neurological Services (CCNS)'


UPDATE case_report_3300 SET BILLER = 'Lectus Sit Amet Incorporated' WHERE BILLER = 'Houston Neurology Institute'
UPDATE case_report_3300 SET BILLER = 'Curae; Donec Corporation' WHERE BILLER = 'Dr. Krane'
UPDATE case_report_3300 SET BILLER = 'Nec Foundation' WHERE BILLER = 'Gulf Coast Billing'
UPDATE case_report_3300 SET BILLER = 'Libero Nec Ligula Incorporated' WHERE BILLER = 'Medical Practice Solutions'
UPDATE case_report_3300 SET BILLER = 'Sed Eget Corporation' WHERE BILLER = 'Real Time Neuromonitoring (RTNA)'
UPDATE case_report_3300 SET BILLER = 'Eu LLC' WHERE BILLER = 'NULL'
UPDATE case_report_3300 SET BILLER = 'Erat Vivamus Associates' WHERE BILLER = 'Dr. Halsell'
UPDATE case_report_3300 SET BILLER = 'Egestas Blandit Nam LLP' WHERE BILLER = ''
UPDATE case_report_3300 SET BILLER = 'Feugiat LLC' WHERE BILLER = 'Dr. High'
UPDATE case_report_3300 SET BILLER = 'Quis Inc.' WHERE BILLER = 'The Pain and Rehab Institute'
UPDATE case_report_3300 SET BILLER = 'Iaculis Nec Eleifend Company' WHERE BILLER = 'H&PCS, INC.'
UPDATE case_report_3300 SET BILLER = 'A Malesuada Id Company' WHERE BILLER = 'Dr. Mitchell'
UPDATE case_report_3300 SET BILLER = 'Elit Corp.' WHERE BILLER = 'Dr. Gulledge'
UPDATE case_report_3300 SET BILLER = 'Mi Duis Risus Industries' WHERE BILLER = 'Acquisition Billing Services'
UPDATE case_report_3300 SET BILLER = 'Mauris Ut PC' WHERE BILLER = 'Acquisition Billing Services -DFW'
UPDATE case_report_3300 SET BILLER = 'Ridiculus Mus Proin Company' WHERE BILLER = 'Rocky Mountain Neurodiagnostics'
UPDATE case_report_3300 SET BILLER = 'Est Tempor Associates' WHERE BILLER = 'Colorado Center of Neurological Services (CCNS)'


UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aaron Preston M.D.' WHERE SURGEON = 'Robsinson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aaron Saunders M.D.' WHERE SURGEON = 'Abbas Toughanipour, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Abbot Vargas M.D.' WHERE SURGEON = 'Abdolreza Siadati, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Abdul Benton M.D.' WHERE SURGEON = 'Achal Achrol, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Abdul Garrison M.D.' WHERE SURGEON = 'Achal Dhruva, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Abdul Yates M.D.' WHERE SURGEON = 'Adam Bruggeman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Abel Rowland M.D.' WHERE SURGEON = 'Adam Harris, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Adrian Hess M.D.' WHERE SURGEON = 'Adam Lewis, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Adrian Knox M.D.' WHERE SURGEON = 'Adewale Adeniran, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aladdin Mueller M.D.' WHERE SURGEON = 'Ajeya Joshi, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aladdin Roberts M.D.' WHERE SURGEON = 'Alec Stall, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alan Langley M.D.' WHERE SURGEON = 'Ali Murad, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alec Ellison M.D.' WHERE SURGEON = 'Amiel Bethel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alec Guerra M.D.' WHERE SURGEON = 'Amin Malik, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alec Mccullough M.D.' WHERE SURGEON = 'Amir Kaviani, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alec Peck M.D.' WHERE SURGEON = 'Amir Malik, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alec Silva M.D.' WHERE SURGEON = 'Amit Patel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alexander Howe M.D.' WHERE SURGEON = 'Amitoz Manhas, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alfonso Porter M.D.' WHERE SURGEON = 'Andrew Cash, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Allistair Vega M.D.' WHERE SURGEON = 'Andrew Indresano, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alvin Bailey M.D.' WHERE SURGEON = 'Andrew Park, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alvin Day M.D.' WHERE SURGEON = 'Andrew Parkinson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Alvin Silva M.D.' WHERE SURGEON = 'Andrew Utter, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Amal Wolf M.D.' WHERE SURGEON = 'Andrew Whaley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Amery Allen M.D.' WHERE SURGEON = 'Anthony Owusu, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Amery Burton M.D.' WHERE SURGEON = 'Arnold Vardiman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Amir Copeland M.D.' WHERE SURGEON = 'Arthur Conley 604, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Amos Chandler M.D.' WHERE SURGEON = 'Arthur Conley 605, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Andrew Vega M.D.' WHERE SURGEON = 'Arthur Conley 606, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Anthony Alston M.D.' WHERE SURGEON = 'Arthur Conley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aquila Chang M.D.' WHERE SURGEON = 'Asif Husain, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aquila Dixon M.D.' WHERE SURGEON = 'Atilla Onan'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aquila Spears M.D.' WHERE SURGEON = 'Azmi Nasser, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Arden Glover M.D.' WHERE SURGEON = 'Baraa Al-Hafez, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Aristotle Hawkins M.D.' WHERE SURGEON = 'Barbara Lazio, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Armand Mclaughlin M.D.' WHERE SURGEON = 'Benjamin Martino, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Asher Beck M.D.' WHERE SURGEON = 'Bernie McHugh, Jr., M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Asher Bryant M.D.' WHERE SURGEON = 'Bernie, McHugh, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Asher Hartman M.D.' WHERE SURGEON = 'Blake Christensen, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ashton Lancaster M.D.' WHERE SURGEON = 'Blake Christensen, DO'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Austin Mcclain M.D.' WHERE SURGEON = 'Bradford Bader, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Austin Morrison M.D.' WHERE SURGEON = 'Brent Adcox, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Axel Burch M.D.' WHERE SURGEON = 'Brent Jackson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Baker Blanchard M.D.' WHERE SURGEON = 'Brent Morgan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Barrett Martin M.D.' WHERE SURGEON = 'Brian Iuliano, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Barrett Rios M.D.' WHERE SURGEON = 'Brian Reece, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Barry Graves M.D.' WHERE SURGEON = 'Brian Snell, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Basil Meadows M.D.' WHERE SURGEON = 'Bridger Co, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Beck Keith M.D.' WHERE SURGEON = 'Bridger Cox, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Benedict Aguilar M.D.' WHERE SURGEON = 'Cameron Carmody, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Benedict Moss M.D.' WHERE SURGEON = 'Carl Bischoff, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Benjamin Burt M.D.' WHERE SURGEON = 'Carmelo Otero, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Benjamin Mcbride M.D.' WHERE SURGEON = 'Casey Taber, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Benjamin Turner M.D.' WHERE SURGEON = 'Chad McDuffie, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Bert Sloan M.D.' WHERE SURGEON = 'Charles Pipkin, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Blake Bolton M.D.' WHERE SURGEON = 'Cheng-Lun Soo, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Blaze Allison M.D.' WHERE SURGEON = 'Cherie Booth, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Boris Cochran M.D.' WHERE SURGEON = 'Chris Bogaev, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Boris Hubbard M.D.' WHERE SURGEON = 'Chris Lee, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brady Castro M.D.' WHERE SURGEON = 'Christian Balldin, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brady Lambert M.D.' WHERE SURGEON = 'Christopher Wolf, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Branden Carter M.D.' WHERE SURGEON = 'Clifford Solomon, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Branden Kerr M.D.' WHERE SURGEON = 'Craig Callewart, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Branden Leach M.D.' WHERE SURGEON = 'Craig Kemper MD'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Branden Parsons M.D.' WHERE SURGEON = 'Craig Kemper, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brandon Burns M.D.' WHERE SURGEON = 'Craig Kuhns, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brent Gallagher M.D.' WHERE SURGEON = 'Curtis Mina, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brent Sykes M.D.' WHERE SURGEON = 'Dale Ehmer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brett Moore M.D.' WHERE SURGEON = 'Dan Eidman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brian Gaines M.D.' WHERE SURGEON = 'Dana Gibbs, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brock Reeves M.D.' WHERE SURGEON = 'Dani Bidros, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Brody Campos M.D.' WHERE SURGEON = 'Daniel Gutierrez, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Bruno Holt M.D.' WHERE SURGEON = 'Daniel Leeman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Bruno Mays M.D.' WHERE SURGEON = 'Daniel Peterson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Bruno Mcleod M.D.' WHERE SURGEON = 'David Book, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Bruno Vance M.D.' WHERE SURGEON = 'David Cavanaugh, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Bruno Wagner M.D.' WHERE SURGEON = 'David Cuellar, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Buckminster Ferguson M.D.' WHERE SURGEON = 'David Feuer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Buckminster Weber M.D.' WHERE SURGEON = 'David Gonzales, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Burton Mullins M.D.' WHERE SURGEON = 'David Masel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Cade Potter M.D.' WHERE SURGEON = 'David Roberts, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Caesar Bryant M.D.' WHERE SURGEON = 'David Rogers, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Caesar Erickson M.D.' WHERE SURGEON = 'Desh Sahni, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Caesar Hartman M.D.' WHERE SURGEON = 'Devinder Bhatia, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Caesar Hurst M.D.' WHERE SURGEON = 'Dharmesh Bhakta'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Cain Knapp M.D.' WHERE SURGEON = 'Diana Wilson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Cairo Hart M.D.' WHERE SURGEON = 'Don Stoval, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Caldwell Foreman M.D.' WHERE SURGEON = 'Don Stovall, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Callum Delacruz M.D.' WHERE SURGEON = 'Donald Mackenzie, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Callum Gilbert M.D.' WHERE SURGEON = 'Dr Conn, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Callum Patrick M.D.' WHERE SURGEON = 'Dr. C Gilberto Brito, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carl Mcclure M.D.' WHERE SURGEON = 'Dustin Hayward, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carlos Roth M.D.' WHERE SURGEON = 'Dustin Ray, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carlos Snider M.D.' WHERE SURGEON = 'Ed Anderson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carson Hebert M.D.' WHERE SURGEON = 'Elijah Hothem, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carson Sexton M.D.' WHERE SURGEON = 'Elizabeth Magnabosco, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carson WatersSurgeon M.D.' WHERE SURGEON = 'Emeka Nwodim, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Carter Barrera M.D.' WHERE SURGEON = 'Eric Gioia, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Castor Fuentes M.D.' WHERE SURGEON = 'Eric Oberlander, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Chancellor Crawford M.D.' WHERE SURGEON = 'Eric Ray, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Chaney Roman M.D.' WHERE SURGEON = 'Eric Ritchie, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Channing Newton M.D.' WHERE SURGEON = 'Erik Gregorie, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ciaran Cohen M.D.' WHERE SURGEON = 'Eubulus Kerr, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ciaran Hyde M.D.' WHERE SURGEON = 'Ewen Tseng, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Clinton Key M.D.' WHERE SURGEON = 'Fadi Nasr, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Clinton Lambert M.D.' WHERE SURGEON = 'Farbod Malek, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Coby Owen M.D.' WHERE SURGEON = 'Francisco Batlle, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Coby Rollins M.D.' WHERE SURGEON = 'Francisco Soldevilla, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Coby Wilkinson M.D.' WHERE SURGEON = 'Frank Fichtel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colby Petersen M.D.' WHERE SURGEON = 'Frank Garcia, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colorado Duncan M.D.' WHERE SURGEON = 'Frank Kuwamura, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colorado Hart M.D.' WHERE SURGEON = 'Frederick Todd, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colt Anthony M.D.' WHERE SURGEON = 'Gareth Adams, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colt Kelly M.D.' WHERE SURGEON = 'Garrison Whitaker, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colt Schmidt M.D.' WHERE SURGEON = 'Genaro Gutierrez, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colt Stokes M.D.' WHERE SURGEON = 'George Galvan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colt Turner M.D.' WHERE SURGEON = 'George Kellis, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colton Brady M.D.' WHERE SURGEON = 'Gerald Franklin, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Colton Matthews M.D.' WHERE SURGEON = 'Gerardo Zavala II, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Conan Walter M.D.' WHERE SURGEON = 'Gilbert Meadows, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Craig Goodwin M.D.' WHERE SURGEON = 'Gordon Marshall, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Craig Shannon M.D.' WHERE SURGEON = 'Gordon Yee, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Curran Carney M.D.' WHERE SURGEON = 'Gregg Gurwitz, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Curran Petty M.D.' WHERE SURGEON = 'Gregory Yoshida, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Cyrus Espinoza M.D.' WHERE SURGEON = 'Gretchin Champion, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dalton Castro M.D.' WHERE SURGEON = 'Guy Fogel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dalton Riggs M.D.' WHERE SURGEON = 'Hari Tumu, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Damian Lane M.D.' WHERE SURGEON = 'Harvinder Bedi, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Damon Riddle M.D.' WHERE SURGEON = 'Henrick Mike-Mayer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dane Ford M.D.' WHERE SURGEON = 'Hongbo Liu, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dane Mccarty M.D.' WHERE SURGEON = 'Houman Saedi, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Daniel Blankenship M.D.' WHERE SURGEON = 'Hugh McPherson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Daniel Ross M.D.' WHERE SURGEON = 'Ian Reynolds, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Daniel Sullivan M.D.' WHERE SURGEON = 'Ian Whitney, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Daquan Copeland M.D.' WHERE SURGEON = 'Ioannis Avramis, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Daquan Rollins M.D.' WHERE SURGEON = 'Irvin K Sahni, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Darius Garza M.D.' WHERE SURGEON = 'Ishaq Syed, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Darius Guerra M.D.' WHERE SURGEON = 'Issada Thongtrangan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Darius Owen M.D.' WHERE SURGEON = 'Jacob Rosenstein, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. David Alston M.D.' WHERE SURGEON = 'Jamal Taha, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. David Mullins M.D.' WHERE SURGEON = 'James Elbaor, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Davis Eaton M.D.' WHERE SURGEON = 'James Go, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Davis Gibbs M.D.' WHERE SURGEON = 'James Hamada, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Davis Vargas M.D.' WHERE SURGEON = 'James Loddengaard, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Deacon Gates M.D.' WHERE SURGEON = 'James Odor, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dennis Austin M.D.' WHERE SURGEON = 'James Rindler'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dennis Rosales M.D.' WHERE SURGEON = 'James Simmons Jr,MD'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Denton William M.D.' WHERE SURGEON = 'James Simmons, III, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Derek Bates M.D.' WHERE SURGEON = 'James Simmons, Jr., M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Derek Tyson M.D.' WHERE SURGEON = 'James Smith, Jr., M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Devin Wyatt M.D.' WHERE SURGEON = 'James Waldron, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dexter Carrillo M.D.' WHERE SURGEON = 'Janmeet ''Rocky'' Sahota, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dexter Garrett M.D.' WHERE SURGEON = 'Jason Highsmith, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dexter Holden M.D.' WHERE SURGEON = 'Jason Taub, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dillon Hooper M.D.' WHERE SURGEON = 'Jean Louis Benae, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dillon Rosario M.D.' WHERE SURGEON = 'Jeff Phelps, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dillon Walter M.D.' WHERE SURGEON = 'Jeffrey Counts, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dolan Ball M.D.' WHERE SURGEON = 'Jeffrey Dean, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dolan Levine M.D.' WHERE SURGEON = 'Jeffrey Lue, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dominic Velez M.D.' WHERE SURGEON = 'Jeffrey Wingate, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Donovan Jacobs M.D.' WHERE SURGEON = 'Jeremy Denning, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Donovan Oneill M.D.' WHERE SURGEON = 'Jeremy Wang, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Drew Manning M.D.' WHERE SURGEON = 'Jerjis Denno, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Drew Mcclure M.D.' WHERE SURGEON = 'Jerry Gutierrez, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Drew Ross M.D.' WHERE SURGEON = 'Jesse Delee, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dustin Berry M.D.' WHERE SURGEON = 'Jim Melton, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dustin Morgan M.D.' WHERE SURGEON = 'Jimmy Conway, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Dylan Giles M.D.' WHERE SURGEON = 'Joe Ho, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Eagan Rich M.D.' WHERE SURGEON = 'Joel Jenne'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Edward Bradshaw M.D.' WHERE SURGEON = 'John Doski, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Edward Malone M.D.' WHERE SURGEON = 'John Edwards, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Edward Moore M.D.' WHERE SURGEON = 'John Evans, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Elijah Moran M.D.' WHERE SURGEON = 'John Frederick, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Elliott Johns M.D.' WHERE SURGEON = 'John Friedland, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Elvis Glass M.D.' WHERE SURGEON = 'John Park, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Emerson Cabrera M.D.' WHERE SURGEON = 'John Tenny, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Emery Shaw M.D.' WHERE SURGEON = 'John Wyatt, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Emmanuel Mack M.D.' WHERE SURGEON = 'Jon Krumerman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Erasmus Hurst M.D.' WHERE SURGEON = 'Jon Paley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Erich Dale M.D.' WHERE SURGEON = 'Jonathan Duncan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Erich Ortiz M.D.' WHERE SURGEON = 'Jonathan Fontenot, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ethan House M.D.' WHERE SURGEON = 'Jorge Alvernia, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Evan Manning M.D.' WHERE SURGEON = 'Jose Barrera, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Evan Mckinney M.D.' WHERE SURGEON = 'Jose Bermudez, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Evan Whitley M.D.' WHERE SURGEON = 'Jose Ferrer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ezekiel Jackson M.D.' WHERE SURGEON = 'Jose Rodriguez, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ezekiel Sellers M.D.' WHERE SURGEON = 'Joseph Tejan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ezra Chapman M.D.' WHERE SURGEON = 'Joseph Wyatt, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ferdinand Cotton M.D.' WHERE SURGEON = 'Joshua James, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Finn Haley M.D.' WHERE SURGEON = 'Joshua Levy, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Finn Solis M.D.' WHERE SURGEON = 'Josue Gabriel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Flynn Neal M.D.' WHERE SURGEON = 'Jr.Gerald Greenfield, M.D'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Flynn Stone M.D.' WHERE SURGEON = 'Jr.Gerald Greenfield, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Forrest Perez M.D.' WHERE SURGEON = 'Juan Martin, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Francis Hood M.D.' WHERE SURGEON = 'Judith Thompson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Francis Tate M.D.' WHERE SURGEON = 'Julio Calderin, MD'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Fritz Chaney M.D.' WHERE SURGEON = 'Kamal Morar, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Fritz Dunlap M.D.' WHERE SURGEON = 'Karl Vega, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Fulton Mckinney M.D.' WHERE SURGEON = 'Katrina Chaung, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gabriel Sellers M.D.' WHERE SURGEON = 'Keith Matheny, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gage Martin M.D.' WHERE SURGEON = 'Keith Norvill, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gage Wynn M.D.' WHERE SURGEON = 'Keith Preston, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Galvin Buckner M.D.' WHERE SURGEON = 'Kelsey Shay, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gannon Mosley M.D.' WHERE SURGEON = 'Kendall Carll, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gareth Clarke M.D.' WHERE SURGEON = 'Kendrick Thomas, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Garrison James M.D.' WHERE SURGEON = 'Kenneth Hsu, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gary Perry M.D.' WHERE SURGEON = 'Kenneth Madsen, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gary Stephenson M.D.' WHERE SURGEON = 'Kenney Carter, Jr, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Geoffrey Quinn M.D.' WHERE SURGEON = 'Kevin James, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Giacomo Kent M.D.' WHERE SURGEON = 'Kevin James, M.D. - Andaz'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Grady Hendricks M.D.' WHERE SURGEON = 'Kevin Kaufman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Grady Kramer M.D.' WHERE SURGEON = 'Kevin McCarthy, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Grady Lawson M.D.' WHERE SURGEON = 'Kevin Richardson, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Graham Lindsey M.D.' WHERE SURGEON = 'Kim Rickert, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Graham Odom M.D.' WHERE SURGEON = 'Kimberly Terry, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Graham Randall M.D.' WHERE SURGEON = 'Lance Jackson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Graiden Little M.D.' WHERE SURGEON = 'Lance Smith, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Grant Brennan M.D.' WHERE SURGEON = 'Lance Tigyer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Gregory Foreman M.D.' WHERE SURGEON = 'Larry Kjeldgaard, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Griffin Hewitt M.D.' WHERE SURGEON = 'Laudislau Albert Jr, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Griffith Ramos M.D.' WHERE SURGEON = 'Laura Kissell, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hakeem Blackburn M.D.' WHERE SURGEON = 'Lav Kapadia, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hamilton Cantrell M.D.' WHERE SURGEON = 'Lenny Stubbs, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hamish Harding M.D.' WHERE SURGEON = 'Lewis Frazier, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hammett Bradshaw M.D.' WHERE SURGEON = 'Li Poa, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Harding Joseph M.D.' WHERE SURGEON = 'M Holland, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Harlan Best M.D.' WHERE SURGEON = 'Magdiel Trinidad, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hasad Cervantes M.D.' WHERE SURGEON = 'Maged Mina, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hasad Winters M.D.' WHERE SURGEON = 'Manish Patel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hayden Ward M.D.' WHERE SURGEON = 'Marc Letellier, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hayes Haynes M.D.' WHERE SURGEON = 'Marcella Madera, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hayes Orr M.D.' WHERE SURGEON = 'Mark Burnett, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hector York M.D.' WHERE SURGEON = 'Mark Grubb, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hedley Arnold M.D.' WHERE SURGEON = 'Mark Segal, M.D'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hedley Barron M.D.' WHERE SURGEON = 'Mark Silver, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hedley Dunlap M.D.' WHERE SURGEON = 'Mark Valente, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hedley Harrison M.D.' WHERE SURGEON = 'Marshall Cain, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Henry Cruz M.D.' WHERE SURGEON = 'Martha Wills, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Henry Woods M.D.' WHERE SURGEON = 'Martin Holland, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hiram Hall M.D.' WHERE SURGEON = 'Matt Dumigan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Holmes Collier M.D.' WHERE SURGEON = 'Matthew Hummell, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Holmes Peters M.D.' WHERE SURGEON = 'Matthew Morrey, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Honorato Lindsay M.D.' WHERE SURGEON = 'Matthew Quigley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hop Armstrong M.D.' WHERE SURGEON = 'Matthew Stanfield, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hop Jefferson M.D.' WHERE SURGEON = 'Melanie Kinchen, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hop Valentine M.D.' WHERE SURGEON = 'Melvin Wahl Jr., M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hyatt Mcintyre M.D.' WHERE SURGEON = 'Melvin Wahl, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Hyatt Mckee M.D.' WHERE SURGEON = 'Micam Tullous, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ian Mosley M.D.' WHERE SURGEON = 'Michael David Dennis, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ian Newton M.D.' WHERE SURGEON = 'Michael Desaloms, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ignatius Rodriguez M.D.' WHERE SURGEON = 'Michael Hahn, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Isaac Perry M.D.' WHERE SURGEON = 'Michael Hennessy, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Isaiah Foreman M.D.' WHERE SURGEON = 'Michael Leonard, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Isaiah Porter M.D.' WHERE SURGEON = 'Michael McKee'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Isaiah Turner M.D.' WHERE SURGEON = 'Michael Moghimi, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ishmael Cunningham M.D.' WHERE SURGEON = 'Michael Moghimi, MD'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Ivor Ramsey M.D.' WHERE SURGEON = 'Michael Riggs, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jack Long M.D.' WHERE SURGEON = 'Michael Rimlawi, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jack Sosa M.D.' WHERE SURGEON = 'Mike Tyler, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jackson Black M.D.' WHERE SURGEON = 'Mirza Baig, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jackson Wheeler M.D.' WHERE SURGEON = 'Mustasim Rumi, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jakeem Good M.D.' WHERE SURGEON = 'Narasimha Jatavallabhula'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jamal Aguilar M.D.' WHERE SURGEON = 'Natalie Weger, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jamal Bridges M.D.' WHERE SURGEON = 'Naveen Kella, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. James Pearson M.D.' WHERE SURGEON = 'Navin Subramanian, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jared Jenkins M.D.' WHERE SURGEON = 'Neal Haynes, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jared Mccray M.D.' WHERE SURGEON = 'Neelesh Mehendale, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jarrod Gonzales M.D.' WHERE SURGEON = 'Neleesh Mehendale, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jeremy Hale M.D.' WHERE SURGEON = 'Nicholas Peiffer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jermaine Benton M.D.' WHERE SURGEON = 'Nilesh Kotecha, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jerome Brooks M.D.' WHERE SURGEON = 'Nimish Patel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jerry Silva M.D.' WHERE SURGEON = 'Okay Onan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jesse Gallegos M.D.' WHERE SURGEON = 'Pablo Vazquez-Seoane'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jesse Winters M.D.' WHERE SURGEON = 'Pablo Vazquez-Seoane, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Joel Baker M.D.' WHERE SURGEON = 'Pantelis Hadjizacharia, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jonah Mccullough M.D.' WHERE SURGEON = 'Patricia Mancuso, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jonas Barton M.D.' WHERE SURGEON = 'Patrick Cindrich'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jonas Castaneda M.D.' WHERE SURGEON = 'Patrick Rudersdorf, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Jordan Preston M.D.' WHERE SURGEON = 'Paul Boone, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Joshua Ashley M.D.' WHERE SURGEON = 'Paul Geibel, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Joshua Cain M.D.' WHERE SURGEON = 'Paul Vaughan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Joshua Mayer M.D.' WHERE SURGEON = 'Paymaun Lotfi, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Judah Morin M.D.' WHERE SURGEON = 'Pedro Loredo, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Julian Oneill M.D.' WHERE SURGEON = 'Peter Campbell, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Justin Kirby M.D.' WHERE SURGEON = 'Pierce Nunley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kadeem Woods M.D.' WHERE SURGEON = 'Presley Mock, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kamal Britt M.D.' WHERE SURGEON = 'Rafael Parra, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kamal Macias M.D.' WHERE SURGEON = 'Rajesh Bindal, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kaseem Finch M.D.' WHERE SURGEON = 'Ralph Garza, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kato Tanner M.D.' WHERE SURGEON = 'Ram Vasudevan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Keefe Bean M.D.' WHERE SURGEON = 'Randall Dryer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Keefe Burke M.D.' WHERE SURGEON = 'Randy Davis, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kelly Brooks M.D.' WHERE SURGEON = 'Raymond Lilly, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kelly Rodriquez M.D.' WHERE SURGEON = 'Rebecca Stachniak, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kelly Wells M.D.' WHERE SURGEON = 'Rene Pena, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kenneth French M.D.' WHERE SURGEON = 'Riad Adoumie, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kermit Rivera M.D.' WHERE SURGEON = 'Richard Burg, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kevin Aguirre M.D.' WHERE SURGEON = 'Richard Jackson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kibo Dawson M.D.' WHERE SURGEON = 'Richard Marks, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kibo Mullins M.D.' WHERE SURGEON = 'Richard Rooney, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kibo Parker M.D.' WHERE SURGEON = 'Richard Thrasher, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kibo Shelton M.D.' WHERE SURGEON = 'Richard Westmark, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kirk Hopper M.D.' WHERE SURGEON = 'Richard Wohns, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Knox Avila M.D.' WHERE SURGEON = 'Richard Wupperman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kuame Cantu M.D.' WHERE SURGEON = 'Robert Henderson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kyle Gamble M.D.' WHERE SURGEON = 'Robert Josey, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Kyle Jones M.D.' WHERE SURGEON = 'Robert Remondino, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Laith Espinoza M.D.' WHERE SURGEON = 'Robert Spicer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Laith Mcmahon M.D.' WHERE SURGEON = 'Robert Thomas, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lamar Harding M.D.' WHERE SURGEON = 'Robert Tibbs, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lamar Hill M.D.' WHERE SURGEON = 'Robert Urrea, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lance Beard M.D.' WHERE SURGEON = 'Robert Viere, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lance Robbins M.D.' WHERE SURGEON = 'Robert Wienecke, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lance Wolf M.D.' WHERE SURGEON = 'Roman Litwinski, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lance Wolfe M.D.' WHERE SURGEON = 'Ronald Magee, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lars Flynn M.D.' WHERE SURGEON = 'Russell Briggs, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lars Roberson M.D.' WHERE SURGEON = 'Ruth Thiex, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lars Stafford M.D.' WHERE SURGEON = 'Ryan Halpin, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lars Vance M.D.' WHERE SURGEON = 'Ryan Nelson, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lee RaySurgeon M.D.' WHERE SURGEON = 'Sabino D''Agostino, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Leo Solis M.D.' WHERE SURGEON = 'Saeid Aryan, D.O.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Leroy Jensen M.D.' WHERE SURGEON = 'Samir Parikh, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Leroy Mejia M.D.' WHERE SURGEON = 'Sanjay Misra, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lev Hunter M.D.' WHERE SURGEON = 'Saqib Siddiqui, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lewis Gray M.D.' WHERE SURGEON = 'Scott Farley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Linus Hyde M.D.' WHERE SURGEON = 'Sean Jones-Quaidoo, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Logan Booth M.D.' WHERE SURGEON = 'Sekinat McCormick, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Logan Combs M.D.' WHERE SURGEON = 'Shah N. Siddiqi,MD'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Lucius Oneill M.D.' WHERE SURGEON = 'Shah Siddiqui, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Luke Hart M.D.' WHERE SURGEON = 'Shamim Badiyan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Luke Moody M.D.' WHERE SURGEON = 'Shane Pahlavan, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Macaulay Booth M.D.' WHERE SURGEON = 'Shawn Funk, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Macaulay Sanders M.D.' WHERE SURGEON = 'Shiela Smitherman, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Macon Olsen M.D.' WHERE SURGEON = 'Shiveindra Jeyamohan'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Macon Warner M.D.' WHERE SURGEON = 'Shon Cook, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Macon Willis M.D.' WHERE SURGEON = 'Stanley Jones, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Magee Mcdowell M.D.' WHERE SURGEON = 'Stephen Courtney, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Mannix Vaughn M.D.' WHERE SURGEON = 'Stephen Earle, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Mark Fischer M.D.' WHERE SURGEON = 'Stephen Neece, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Mark Johns M.D.' WHERE SURGEON = 'Steven Cyr, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Marsden Gutierrez M.D.' WHERE SURGEON = 'Steven Remer, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Martin Aguilar M.D.' WHERE SURGEON = 'Stuart Thomas, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Martin Howell M.D.' WHERE SURGEON = 'Stuart Weil, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Marvin Higgins M.D.' WHERE SURGEON = 'T Wigley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Marvin Rich M.D.' WHERE SURGEON = 'Theodore Spinks, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Mason Hoover M.D.' WHERE SURGEON = 'Thomas Crepps, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Mason Nichols M.D.' WHERE SURGEON = 'Thomas Jones, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Maxwell Spears M.D.' WHERE SURGEON = 'Thomas Loftus, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Melvin Wise M.D.' WHERE SURGEON = 'Thomas Raley, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Merrill Kirby M.D.' WHERE SURGEON = 'Tiffany Rogers, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Michael Trujillo M.D.' WHERE SURGEON = 'Todd Lansford, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Moses Fletcher M.D.' WHERE SURGEON = 'Tom Chow, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Myles Reilly M.D.' WHERE SURGEON = 'Trent Tredway, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nasim Rush M.D.' WHERE SURGEON = 'Vidhya Subramanian, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nathan Bailey M.D.' WHERE SURGEON = 'Vivek Kushwaha, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nathan Conway M.D.' WHERE SURGEON = 'Vudhi Slabisak, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nathan Huffman M.D.' WHERE SURGEON = 'Warren Neely, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nathan Mooney M.D.' WHERE SURGEON = 'William Koeck, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nehru Cote M.D.' WHERE SURGEON = 'William Tally, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Neil Clayton M.D.' WHERE SURGEON = 'William Tisdall, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nero Cooper M.D.' WHERE SURGEON = 'William Wilson, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Neville Leblanc M.D.' WHERE SURGEON = 'Winston Fong, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nicholas Mann M.D.' WHERE SURGEON = 'Yoshihiro Yamamoto, M.D.'
UPDATE Surgeonlookup2 SET surgeon = 'Dr. Nigel Logan M.D.' WHERE SURGEON = 'Zachary Garza, M.D.'


UPDATE case_report_3300 SET surgeon = 'Dr. Aaron Preston M.D.' WHERE SURGEON = 'Robsinson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Aaron Saunders M.D.' WHERE SURGEON = 'Abbas Toughanipour, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Abbot Vargas M.D.' WHERE SURGEON = 'Abdolreza Siadati, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Abdul Benton M.D.' WHERE SURGEON = 'Achal Achrol, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Abdul Garrison M.D.' WHERE SURGEON = 'Achal Dhruva, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Abdul Yates M.D.' WHERE SURGEON = 'Adam Bruggeman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Abel Rowland M.D.' WHERE SURGEON = 'Adam Harris, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Adrian Hess M.D.' WHERE SURGEON = 'Adam Lewis, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Adrian Knox M.D.' WHERE SURGEON = 'Adewale Adeniran, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Aladdin Mueller M.D.' WHERE SURGEON = 'Ajeya Joshi, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Aladdin Roberts M.D.' WHERE SURGEON = 'Alec Stall, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alan Langley M.D.' WHERE SURGEON = 'Ali Murad, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alec Ellison M.D.' WHERE SURGEON = 'Amiel Bethel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alec Guerra M.D.' WHERE SURGEON = 'Amin Malik, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alec Mccullough M.D.' WHERE SURGEON = 'Amir Kaviani, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alec Peck M.D.' WHERE SURGEON = 'Amir Malik, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alec Silva M.D.' WHERE SURGEON = 'Amit Patel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alexander Howe M.D.' WHERE SURGEON = 'Amitoz Manhas, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alfonso Porter M.D.' WHERE SURGEON = 'Andrew Cash, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Allistair Vega M.D.' WHERE SURGEON = 'Andrew Indresano, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alvin Bailey M.D.' WHERE SURGEON = 'Andrew Park, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alvin Day M.D.' WHERE SURGEON = 'Andrew Parkinson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Alvin Silva M.D.' WHERE SURGEON = 'Andrew Utter, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Amal Wolf M.D.' WHERE SURGEON = 'Andrew Whaley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Amery Allen M.D.' WHERE SURGEON = 'Anthony Owusu, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Amery Burton M.D.' WHERE SURGEON = 'Arnold Vardiman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Amir Copeland M.D.' WHERE SURGEON = 'Arthur Conley 604, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Amos Chandler M.D.' WHERE SURGEON = 'Arthur Conley 605, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Andrew Vega M.D.' WHERE SURGEON = 'Arthur Conley 606, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Anthony Alston M.D.' WHERE SURGEON = 'Arthur Conley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Aquila Chang M.D.' WHERE SURGEON = 'Asif Husain, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Aquila Dixon M.D.' WHERE SURGEON = 'Atilla Onan'
UPDATE case_report_3300 SET surgeon = 'Dr. Aquila Spears M.D.' WHERE SURGEON = 'Azmi Nasser, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Arden Glover M.D.' WHERE SURGEON = 'Baraa Al-Hafez, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Aristotle Hawkins M.D.' WHERE SURGEON = 'Barbara Lazio, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Armand Mclaughlin M.D.' WHERE SURGEON = 'Benjamin Martino, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Asher Beck M.D.' WHERE SURGEON = 'Bernie McHugh, Jr., M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Asher Bryant M.D.' WHERE SURGEON = 'Bernie, McHugh, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Asher Hartman M.D.' WHERE SURGEON = 'Blake Christensen, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ashton Lancaster M.D.' WHERE SURGEON = 'Blake Christensen, DO'
UPDATE case_report_3300 SET surgeon = 'Dr. Austin Mcclain M.D.' WHERE SURGEON = 'Bradford Bader, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Austin Morrison M.D.' WHERE SURGEON = 'Brent Adcox, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Axel Burch M.D.' WHERE SURGEON = 'Brent Jackson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Baker Blanchard M.D.' WHERE SURGEON = 'Brent Morgan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Barrett Martin M.D.' WHERE SURGEON = 'Brian Iuliano, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Barrett Rios M.D.' WHERE SURGEON = 'Brian Reece, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Barry Graves M.D.' WHERE SURGEON = 'Brian Snell, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Basil Meadows M.D.' WHERE SURGEON = 'Bridger Co, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Beck Keith M.D.' WHERE SURGEON = 'Bridger Cox, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Benedict Aguilar M.D.' WHERE SURGEON = 'Cameron Carmody, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Benedict Moss M.D.' WHERE SURGEON = 'Carl Bischoff, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Benjamin Burt M.D.' WHERE SURGEON = 'Carmelo Otero, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Benjamin Mcbride M.D.' WHERE SURGEON = 'Casey Taber, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Benjamin Turner M.D.' WHERE SURGEON = 'Chad McDuffie, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Bert Sloan M.D.' WHERE SURGEON = 'Charles Pipkin, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Blake Bolton M.D.' WHERE SURGEON = 'Cheng-Lun Soo, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Blaze Allison M.D.' WHERE SURGEON = 'Cherie Booth, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Boris Cochran M.D.' WHERE SURGEON = 'Chris Bogaev, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Boris Hubbard M.D.' WHERE SURGEON = 'Chris Lee, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brady Castro M.D.' WHERE SURGEON = 'Christian Balldin, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brady Lambert M.D.' WHERE SURGEON = 'Christopher Wolf, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Branden Carter M.D.' WHERE SURGEON = 'Clifford Solomon, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Branden Kerr M.D.' WHERE SURGEON = 'Craig Callewart, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Branden Leach M.D.' WHERE SURGEON = 'Craig Kemper MD'
UPDATE case_report_3300 SET surgeon = 'Dr. Branden Parsons M.D.' WHERE SURGEON = 'Craig Kemper, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brandon Burns M.D.' WHERE SURGEON = 'Craig Kuhns, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brent Gallagher M.D.' WHERE SURGEON = 'Curtis Mina, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brent Sykes M.D.' WHERE SURGEON = 'Dale Ehmer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brett Moore M.D.' WHERE SURGEON = 'Dan Eidman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brian Gaines M.D.' WHERE SURGEON = 'Dana Gibbs, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brock Reeves M.D.' WHERE SURGEON = 'Dani Bidros, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Brody Campos M.D.' WHERE SURGEON = 'Daniel Gutierrez, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Bruno Holt M.D.' WHERE SURGEON = 'Daniel Leeman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Bruno Mays M.D.' WHERE SURGEON = 'Daniel Peterson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Bruno Mcleod M.D.' WHERE SURGEON = 'David Book, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Bruno Vance M.D.' WHERE SURGEON = 'David Cavanaugh, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Bruno Wagner M.D.' WHERE SURGEON = 'David Cuellar, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Buckminster Ferguson M.D.' WHERE SURGEON = 'David Feuer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Buckminster Weber M.D.' WHERE SURGEON = 'David Gonzales, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Burton Mullins M.D.' WHERE SURGEON = 'David Masel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Cade Potter M.D.' WHERE SURGEON = 'David Roberts, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Caesar Bryant M.D.' WHERE SURGEON = 'David Rogers, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Caesar Erickson M.D.' WHERE SURGEON = 'Desh Sahni, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Caesar Hartman M.D.' WHERE SURGEON = 'Devinder Bhatia, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Caesar Hurst M.D.' WHERE SURGEON = 'Dharmesh Bhakta'
UPDATE case_report_3300 SET surgeon = 'Dr. Cain Knapp M.D.' WHERE SURGEON = 'Diana Wilson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Cairo Hart M.D.' WHERE SURGEON = 'Don Stoval, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Caldwell Foreman M.D.' WHERE SURGEON = 'Don Stovall, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Callum Delacruz M.D.' WHERE SURGEON = 'Donald Mackenzie, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Callum Gilbert M.D.' WHERE SURGEON = 'Dr Conn, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Callum Patrick M.D.' WHERE SURGEON = 'Dr. C Gilberto Brito, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carl Mcclure M.D.' WHERE SURGEON = 'Dustin Hayward, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carlos Roth M.D.' WHERE SURGEON = 'Dustin Ray, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carlos Snider M.D.' WHERE SURGEON = 'Ed Anderson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carson Hebert M.D.' WHERE SURGEON = 'Elijah Hothem, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carson Sexton M.D.' WHERE SURGEON = 'Elizabeth Magnabosco, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carson WatersSurgeon M.D.' WHERE SURGEON = 'Emeka Nwodim, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Carter Barrera M.D.' WHERE SURGEON = 'Eric Gioia, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Castor Fuentes M.D.' WHERE SURGEON = 'Eric Oberlander, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Chancellor Crawford M.D.' WHERE SURGEON = 'Eric Ray, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Chaney Roman M.D.' WHERE SURGEON = 'Eric Ritchie, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Channing Newton M.D.' WHERE SURGEON = 'Erik Gregorie, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ciaran Cohen M.D.' WHERE SURGEON = 'Eubulus Kerr, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ciaran Hyde M.D.' WHERE SURGEON = 'Ewen Tseng, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Clinton Key M.D.' WHERE SURGEON = 'Fadi Nasr, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Clinton Lambert M.D.' WHERE SURGEON = 'Farbod Malek, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Coby Owen M.D.' WHERE SURGEON = 'Francisco Batlle, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Coby Rollins M.D.' WHERE SURGEON = 'Francisco Soldevilla, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Coby Wilkinson M.D.' WHERE SURGEON = 'Frank Fichtel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colby Petersen M.D.' WHERE SURGEON = 'Frank Garcia, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colorado Duncan M.D.' WHERE SURGEON = 'Frank Kuwamura, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colorado Hart M.D.' WHERE SURGEON = 'Frederick Todd, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colt Anthony M.D.' WHERE SURGEON = 'Gareth Adams, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colt Kelly M.D.' WHERE SURGEON = 'Garrison Whitaker, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colt Schmidt M.D.' WHERE SURGEON = 'Genaro Gutierrez, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colt Stokes M.D.' WHERE SURGEON = 'George Galvan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colt Turner M.D.' WHERE SURGEON = 'George Kellis, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colton Brady M.D.' WHERE SURGEON = 'Gerald Franklin, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Colton Matthews M.D.' WHERE SURGEON = 'Gerardo Zavala II, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Conan Walter M.D.' WHERE SURGEON = 'Gilbert Meadows, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Craig Goodwin M.D.' WHERE SURGEON = 'Gordon Marshall, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Craig Shannon M.D.' WHERE SURGEON = 'Gordon Yee, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Curran Carney M.D.' WHERE SURGEON = 'Gregg Gurwitz, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Curran Petty M.D.' WHERE SURGEON = 'Gregory Yoshida, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Cyrus Espinoza M.D.' WHERE SURGEON = 'Gretchin Champion, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dalton Castro M.D.' WHERE SURGEON = 'Guy Fogel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dalton Riggs M.D.' WHERE SURGEON = 'Hari Tumu, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Damian Lane M.D.' WHERE SURGEON = 'Harvinder Bedi, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Damon Riddle M.D.' WHERE SURGEON = 'Henrick Mike-Mayer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dane Ford M.D.' WHERE SURGEON = 'Hongbo Liu, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dane Mccarty M.D.' WHERE SURGEON = 'Houman Saedi, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Daniel Blankenship M.D.' WHERE SURGEON = 'Hugh McPherson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Daniel Ross M.D.' WHERE SURGEON = 'Ian Reynolds, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Daniel Sullivan M.D.' WHERE SURGEON = 'Ian Whitney, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Daquan Copeland M.D.' WHERE SURGEON = 'Ioannis Avramis, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Daquan Rollins M.D.' WHERE SURGEON = 'Irvin K Sahni, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Darius Garza M.D.' WHERE SURGEON = 'Ishaq Syed, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Darius Guerra M.D.' WHERE SURGEON = 'Issada Thongtrangan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Darius Owen M.D.' WHERE SURGEON = 'Jacob Rosenstein, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. David Alston M.D.' WHERE SURGEON = 'Jamal Taha, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. David Mullins M.D.' WHERE SURGEON = 'James Elbaor, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Davis Eaton M.D.' WHERE SURGEON = 'James Go, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Davis Gibbs M.D.' WHERE SURGEON = 'James Hamada, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Davis Vargas M.D.' WHERE SURGEON = 'James Loddengaard, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Deacon Gates M.D.' WHERE SURGEON = 'James Odor, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dennis Austin M.D.' WHERE SURGEON = 'James Rindler'
UPDATE case_report_3300 SET surgeon = 'Dr. Dennis Rosales M.D.' WHERE SURGEON = 'James Simmons Jr,MD'
UPDATE case_report_3300 SET surgeon = 'Dr. Denton William M.D.' WHERE SURGEON = 'James Simmons, III, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Derek Bates M.D.' WHERE SURGEON = 'James Simmons, Jr., M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Derek Tyson M.D.' WHERE SURGEON = 'James Smith, Jr., M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Devin Wyatt M.D.' WHERE SURGEON = 'James Waldron, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dexter Carrillo M.D.' WHERE SURGEON = 'Janmeet ''Rocky'' Sahota, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dexter Garrett M.D.' WHERE SURGEON = 'Jason Highsmith, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dexter Holden M.D.' WHERE SURGEON = 'Jason Taub, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dillon Hooper M.D.' WHERE SURGEON = 'Jean Louis Benae, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dillon Rosario M.D.' WHERE SURGEON = 'Jeff Phelps, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dillon Walter M.D.' WHERE SURGEON = 'Jeffrey Counts, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dolan Ball M.D.' WHERE SURGEON = 'Jeffrey Dean, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dolan Levine M.D.' WHERE SURGEON = 'Jeffrey Lue, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dominic Velez M.D.' WHERE SURGEON = 'Jeffrey Wingate, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Donovan Jacobs M.D.' WHERE SURGEON = 'Jeremy Denning, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Donovan Oneill M.D.' WHERE SURGEON = 'Jeremy Wang, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Drew Manning M.D.' WHERE SURGEON = 'Jerjis Denno, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Drew Mcclure M.D.' WHERE SURGEON = 'Jerry Gutierrez, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Drew Ross M.D.' WHERE SURGEON = 'Jesse Delee, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dustin Berry M.D.' WHERE SURGEON = 'Jim Melton, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dustin Morgan M.D.' WHERE SURGEON = 'Jimmy Conway, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Dylan Giles M.D.' WHERE SURGEON = 'Joe Ho, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Eagan Rich M.D.' WHERE SURGEON = 'Joel Jenne'
UPDATE case_report_3300 SET surgeon = 'Dr. Edward Bradshaw M.D.' WHERE SURGEON = 'John Doski, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Edward Malone M.D.' WHERE SURGEON = 'John Edwards, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Edward Moore M.D.' WHERE SURGEON = 'John Evans, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Elijah Moran M.D.' WHERE SURGEON = 'John Frederick, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Elliott Johns M.D.' WHERE SURGEON = 'John Friedland, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Elvis Glass M.D.' WHERE SURGEON = 'John Park, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Emerson Cabrera M.D.' WHERE SURGEON = 'John Tenny, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Emery Shaw M.D.' WHERE SURGEON = 'John Wyatt, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Emmanuel Mack M.D.' WHERE SURGEON = 'Jon Krumerman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Erasmus Hurst M.D.' WHERE SURGEON = 'Jon Paley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Erich Dale M.D.' WHERE SURGEON = 'Jonathan Duncan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Erich Ortiz M.D.' WHERE SURGEON = 'Jonathan Fontenot, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ethan House M.D.' WHERE SURGEON = 'Jorge Alvernia, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Evan Manning M.D.' WHERE SURGEON = 'Jose Barrera, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Evan Mckinney M.D.' WHERE SURGEON = 'Jose Bermudez, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Evan Whitley M.D.' WHERE SURGEON = 'Jose Ferrer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ezekiel Jackson M.D.' WHERE SURGEON = 'Jose Rodriguez, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ezekiel Sellers M.D.' WHERE SURGEON = 'Joseph Tejan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ezra Chapman M.D.' WHERE SURGEON = 'Joseph Wyatt, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ferdinand Cotton M.D.' WHERE SURGEON = 'Joshua James, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Finn Haley M.D.' WHERE SURGEON = 'Joshua Levy, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Finn Solis M.D.' WHERE SURGEON = 'Josue Gabriel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Flynn Neal M.D.' WHERE SURGEON = 'Jr.Gerald Greenfield, M.D'
UPDATE case_report_3300 SET surgeon = 'Dr. Flynn Stone M.D.' WHERE SURGEON = 'Jr.Gerald Greenfield, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Forrest Perez M.D.' WHERE SURGEON = 'Juan Martin, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Francis Hood M.D.' WHERE SURGEON = 'Judith Thompson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Francis Tate M.D.' WHERE SURGEON = 'Julio Calderin, MD'
UPDATE case_report_3300 SET surgeon = 'Dr. Fritz Chaney M.D.' WHERE SURGEON = 'Kamal Morar, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Fritz Dunlap M.D.' WHERE SURGEON = 'Karl Vega, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Fulton Mckinney M.D.' WHERE SURGEON = 'Katrina Chaung, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gabriel Sellers M.D.' WHERE SURGEON = 'Keith Matheny, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gage Martin M.D.' WHERE SURGEON = 'Keith Norvill, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gage Wynn M.D.' WHERE SURGEON = 'Keith Preston, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Galvin Buckner M.D.' WHERE SURGEON = 'Kelsey Shay, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gannon Mosley M.D.' WHERE SURGEON = 'Kendall Carll, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gareth Clarke M.D.' WHERE SURGEON = 'Kendrick Thomas, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Garrison James M.D.' WHERE SURGEON = 'Kenneth Hsu, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gary Perry M.D.' WHERE SURGEON = 'Kenneth Madsen, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gary Stephenson M.D.' WHERE SURGEON = 'Kenney Carter, Jr, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Geoffrey Quinn M.D.' WHERE SURGEON = 'Kevin James, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Giacomo Kent M.D.' WHERE SURGEON = 'Kevin James, M.D. - Andaz'
UPDATE case_report_3300 SET surgeon = 'Dr. Grady Hendricks M.D.' WHERE SURGEON = 'Kevin Kaufman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Grady Kramer M.D.' WHERE SURGEON = 'Kevin McCarthy, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Grady Lawson M.D.' WHERE SURGEON = 'Kevin Richardson, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Graham Lindsey M.D.' WHERE SURGEON = 'Kim Rickert, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Graham Odom M.D.' WHERE SURGEON = 'Kimberly Terry, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Graham Randall M.D.' WHERE SURGEON = 'Lance Jackson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Graiden Little M.D.' WHERE SURGEON = 'Lance Smith, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Grant Brennan M.D.' WHERE SURGEON = 'Lance Tigyer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Gregory Foreman M.D.' WHERE SURGEON = 'Larry Kjeldgaard, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Griffin Hewitt M.D.' WHERE SURGEON = 'Laudislau Albert Jr, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Griffith Ramos M.D.' WHERE SURGEON = 'Laura Kissell, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hakeem Blackburn M.D.' WHERE SURGEON = 'Lav Kapadia, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hamilton Cantrell M.D.' WHERE SURGEON = 'Lenny Stubbs, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hamish Harding M.D.' WHERE SURGEON = 'Lewis Frazier, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hammett Bradshaw M.D.' WHERE SURGEON = 'Li Poa, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Harding Joseph M.D.' WHERE SURGEON = 'M Holland, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Harlan Best M.D.' WHERE SURGEON = 'Magdiel Trinidad, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hasad Cervantes M.D.' WHERE SURGEON = 'Maged Mina, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hasad Winters M.D.' WHERE SURGEON = 'Manish Patel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hayden Ward M.D.' WHERE SURGEON = 'Marc Letellier, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hayes Haynes M.D.' WHERE SURGEON = 'Marcella Madera, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hayes Orr M.D.' WHERE SURGEON = 'Mark Burnett, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hector York M.D.' WHERE SURGEON = 'Mark Grubb, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hedley Arnold M.D.' WHERE SURGEON = 'Mark Segal, M.D'
UPDATE case_report_3300 SET surgeon = 'Dr. Hedley Barron M.D.' WHERE SURGEON = 'Mark Silver, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hedley Dunlap M.D.' WHERE SURGEON = 'Mark Valente, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hedley Harrison M.D.' WHERE SURGEON = 'Marshall Cain, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Henry Cruz M.D.' WHERE SURGEON = 'Martha Wills, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Henry Woods M.D.' WHERE SURGEON = 'Martin Holland, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hiram Hall M.D.' WHERE SURGEON = 'Matt Dumigan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Holmes Collier M.D.' WHERE SURGEON = 'Matthew Hummell, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Holmes Peters M.D.' WHERE SURGEON = 'Matthew Morrey, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Honorato Lindsay M.D.' WHERE SURGEON = 'Matthew Quigley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hop Armstrong M.D.' WHERE SURGEON = 'Matthew Stanfield, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hop Jefferson M.D.' WHERE SURGEON = 'Melanie Kinchen, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hop Valentine M.D.' WHERE SURGEON = 'Melvin Wahl Jr., M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hyatt Mcintyre M.D.' WHERE SURGEON = 'Melvin Wahl, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Hyatt Mckee M.D.' WHERE SURGEON = 'Micam Tullous, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ian Mosley M.D.' WHERE SURGEON = 'Michael David Dennis, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ian Newton M.D.' WHERE SURGEON = 'Michael Desaloms, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ignatius Rodriguez M.D.' WHERE SURGEON = 'Michael Hahn, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Isaac Perry M.D.' WHERE SURGEON = 'Michael Hennessy, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Isaiah Foreman M.D.' WHERE SURGEON = 'Michael Leonard, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Isaiah Porter M.D.' WHERE SURGEON = 'Michael McKee'
UPDATE case_report_3300 SET surgeon = 'Dr. Isaiah Turner M.D.' WHERE SURGEON = 'Michael Moghimi, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Ishmael Cunningham M.D.' WHERE SURGEON = 'Michael Moghimi, MD'
UPDATE case_report_3300 SET surgeon = 'Dr. Ivor Ramsey M.D.' WHERE SURGEON = 'Michael Riggs, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jack Long M.D.' WHERE SURGEON = 'Michael Rimlawi, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jack Sosa M.D.' WHERE SURGEON = 'Mike Tyler, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jackson Black M.D.' WHERE SURGEON = 'Mirza Baig, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jackson Wheeler M.D.' WHERE SURGEON = 'Mustasim Rumi, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jakeem Good M.D.' WHERE SURGEON = 'Narasimha Jatavallabhula'
UPDATE case_report_3300 SET surgeon = 'Dr. Jamal Aguilar M.D.' WHERE SURGEON = 'Natalie Weger, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jamal Bridges M.D.' WHERE SURGEON = 'Naveen Kella, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. James Pearson M.D.' WHERE SURGEON = 'Navin Subramanian, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jared Jenkins M.D.' WHERE SURGEON = 'Neal Haynes, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jared Mccray M.D.' WHERE SURGEON = 'Neelesh Mehendale, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jarrod Gonzales M.D.' WHERE SURGEON = 'Neleesh Mehendale, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jeremy Hale M.D.' WHERE SURGEON = 'Nicholas Peiffer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jermaine Benton M.D.' WHERE SURGEON = 'Nilesh Kotecha, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jerome Brooks M.D.' WHERE SURGEON = 'Nimish Patel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jerry Silva M.D.' WHERE SURGEON = 'Okay Onan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jesse Gallegos M.D.' WHERE SURGEON = 'Pablo Vazquez-Seoane'
UPDATE case_report_3300 SET surgeon = 'Dr. Jesse Winters M.D.' WHERE SURGEON = 'Pablo Vazquez-Seoane, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Joel Baker M.D.' WHERE SURGEON = 'Pantelis Hadjizacharia, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jonah Mccullough M.D.' WHERE SURGEON = 'Patricia Mancuso, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jonas Barton M.D.' WHERE SURGEON = 'Patrick Cindrich'
UPDATE case_report_3300 SET surgeon = 'Dr. Jonas Castaneda M.D.' WHERE SURGEON = 'Patrick Rudersdorf, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Jordan Preston M.D.' WHERE SURGEON = 'Paul Boone, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Joshua Ashley M.D.' WHERE SURGEON = 'Paul Geibel, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Joshua Cain M.D.' WHERE SURGEON = 'Paul Vaughan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Joshua Mayer M.D.' WHERE SURGEON = 'Paymaun Lotfi, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Judah Morin M.D.' WHERE SURGEON = 'Pedro Loredo, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Julian Oneill M.D.' WHERE SURGEON = 'Peter Campbell, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Justin Kirby M.D.' WHERE SURGEON = 'Pierce Nunley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kadeem Woods M.D.' WHERE SURGEON = 'Presley Mock, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kamal Britt M.D.' WHERE SURGEON = 'Rafael Parra, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kamal Macias M.D.' WHERE SURGEON = 'Rajesh Bindal, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kaseem Finch M.D.' WHERE SURGEON = 'Ralph Garza, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kato Tanner M.D.' WHERE SURGEON = 'Ram Vasudevan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Keefe Bean M.D.' WHERE SURGEON = 'Randall Dryer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Keefe Burke M.D.' WHERE SURGEON = 'Randy Davis, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kelly Brooks M.D.' WHERE SURGEON = 'Raymond Lilly, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kelly Rodriquez M.D.' WHERE SURGEON = 'Rebecca Stachniak, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kelly Wells M.D.' WHERE SURGEON = 'Rene Pena, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kenneth French M.D.' WHERE SURGEON = 'Riad Adoumie, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kermit Rivera M.D.' WHERE SURGEON = 'Richard Burg, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kevin Aguirre M.D.' WHERE SURGEON = 'Richard Jackson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kibo Dawson M.D.' WHERE SURGEON = 'Richard Marks, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kibo Mullins M.D.' WHERE SURGEON = 'Richard Rooney, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kibo Parker M.D.' WHERE SURGEON = 'Richard Thrasher, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kibo Shelton M.D.' WHERE SURGEON = 'Richard Westmark, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kirk Hopper M.D.' WHERE SURGEON = 'Richard Wohns, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Knox Avila M.D.' WHERE SURGEON = 'Richard Wupperman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kuame Cantu M.D.' WHERE SURGEON = 'Robert Henderson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kyle Gamble M.D.' WHERE SURGEON = 'Robert Josey, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Kyle Jones M.D.' WHERE SURGEON = 'Robert Remondino, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Laith Espinoza M.D.' WHERE SURGEON = 'Robert Spicer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Laith Mcmahon M.D.' WHERE SURGEON = 'Robert Thomas, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lamar Harding M.D.' WHERE SURGEON = 'Robert Tibbs, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lamar Hill M.D.' WHERE SURGEON = 'Robert Urrea, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lance Beard M.D.' WHERE SURGEON = 'Robert Viere, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lance Robbins M.D.' WHERE SURGEON = 'Robert Wienecke, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lance Wolf M.D.' WHERE SURGEON = 'Roman Litwinski, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lance Wolfe M.D.' WHERE SURGEON = 'Ronald Magee, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lars Flynn M.D.' WHERE SURGEON = 'Russell Briggs, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lars Roberson M.D.' WHERE SURGEON = 'Ruth Thiex, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lars Stafford M.D.' WHERE SURGEON = 'Ryan Halpin, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lars Vance M.D.' WHERE SURGEON = 'Ryan Nelson, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lee RaySurgeon M.D.' WHERE SURGEON = 'Sabino D''Agostino, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Leo Solis M.D.' WHERE SURGEON = 'Saeid Aryan, D.O.'
UPDATE case_report_3300 SET surgeon = 'Dr. Leroy Jensen M.D.' WHERE SURGEON = 'Samir Parikh, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Leroy Mejia M.D.' WHERE SURGEON = 'Sanjay Misra, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lev Hunter M.D.' WHERE SURGEON = 'Saqib Siddiqui, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Lewis Gray M.D.' WHERE SURGEON = 'Scott Farley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Linus Hyde M.D.' WHERE SURGEON = 'Sean Jones-Quaidoo, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Logan Booth M.D.' WHERE SURGEON = 'Sekinat McCormick, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Logan Combs M.D.' WHERE SURGEON = 'Shah N. Siddiqi,MD'
UPDATE case_report_3300 SET surgeon = 'Dr. Lucius Oneill M.D.' WHERE SURGEON = 'Shah Siddiqui, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Luke Hart M.D.' WHERE SURGEON = 'Shamim Badiyan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Luke Moody M.D.' WHERE SURGEON = 'Shane Pahlavan, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Macaulay Booth M.D.' WHERE SURGEON = 'Shawn Funk, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Macaulay Sanders M.D.' WHERE SURGEON = 'Shiela Smitherman, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Macon Olsen M.D.' WHERE SURGEON = 'Shiveindra Jeyamohan'
UPDATE case_report_3300 SET surgeon = 'Dr. Macon Warner M.D.' WHERE SURGEON = 'Shon Cook, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Macon Willis M.D.' WHERE SURGEON = 'Stanley Jones, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Magee Mcdowell M.D.' WHERE SURGEON = 'Stephen Courtney, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Mannix Vaughn M.D.' WHERE SURGEON = 'Stephen Earle, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Mark Fischer M.D.' WHERE SURGEON = 'Stephen Neece, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Mark Johns M.D.' WHERE SURGEON = 'Steven Cyr, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Marsden Gutierrez M.D.' WHERE SURGEON = 'Steven Remer, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Martin Aguilar M.D.' WHERE SURGEON = 'Stuart Thomas, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Martin Howell M.D.' WHERE SURGEON = 'Stuart Weil, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Marvin Higgins M.D.' WHERE SURGEON = 'T Wigley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Marvin Rich M.D.' WHERE SURGEON = 'Theodore Spinks, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Mason Hoover M.D.' WHERE SURGEON = 'Thomas Crepps, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Mason Nichols M.D.' WHERE SURGEON = 'Thomas Jones, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Maxwell Spears M.D.' WHERE SURGEON = 'Thomas Loftus, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Melvin Wise M.D.' WHERE SURGEON = 'Thomas Raley, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Merrill Kirby M.D.' WHERE SURGEON = 'Tiffany Rogers, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Michael Trujillo M.D.' WHERE SURGEON = 'Todd Lansford, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Moses Fletcher M.D.' WHERE SURGEON = 'Tom Chow, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Myles Reilly M.D.' WHERE SURGEON = 'Trent Tredway, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nasim Rush M.D.' WHERE SURGEON = 'Vidhya Subramanian, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nathan Bailey M.D.' WHERE SURGEON = 'Vivek Kushwaha, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nathan Conway M.D.' WHERE SURGEON = 'Vudhi Slabisak, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nathan Huffman M.D.' WHERE SURGEON = 'Warren Neely, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nathan Mooney M.D.' WHERE SURGEON = 'William Koeck, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nehru Cote M.D.' WHERE SURGEON = 'William Tally, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Neil Clayton M.D.' WHERE SURGEON = 'William Tisdall, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nero Cooper M.D.' WHERE SURGEON = 'William Wilson, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Neville Leblanc M.D.' WHERE SURGEON = 'Winston Fong, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nicholas Mann M.D.' WHERE SURGEON = 'Yoshihiro Yamamoto, M.D.'
UPDATE case_report_3300 SET surgeon = 'Dr. Nigel Logan M.D.' WHERE SURGEON = 'Zachary Garza, M.D.'

-- 4/21/17
select pid, dos, hospital, billstatustech, * from vwMaster2 where hospital = 'University of Maryland Baltimore Washington Medical Center' and billstatustech  not like '%future%'

select pid,dos,surgeon,[claim date], region_short_name, correctentity, * from vwmaster2 where pid = 576929
select * from insurancelookup
select * from surgeonlookup2 where surgeon = 'Adam Bruggeman, M.D.'

select * from vwmaster2

Select BillingCompany from readerfees as rf where rf.readername = CR.Reader and rf.[1st Insurance Category] = CR.[1st Insurance Category] and CR.DOS >= startdate and CR.DOS <= enddate) <> 'ABS' THEN 'Unbillable'	
select  readername, [1st Insurance Category], count(*) from readerfees group by readername, [1st Insurance Category] having count(*) > 1
  -- > reader, 1st Insurance Category, StartDate/EndDate

select readername, [1st Insurance Category], startdate, enddate 
		from readerfees 
		where readername = 'Erin Phillips, M.D.' and [1st Insurance Category]  = 'Blue Cross Blue Shield'


select pid, hospital, billstatustech from vwmaster2 where hospital like '%HonorHealth%' or hospital like '%scottsdale shea%'
select *  from vwcases where OnCall_Time_TZAdjusted = ''
select distinct OnCall_Time_TZAdjusted  from vwcases 
select pid, dos, readerTimeZone, hospitalTimeZone, pro_time_end, oncall_time, Oncall_time_TZAdjusted from vwcases where pid = 654361
select * from vwmaster2 where correctentity like '%neuropl%'

-- 4/10/17

select distinct(current_zone) from hospitals_3300
select * from hospitals_3300 where current_zone is null
select distinct (timezone) from readers
select * from readers

select count(*) from vwcases
select distinct current_zone,timezone, oncall_time_TZAdjusted from vwcases2 where OnCall_Time_TZAdjusted = '' and current_zone is not null and timezone is not null and timezone <>'' order by current_zone, timezone 

-- 3/30/2017
select * from vwPADenialsOverturnedDetail

--3/28/2017

select * from vwmaster2

select * from surgeonlookup2

CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO 


select distinct surgeon,  region_short_name as region from vwcases where DOS > '2016-01-01'

select * from vwCases where PID in (419450, 422789, 423950, 439321, 436015, 440225, 442618, 445793, 447785, 447298)
select * from vwMaster2 where PID in (419450, 422789, 423950, 439321, 436015, 440225, 442618, 445793, 447785, 447298)

-- 3/17/2017
select * from vwcases where DOS > '2016-01-01'
select * from vwhospitalBillings where PID in (36787, 38739)

select * from vwmaster2

-- 3/16/2017

select correctentity, surgeon, [Insurance Type], * from vwmaster2 where surgeon = 'Dr. C Gilberto Brito, M.D.' and [Insurance Type] = 'Blue Cross Blue Shield'
select * from surgeonlookup2 where surgeon like '%brito%'

select * from view_DashEntityTotalCaseVolume

select * from vwmaster2 where PID = 652556
select * from vwBillableCasesCalculation where PID = 652556

select * from view_payerMix where Defaultentity like '%grand canyon%' and dos > '2017-03-01'
select * from vwcases where defaultentity like '%grand canyon%' and dos > '2017-03-01'

-- 3/8/2017
select PID, DOS, [1st Insurance Category], billablestatus from vwbillablecasescalculation where [1st Insurance Category] like '%federal%'
select * from agenthistory2

select * from vwpamaster
select * from vwmaster2

-- 3/7/2017

select * from surgeonlookup2

select * from surgeonlookup2 where payor like '%*ANY%%'

update surgeonlookup2 set Payor = '* ANY *' where payor like '%*ANY%%'

spEmailUnmatchedReaders

SELECT * from surgeonlookup2 where surgeon like '%bidros%'
select * from vwcases where specialty like '%unknown%' and dos > '2016-01-01' and surgeon like '%bidros%'
select * from vwmaster2 where surgeon like '%bidros%'

select * from case_report_3300 
					LEFT OUTER JOIN
						dbo.surgeonlookup2 sl1 on dbo.case_report_3300.surgeon = sl1.surgeon 
								and dbo.case_report_3300.dos >= sl1.startdate  
								and dbo.case_report_3300.dos <= sl1.enddate
								and sl1.region = Region_Short_Name
								and sl1.payor = '* ANY *'
where case_report_3300.surgeon = 'Dani Bidros, M.D.'

select * from surgeonlookup2 where surgeon = 'Dani Bidros, M.D.' 
					and  '2017-01-27'  >= startdate 
					AND '2017-01-27' <= enddate
					AND region = 'Louisiana'
					AND Payor = '* ANY *'
				select case WHEN '2017-01-27' > = '2014-09-01' Then 'Yes' ELse 'No' End As Test
update surgeonlookup2 set startdate = '2014-09-01' where surgeonid = 785

select * from vwPAMisbilledClaims
select * from patient_insurance_charges_3350



				






select *,len(region), len(surgeon) from surgeonlookup2
select len(region_short_name), len(surgeon), * from case_report_3300 where surgeon = 'Dani Bidros, M.D.'

-- 3/3/2017
select * from vwunmatchedSurgeonReport
select * from vwInsuranceDeposits where entity like '%garuda%' and date_collected >= '2017-02-01' and date_collected < '2017-03-01' order by date_collected desc

sp_helpserver

DBCC FREEPROCCACHE WITH NO_INFOMSGS 

-- 3/2/17

select * from vwHospitalBillingsStatus where PID = 576720


select * from vwHospitalBillings where PID = 567992

select * from vwHospitalBillings where invoice_amount = PaidAmount and balance <>0

select * from invoice_history_3300 where invoice_amount = amt_recieved and balance <>0

select * from patient_insurance_charges_3300 where PID = 521465
select * from vwIOMEntityAging where patient_ID = 521465
select * from vwIOMEntityAgingbyDOS where patient_ID = 521465

select * from agenthistory2

select top 100 * from history_3300

select -datediff(day, getdate(),'2017-01-23')

select * from Insurance_Deposits_3300 where patient_id = 521465

select * from surgeonlookup2 where surgeon = 'Mirza Baig, M.D.'


-- 2/27/17

select * from vwValidationCheckUnmatchedReaders
select * from readers

select * from agenthistory2 where agent like '%Ridout%'

select * from insurancelookup
select * from vwmaster2 where [primary insurance] = 'Loyola Health'
select * from vwcases  where [primary insurance] = 'Loyola Health'
--2/23/17

select distinct agent from PAAgentHistory

-- 2/20/17
select * from vwmaster2
select * from patient_deduct_3300
select * from patient_insurance_charges_3300
select * from claim_charges_3300
select * from claim_entity_3300
select * from claim_det_33300
select * from case_report_3300

select * from vwPatientIndicies

select * from vwIOMEntityAgingbyDOS where claim_seq = 766256

-- 2/17/17

select * from vwpamaster where surgeon like '%josue%'

select correctentity, defaultentity, pid, claim_id from vwmaster2 where claim_id = 779334
select pid, defaultentity, correctproentity from vwcases where pid = 624536
--

select * from vwPACPTCollectionDetail
select * from collect_detail_3300

-- 2/8/17

select * from vwInsuranceDeposits group by 

USE master;  
GO  
EXEC sp_addlinkedserver   
   N'72.52.135.204',  
   N'SQL Server';  
GO  

EXEC sp_addlinkedsrvlogin '72.52.135.204', 'false',null , 'south_texas', 'S01th#24Pas@Us12on'; 

sp_helpserver

use [USMON_Local]
spRefreshData


-- 2/6/17

select top 100 * from vwmaster2 where [2017 PYMT] is not null

select * from agenthistory2
select * from agents

select * from vwunbilledTechClaims where pid = 414624
select * from vwmaster2 where pid = 414624

-- 2/3/17
select * from vwCases where PID in (614919,616407,614910,631138)

select * from surgeonlookup2 where surgeon like '%nunley%'

select * from surgeonlookup2 where region = 'ALL'

select * from 

select * from vwCases

select * from vwHospitalBillings 

select * from vwHospitalBillingsStatus where dos > '2012-01-01'

select * from hospitals_3300




select count(*) from [dbo].[hosp_credentials_users_3300]
select count(*) from [dbo].[assigned_auditor_techs_users_3300]
select count(*) from [dbo].[im_users_3300]
select count(*) from [dbo].[li_users_3300]
select count(*) from [dbo].[re_users_3300]
select count(*) from [dbo].[t_users_3300]

select * from [dbo].[hosp_credentials_users_3300]
select * from [dbo].[assigned_auditor_techs_users_3300]
select * from [dbo].[im_users_3300]
select * from [dbo].[li_users_3300]
select * from [dbo].[re_users_3300]
select * from [dbo].[t_users_3300]


select * from insurancelookup where 

select * from vwCollectionSummary

-- 1/30/17
select * from users_3300 where last_name like '%white%' or last_name like '%mcdonald%' or last_name like '%Finney%'


-- 1/26/17

select PID, DOS, claim_id, clm_billing_type from vwmaster2 where claim_id in (707365,701603) 
-- 1/24/17
select * from hospitals_3300



select * from vwhospitalbillings where contracttype = 'exp' and hospital 

select * from vwCPTCollectionDetail where denialcode  like '%OTA%'

Select count(*) from vwmaster2

select * from vwDenialsOverturnedDetail

-- 1/13/17

select * from vwValidationCheckUnMatchedSurgeons
select * from surgeonlookup2 where surgeon like '%kinchen%'
select * from vwcases where surgeon like '%kinchen%' 

-- 1/9/17
--		#1451
select * from hospitals_3300 
select pid, dos, hospital, surgeon, isbillablesupplies from vwhospitalbillings where pid in (547713, 547698)
select * from supplies_track_3300 where pid in (547713, 547698)
-- 1/4/17
select cast(dos as smalldatetime), * from vwHospitalTechBillingValidation

--1/3/17

select * from vwcases where aud_days_to_sign_off is not null

select * from vwmaster2 where surgeon like '%yeh%'

select * from dbo.hospitals_3300 where hospital like '%cypress point%'

select  distinct field_changed from history_3300 order by field_changed

alter view vwLatePatientInsuranceChanges as 
select distinct patient_id, dos, convert_unhook_time, CAST(date_changed AS datetime2(0)) as date_changed, cuser_name, tech, hospital, [1st Insurance Category] from history_3300 
LEFT OUTER JOIN case_report_3300 on history_3300.patient_id = case_report_3300.pid
where field_changed = 'Insurance Type' 
and date_changed > (cast(case_report_3300.dos as datetime) + cast(case_report_3300.convert_hookup_time as datetime))
order by dos desc

select * from vwLatePatientInsuranceChanges where patient_id = 447334

select * from readerfees

select *, DATEDIFF(DAY,  DATEADD(day, -1, invoice_date), GETDATE()), DATEDIFF(DAY,  DATEADD(day, -1, originalclaimdate), GETDATE())
 from vwhospitaltechbillingvalidation 
 where DATEDIFF(DAY,  DATEADD(day, -1, invoice_date), GETDATE()) < 7
 or DATEDIFF(DAY,  DATEADD(day, -1, originalclaimdate), GETDATE()) < 7

 spEmailHospitalTechBillingValidation

select * from hospitals_3300
select * from hosp_ins_3000

-- old 2016
select * from vwtechproductivity where techname like '%prenkert%' and dos_wk = 49
select * from vwtechproductivity_Secondarytech where techname like '%prenkert%' and dos_wk=49
select * from vwtechproductivityCombined where tech like '%prenkert%' and dos_wk = 49

select * from techregionlookup where tech like '%prenkert%'
select * from vwcases where tech like '%prenkert%' and dos >= '2016-11-27' and dos <= '2016-12-03'

select * from surgeonlookup2 where surgeon like '%kinchen%'

select * from vwValidationCheckUnMatchedSurgeons

select distinct [consolidated payor] from vwCases order by [consolidated payor]
select distinct [primary insurance], [consolidated payor] from vwcases where [primary insurance] like '%replacement%'
select distinct [1st Insurance Category] from vwcases


select top 100 *  from vwmaster2


select * from vwHospitalTechBillingValidation

-- 12/20/16
select correctentity, claim_id, * from vwmaster2 where surgeon like '%parikh%' and [Insurance Type] = 'BLUE CROSS BLUE SHIELD' order by dos desc
select correctentity, claim_id, * from vwmaster2 where claim_id = 367261
select * from vwcases where surgeon like '%parikh%'

select * from techregionlookup

--12/14/16
select * from supplies_track_3300
select distinct dos, pid, hospital, is_IOM_Supply_Item from supplies_track_3300
select * from vwHospitalBillings where isbillablesupplies = 'No'
select * from hospitals_3300 where hospital = 'CHRISTUS Santa Rosa Hospital - Westover Hills'
--#1384
select * from vwCPTCollectionDetail where claim_id=265861 and proc_code=95870 and collected_date = '2016-10-03'

select * from denialcodelookup where auth = 'OTH'
select * from entitylookup 

select * from collect_detail_3300 where claim_seq = 265861 and proc_code=95870 and collected_date = '2016-10-03'

--RAW TABLE = Collection_detail_3300 

	select * from collect_detail_3300 where claim_seq = 265861 and proc_code=95870
	select * from dbo.claim_entity_3300 where claim_seq = 265861
	SELECT * FROM  dbo.case_report_3300 where pid = 114741
	SELECT * FROM dbo.claim_det_33300 where claim_id = 265861

	SELECT * from  dbo.claim_charges_3300 where claim_seq = 265861
													AND proc_code = 95870
	
	
	select * from  dbo.patient_insurance_charges_3300 where claim_id = 265861
	select * from  dbo.InsuranceLookup AS IL where  IL.InsuranceCompany = 'Aetna'
	select * from dbo.EntityLookup AS EL where EL.client_name = 'GSGNM, PLLC'
	select * from dbo.vwHL7_Raw AS HL7 where HL7.patient_id = 114741 
	select * from dbo.denialcodelookup as DCL where auth = 'OTH'



--12/13/16
select * from vwmaster2 where hospital =  'McBride Clinic Orthopedic Hospital' and [Primary Insurance] like '%kempton%'
select * from vwcases where hospital =  'McBride Clinic Orthopedic Hospital' and [Primary Insurance] like '%kempton%'
select * from vwcases
set datefirst 1

-- 12/8/16
select * from vwcases where holidaypay = 'Yes'

select * from view_payermix where defaultentity like '%gateway%'

-- 12/7/16

select * from vwmaster2 where correctentity like '%microfu%'
select * from vwBillingQueueVIP



select * from vwmaster2 where surgeon like '%krum%'

SELECT SL1.proentity, * from       dbo.case_report_3300 AS CR 
			LEFT OUTER JOIN dbo.SurgeonLookup2 AS SL1 ON CR.Surgeon = SL1.Surgeon 
						AND CR.DOS >= SL1.StartDate 
						AND CR.DOS <= SL1.EndDate 
						AND CR.Region_Short_Name = SL1.Region
						AND SL1.Payor = '* ANY *'
		where cR.surgeon like '%krum%'

select * from surgeonlookup2 as sl1 where sl1.surgeon  = 'Jon Krumerman, M.D.'
						AND '2016-11-02' >= SL1.StartDate 
						AND '2016-11-02' <= SL1.EndDate 
						AND SL1.Region = 'Texas - DFW'
						'Texas - DFW'
-- 12/1/16
select pid, dos, claim_id, clm_billing_type, ins_collcted, ins_charged, ins_writte_off, [claim Date], [total collection], [Balance] from vwMaster2 where pid = 541924

-- 11/30/16
select * from surgeonlookup2 where surgeon like '%Vasudevan%'
select pid, dos, surgeon, [primary insurance], defaultentity,correctentity, box33 from vwmaster2 where surgeon like '%Vasudevan%' and [insurance type] = 'Blue Cross Blue Shield' order by dos

select * from vwBillableCasesCalculation where tech like '%olson%'
-- 11/29/16
select * from vwValidationCheckCurrentCaseEntitiesWithoutPayroll
select * from vwpayrollentities
spEmailCurrentMonthEntitiesWithoutPayroll

select * from insurancelookup where insurancecompany like '%DRISCOLL%'

select * from vwcases where pid = 576419

select * from DenialCodelookup

select * from vwCPTCollectionDetail where comment is not null
select * from vwPACPTCollectionDetail
select * from vwMaster2 where entity like '%In-Site%' and [surgeon ownd] = 'Yes'
select * from readers

select * from entitylookup where client_name = 'In-Site Surgical Monitoring Services'
update entitylookup set [S#C] = 'No' where client_name = 'In-Site Surgical Monitoring Services'
select * from entitylookup where [S#C] is null
select * from vwWeeklyCaseVolumeByEntity
select * from vwBillingClaimsByEntity

-- 11/22/16
-- Ticket #1274
select * from vwContractInsuranceMatrix where hospital like '%surgcenter of westover%'
select * from  dbo.hospitals_3300 where hospital like 'SurgCenter%' --and invoice_hosp_by_insurance_type = 1
select * from dbo.hosp_ins_3000 where hospital_id = 1804
-- 11/21/16
select * from vwmaster2 where surgeon like '%kellis%'
select * from vwmaster2 where surgeon like '%indresano%'
select * from surgeonlookup2 where proentity like '%AINeurology%'
-- 11/17/16
select * from surgeonlookup2 where surgeon like '%carl%'

--11/16/16
select * from vwPAMaster where claim_id = 715321
select * from vwPAcases where pid = 715321
select * from dbo.case_report_3350 where pid = 715321

-- 11/14/16

select * from vwPACPTCollectionDetail
select * from paagenthistory
select distinct cuser_name, changed_by from history_3350 order by cuser_name


-- 11/8/16

select * from vwsecondarytech 
select * from pasurgeonlookup where entity like '%horizon%' or entity like '%reliable%'

select pid, dos, defaultentity, [insurance type], clm_billing_type, correctentity from vwpamaster where defaultentity like '%horizon%'

select pid, dos, defaultentity,  correctentity from vwpacases where defaultentity like '%horizon%'


-- 11/7/16
select * from vwBillableCasesCalculation where Hospital like '%northwest Hills%' and BillableStatusTech = 'Billable' and PID = 159284
select * from hospitals_3300 where hospital like '%northwest Hills%'

select * from vwcontractInsuranceMatrix where hospital like '%northwest hills%' and insurance_type like 'CHAMPVA'

vwMisbilledIOMClaimsABS_DFW
select * from vwMisbilledClaims


select * from vwmaster2 where dos = '2016-09-21' and surgeon like '%urrea%'
select * from vwmaster2 where surgeon like '%Rimlawi%' and [insurance type] like '%blue cross%'


-- 11/1/116

select top 10 * from vwCases 
select * from vwCPTClaimDetail
select * from vwCPTCollectionDetail where DOS > '2016-01-01'
select top 10 * from claim_det_33300


select * from agents
select * from notes_3300  
select distinct cuser_name, changed_by from history_3350 where cuser_name like '%Alba%' 


-- 10/31/16

select top 10 * from notes_3300
select top 10 * from claim_entity_3300

select * from supplies_track_3300 where [supply source] is not null

-- 10/27/16

select * from surgeonlookup2 where surgeon like '%urrea%'

select * from vwPACPTCollectionDetail

select * from vwbillablecasescalculation where hospital = 'McBride Clinic Orthopedic Hospital' and primaryinsurance like '%kempton%'
select * from vwmaster2 where hospital = 'McBride Clinic Orthopedic Hospital' and [primary insurance] like '%kempton%'

select * from vwmaster2 where defaultentity like '%unknown%'
select * from vwmaster2 where pid in (110122, 110773, 324881, 324883)

-- 10/24/2016

select * from vwPAMisbilledClaims

select PID, DOS, claim_id, [claim date], surgeon, [Primary Insurance], [Insurance Type], Region_Short_Name, biller, box33, 
			Correctentity, DATEDIFF(day, [Claim Date], getdate()) as DaysClaimed 
	from vwPAMaster 
	where box33 <> correctentity and Folder in ('Ongoing Insurance Billing') 
		and biller not in ('Anesthesia Services, Ltd') 
		and ins_charged > 0.25



select * from surgeonlookup2 where surgeon like '%paley%'

select * from agentsf
select * from vwmaster2 where surgeon like '%rimlawi%' and [consolidated payer] = 'Blue Cross Blue Shield'
select * from surgeonlookup2 where surgeon like '%silver%'

-- 10/19/2016
select * from surgeonlookup2 where proentity like '%rrv%'
select pid, dos, surgeon, defaultentity, correctentity,* from vwmaster2 where pid in (525542,527117)

-- 10/18/2016
select * from vwCPTCollectionDetail
select * from vwpamaster
select * from collect_detail_3300

select * from collect_detail_3350



select * from collect_detail_3300 where collected_date > '2016-10-01'

select * from claim_charges_3300

spEmailPAUnMatchedSurgeons
select * from agenthistory where commentdate >= '2016-10-17' order by agent, commentdate

select * from agenthistory2 where commentdate >= '2016-10-17'  and agentid is not null order by agent, commentdate 

select * from agenthistory2 where patientid = 268923 and commentdate = '2016-10-10'

select * from agents where agent like 'Christina Davis'
select * from agents where id is null

select * from notes_3300 where web_id = 1490 and initialdate > '2016-10-17'

--left outer join agents on agents.id = notes_3300.web_id
 where clm = 701340 

--10/14/2016
select * from vwMaster3 where surgeon like '%pahlavan%'
select * from vwMaster3 where surgeon like '%thomas%'
select * from vwMaster3 where surgeon like '%dryer%'

select distinct  sl3.surgeon from surgeonlookup2 as SL3 where proentity = 'CTSI Monitoring, PLLC'   

select * from surgeonlookup2 where surgeon like '%Shane Pahlavan, M.D.%'
select * from surgeonlookup2 where proentity like '%CTSI%'

select * from vwPAMaster where surgeon like '%benae%' and dos < '2016-10-14'
select * from pasurgeonlookup where surgeon = 'Jean Louis Benae, M.D.' 

select pid, dos, surgeon, defaultentity, correctentity,  region_short_name, * from vwmaster3 where surgeon like '%sahni%'
select * from surgeonlookup2 where surgeon like '%sahni%'

select * from vwInsuranceDeposits

select count(*) from vwIOMENtityAging
select * from vwIOMEntityAging

-- 10/11/16

select * from vwbillablecasescalculation where reader like '%high%' 
			and [1st insurance category] like '%blue cross%' and dos > '2016-05-01'

select * from readerfees where readername like '%high%'

select * from vwmaster2 where folder like '%new%'
select * from vwUnbilledProClaims where folder is null
select * from vwmaster2

select * from vwBillablecasescalculation where folder is null
select * from vwmaster2 where folder is null and billstatus = 'Billable'

select distinct entity, region from entitylookup order by entity
select * from surgeonlookup2
select * from vwcases3 where correctproentity like 'wilcox%'

update surgeonlookup2 set region = (select distinct top 1 region from entitylookup where entity = proentity) 


select * from surgeonlookup2 where surgeon like '%Kinchen%'
select * from vwmaster3 where surgeon like '%Gabriel%' 

627	Josue Gabriel, M.D. Gateway IOM, LLC	10/13/2016	12/31/2020	Spine Surgeon Missouri	NO

insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor, region) 
		values('Josue Gabriel, M.D.', 'Gateway IOM, LLC', '2016-10-13', '2020-12-31', 'Spine Surgeon', '* ANY *', 'Missouri')


select dos, surgeon, region_short_name, correctproentity, specialty, [Consolidated Payor]  from vwCases 
		where surgeon like '%kinchen%' 
		order by dos


SELECT * INTO surgeonlookup2 FROM surgeonlookup;
update surgeonlookup2 set payor = '* ANY *' 

select * from surgeonlookup2
select distinct InsuranceGroup from insurancelookup order by insurancegroup

select * from surgeonlookup2 where surgeon like '%kinchen%'
update surgeonlookup2 set payor = 'Aetna', proentity= 'Wilcox Neuromonitoring, PLLC', startdate = '2016-06-28'  where surgeonid = 314
delete from surgeonlookup2 where surgeonid = 708
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Attorney Office')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Attorney Office')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Blue Cross Blue Shield')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'CHAMPVA')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Cigna')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Group Health')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Humana')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Misc Payor')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'Tricare')
insert into surgeonlookup2 (surgeon, proentity, startdate, enddate, specialty,payor) 
		values('Melanie Kinchen, M.D.', 'BK Neuromonitoring, PLLC', '2012-06-13', '2020-12-31', 'Spine Surgeon', 'United Healthcare')

select * from collect_detail_3300 where comment is not null
select * from surgeonlookup


-- 10/7/16

 select * from vwEntityPriorMonthEndSummary
 select * from surgeonlookup where proentity like '%Andaz%'
 select * from entitylookup where entity like '%Andaz%'

-- 09/29/16
select contracttype,closed,contracttype,CIMcontractstatus, chargeforsupplies,isbillable, * from vwhospitalbillings where invoice_no = 12951

(Select BillingCompany from readerfees as rf 
		where rf.readername = CR.Reader 
			and rf.[1st Insurance Category] = CR.[1st Insurance Category] 
			and CR.DOS >= startdate and CR.DOS <= enddate
			
			
			) <> 'ABS' THEN 'Unbillable'


--09/26/16
select * from readerfees where readername like '%high%' and [1st Insurance Category] like '%replacement%'

select dos, reader, [insurance type], billstatusnew,  * from vwMaster2 where reader like '%high%' and [Insurance Type] like '%replacement%' order by vwmaster2.dos desc
select * from hospitals_3300

select distinct pid, dos, patient, [primary insurance], [secondary insurance] from vwCases
select * from vwcases
select distinct entity, S#C as SurgeonOwned, Region, status, payrollID, mgmtfee from entitylookup

-- 09/20/16

select * from readers
select * from readerfees where readername like'%high%' and [1st Insurance Category] = 'Blue Cross Blue Shield'
update readerfees set startdate = '2010-01-01', enddate = '2020-12-31'

select billstatus, billstatusnew, dos as dos1, surgeon, reader, [Insurance Type], * 
from vwmaster2 
where reader like '%high%' and billstatus <> billstatusnew
order by dos1 desc

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, BillingCompany, StartDate, EndDate)
	 VALUES(4,'Bjorn Krane, M.D.','Blue Cross Blue Shield',275,275,275,'Dr. Krane', '2010-01-01', '2015-11-30')

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, BillingCompany, StartDate, EndDate)
	 VALUES(4,'William High, M.D.','Blue Cross Blue Shield',175,175,175,'Dr. Krane', '2016-07-01', '2020-12-31')
update readerfees set BillingCompany = 'Dr. High', enddate = '2016-06-30' where readerfee_id = 106
update readerfees set BillingCompany = 'ABS' where readerfee_id = 482
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, BillingCompany, StartDate, EndDate)
	 VALUES(4,'William High, M.D., Ph.D.','Blue Cross Blue Shield',175,175,175,'ABS', '2016-07-01', '2020-12-31')
update readerfees set BillingCompany = 'Dr. High', enddate = '2016-06-30' where readerfee_id = 121
update readerfees set reader_ID = 8 where readerfee_id = 482
update readerfees set reader_id = 9 where readerfee_id = 483

select * from entitylookup

select * from entitylookup

select * from vwreaderpayroll
update readerfees set startdate = '2015-12-01' where readerfee_id =46



--09/15/16 

select * from vwPayrollEntities

-- ******** Validation
spEmailCurrentMonthEntitiesWithoutPayroll
select * from vwReaderPayroll

select * from readers order by readername


-- 09/14/16 onsite
select * from vwMaster2

select * from readers
select * from readerfees where fee1< fee2
select * from readerfees where readername like '%wol%'

select * from vwreaderpayroll where month = 8 and reader like '%wol%'

select * from readerfees where fee3 = 190 and readername like '%wol%'
update readerfees set fee3 = 170 where fee3 = 190 and readername like '%wol%'


select distinct entity from entitylookup order by entity
select * from entitylookup
select * from vwInsuranceDeposits2

-- 09/09/16
select * from vwCases where defaultentity like '%correxa%'

-- 8/31/16
select * from vwPAMaster where clm_billing_type = 'CORRECTED CLAIM'
select * from EntityLookup where client_name <> Entity

select count(*) from insurancelookup

select * from vwmaster2 where [claim date] <> originalClaimdate

-- 8/30/16

/*
PA clm_billing_type Modify logic assigned
John, I just noticed that the clm_billing_type is not returning precise data.  You may need to refresh my memory, but
 I think the issue is in how we assign "Corrected Claim" Status and "Pro Only" Status.  I noticed that their are 
 tech claims also, so we are going to have to leave the default to this column as it is exported form USMON, and 
 add logic for the following examples:

When folder is="Ongoing Insurance Billing" or "Closed Billing Claims" or "Refile Claims" and ins_charged is<0.25 then the clm_billing_type ="Corrected Claim" 

I think we also defaulted all cases where the clm_billing_type is null to "Pro Only", and that should be OK. 

I don't want to overwrite any data in this column that comes out of USMON with the exception of "Corrected Claims"

*/
select * from vwpamaster
select distinct clm_billing_type from 
patient_insurance_charges_3350

select distinct ins_folder from claim_entity_3350

select * from vwpamaster where claim_id = 521994
select * from vwPAInsuranceDeposits2 where claim_seq = 521994
 --use the view and filter for the claim_seq 521994, the box33 is NULL.

select * from vwmaster2
select * from agents
select * from history_3300 where cuser_name like '%ronica%'  --7043
select * from history_3300 where cuser_name like '%Staysie%'  --6458
-- 8/29 work
select * from users

select * from agenthistory where agent like '%wick%' and commentdate >= '2016-08-17' and commentdate < '2016-08-18'

select * from vwbillablecasescalculation

select * from vwUnbilledTechClaims
select * from vwUnbilledProClaims

select FLOOR(RAND()*(1000000-1)+1) 

--Work on 8/27/16
select * from vwpamaster where pid = 532101

-- Onsite 8/23/16
select pro_time_end - pro_time_start as duration,
		case
			when (pro_time_end - pro_time_start)>'02:00' then 'TRUE'
			else 'FALSE' end as DURATION, 
		datepart("D", pro_time_end) as days, *
		 from vwCases where PID = '511721'

select count(*) from vwcases where oncall_time = 'Yes'

select * from surgeonlookup

select distinct insurancegroup from insurancelookup order by insurancegroup

-- Ticket #919 8/22/16
select * from vwMaster2 where PID = 194797
					WHEN (PIC.ins_charged - PIC.ins_writte_off - (SELECT SUM(ID.Payment_Collected) FROM Insurance_Deposits_3300 AS ID WHERE ID.Claim_id = PIC.claim_ID)) <= 0 THEN 'Appealed' 
					WHEN PIC.ins_collcted > 0 AND   CE.ins_folder = 'Ongoing Insurance Billing' THEN 'Appealed' 

select * from claim_charges_3300 where patient_id = 194797
select * from claim_charges_3300 where claim_seq = 361760
select * from insurance_deposits_3300  where claim_seq = 361760

-- 8/18/16
select top 100 * from vwCases

-- 8/16/16
--an "eligible" case for ACME Assist, PLLC will include the following exception:
--When Insurance Type is Blue Cross Blue Shield and Tech is Kimberly Stewart, MPAS, PA-C, then the case should be counted as eligible.

select * from vwPAcases where defaultentity =  'ACME Assist, PLLC' and  [1st Insurance Category] = 'Blue Cross Blue Shield' --and Tech = ' Kimberly Stewart, MPAS, PA-C' -- Then 'Private'
select * from vwPACases where defaultentity ='Premier Physician Surgical Associates, PLLC'

		WHEN DefaultEntity = 'Premier Physician Surgical Associates, PLLC' and [1st Insurance Category] = 'Blue Cross Blue Shield' Then 'Private'

		WHEN Defaultentity = 'ACME Assist, PLLC' and  [1st Insurance Category] = 'Blue Cross Blue Shield' and Tech = ' Kimberly Stewart, MPAS, PA-C' Then 'Private'

spEmailUnMatchedInsuranceLookup

select * from view_billingcount where correctentity like '%aust%'

select * from vwmaster2 where correctentity like '%austx%' 
		and folder in ('New Insurance Claims', 'Ongoing Insurance Billing', '')
		and clm_billing_type in



--8/12/2016
select top 10 * from vwpamaster
select * from dbo.Insurance_Deposits_3300 

select * from vwmaster2 where correctentity like '%austx%' and folder like '%ongoing%'

select * from view_billingcount where correctentity like '%austx%'

-- 8/9/2016

select * from techregionlookup
select * from vwCases where		surgeon like '%vard%' and OR_Procedure like '%stim%'

select * from vwmaster2 where correctentity like '%neurocept diag%'

select * from vwmaster2 where entity like '%neurocept diag%'

select * from view_billingcount where entity like '%texoma%'
select * from vwPAMaster

select top 1 note from notes_3350 where patient_id = 364412  order by initialdate desc --clm# = 541459

select * from vwPAMaster where pid = 364412

select * from (select top 1 billing_notes_id from notes_3350 where notes_3350.patient_id = 364412 order by initialdate desc)a

select * from agents  agent, id

delete  from agents 

insert into agents (agent, id)  
select cuser_name, changed_by from history_3300  where changed_by in (6258,6381,6594,1490,6457,5905,
		6558,6979,6559,6711,6862,6382,5755,6629,6631,6012,2946,6076,6670,6825,3287,1684,6593,6535,6968,6757,6875,6575,6518,5807,5450)



select distinct changed_by, cuser_name from history_3300  	order by cuser_name

select distinct  from notes_3300

Accusist, PLLC

select * from vwPAMaster where correctentity like '%horizon%'

-- 8/4/16
select * from vwEntityPriorMonthEndSummary

select * from vwHospitalBillings where pid = 241140

-- 8/3/16 Tests
select correctentity, * from vwPAMaster where PID = 523037
select * from vwcases where pid = 516782

select * from vwmaster2 where pid = 475404
select * from vwcases where pid = 475404

-- 8/2/16 ONSITE

select * from vwMaster2 where surgeon like '%Kinchen%'
select * from surgeonlookup where surgeon like '%Kinchen%'
select * from vwIOMEntityAgingNewInsurance

select distinct correctentity from vwpamaster

select distinct [Primary Insurance], [Insurance type] from vwmaster2 order by [primary insurance] where [Insurance Type] like '%Blue Cross Blue Shield%'

select [Primary Insurance], [1st Insurance Category], * 
from case_report_3300 where ([Primary Insurance] like '%Blue Cross Blue Shield%' or [Primary Insurance] like '%BCBS%') --and [1st Insurance Category] like '%Replacement%'

-- Misc. work offsite


select * from vwCases where correctproentity like '%AO IOM%'


select * from hospitals_3300
select * from surgeonlookup
select * from pasurgeonlookup
select * from regionlookup
select * from vwpamaster
select * from notes_3350

select distinct client_name from vwmaster2 where client_name like '%Correxa%'

select * from vwMisbilledClaims order by PID


SELECT * 
FROM   INFORMATION_SCHEMA.VIEWS 
WHERE  VIEW_DEFINITION like '%hospitallookup%'

select distinct count(PID) from vwhospitalbillings where hospital like '%francis%'

select * from hospitals_3300

-- ONSITE 7/19/16

select * from surgeonlookup where surgeon = 'Adam Bruggeman, M.D.'
select * from entitylookup where entity 

select * from denialcodelookup

-- Onsite 7/12/16

select * from hospitals_3300 where hospital like '%Precinct Ambulatory%'
select * from hospitals_3300 where hospital like '%Presbyterian Hospital%'
select * from hospitallookup where USMON_ID is null

select * from hospitals_3300 where hospital like '%St. Francis Medical%'
select * from hospitallookup where  hospital like '%St. Francis Medical%'

select * from vwCases
select * from case_report_3300

select * from vwpainsurancedeposits2

update hospitallookup set hospitallookup.usmon_ID = hospitals_3300.hospital_id
from hospitallookup hl inner join hospitals_3300 on hospitals_3300.hospital = hl.hospital

update hospitallookup set usmon_id = 2421 where hospital_id = 229

select * from hospitallookup hl 
inner join hospitals_3300 on hospitals_3300.hospital = hl.hospital
 

select distinct contract_status from hospitals_3300
select distinct contracttype from hospitallookup

select count(*) from vwunbilledtechclaims
select count(*) from vwmaster2 
select * from vwUnbilledTechClaims

SELECT table_name FROM   INFORMATION_SCHEMA.VIEWS 
WHERE  VIEW_DEFINITION like '%From vwCases%'
order by table_name

select * from vwmaster2 where claim_id = 604227
select distinct [1st Insurance Category] from vwcases
SELECT       *
	FROM            dbo.Insurance_Deposits_3300 AS ID
	WHERE        (claim_id = 604227 /*and payment_collected > 0*/)
	ORDER BY Date_Collected

select * from vwIOMentityAging

-- Ticket #724

select * from vwCases where PID in (450919,453245,484718,496401)
select * from invoice_history_3300 where patient_id in (450919,453245,484718,496401)
select pid, dos, cancelled, surgeon from dbo.case_report_3300 where PID in (450919,453245,484718,496401)

select * from vwhospitalbillings where pid in (486182,423167,469405)
select * from vwCases where pid in (486182,423167,469405)
select * from invoice_history_3300 where invoice_number = 11887
select * from vwcontractinsurancematrix where hospital = 'CHRISTUS Santa Rosa - Children''s Hospital' and Insurance_type = 'TRICARE'

select * from vwcontractinsurancematrix

ALTER VIEW vwContractInsuranceMatrix as
SELECT        hosp.Hospital, hl.ContractType, hi.Insurance_Type
FROM            dbo.hospitals_3300 AS hosp 
		LEFT OUTER JOIN dbo.HospitalLookup AS hl ON hl.Hospital = hosp.Hospital 
		LEFT OUTER JOIN dbo.hosp_ins_3000 AS hi ON hi.Hospital_ID = hosp.hospital_id

select * from hospitallookup where hospital = 'CHRISTUS Santa Rosa - Children''s Hospital'  --148

select * from hosp_ins_3000 where hospital_id = 391 order by Insurance_type 
select * from hospitals_3300  where hospital = 'CHRISTUS Santa Rosa - Children''s Hospital'

select * from HospitalLookup where hospital = 'CHRISTUS Santa Rosa - Children''s Hospital'
`
			LEFT OUTER JOIN dbo.HospitalLookup AS HL ON dbo.vwCases.Hospital = HL.Hospital and vwCases.Region_Short_Name = HL.Region
			LEFT OUTER JOIN dbo.invoice_history_3300 AS Inv_Hist 
					ON Inv_Hist.invoice_number = dbo.vwCases.[Invoice #] 
						AND dbo.vwCases.PID = Inv_Hist.patient_id 
			LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM 
					ON dbo.vwCases.Hospital = CIM.hospital 
					AND dbo.vwCases.[1st Insurance Category] = CIM.insurance_type


-- 6/28/16 Onsite
select sum(claimscollected)  from vwCollectionSummary
select * from vwcollectionsummary where [consolidated payer] = 'Other'

select * from notes_3300 where Note_type like '%appeal%'

select pid, dos, reader, [1st Insurance Category], pro_time_start, pro_time_end, mrpoverlap from vwcases where MRPOverlap > 0 order by dos

select  pid, dos, reader, [1st Insurance Category], pro_time_start, pro_time_end, mrpoverlap from vwcases
	where dos> '2016-01-01' and reader like '%vanness%' and MRPOverlap > 0 order by dos

select * from vwIOMEntityAgingbyDOS
select * from vwIOMEntityAging

select * from notes_3300 where patient_id = 50413
select * from vw
select * from vwAppealNotesPro

select * from 
/**********/

select * from vwCases where dos = '2016-06-08' and reader like '%ibra%' and [1st insurance category] like '%medicare rep%'
		and mrpoverlap = 1

select pid, dos, reader, pro_time_start, pro_time_end, mrpoverlap from vwCases where dos = '2016-03-02' and reader like '%wolin%' and [1st insurance category] like '%medicare rep%'
		and mrpoverlap = 1

select count(*), mrpoverlap from vwCases group by mrpoverlap


Select pid, dos, cr.dos, reader, cr.reader, [1st Insurance Category], cr.pro_time_start, cr.pro_time_end
  from dbo.case_report_3300 as cr 
								where 'Joel Wolinsky, M.D.' = cr.reader
									AND [1st Insurance Category] = 'Medicare Replacement Plan'
									AND cr.dos = '2016-03-02 00:00:00'
									AND cr.pro_time_start < '1900-01-01 11:50:00' 
									AND '1900-01-01 11:09:00' < cr.pro_time_end 
									AND '439092' <> cr.pid

Select pid, dos, cr.dos, reader, cr.reader, [1st Insurance Category], cr.pro_time_start, cr.pro_time_end from dbo.case_report_3300 as cr 
								where 'Joel Wolinsky, M.D.' = cr.reader
									AND [1st Insurance Category] = 'Medicare Replacement Plan'
									AND cr.dos = '2016-03-02 00:00:00'
									AND '1900-01-01 11:09:00' < cr.pro_time_end 
									AND cr.pro_time_start < '1900-01-01 11:50:00'
									AND '439092' <> cr.pid

									select * from dbo.case_report_3300 where pro_time_end = '1900-01-01 13:37:00'
									and dos = '2016-03-02 00:00:00'

									select * from vwcases where pro_time_end = '1900-01-01 13:37:00'
									and dos = '2016-03-02 00:00:00'


									select  case when '1900-01-01 08:18:00' < '1900-01-01 11:50:00'  then 'true'
									else 'false' end as condition

									select  case when '1900-01-01 11:09:00'  < '1900-01-01 09:48:00' then 'true'
									else 'false' end as condition


where patient_id in ('124315')

select top 1 * from vwcases

/*
Billing_Notes_ID	
Patient_ID	
Note_Type	
Note	
InitialDate	
DOS	
Region	
Default 
Entity	
Primary 
Insurance	
Insurance Type	
Billing Pro Entity*/




select * from notes_3300 where note_type in ('First Level Appeal Tech', 'Second Level Appeal Tech', 'Third Level  Appeal Tech')




-- 6/24/16 misc requests
select * from vwmaster2 where claim_id in ('617825', '630007')

-- 6/21/16 onsite
select pid, dos, claim_id, client_name, [primary insurance], surgeon, defaultentity, correctentity
 from vwpamaster where surgeon = 'Sean Jones-Quaidoo, M.D.' and [Insurance Type] = 'Blue Cross Blue Shield'
 
select * from techregionlookup where [assigned region] like '%OK%'
update techregionlookup set [Assigned Region] = 'Oklahoma-OKC' where [Assigned Region] = 'OK'

select * from vwmaster2 where box33 like '%frisco neurosurgical%'

select count(*) from notes_3300
select count(*) from notes_3300 where clm = 0

select * from notes_3300 where patient_id = 158903

select max(initialdate) from notes_3300 

select top 1000 * from notes_3300

select * from vwInsuranceDeposits where entity like '%frisco%' 
select * from entitylookup where entity like '%frisco%'

/****
patient injury risks - vwPatientInjuryRisk - Entity
annual cumulative collections - vwInsuranceDeposits - Entity
total outstanding cases - view_billingcount - Entity
total cases payer mix - View_PayerMix - DefaultEntity
recent receipts - View_PayerMix - Entity
average reader to sign off - vwCases - Entity
month collections - vwInsuranceDeposits - Entity
average collections by payer - vwInsuranceDeposits - Entity
*/

select * from View_PayerMix where DefaultEntity like '%frisco Neurosur%' order by dos desc
select * from vwInsuranceDeposits where entity like '%frisco%' and payment_collected > 0 order by dos desc
select * from view_billingcount

select * from surgeonlookup

-- 6/14/16 onsite

select claim_seq, proc_code, count(*) from collect_detail_3300 group by claim_seq, proc_code

select * from hospitallookup where hospital_id =  199

select claim_id, proc_code, box33, count(*) from vwCPTCollectionDetail where box33 like '%acme%' group by claim_id, proc_code, box33 

select * from hospitallookup where hospital_id  IN('261', '262', '264', '265', '268', '269', '138', '139', '140', '141', '142', '270', '147', '271', '148', '149', '151', '152', '153', '154', '272', '273', '274', '275', '276', '277', '280', '281', '254', '282', '178', '283', '284', '287', '288', '296', '202', '363', '300', '301', '302', '303', '304', '305', '306', '307', '308', '309', '310', '311', '313', '324', '326', '327', '328', '329', '331', '332', '231', '334', '335', '237', '238', '341', '342', '343', '344', '247', '250', '251', '345')

select * from entitylookup
select * from vwpropacombined where pasurgeon like '%pipkin%'
select * from vwpamaster where surgeon like '%pipkin%' and folder not like '%new%'
select * from vwmaster2 where patient like '%Dusty%' = 'Johnson, Dusty'
Johnston, Dusty
/**********/
alter view vwProPACombined as 
		select 
			vwmaster2.PID,
			vwmaster2.claim_id as ProClaimID,
			vwpamaster.claim_id as PAClaimID,
			vwmaster2.dos,
			vwmaster2.client_name as ProClientName,
			vwpamaster.client_name as PAClientName,
			vwmaster2.surgeon as ProSurgeon,
			vwmaster2.patient,
			vwmaster2.correctentity as ProCorrectEntity,
			vwmaster2.[Primary Insurance],
			vwmaster2.ins_collcted as ProInsCollected,
			vwmaster2.ins_charged as ProInsCharged,
			vwmaster2.ins_writte_off as ProInsWriteOff,
			vwmaster2.claimbiller as ProClaimBiller,
			vwmaster2.originalclaimDate as ProOriginalClaimDate,
			vwmaster2.[First Collection] as ProFirstCollection,
			vwmaster2.[Total Collection] as ProTotalCollection,
			vwmaster2.Balance as ProBalance,
			vwmaster2.Box33 as proBox33, 
			vwmaster2.FOlder as ProFolder,
			vwmaster2.BillStatus as ProBillStatus,
			vwpamaster.surgeon as pasurgeon,
			vwpamaster.correctentity as PACorrectEntity,
			vwpamaster.[Primary Insurance] as PAPrimaryInsurance,
			vwpamaster.ins_collcted as PAInsCollected,
			vwpamaster.ins_charged as PAInsCharged,
			vwpamaster.ins_writte_off as PAInsWriteOff,
			vwpamaster.claimbiller as PAClaimBiller,
			vwpamaster.[Claim Date] as PAOriginalClaimDate,
			vwpamaster.[First Collection] as PAFirstCollection,
			vwpamaster.[Total Collection] as PATotalCollection,
			vwpamaster.Balance as PABalance,
			vwpamaster.box33 as PABox33,
			vwpamaster.Folder as PAFolder,
			vwpamaster.billstatus as PABillStatus

		from vwMaster2
			LEFT OUTER JOIN vwPAMaster on 
				vwmaster2.surgeon = vwpamaster.IOMsurgeonname
				and vwmaster2.dos = vwpamaster.dos 
				and vwpamaster.patient = vwmaster2.patient
		where 
			vwpamaster.pid is not null
			and vwmaster2.clm_billing_type = 'Pro Only'
			and vwpamaster.correctentity in (select entity from pasurgeonlookup where surgeonownd = 'Yes') 
			and vwmaster2.folder not in ('New Insurance Billing') 
			and vwpamaster.folder not in ('New Insurance Billing')
/**********/
select top 10 * from vwmaster2
select top 10 * from vwpamaster

update pasurgeonlookup set iomsurgeonname = surgeon

select * from pasurgeonlookup where surgeon like '%sahni%' 
select * from pasurgeonlookup where surgeon like  '%pipkin%' 
select * from pasurgeonlookup where surgeon like '%benae%'


update pasurgeonlookup set iomsurgeonname = 'Irvin K Sahni, M.D.' where surgeonid in (1,2,45) 
update pasurgeonlookup set iomsurgeonname = 'Charles Pipkin, M.D.' where surgeonid in (7,24,44) 
update pasurgeonlookup set iomsurgeonname = 'Jean Louis Benae, M.D.' where surgeonid in (4,34,39) 

select * from surgeonlookup where surgeon like '%sahni%'
select * from surgeonlookup where surgeon like '%pipkin%'
select * from surgeonlookup where surgeon like '%benae%'


 alter table pasurgeonlookup add  [IOMSurgeonName] NCHAR(50) NULL

select * from vwInsuranceDeposits2 where check_no like '%ota%' order by date_collected 
select * 

select * from vwmaster2
select * from vwpamaster



----------
SELECT * 
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0', 'Excel 12.0;Database=C:\hospitallookup.xls', [Sheet1$])

select top 100 * from case_report_3300 where [Primary Insurance] = 'Aetna' and surgeon = 'Kevin James, M.D.'

select * from vwMaster2 where correctentity like '%Andaz%' order by dos

select * from vwmaster2 where claim_id = '430278'
select * from surgeonlookup where surgeon = 'Patrick Rudersdorf, M.D.'
select * from vwCollectionsummary where box33 = 'CTSI Monitoring, PLLC'

select * from vwCPTClaimDetail where patient_id = 353501

select * from vwhospitalbillings order by dos desc

select * from vwEntityPriorMonthEndSummary








-- 5/31/16
sel
select * from claim_entity_3300

select * from vwmaster2 where claim_id = 421303
select daystobill from vwmaster2 where claim_id = 421303

select distinct client_name from entitylookup
select distinct proentity  from surgeonlookup where enddate = '2016-12-31'
select distinct surgeon from pasurgeonlookup where enddate = '2016-12-31'

-- 5/24/16
select * from case_report_3300 where dos > '2016-05-01' and pid = 408031
select * from claim_entity_3300 where dos > '2016-01-01' and payer is not null and patient_id = 408031
select * from hl7_raw_data_3300 where patient_id = 408031
select * from hospitals_3300 where hospital like '%heritage%'
select * from hospitallookup where hospital = 'AMC South Campus'

select * from vwMaster2 where 

select top 100 * from hl7_raw_data_3300
select * from case_report_3300
select * from claim_entity_3300
select * from claim_charges_3300
select * from surgeonlookup

select distinct surgeon, OR_Procedure from case_report_3300 

-- 5/19/16 Investigate #604
select * from regionlookup
select * from vwInsurancedeposits2 where full_name like '%sara boyles%' 

select * from entitylookup  where client_name = 'Neurodiagnostics & Neuromonitoring Institute, Inc.'
select * from regiontechentitylookup where regionname = 'Oklahoma-OKC' region_short_name

select * from insurancetypelookup  where InsuranceGroup = 'United Healthcare'
select * from insurancelookup where  insurancecompany = 'United Healthcare'
select * from hospitallookup where  hospital = 'Summit Medical Center'
select * from surgeonlookup where surgeon = 'Arthur Conley, M.D.'


-- 5/18/16 Onsite

select * from entitylookup where Region like '%tri%'
update entitylookup set Region = 'Washington' where region = 'Tri-Cities'
update regionlookup set Regionname = 'Washington' where id = 8
select * from techregionlookup where [assigned region] like '%tri%'
update techregionlookup set [Assigned Region] = 'Washington' where [Assigned Region] = 'Tri-Cities'

select * from regionlookup

select * from vwmaster2 where pid in ('60333','57818')
select * from claim_entity_3300 where patient_id in ('60333','57818')
select * from claim_det_33300 where patient_id in ('60333','57818')
select * from case_report_3300 where pid in ('60333','57818')

select * from vwMaster2 where biller ='' and folder = 'ongoing insurance billing'

select * from vwInsuranceDeposits2

spEmailMisBilledTechClaims
select * from techregionlookup

select * from vwTechMisbilledClaims

select * from regiontechentitylookup

select * from vwMaster2 where box33 like '%synergy%' and clm_billing_type = 'Tech Only'

select * from entitylookup order by client_name

select * from surgeonlookup where proentity

select * from vwMaster2

select distinct region_short_name from vwMaster2 where region_short_name not in (select regionname from regiontechentitylookup)

--<<<<<<< HEAD
-- 5/10/16
select * from case_report_3300
select * from surgeonlookup where surgeon like '%hahn%'
update 

﻿-- 5/3/16 ONSITE
select * from vwEntityPriorMonthEndSummary
select * from vwPAEntityPriorMonthEndSummary
select * from PASurgeonLookup
select * from vwPAInsuranceDeposits2 where date_Collected >= '2016-04-01' and date_collected < '2016-05-01' 
	and Payment_Collected <> 0
	order by box33, date_collected

select distinct box33 from vwMaster2 where clm_billing_type = 'Tech only'   
	and [claim date] >= '2016-04-01' and [claim date] < '2016-05-01' and folder not in ('New Insurance Billing','Pending Clearinghouse')

select distinct count(pid) from vwmaster2 where dos > '2016-04-01' and dos < '2016-05-01'


select * from vwCollectionsReportTechNNS
select * from regiontechentitylookup 
select distinct box33 from vwMaster2 

select * from vwMaster2 where 
		surgeon in (select surgeon from surgeonlookup where ProEntity = 'ABK Monitoring Inc., PLLC')
	and clm_billing_type = 'Tech Only'

select * from vwInsuranecDeposits2

select * from surgeonlookup where proentity like '%aspen%'

			select * from vwMaster2 where surgeon in (select surgeon from surgeonlookup where proentity like '%aspen%') 
			and clm_billing_type = 'Tech Only' 
			and DATEPART(m, [Claim Date]) = DATEPART(m, DATEADD(m, -1, getdate()))
				AND DATEPART(yyyy, [Claim Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
				AND folder not in ('New Insurance Billing')

select * from vwPAInsuranceDeposits2 where claim_seq in (
select distinct claim_id from vwPAMaster where box33 like '%horizon%' ) order by date_collected desc
select * from pasurgeonlookup where entity like '%horizon%'
select * from vwPamaster
select * from vwCases where Oncall_time = 'Yes'

SELECT TRY_CONVERT(datetime2, '2010-12-31' + ' ' + '13:30') AS Result;


-- 4/28/16
select top 1 * from Insurance_Deposits_3350 as ID where payment_Collected <> 0 Order by ID.Date_Collected DESC
select * from vwMaster2 where [last collection] > 0

-- 4/27/16
select * from vwPAMaster where [Total Collection] = 0

select count(*) from vwcases
select * from denialcodelookup
--4/18/16
spEmailUnmatchedTechRegionLookup
select * from vwpamaster
select * from vwPAInsuranecDeposits2

select * from vwValidationCheckUnmatchedTechRegionLookup
select * from case_report_3300
select distinct [assigned region] from techregionlookup  
select * from techregionlookup where [assigned region] = 'Natioanl Neuromonitoring - Houston'
update techregionlookup set [assigned region] = 'National Neuromonitoring - Houston' where [assigned region] = 'Natioanl Neuromonitoring - Houston'

select * from vwmaster2 where biller = '' 
149220
select * from case_report_3300 where pid = '149220'
select * from claim_entity_3300 where patient_id = '149220'

select billstatus, count(*) from vwPamaster where box33 like '%horizon pa%' and clm_billing_type = 'Pro Only' group by billstatus
select * from vwPAmaster where box33 like '%horizon pa%' and billstatus = 'Not Billed'

select count(*) from vwpamaster where balance <0

select top 10 * from vwpamaster

select * from vwPAmaster where defaultentity like '%horizon pa%' and dos >= '2015-06-01' and dos < '2015-07-01'
select * from vwpacases where defaultentity like '%horizon pa%' and dos >= '2015-06-01' and dos < '2015-07-01'

-- 4/15/16

select biller, claimbiller, folder, * from vwMaster2 where biller = ''  and claimbiller is null and folder = 'Ongoing Insurance Billing'


If the "biller" and "claimbiller" are null and the folder is ongoing, and the DOS is 2013 then the BillStatus should be "closed"  

select * from vwunbilledproclaims where pid in (414122,414117,418233,418238)

select * from vwbillablecasescalculation where pid in (414122,414117,418233,418238)
-- 3/29/16
select * from hospitallookup where hospital in ('Medical Center of Arlington', 'Advanced Surgery Center of San Antonio')
select * from vwContractInsuranceMatrix where hospital in ('Medical Center of Arlington', 'Advanced Surgery Center of San Antonio')

select * from case_report_3300 where surgeon like 'Arnold Vardiman%' and reader like '* %'
select * from vwUnbilledTechClaims where surgeon like 'Arnold Vardiman%' and reader not in ('Jane Doe','* Unassigned *')

select * from vwBillableCasesCalculation where surgeon like 'Arnold Vardiman%'

select * from vwBillableCasesCalculation where [1st insurance Category] is null or [1st insurance Category] = ''
select * from vwContractInsuranceMatrix where ContractType = 'Technical Services' and Insurance_type is null

select * from vwPAMisbilledClaims

select * from claim_entity_3300 where entity like '%chandler%'
select * from entitylookup

spEmailUnMatchedPASurgeons

select * from vwreaderpayroll where reader like '%katuna%'
select * from readerfees where fee1 <> fee2 or fee2 <> fee3  readername like '%wolin%'
select * from vwReaderBillableCasesByMonth  where reader like '%wolin%'
select * from vwCases where reader like '%wolin%'
select * from readers where readername like '%wolin%'

select * from readerfees where readername like '%katuna%'
select * from vwcases where pid = '412268'

select * from vwTechProductivity
select * from techregionlookup

--vwmaster2 Billstatus should be Unpaid Billed, Billed, and Partially Paid

---------
-- 3/30/16

select * from vwUnbilledProClaims where PID in ('213786','329655','343507','337943')
select distinct billstatuspro from vwUnbilledProClaims

select * from patient_insurance_charges_3300  where  PID in ('343507','337943')


------

select * from vwmaster2 where pid = 414117
select * from vwmaster2 where surgeon like '%hugh%' and [insurance type] like '%workman%'
select * from surgeonlookup where surgeon like '%hugh%'

select * from vwContractInsuranceMatrix where hospital like '%northwest%'

select * from hospitallookup where hospital like '%northwest%'

select distinct ins_folder from claim_entity_3300
select * from claim_entity_3300 where ins_folder = 'Deleted Claims'

--
select * from vwcollectionsummary where box33 = 'Neuriom, PLLC'


select [Consolidated Payer], datepart(m,date_collected) as monthcollected , payment_collected, ins_charged,
	Case
		when ins_charged > 0 then payment_collected / ins_charged 
		else 0
		end as ReimbursementPct
	from vwInsuranecDeposits2 
	where box33 = 'Neuriom, PLLC' and date_collected >= '2016-01-01' 

select * from vwInsuranecDeposits2 where box33 = 'Neuriom, PLLC' and date_collected >= '2016-01-01' 

select PID, DOS, claim_id, [2016 PYMT], select   from vwmaster2 where box33 = 'Neuriom, PLLC' and [2016 PYMT] > 0 
select top 10 * from vwmaster2

--
-- 4/5/16

select distinct proentity from surgeonlookup where proentity not in (
select distinct entity from entitylookup) order by proentity

select distinct box33 from vwMaster2 where box33 not in (
select distinct client_name from entitylookup) order by box33 

select distinct box33 from vwMaster2 where box33 not in (
select distinct proentity from surgeonlookup) order by box33 

select * from entitylookup
select * from surgeonlookup where proentity like '%frisco%'
select * from entitylookup where entity like '%frisco%'

select * from vwInsuranecDeposits2

select * from vwMaster2 where  box33 like '%In-Site%' and [Surgeon Ownd] = 'Yes' 
select * from entitylookup where entity like '%In-Site%'
update entitylookup set [S#C] = 'No' where entity = 'In-Site Surgical Monitoring Services'

select top 100 * from history_3300

-- Ticket #488

Select box33 from vwMaster2 where claim_id = '598711'

Select * from claim_entity_3300 as CE on CE.patient_id = CR.PID
Select * from claim_det_33300 as CD on CD.claim_id = CE.claim_seq
Select * from patient_insurance_charges_3300 as PIC on ce.claim_seq = pic.claim_id
Select * from entitylookup as EL on PIC.client_name = EL.client_name  
Select * from entitylookup as EL2 where EL2.client_name = 'In-Site Surgical Monitoring Services'
Select * from insuranceTypelookup as ITL where ITL.insurancetype = 'Private Insurance'
Select * from insurancelookup as IL where IL.insurancecompany = 'Aetna'
Select * from hospitallookup as HL where HL.Hospital = 'Baylor Regional Medical Center at McKinney'
Select * from surgeonlookup as SL where SL.Surgeon = 'Keith Preston, M.D.' and CR.dos >= sl.startdate and CR.dos<= sl.enddate
Select * from vwhl7_Raw as HL7 on HL7.patient_id = CR.PID
Select * from regiontechentitylookup as RTEL where RTEL.RegionName = 'National Neuromonitoring - DFW' and CR.dos >= RTEL.startdate and CR.dos<= RTEL.enddate

-- Ticket #484
select * from vwInsuranecDeposits2 where box33 like '%borpan%'

-- 4/12/16 

select * from vwEntityPriorMonthEndSummary
select * from vwValidationCheckUnmatchedTechRegionLookup
spEmailUnmatchedTechRegionLookup

select * from vwPAMaster where BillStatus = 'UnBillable' and 


select billstatus, count(*) from vwmaster2 where box33 like '%alamo%' group by billstatus

--Insurance Type
alter view vwInsuranceTypeChanges as 
select distinct 
	date_changed, 
	dos,
	history_3300.patient_id, 
	[claim date],  
	box33, 
	claimbiller,  
	surgeon, 
	HL7.[Primary Policy Coverage Type], 
	[Insurance Type] as ClaimedInsuranceType, 
	cuser_name as ChangedByUser
from history_3300 
left outer join vwMaster2 on patient_id = vwmaster2.pid
left outer join hl7_raw_data_3300 as hl7 on history_3300.patient_id = hl7.patient_id
--left outer join insurancelookup as IL on hl7.[Primary Policy Name] = IL.InsuranceCompany
where field_changed = 'Insurance Type' and dateadd(day, 5, dos) < date_changed and clm_billing_type = 'Pro Only'
order by date_changed desc, dos asc

--

select * from hl7_raw_data_3300 where patient_id = '424831'
select * from insurancelookup

select * from history_3300 where patient_id = '424831' order by date_changed desc
select * from vwMaster2 where pid = '424831'


--

select InsuranceType, count(*) from View_PayerMix where defaultentity = 'BK Neuromonitoring, PLLC' 
	and DOS >= '2015-12-01' and DOS < '2016-01-01'
	group by insurancetype 

select * from vwBillableCasesCalculation where billablestatus = 'Future Case'


	select * from insurance_deposits_3300 where patient_id = '253536'
	select * from insurance_deposits_3300 where claim_seq = '410780'


	select * from insurance_deposits_3300 where date_collected > '2016-01-18' and date_collected < '2016-01-19'
select * from case_report_3300
select * from vwPAMaster

select * from vwmaster2 where client_name like '%site%'
                  
select * from vwentitymonthendsummary

select distinct entity from vwInsurancedeposits where date_collected >= '2016-03-01'

-- 3/1/2016 Onsite: Duplicate entirs on vwHospitalBillings
select * from vwHospitalBillings order by PID
SELECT PID, COUNT(PID) 
FROM vwHospitalBillings
GROUP BY PID
HAVING ( COUNT(PID) > 1 )

select * from vwHospitalBillings where PID = '117616'
select * from hospitallookup where hospital = 'Methodist Stone Oak Hospital'
select * from invoice_history_3300 where invoice_number = 5361
select * from vwContractInsuranceMatrix where hospital = 'St. Francis Medical Center' 
		and insurance_type = 'Medicare'

SELECT hospital, contracttype, insurance_type, count(hospital)
from vwContractInsuranceMatrix
group by hospital, contracttype, insurance_type
having (count(hospital) > 1)

select * from case_report_3300

/***************************************
***** IOM ******************/
select * from vwIOMEntityAging


LEFT OUTER JOIN dbo.HospitalLookup AS HL ON dbo.vwCases.Hospital = HL.Hospital 
			LEFT OUTER JOIN dbo.invoice_history_3300 AS Inv_Hist 
					ON Inv_Hist.invoice_number = dbo.vwCases.[Invoice #] 
						AND dbo.vwCases.PID = Inv_Hist.patient_id 
			LEFT OUTER JOIN dbo.vwContractInsuranceMatrix AS CIM 
					ON dbo.vwCases.Hospital = CIM.hospital 
					AND dbo.vwCases.[1st Insurance Category] = CIM.insurance_type

select distinct folder from vwUnbilledTechClaims
select * from vwUnbilledTechClaims where pid = '380054'
select * from vwBillableCasesCalculation where pid = '380054'
select * from vwMaster2 where pid = '380054' and clm_billing_type = 'Tech Only'

select * from entitylookup where entity like '%Cortico%'

select * from AgentHistory where Agent like '%sandra%' and commentdate >'2016-02-10' and commentdate < '2016-02-13'
select * from agenthistory where patientid in ('353275','358094','348480')
------
create view View_PayerMix as 
SELECT        CASE WHEN [1st Insurance Category] = 'Private Insurance' OR
                         [1st Insurance Category] = 'Letter of Protection' OR
                         [1st Insurance Category] = 'Lein Case' THEN 'Private' ELSE 'Other' END AS InsuranceType, DOS, DefaultEntity
FROM            dbo.vwCases
WHERE        (DOS BETWEEN DATEADD(m, - 11, GETDATE()) AND GETDATE())


------
select * from regiontechentitylookup

SELECT top 100 * from dbo.history_3300 
								WHERE  field_changed like 'Auditor%' 
								ORDER BY date_changed  
------------

spemailmisbilledclaims;

select * from vwInsuranceDeposits

select * from vwmaster2 where claim_id = '393567'

select * from vwBillableCasesCalculation where pid = '221380'
select * from vwCases where pid = '221380'

select * from vwUnbilledProClaims

select * from hospitallookup where hospital like '%Crescent%'
update hospitallookup set ContractType = 'Technical Services' where hospital_id = 367

select * from vw


select * from vwmisbilledclaims order by daysclaimed
=======
﻿select * from case_report_3350
select * from vwpamaster
select * from vwMisBilledClaims order by daysclaimed
select * from vwBillableCasesCalculation
select * from surgeonlookup where surgeon like '%sco%'
select * from vwmaster2 where pid = '353708'

select * from vwTechProductivity

spEmailMisBilledClaims

select * from vwBillableCases

select * from vwmaster2 where pid = '322804'

select distinct contracttype from hospitallookup where hospital like '%innova%'
select count(*) from hospitallookup

select * from patient_insurance_charges_3300 as PIC where PID= '159284'

select * from vwMisbilledClaims order by daysclaimed

-- UNBILLED PRO CLAIMS -- 
select vwBillableCasesCalculation.*, vwMaster2.folder, vwMaster2.clm_billing_type
from vwBillableCasesCalculation 
	LEFT OUTER JOIN vwMaster2 on vwBillableCasesCalculation.PID = vwMaster2.PID  and clm_billing_type = 'Pro Only'
Where 
	(vwBillableCasesCalculation.BillableStatus = 'Billable'
		and ProClaims = 0 )
	or (vwBillableCasesCalculation.BillableStatus = 'Billable' and vwMaster2.folder not in ('Closed Billing Claims','Ongoing Insurance Billing'))
	and vwBillableCasesCalculation.dos >= '2015-01-01' 
	and vwBillableCasesCalculation.dos < '2016-01-01'



>>>>>>> origin/Modifications

---  HOSPITAL BILLING VERIFICATION ------
select vwhospitalBillings.PID, vwmaster2.DOS, vwmaster2.patient, clm_billing_type, invoice_amount as Hosp_Inv_Amount, ins_charged, ins_Collcted, folder
from vwHospitalBillings 
LEFT OUTER JOIN vwMaster2 ON vwHospitalBillings.PID = vwMaster2.PID
where clm_billing_type = 'Tech Only'
and invoice_amount > 0
and ins_charged > 0
and vwmaster2.dos >= '2014-01-01'
-------------------------------------


select * from case_report_3350

select * from information_schema.columns 
where  column_name like 'group%' = 'case_report_3350'

from  as CR
	LEFT OUTER JOIN claim_entity_3350 as CE on CE.patient_id = CR.PID
	LEFT OUTER JOIN claim_det_3350 as CD on CD.claim_id = CE.claim_seq
	LEFT OUTER JOIN patient_insurance_charges_3350 as PIC on ce.claim_seq = pic.claim_id
	LEFT OUTER JOIN insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
	LEFT OUTER JOIN PAsurgeonlookup as SL on CR.surgeon = SL.Surgeon and CR.dos >= sl.startdate and CR.dos<= sl.enddate



------------------------------------


select [1st Insurance Category], count(*) from vwbillablecasescalculation where techclaims =0 and BillStatusTech = 'Billable' group by [1st Insurance Category]


select count(*) from vwbillablecasescalculation where billstatustech = 'Billable'

select * from case_report_3300

select * from vwContractInsuranceMatrix where hospital = 'Lourdes Medical Center'
select * from hospitallookup where hospital = 'Lourdes Medical Center'

spEmailMisbilledclaims

select * from hospitallookup
select * from hosp_ins_3000
select * from hospitals_3300


-------------

create view vwContractInsuranceMatrix as 
select hosp.hospital,  contracttype, insurance_type
from hospitals_3300 as hosp
left outer join hospitallookup as hl on hl.hospital = hosp.hospital
left outer join hosp_ins_3000 as hi on hi.hospital_id = hosp.hospital_id



---- SEND EMAIL REPORTS TEST

    USE msdb
    EXEC sp_send_dbmail
      @profile_name = 'SendGrid',
      @recipients = 'JohnB@simplicityhealthsystems.com',
      @subject = 'T-SQL Query Result',
      @body = 'The result from SELECT is appended below.',
      @execute_query_database = 'USMON_Local',
      @query = 'SELECT  * from vwTechProductivity'

-- 

<<<<<<< HEAD
=======

select * from vwmaster2 where pid in ('378386','279231','242667')








>>>>>>> origin/Modifications
sprefreshdata

select * from vwmaster2 where billstatustech <> 'Unbillable'

select distinct Region_Short_Name from case_report_3300 order by Region_short_name


select distinct [insurance type] from vwmaster2 order by [insurance type]

select * from surgeonlookup where ProEntity = 'NNI'
update surgeonlookup set proentity = 'Neurodiagnostics & Neuromonitoring Institute, Inc.' where ProEntity = 'NNI'

select * from vwmaster2 where claim_id = '515996'

select * from vw

select * from vwIOMEntityAging where patient_id = '275507'
select * from claim_entity_3300 where patient_id = '275507'

select * from insurance_deposits_3300 where patient_id = '312539' order by date_collected desc

    spRefreshData
select * from surgeonlookup where proentity like 'JWJM%'
select max(surgeonid) from surgeonlookup
select * from surgeonlookup where surgeonid in ('439','440','441','442','443')

select * from techlookup

select * from vwvalidationcheckunmatchedinsurancelookup

update surgeonlookup set ProEntity = 'Horizon Neurodiagnostics, PLLC' where proEntity = 'Horizon Neurodiagnostics'
update surgeonlookup set ProEntity = 'Synapse Neuro, PLLC' where surgeonid in ('439','440','441','442','443')
update surgeonlookup set startdate = '2015-10-06' where surgeonid = '452'
update surgeonlookup set startdate = '2015-09-01' where surgeonid in ('450','451')
insert into surgeonlookup (surgeon, proentity, startdate, enddate) values ('Paul Vaughan, M.D.','Chandler Newsome Corp, PLLC','2015-10-27','2016-12-31')

select * from surgeonlookup where surgeon like '%mock%' in ('485','424')
update surgeonlookup set startdate = '2015-09-01' where surgeonid = '424'
delete from surgeonlookup where surgeonid = '424'

select * from surgeonlookup where surgeon like '%frazier%'
update surgeonlookup set enddate = '2015-08-30' where surgeonid = '480'

select distinct pid, billstatus, count(billstatus) from vwMaster2 
where entity like 'Neurom %'  and billstatus <> 'paid' and billstatus <> 'unbillable' 

select  [DOS MO],[Insurance Type], count(distinct PID)  from vwMaster2 
where entity like 'ACME%'  and [DOS YR] = 2015
group by [DOS MO],[Insurance Type] 
order by [DOS MO]

select * from surgeonlookup where proentity like 'Austx%'
update surgeonlookup set proentity = 'Austx Neuro, PLLC' where proentity = 'AUSTX Neuro'

select * from claim_charges_3300

select * from vwCases where defaultentity is null

select * from surgeonlookup order by Surgeon
select * from vwMaster2 where ins_charged = 0 and Folder in ( 'Ongoing Insurance Billing') and billstatus in ( 'Not Billed', 'Billed') 'Closed Billing Claims')

DECLARE @Entity varchar(50)
Set @Entity = 'Neuromonitoring%'
select * from vwMaster2 where entity like @Entity 
select * from vwMaster2 where [Total Collection] > 0 and Billstatus = 'Billed' and DOS > '2013-05-01'

select * from vwmaster2 where entity like 'ACME%' and billstatus like 'Part%' order by [Claim Date] desc
select * from vwmaster2 where entity like 'Alamo%' and billstatus like 'Bill%' order by [Claim Date] desc
select * from vwmaster2 where entity like 'Neuromonitoring%' and billstatus like 'Not %'  and  
        (clm_billing_type like 'Pro%' or clm_billing_type is null) 
        and dos < getutcdate()
        order by dos 
select distinct PID from vwmaster2 where entity like 'Neuromonitoring%' and billstatus like 'Not %'  and  clm_billing_type like 'Pro%'

select * from insurancelookup where InsuranceCompany like 'UH%'

select * from vwMaster2
select * from patient_insurance_charges_3300




--  ===========
-- Create Indexes
CREATE INDEX IX_ClaimEntity_patient_id 
    ON claim_entity_3300(patient_id);
CREATE INDEX IX_CaseReport_PID
    ON case_report_3300(PID);
CREATE INDEX IX_PatientInsuranceCharges_ClaimID
    on patient_Insurance_charges_3300(Claim_ID)
CREATE INDEX IX_EntityLookup_ClientName
    on entitylookup(client_name)
CREATE INDEX IX_insurancelookup_InsuranceCompany
    on insurancelookup(InsuranceCompany)
CREATE INDEX IX_surgeonlookup_surgeon
    on surgeonlookup(surgeon)
CREATE INDEX IX_insurancetypelookup_InsuranceType
    on insurancetypelookup(insurancetype)
CREATE INDEX IX_hospitallookup_hospital
    on hospitallookup(hospital)

select * from insurancetypelookup
select * from surgeonlookup




select * from view_billingcount where entity like 'Alamo%' and billstatus like 'Not %'  and  (clm_billing_type like 'Pro%' or clm_billing_type is null) order by dos 

select * from view_payermix where defaultentity like 'austx%'
select * from surgeonlookup where proentity like 'austx%'

--=====================================
SELECT        BillStatus, Entity, COUNT(BillStatus) AS count
FROM            (SELECT DISTINCT PID, Entity, BillStatus
                         FROM            dbo.vwMaster2
                          WHERE        (BillStatus <> 'paid') AND (BillStatus <> 'unbillable') AND (clm_billing_type <> 'Tech Only' or clm_billing_type is null) AND (Folder <> 'Closed Billing Claims' OR
                                                    Folder IS NULL)) AS bs
                                                    where entity like 'CTSI%'
GROUP BY Entity, BillStatus
------------------------




select  surgeon, DOS, patient, DefaultEntity, (select ProEntity from surgeonlookup where surgeon = vwCases.Surgeon) as InvalidProEntity,
    (select EndDate from surgeonlookup where surgeon = vwCases.Surgeon) as EndDate from vwcases 
    where defaultentity is null and dos > '2015-01-01' order by surgeon

    select *  from  vwCases where surgeon in (select distinct surgeon from vwCases where defaultentity is null and dos > '2015-01-01') 
                and defaultentity is null order by DOS
    select * from surgeonlookup where surgeon in (select distinct surgeon from vwCases where defaultentity is null and dos > '2015-01-01') 
    
    select (case when '2015-08-11' > '2015-08-11' then 'True' else 'False' end) as Test
    select * from vwCases where surgeon like '%kauf%'  order by dos

    select * from claim_det_33300
    
    select *, case when correctentity <> Box33 and clm_billing_type ='Pro Only' then 'No' else 'Yes' end from vwMaster2 
    select * from vwMaster2 where 
        correctentity <> Box33 and clm_billing_type ='Pro Only' and DOS > '2014-01-01' and BillStatus <> 'Unbillable' 
        and biller in ('Acquisition Billing Services','Acquisition Billing Services')
        order by dos desc

        select * from surgeonlookup where surgeon like '%Loredo%'

    select dateadd("hh",23,'2015-08-01')
    select cast( getdate() as float)

    select cast('2015-11-01 00:00:00' as date)
    select * from case_report_3300

    select * from insurance_deposits_3300
select * from claim_charges_3300
    
 




select distinct CR.surgeon from dbo.case_report_3300 as CR  
Left Outer Join 
    dbo.surgeonlookup sl on CR.surgeon = sl.surgeon and CR.dos > sl.startdate  and CR.dos < sl.enddate
WHERE        (CR.Deleted <> 'Yes') AND (CR.Cancelled <> 'Yes') and DOS > '2015-01-01'
order by CR.surgeon


select * from surgeonlookup where EndDate < '2016-12-31'  order by surgeon
update surgeonlookup set enddate = '2016-12-31' where enddate = '2015-09-15'

select * from vwCases where defaultentity like 'Frisco%'
select * from view_PayerMix where defaultentity like 'JJDN%' order by DOS asc
select  Year(DOS), Month(DOS) as Month,InsuranceType, Count(defaultentity) from view_PayerMix where defaultentity like 'JJDNM%' and DOS > '2014-01-01'
    group by Year(DOS), Month(DOS), InsuranceType order by month(DOS), InsuranceType

select * from surgeonlookup where proentity like 'Frisco%'
update surgeonlookup set proentity = 'Frisco Neurosurgical, PLLC'


select * from vwMaster2 where entity like 'JJDNM%' order by DOS asc
sprefreshdata

select * from vwMaster2 where defaultentity like 'ACME%'  and DOS >= '2015-01-01' order by DOS

select [Insurance Type], count(PID) from
(
select distinct pid, DOS, [DOS MO], Patient, Surgeon, [Insurance Type]  from vwMaster2 where defaultentity like 'ACME%'  and DOS >= '2015-01-01' )
 group by [Insurance Type]

 select [1st Insurance Category], count(PID) from vwCases where  DOS > = '2015-01-01' and DOS <= '2015-10-14' group by [1st Insurance Category]
 
 
 select  case when [1st Insurance Category] = 'Private Insurance' or [1st Insurance Category] = 'Letter of Protection' or [1st Insurance Category] = 'Lein Case' Then 'Private'
              else 'Other'
              end
              as [Insurance Type],
         DOS, DefaultEntity
 from vwCases 
 where DefaultEntity like 'ACME%' and DOS > = '2015-01-01' and DOS <= GETDATE() 





select * from vwMaster2 
select * from surgeonlookup

select * from vwMaster2 where entity like 'ACME%'  and billstatus <> 'paid' and billstatus <> 'unbillable' and billstatus = 'Not Billed'
and folder <> 'Closed Billing Claims'
order by [Insurance Type]

select billstatus, count(billstatus) from vwMaster2 where entity like 'ACME%' and  billstatus = 'Billed' group by billstatus

select * from vwMaster2 where entity like 'Pinn%' and billstatus like 'part%' group by billstatus
select * from vwMaster2 where pid = '61208'

select billstatus, entity, count(billstatus) as count from 
(
    select distinct PID, entity, billstatus from vwMaster2 where entity like 'ACME%'  and billstatus <> 'paid' and billstatus <> 'unbillable'  
    and folder <> 'Closed Billing Claims'
) as bs group by bs.entity, bs.billstatus

    select distinct PID, dos, patient, entity, billstatus from vwMaster2 where entity like 'ACME%'  and billstatus <> 'paid' and billstatus <> 'unbillable'  
    and folder <> 'Closed Billing Claims' and billstatus = 'Not Billed' order by PID

    select * from view_billingcount where entity like 'ACME%'
    select * from vwMaster2 where PID = '304173'
    select * from vwMaster2 where entity like 'ACME%' and billstatus <>'paid' and billstatus <> 'unbillable' 
        and  (folder <> 'Closed Billing Claims' or folder is null) and PID = '304173'
    select * from vwMaster2 where entity like 'ACME%' and billstatus <>'paid' and billstatus <> 'unbillable' 
        and  folder not in( 'Closed Billing Claims') and PID = '304173'



select distinct entity from vwMaster2 order by entity

select * from vwMast

select * from errorlog

select distinct insurancegroup  from insurancelookup
select * from entitylookup
select billstatus, count(*) from vwMaster2 where entity like 'ACME%'  and billstatus <> 'paid' and billstatus <> 'unbillable' 
select [1st insurance category], count(*) from case_report_3300 group by [1st insurance category] order by [1st insurance category]
select distinct [1st insurance category] from case_report_3300 order by [1st insurance category]
select * from surgeonlookup where ProEntity = 'Insite' and enddate > '2014-08-31'
select * from surgeonlookup where surgeon = 'Joel Jenne' order by startdate

select * from case_report_3300 where pid in ('324614','325716')

select * from 
    select * from  claim_entity_3300 as CE where patient_id  in ('324614','325716')
    select * from  claim_det_33300 as CD where claim_id in ('489211', '490730','490731')
    select * from  patient_insurance_charges_3300 as PIC on ce.claim_seq = pic.claim_id
    select * from  entitylookup as EL on PIC.client_name = EL.client_name  
    select * from  insuranceTypelookup as ITL on ITL.insurancetype = PIC.insurance_type
    select * from insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
    select * from  hospitallookup as HL on HL.Hospital = CR.Hospital
    select * from  surgeonlookup as SL on CR.surgeon = SL.Surgeon


select distinct entity from vwmaster2 order by entity asc

select * from vwCases where patient like 'engligh%'
select * from surgeonlookup where surgeon like 'Presley%'
select * from techregionlookup where tech like 'Rob Sal%'

delete from techregionlookup where tech = 'Jackie Carolus, DC,CNIM'
insert into techregionlookup values ('Jackie Carolus, DC,CNIM', 'SA')

delete from surgeonlookup where surgeonID = 294


select * from vwMaster2 
where entity is null

select * from surgeonlookup
select * from case_report_3300

select defaultentity, month(dos) as [Month], AVG(cast(Reader_days_to_signoff as Decimal(10,2))) from vwcases where dos > '2015-01-01' group by defaultentity,month(Dos) order by defaultentity, month(DOS)
select * from vwcases

AVG(CAST(opening_amt AS DECIMAL(12,2))) AS SQLAVG 
CAST(AVG(advance_amount) AS DECIMAL(10,2)) 

select top 10 * from history_3300 order by date_changed desc

 --- To recap:  No pro claim is issued when the insurance type as Tricare and the reader is not Krane, Katuna, Lee or Ibrahim,
 ---            No pro claim is issued when the insurance type is BCBS and the reader Krane or High



select * from vwmaster2 where billstatustech = 'Unbillable' and [Con Ins Type] = 'workmans comp'

select distinct month(dos), count(distinct PID) as cases, count(distinct claim_id) as claims, count(distinct client_name) from vwMaster2 
where biller  = 'Acquisition Billing Services' 
    and dos >= '2015-01-01' 
    and clm_billing_type = 'Pro Only'
group by month(dos) order by month(dos)

select * from vwMaster2 where biller = 'Acquisition Billing Services' and dos >= '2015-01-01' and dos < '2015-02-01' and clm_billing_type = 'Pro Only' order by pid

select * from vwMaster2 where dos > '2015-08-01' and folder = 'New Insurance Billing' and (ins_charged is null  or ins_charged = 0)
select distinct folder from vwMaster2 

select * from tech_sign_off_3300

select sum(payment_collected) from vwInsuranceDeposits where date_Collected > '2015-09-01' and payment_collected > 0

select entity from vwinsurancedeposits


select distinct entity from vwMaster2 order by entity

select * from vwMaster2 where PID = 334746
select top 100 * from claim_entity_3300

SELECT t1.name
FROM table1 t1
LEFT JOIN table2 t2 ON t2.name = t1.name
WHERE t2.name IS NULL

select CR.PID, CR.DOS, CR.Patient, CE.First_Name, CE.Ins_folder 
from case_report_3300 as CR
    LEFT JOIN claim_entity_3300 as CE on CE.patient_id = CR.PID
    LEFT OUTER JOIN claim_det_33300 as CD on CD.claim_id = CE.claim_seq
    LEFT OUTER JOIN patient_insurance_charges_3300 as PIC on ce.claim_seq = pic.claim_id
    LEFT OUTER JOIN entitylookup as EL on PIC.client_name = EL.client_name  
    LEFT OUTER JOIN insuranceTypelookup as ITL on ITL.insurancetype = PIC.insurance_type
    LEFT OUTER JOIN insurancelookup as IL on IL.insurancecompany = CR.[Primary Insurance]
    LEFT OUTER JOIN hospitallookup as HL on HL.Hospital = CR.Hospital
--Where CE.patient_id is null
where CR.dos > '2013-01-01' 
    and CR.Cancelled <> 'Yes'
    and CR.Deleted <> 'Yes'
    and (CE.ins_folder <> 'Deleted Claims' or CE.ins_folder is null)
order by CR.dos desc


select * from vwCPTClaimDetail where collected is null

select * from claim_charges_3300

select * from history_3300 where  field_changed = 'Auditer Sign Off'

select count(*) from vwmaster2

select  PID, count(PID) from vwCases  group by PID having count(PID) > 1

select * from surgeonlookup where surgeon like 'Frederi%'
delete from surgeonlookup where surgeonid = '416'

select * from vwCases where PID = '334811'
/***************/
alter view vwHL7_Raw as 
select distinct patient_id, [Primary Policy, Group ID/Secondary ID No] as GroupID from hl7_raw_data_3300


select distinct note_type from notes_3300 order by note_type 

select count(*) from notes_3300
select count(*) from notes_3300 where note_type in ('Auditor Notes','PO Comments','QA Comments')

/***************/
create view vwAuditorNotes as 
select * from notes_3300 where note_type in ('Auditor Notes','PO Comments','QA Comments')


select * from vwValidationCheckUnmatchedInsuranceLookup
select * from vwValidationCheckUnMatchedSurgeonDates
select * from vwValidationCheckUnMatchedSurgeons
select * from vwValidationCheckUnMatchedTechRegionLookup






