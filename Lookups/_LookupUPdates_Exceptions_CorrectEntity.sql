CREATE TABLE CorrectEntityExceptions (
    ClaimID int,
    PID int,
    CorrectEntity varchar(255)
);
CREATE INDEX CEE_ClaimID ON CorrectEntityExceptions (ClaimID);  
CREATE INDEX CEE_PID ON CorrectEntityExceptions (PID);  

CREATE VIEW vwCorrectEntityExceptionsByPID AS
select distinct PID, CorrectEntity from CorrectEntityExceptions

select * from vwCorrectEntityExceptionsByPID

INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(515996,'ABV Neuromonitoring, PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(779334,'Alamo City Neurodiagnostics, PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(617825,'RRV Neuromonitoring PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(630007,'RRV Neuromonitoring PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(654641,'RRV Neuromonitoring PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(367261,'HKJ Med, PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(357332,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(354211,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(354292,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(347908,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(298807,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(735450,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(735444,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(735435,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(735443,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(742160,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(777073,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(777855,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(778171,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(778298,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(778276,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(788164,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(793966,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(773616,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(765268,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(697524,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(593754,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(701429,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(774622,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(675342,'RRV Neuromonitoring PLLC                          ')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(677257,'RRV Neuromonitoring PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(683545,'RRV Neuromonitoring PLLC')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(711162,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(701379,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(695792,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(711224,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(703082,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(864147,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(855841,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(855838,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(855824,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(855772,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(855760,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(853806,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(853801,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(853799,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(763832,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(764047,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(838040,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(908716,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(908697,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(910821,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(908581,'Neurodiagnostics & Neuromonitoring Institute, Inc.')
INSERT INTO CorrectEntityExceptions (ClaimID, CorrectEntity) VALUES(908566,'Neurodiagnostics & Neuromonitoring Institute, Inc.')

--ticket 2222 lauren, ran it in lookupupdates but adding here for next time
select * from correctentityexceptions
select * from correctentityexceptions where claimid = 894105
insert into correctentityexceptions (claimid, PID, correctentity) values (894105,738120,'Neurodiagnostics & Neuromonitoring Institute, Inc.')


UPDATE CorrectEntityExceptions SET PID = 343507 WHERE claimid = 515996
UPDATE CorrectEntityExceptions SET PID = 433968 WHERE claimid = 593754
UPDATE CorrectEntityExceptions SET PID = 461920 WHERE claimid = 617825
UPDATE CorrectEntityExceptions SET PID = 475127 WHERE claimid = 630007
UPDATE CorrectEntityExceptions SET PID = 504144 WHERE claimid = 654641
UPDATE CorrectEntityExceptions SET PID = 521290 WHERE claimid = 675342
UPDATE CorrectEntityExceptions SET PID = 525542 WHERE claimid = 677257
UPDATE CorrectEntityExceptions SET PID = 527117 WHERE claimid = 683545
UPDATE CorrectEntityExceptions SET PID = 529219 WHERE claimid = 695792
UPDATE CorrectEntityExceptions SET PID = 525878 WHERE claimid = 697524
UPDATE CorrectEntityExceptions SET PID = 543123 WHERE claimid = 701379
UPDATE CorrectEntityExceptions SET PID = 518238 WHERE claimid = 701429
UPDATE CorrectEntityExceptions SET PID = 530012 WHERE claimid = 703082
UPDATE CorrectEntityExceptions SET PID = 543710 WHERE claimid = 711162
UPDATE CorrectEntityExceptions SET PID = 548266 WHERE claimid = 711224
UPDATE CorrectEntityExceptions SET PID = 569546 WHERE claimid = 735435
UPDATE CorrectEntityExceptions SET PID = 577765 WHERE claimid = 735443
UPDATE CorrectEntityExceptions SET PID = 574362 WHERE claimid = 735444
UPDATE CorrectEntityExceptions SET PID = 574403 WHERE claimid = 735450
UPDATE CorrectEntityExceptions SET PID = 590463 WHERE claimid = 742160
UPDATE CorrectEntityExceptions SET PID = 606800 WHERE claimid = 763832
UPDATE CorrectEntityExceptions SET PID = 607477 WHERE claimid = 764047
UPDATE CorrectEntityExceptions SET PID = 607480 WHERE claimid = 765268
UPDATE CorrectEntityExceptions SET PID = 549577 WHERE claimid = 773616
UPDATE CorrectEntityExceptions SET PID = 620998 WHERE claimid = 774622
UPDATE CorrectEntityExceptions SET PID = 627226 WHERE claimid = 777073
UPDATE CorrectEntityExceptions SET PID = 628336 WHERE claimid = 777855
UPDATE CorrectEntityExceptions SET PID = 629438 WHERE claimid = 778171
UPDATE CorrectEntityExceptions SET PID = 621107 WHERE claimid = 778276
UPDATE CorrectEntityExceptions SET PID = 607959 WHERE claimid = 778298
UPDATE CorrectEntityExceptions SET PID = 624536 WHERE claimid = 779334
UPDATE CorrectEntityExceptions SET PID = 630028 WHERE claimid = 788164
UPDATE CorrectEntityExceptions SET PID = 634612 WHERE claimid = 793966
UPDATE CorrectEntityExceptions SET PID = 682760 WHERE claimid = 838040
UPDATE CorrectEntityExceptions SET PID = 611878 WHERE claimid = 853799
UPDATE CorrectEntityExceptions SET PID = 611862 WHERE claimid = 853801
UPDATE CorrectEntityExceptions SET PID = 610905 WHERE claimid = 853806
UPDATE CorrectEntityExceptions SET PID = 607476 WHERE claimid = 855760
UPDATE CorrectEntityExceptions SET PID = 606867 WHERE claimid = 855772
UPDATE CorrectEntityExceptions SET PID = 606861 WHERE claimid = 855824
UPDATE CorrectEntityExceptions SET PID = 605579 WHERE claimid = 855838
UPDATE CorrectEntityExceptions SET PID = 605560 WHERE claimid = 855841
UPDATE CorrectEntityExceptions SET PID = 579985 WHERE claimid = 864147
UPDATE CorrectEntityExceptions SET PID = 738120 WHERE claimid = 894105
UPDATE CorrectEntityExceptions SET PID = 595208 WHERE claimid = 908566
UPDATE CorrectEntityExceptions SET PID = 559303 WHERE claimid = 908581
UPDATE CorrectEntityExceptions SET PID = 533587 WHERE claimid = 908697
UPDATE CorrectEntityExceptions SET PID = 610952 WHERE claimid = 908716
UPDATE CorrectEntityExceptions SET PID = 540947 WHERE claimid = 910821

-- 9/18/17
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

--Ticket #2471
select * from CorrectEntityExceptions where PID = '930530'
insert into CorrectEntityExceptions (ClaimID,PID,CorrectEntity) values ('930530','763797','Ahai, PLLC')

--DR	
insert into CorrectEntityExceptions (ClaimID,PID,CorrectEntity) values ('969160','766899','Pro Read, LLC')



