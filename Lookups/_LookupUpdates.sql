select * from hospitallookup
select * from surgeonlookup
select * from techregionlookup
select * from entitylookup


SELECT Column_name FROM INFORMATION_SCHEMA.COLUMNS where table_name = 'hospitallookup'

update techregionlookup set [assigned region] = 'AUS' where tech = 'Joel McMillian, CNIM'
select * from techregionlookup where tech like 'Brad%'
Cor surgeon like 'brent%'
select * from surgeonlookup where surgeon like 'Ralph%'
update surgeonlookup set enddate = '2015-06-23' where surgeonID = 273
select * from vwCases where patient like 'Garcia, Gusta%'
select * from surgeonlookup where surgeon like 'Frederick%'
delete from surgeonlookup where surgeonID = 295

update surgeonlookup set enddate = '2016-12-31' where enddate = '2015-09-15'
tech

delete from hospitallookup
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2475','Advanced Surgery Center of San Antonio','18414 US HIGHWAY 281 N','','78259-7610','South Texas Neuromonitoring','1225439250','TRUE','42033','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1203','Alamo Bone & Joint Clinic','','','','South Texas Neuromonitoring','','FALSE','41379','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1303','Arise Austin Medical Center','3003 Bee Cave Road','','78746','Austin','1700968427','FALSE','41479','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('595','Babcock Surgical Center','','','','South Texas Neuromonitoring','','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1453','Baylor Irving','1901 N McArthur Blvd','','','National Neuromonitoring - DFW','','TRUE','41578','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('830','Baylor Medical Center at Grapevine','1650 W College St.','','76051','National Neuromonitoring - DFW','1073511762','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('901','Baylor Medical Center at McKinney','5252 W. University Drive','','75071','National Neuromonitoring - DFW','1124305065','FALSE','41113','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2248','Baylor Medical Center at Uptown','','','','National Neuromonitoring - DFW','','FALSE','42010','Equipment','41960')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1018','Baylor Medical Center Carrollton','4343 N Josey Ln.','','75010-4603','National Neuromonitoring - DFW','1952509465','FALSE','41263','Technical Services','41368')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1017','Baylor Plano Hospital','4700 Alliance Blvd.','','75093','National Neuromonitoring - DFW','1649273434','FALSE','41263','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1612','Baylor Surgicare Grapevine','2040 W State Highway 114','','76051','National Neuromonitoring - DFW','1295702942','FALSE','41680','Equipment','41675')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Baylor Regional Medical Center at Grapevine','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1622','Castle Hill Surgery Center','1646 Lockhill-Selma Rd','','78213-1929','South Texas Neuromonitoring','1083964001','FALSE','41688','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('968','Cedar Park Regional Medical Center','','','','Austin','','FALSE','41194','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('935','Cedar Park Surgery Center','351 Cypress Creek Road','#102','78613','Austin','1568776615','FALSE','41183','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('982','Centennial Hills Hospital','','','','Las Vegas','','FALSE','41213','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1013','Centennial Medical Center','12505 Lebanon Rd','','','National Neuromonitoring - DFW','1801826839','FALSE','41263','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('391','CHRISTUS Santa Rosa - Children''s Hospital','333 N. Santa Rosa Street','','78207','South Texas Neuromonitoring','1821004151','TRUE','40582','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('300','CHRISTUS Santa Rosa Ambulatory Surgery Center - New Braunfels','1738 E Common Street','','78130','South Texas Neuromonitoring','1598744856','FALSE','','Supplies Only','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('914','CHRISTUS Santa Rosa Hospital - Alamo Heights','','','','South Texas Neuromonitoring','','TRUE','41141','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('394','CHRISTUS Santa Rosa Hospital - City Centre','333 N. Santa Rosa Street','','78207','South Texas Neuromonitoring','1194787218','TRUE','40602','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('313','CHRISTUS Santa Rosa Hospital - Medical Center','2827 Babcock Road','','78229','South Texas Neuromonitoring','1194787218','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('279','CHRISTUS Santa Rosa Hospital - New Braunfels','600 North Union Avenue','','78130-4194','South Texas Neuromonitoring','1194787218','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('310','CHRISTUS Santa Rosa Hospital - Westover Hills','11212 State Highway 151','','78251','South Texas Neuromonitoring','1194787218','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('291','Citizens Medical Center','2701 Hospital Drive','','77901','South Texas Neuromonitoring','','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('601','Cypress Fairbanks Medical Center','','','','National Neuromonitoring - Houston','','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('980','Cypress Pointe Hospital','42570 South Airport Rd','','','Louisiana','1790094985','FALSE','41211','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('975','Cypress Pointe Hospital East','989 Robert Blvd','','70458','Louisiana','1043392491','FALSE','41206','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('803','Dallas Medical Center','7 Medical Pkwy','','75234','National Neuromonitoring - DFW','1861690364','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('307','DeTar Healthcare System                 ','506 E. San Antonio St                             ','                                                  ','77902','South Texas Neuromonitoring','','','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('287','DETAR HOSPITAL-  NAVARRO                ','506 E SAN ANTONIO ST                              ','                                                  ','          ','South Texas Neuromonitoring','','','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1014','Doctors Hospital at White Rock Lake','9440 POPPY DR','','75218-3652','National Neuromonitoring - DFW','1699705426','FALSE','41263','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2417','Elite Center for Minimally Invasive Surgery','6655 Travis St., Ste. 200','','77030','National Neuromonitoring - Houston','1861715815','TRUE','42018','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2054','Elite Orthopedic Spine and Surgery Center','1605 Airport Fwy.','','76021','National Neuromonitoring - DFW','1558780130','TRUE','41957','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2419','Elite Sinus and Ortho, LLC','4120 Southwest Fwy. Ste. 100','','77027','National Neuromonitoring - Houston','1831528025','TRUE','42018','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('822','FAITH Surgical Center','3716 Standbridge Dr.','Suite 100','75056','National Neuromonitoring - DFW','1164703815','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Forest Park Medical Center at Frisco','','','','National Neuromonitoring - DFW','','','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1731','Forest Park Frisco','5500 Frisco Sq Blvd','','75034','National Neuromonitoring - DFW','1801162250','FALSE','41758','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('805','Forest Park Medical Center','11990 N Central Expressway','','75235','National Neuromonitoring - DFW','1659543429','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2073','Forest Park Medical Center San Antonio','','','','South Texas Neuromonitoring','','','41967','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1597','Forest Park SL','421 E State Highway 114','','76092','National Neuromonitoring - DFW','1801134903','TRUE','41660','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('314','Foundation Surgical Hospital','9522 Huebner Road','','78240','South Texas Neuromonitoring','1932284411','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2566','Frisco Ambulatory Surgery Center','','','','National Neuromonitoring - DFW','','','42047','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('585','Guadalupe Regional Medical Center','1215 E Court St','','78155','South Texas Neuromonitoring','1720088123','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('993','Hays Surgery Center','135 Bunton Creek Road','','78640','Austin','1861766016','FALSE','41225','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('648','Hopkins County Memorial Hospital','115 Airport Rd','','','National Neuromonitoring - DFW','1902072283','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2416','Houston Metro Orthopedic and Spine','4219 Richmond Ave.','','77027','National Neuromonitoring - Houston','1952697682','TRUE','42018','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('517','Humble Surgical Hospital','1475 FM 1960 Bypass Rd E','','77338-3909','National Neuromonitoring - Houston','','FALSE','41442','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('800','Hyde Park Surgery Center','4611 Guadalupe St.','','78751','Austin','1962671487','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('505','Innova Hospital - San Antonio','4243 E. Southcross Blvd.','','78222','South Texas Neuromonitoring','1801805395','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1829','Lake Pointe Medical Center','6800 Scenic Dr.','','75088','National Neuromonitoring - DFW','1467478438','TRUE','41821','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1319','Legacy Surgery Center','','','','National Neuromonitoring - DFW','','','41502','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('937','Lourdes Medical Center','520 N 4th Ave','','99301','Tri-Cities','1831284280','FALSE','41185','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('821','Medical Center McKinney','4500 Medical Center Dr','','75069','National Neuromonitoring - DFW','1437102639','FALSE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2034','Medical Center of Arlington','3301 Matlock Rd.','','76015','National Neuromonitoring - DFW','1134172406','TRUE','41948','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1226','Medical Center Plano','3901 W 15TH ST','','75075-7738','National Neuromonitoring - DFW','1699726406','FALSE','41416','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1327','Methodist Ambulatory Surgery Center- North Central','19010 STONE OAK PKWY','','78258-3225','South Texas Neuromonitoring','1922075167','FALSE','41512','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('631','Methodist Ambulatory Surgical Hospital','9150 Huebner Rd #100','','78240','South Texas Neuromonitoring','1871560003','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('306','Methodist Children''s Hospital','7700 Floyd Curl Drive','','','South Texas Neuromonitoring','','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1015','Methodist Hospital for Surgery','17101 Dallas Parkway','','75001','National Neuromonitoring - DFW','1023338142','FALSE','41263','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('296','Methodist Main','7700 Floyd Curl Drive','','78229-3902','South Texas Neuromonitoring','1124074273','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1322','Methodist McKinney','8000 Eldorado Pkwy','','75070','National Neuromonitoring - DFW','1952538431','TRUE','41506','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('298','Methodist Metropoliitan','1310 McCullough Avenue','','78212','South Texas Neuromonitoring','1124074273','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1225','Methodist Richardson Hospital','401 W CAMPBELL ROAD','','75080-3416','National Neuromonitoring - DFW','1033165501','FALSE','41415','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('277','Methodist Stone Oak Hospital','1139 E Sonterra Blvd.','','78258-3999','South Texas Neuromonitoring','1659525236','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1220','Microsurgical Spine Center','1519 3rd Street, SE','Suite 102','98372','Tri-Cities','1275510141','FALSE','41409','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('588','Mission Trail Baptist Hospital','3333 Research Plaza','','78235','South Texas Neuromonitoring','1598744856','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('315','Nix Healthcare System','414 Navarro','Suite 1720','78205-2522','South Texas Neuromonitoring','1801168190','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('976','North Austin Medical Center','12221 North Mopac Expressway','','78758-4621','Austin','1629021845','TRUE','41206','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('311','North Central Baptist Hospital','520 Madison Oak Drive','','78258','South Texas Neuromonitoring','1598744856','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('395','Northeast Baptist Hospital','8811 Village Dr.','','78217','South Texas Neuromonitoring','1598744856','TRUE','40610','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('275','Northeast Methodist Hospital','12412 Judson Rd.','','78233-3255','South Texas Neuromonitoring','1124074273','TRUE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1552','Northwest Hills Surgical Hospital','6818 Austin Center Blvd','','78731','Austin','1245292630','TRUE','41621','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1846','Northwest Surgery Center','1110 N. 35th Ave.','','98902','Tri-Cities','1477973634','FALSE','41838','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('605','Orthopedic Surgery Center','400 Concord Plaza Dr. #200','','78216','South Texas Neuromonitoring','1083659866','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('604','Paris Regional Medical Center','865 Deshong Dr','','75460','National Neuromonitoring - DFW','1063411767','FALSE','','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1053','Parkview Medical Center','400 W 16th St.','','81003','Colorado Springs','1104881507','FALSE','41290','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1960','Parkway Surgical & Cardiovascular Hospital','3200 North Tarrant','','76177','National Neuromonitoring - DFW','','FALSE','41919','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('285','PASC II','423 TREELINE PARK','SUITE 202','78209','South Texas Neuromonitoring','1194718684','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2413','Penrose Hospital','2222 N NEVADA AVE','','80907-6819','Colorado Springs','1053485193','TRUE','42017','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('278','Physician''s Ambulatory Surgery Center','403 Treeline Park #100','','78209','South Texas Neuromonitoring','','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('804','Pine Creek Medical Center','9032 Harry Hines Blvd','','75235-1720','National Neuromonitoring - DFW','1659374585','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1016','Presbyterian Hospital of Plano','6200 W. Parker Rd.','','75093-7939','National Neuromonitoring - DFW','1073664116','FALSE','41263','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1830','Presbyterian Rockwall','','','','National Neuromonitoring - DFW','','','41821','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1837','Providence St. Peter Hospital','413 Lilly Rd. NE','','98506','Tri-Cities','1487696787','FALSE','41829','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2245','Regional Medical Center at Sunnyvale','','','','National Neuromonitoring - DFW','','','42009','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('965','Round Rock Medical Center','2400 Round Rock Ave','','78681-4004','Austin','1699729681','TRUE','41194','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1840','Saint Raphael''s Surgery Center','18518 Hardy Oak Blvd., Ste. 100','','78258','South Texas Neuromonitoring','1821411885','TRUE','41834','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('640','San Marcos Surgery Center','1891 Medical Parkway','','78666','South Texas Neuromonitoring','1487732657','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2257','Seton Medical Center','','','','Austin','','','42013','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('966','Seton Medical Center Williamson','','','','Austin','','FALSE','41194','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1050','South Peninsula Hospital','203 W PIONEER AVE','','99603','Alaska-Homer','1164400750','FALSE','41288','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('276','South Texas Spine & Surgical Hospital','18600 Hardy Oak Blvd.','','78258','South Texas Neuromonitoring','1295890093','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('284','South Texas Surgical Center','214 Medical','','78155-5307','South Texas Neuromonitoring','1306830500','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('984','Southern Hills Hospital','','','','Las Vegas','','FALSE','41213','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('594','Southwest General','7400 Barlite Boulevard','','78224-1362','South Texas Neuromonitoring','1912906298','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('281','Southwest Texas Methodist (Main)        ','7700 Floyd Curl Dr                                ','                                                  ','78240','South Texas Neuromonitoring','','','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('985','Spring Valley Hospital','','','','Las Vegas','','FALSE','41213','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('802','St. David''s Medical Center','919 E. 32nd St','','78705','Austin','1720033947','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2421','St. Francis Medical Center','8402 COOPER RIVER DR','','80920-4246','Colorado Springs','1720211378','TRUE','42018','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('282','St. Luke''s Baptist Hospital','7930 Floyd Curl Drive','','78240','South Texas Neuromonitoring','1598744856','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1054','St.Mary-Corwin Medical Center','1008 Minnequa Ave','','81004','Colorado Springs','1306857974','TRUE','41292','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2047','Star Medical Center','','','','National Neuromonitoring - DFW','','FALSE','41953','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1336','Stone Oak Surgery Center','123 N LOOP 1604 E','','78232-1388','South Texas Neuromonitoring','1407144132','FALSE','41523','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1031','Stonebridge Surgery Center','8855 Synergy Dr','','75070','National Neuromonitoring - DFW','1972878726','FALSE','41278','Supplies Only','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('977','Stonegate Surgery Center','2501 W William Cannon Dr','#301','78745','Austin','1740231489','FALSE','41206','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('983','Sunrise Hospital','','','','Las Vegas','','FALSE','41213','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1804','SurgCenter of Westover Hills','1927 Rogers Rd','','78251','South Texas Neuromonitoring','1205267341','FALSE','41803','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2407','TEMPLATE','','','','National Neuromonitoring - DFW','','TRUE','42016','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('807','Texas General Hospital','','','','National Neuromonitoring - DFW','','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1337','Texas Health Harris Methodist HEB','1600 Hospital Pkwy','','76022','National Neuromonitoring - DFW','1104845015','FALSE','41523','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1012','Texas Institute for Surgery','7115 Greenville Ave','','','National Neuromonitoring - DFW','','FALSE','41263','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1865','The Center for Special Surgery @ TCA','21 Spurs Lane Ste. SL 100','','78240','South Texas Neuromonitoring','1801854591','FALSE','41857','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2418','The Hospital for Surgical Excellence at OakBend Medical Center','1211 Highway 6, Ste., 70','','77478','National Neuromonitoring - Houston','','TRUE','42018','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1160','Tri-Cities Orthopedic ASC','821 Swift Blvd','','99352','Tri-Cities','1215020144','FALSE','41332','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1008','Trios Health','900 S. Auburn St.','','99336','Tri-Cities','1255367611','FALSE','41254','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1662','USMD Hospital at Arlington, L. P.','801 W Interstate 20','','76017-5851','National Neuromonitoring - DFW','1659352987','TRUE','41723','Technical Services','41852')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1663','Victory Medical Center Craig Ranch','6045 Alma Rd','#100','75070-2188','National Neuromonitoring - DFW','1164867198','TRUE','41723','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1630','Victory Medical Center Hurst','1612 Hurst Town Center Dr','','76054','National Neuromonitoring - DFW','1013260744','TRUE','41697','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1335','Victory Medical Center Landmark','5330 North Loop 1604 W','','78249','South Texas Neuromonitoring','1568801116','TRUE','41523','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1060','Victory Medical Center Plano','2301 Marsh Lane','','75093','National Neuromonitoring - DFW','1922384114','TRUE','41299','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('787','Westlake Surgical Hospital','5656 Bee Caves Road','','78746','Austin','1043328198','FALSE','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('967','Williamson Surgery Center','','','','Austin','','FALSE','41194','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Forest Park Medical Center - Southlake','','','','','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Resolute Health Hospital','','','','','','','','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Baptist Medical Center','','','','','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Baylor Regional Medical Center at Irving','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Baylor Regional Medical Center at McKinney','','','','National Neuromonitoring - DFW','','','','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Baylor Regional Medical Center at Plano Hospital','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Forest Park SOUTHLAKE','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Forest Park DALLAS','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('1054','St. Mary-Corwin Medical Center','','','','Colorado Springs','','TRUE','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('2830','Precinct Ambulatory Surgery Center','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Austin Medical Center','','','','Austin','','','','Equipment','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Hurst d/b/a Precinct Ambulatory Surgery Center','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Austin Midtown Ambulatory Surgical Center','','','','Austin','','','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Walnut Hill Medical Center','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Forest Park Medical Center at San Antonio','','','','South Texas Neuromonitoring','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Longview Regional Medical Center','','','','National Neuromonitoring - DFW','','','','No Contract','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Elite Surgery Center, an ITH Affiliate','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Nacogdoches Memorial Hospital','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','Surgery Center of Plano','','','','National Neuromonitoring - DFW','','','','Technical Services','')
INSERT INTO HOSPITALLOOKUP (Hospital_ID, Hospital, Address1, Address2, Zip, Region, hosp_npi, InvoiceHospForSome, [Date Added], [Contract Type], Effective) VALUES('','ASID-Ambulatory Surgical Inst. of Dallas','','','','National Neuromonitoring - DFW','','','','Technical Services','')

-- Ticket #344
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Alliance Health Deaconess','Oklahoma-OKC','No Contract')
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Crescent Medical Center Lancaster','National Neuromonitoring - DFW','Technical Contract')
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Hermann Drive Surgical Hospital', 'National Neuromonitoring - Houston','No Contract')
INSERT INTO HOSPITALLOOKUP ( Hospital, Region, ContractType) 
	VALUES('Preston Surgery Center','National Neuromonitoring - DFW','No Contract')
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Scottsdale Shea Medical Center','Arizona','No Contract')

-- Ticket #480
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Museum District Aesthetic Surgery Center','National Neuromonitoring - Houston','No Contract')

-- Ticket #539
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('The Spine Hospital of Louisiana', 'Louisiana', 'No Contract')  

-- Ticket #541

INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Abrazo Arrowhead Campus', 'Arizona', 'Technical Services') 
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('North Texas Team Care Surgery Center', 'National Neuromonitoring - DFW',  'Technical Services')
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('South Austin Hospital', 'Austin', 'Technical Services')

-- Ticket #549
INSERT INTO HOSPITALLOOKUP (Hospital, Region, ContractType) 
	VALUES('Methodist Charlton Medical Center', 'National Neuromonitoring - DFW', 'Technical Services')

                                             
select * from hospitallookup where hospital in ('Methodist Charlton Medical Center')
---------------------------------------



-- Onsite with Deb 2/9/16
CREATE TABLE RegionLookup
(
ID int IDENTITY(1,1) PRIMARY KEY,
RegionName varchar(255) NOT NULL,
AuditorName varchar(255)
)
insert into RegionLookup (RegionName,AuditorName) values ('Oklahoma-OKC','Angela Leigh')
insert into RegionLookup (RegionName,AuditorName) values ('California - Central','')
insert into RegionLookup (RegionName,AuditorName) values ('Arizona','')
insert into RegionLookup (RegionName,AuditorName) values ('Alaska-Homer','')
insert into RegionLookup (RegionName,AuditorName) values ('Georgia-North','')
insert into RegionLookup (RegionName,AuditorName) values ('South Texas Neuromonitoring','Matthew Montgomery')
insert into RegionLookup (RegionName,AuditorName) values ('Colorado Springs','Carlos Ramos')
insert into RegionLookup (RegionName,AuditorName) values ('Tri-Cities','Jeth Odom')
insert into RegionLookup (RegionName,AuditorName) values ('Austin','Lewis Hendrick')
insert into RegionLookup (RegionName,AuditorName) values ('Louisiana','')
insert into RegionLookup (RegionName,AuditorName) values ('National Neuromonitoring - DFW','Brad Shults')
insert into RegionLookup (RegionName,AuditorName) values ('National Neuromonitoring - Houston','')

select * from RegionLookup
update regionlookup set auditorname = 'Alan Wan' where id = 3
update regionlookup set auditorname = 'Matthew Montgomery' where id = 4
update regionlookup set auditorname = 'Ronier Abarca' where id = 10
update regionlookup set auditorname = 'Ross Falotico' where id = 12

update regionlookup set auditorname ='Jeth Odom' where id=4

-- Ticket #577
update regionlookup set auditorname = ''
3	Arizona	Alan Wan
4	Alaska-Homer	Matthew Montgomery
10	Louisiana	Ronier Abarca
12	National Neuromonitoring - Houston	Ross Falotico

-- Ticket #1430 Christy 

select * from RegionLookup where ID in (1, 2, 4, 5, 6, 7, 11)

update regionlookup set RegionName = 'Oklahoma' where id = 1
update regionlookup set auditorname = 'Brad Shults' where id = 2
update regionlookup set RegionName = 'Alaska' where id = 4
update regionlookup set auditorname = 'Brad Shults' where id = 5
update regionlookup set auditorname = 'Jackie Carolus' where id = 6
update regionlookup set auditorname = 'Doug Geter' where id = 7
update regionlookup set auditorname = 'Rob Salinas' where id = 11

insert into RegionLookup (RegionName,AuditorName) values ('Mississippi - South','Gregg Hoffman')
insert into RegionLookup (RegionName,AuditorName) values ('Missouri','Eddie Landry')
insert into RegionLookup (RegionName,AuditorName) values ('Nevada - Las Vegas','Gemma Marcelo')
insert into RegionLookup (RegionName,AuditorName) values ('Ohio','Eddie Landry')
insert into RegionLookup (RegionName,AuditorName) values ('Texas - West','Texas	Brad Shults')
insert into RegionLookup (RegionName,AuditorName) values ('Oregon','Brad Shults')
insert into RegionLookup (RegionName,AuditorName) values ('South Carolina','Brad Shults')

/*****************
   DENIAL CODE LOOKUP
*********************/

select * from denialcodelookup

INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('AUTH', 'Denied for authorization')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('PTF15', 'Past Timely Filing 2015')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('PTF16', 'Past TImely Filing 2016')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('ZPARTIAL', 'Insurance processed part of the claim')

-- Ticket #543
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('UN', 'Unlisted code 95999 (request documentation)')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('INFO', 'Info only')

-- Ticket #1126

INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('INT', 'Interest Payment Received')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('NEG', 'Negation Accepted by Management')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('OTA', 'Overturned on Appeal (Used when Payment Received)')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('PDNEG', 'Negotiated Claim Paid')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('PR', 'Patient Responsibility - approved but no payment issued')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('NOPA', 'Not covered for Physician Assistant or Assistant During Surgery')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('SEQ', '2%	Sequestration amount taken on Medicare Replacement claims')
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('TRUENOPA', 'Code is not payable to PA as determined on review by coding')

select * from denialcodelookup where AUTH is null


select * from regiontechentitylookup where regionname like '%south texas%'
-->>>>>>> origin/Modifications


INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('NOPA', 'Not Covered for Physician Assistant or Assistant During Surgery')

select * from denialcodelookup where auth in ('NOPA')

-- Ticket #1200
INSERT INTO DENIALCODELOOKUP (AUTH, REASON) VALUES ('COV', 'As is coverage issue / not a covered benefit')
select * from denialcodelookup where auth = 'COV'


-- AGENTS
INSERT INTO AGENTS (agent, id) VALUES ('Kierra Baker', '2918')
INSERT INTO AGENTS (agent, id) VALUES ('Marissa Barrientos', '7205')
INSERT INTO AGENTS (agent, id) VALUES ('ThomasHerrera', '6611')
INSERT INTO AGENTS (agent, id) VALUES ('Soledad Mendez', '5980')
INSERT INTO AGENTS (agent, id) VALUES ('Tabatha Navarro', '7022')
INSERT INTO AGENTS (agent, id) VALUES ('Yvonne Silva', '7206')
INSERT INTO AGENTS (agent, id) VALUES ('Teresa Swinhart', '7040')
INSERT INTO AGENTS (agent, id) VALUES ('Wendy Tate', '7229')
INSERT INTO AGENTS (agent, id) VALUES ('Lisa Weldon', '7039')
select * from agents  where agent in ('Kierra Baker', 'Marissa Barrientos','ThomasHerrera','Soledad Mendez',
		'Tabatha Navarro', 'Yvonne Silva','Teresa Swinhart','Wendy Tate', 'Lisa Weldon')

-- Ticket #1485 Christy

INSERT INTO AGENTS (agent, id) VALUES ('Witne White')
INSERT INTO AGENTS (agent, id) VALUES ('Robbin Walker McDonald')
INSERT INTO AGENTS (agent, id) VALUES ('Billy Finney')
select * from agents
select * from Agents where agent in ('Julie Andrew','KaShauna Green','Keshonna McMaron','Witne White','Robbin Walker McDonald',
'Addrienne Hollins','Billy Finney','Susan Brown','Lindsay Baker')

select  distinct cuser_name, changed_by from history_3300 where cuser_name in ('Julie Andrew','KaShauna Green','Keshonna McMaron','Witne White','Robbin Walker McDonald',
'Addrienne Hollins','Billy Finney','Susan Brown','Lindsay Baker')

select  distinct cuser_name, changed_by from history_3300 where cuser_name like '%Witne White%' or  cuser_name like '%Billy Finney%' or cuser_name like '%Robbin Walker McDonald%'

-- Ticket 1575 Christy

select * from Agents where agent like '%melinda%' in ('Melinda Pattillo','Amelia Ridout')
select * from agents where id in (7358, 7668)
--INSERT INTO AGENTS (agent, id) VALUES ('Melinda Patillo', '7358')
INSERT INTO AGENTS (agent, id) VALUES ('Amelia Ridout', '7668')

-- Ticket 1576 Christy

select * from Agents where agent in ('Alisa Prelow','Robbin Walker McDonald','Shanikia Polk','Ashley Tomas')
select * from agents where id in (7632,7633, 7631,7360)
--INSERT INTO AGENTS (agent, id) VALUES ('Alisa Prelow', '7632')
--INSERT INTO AGENTS (agent, id) VALUES ('Robbin Walker McDonald', '7633')
--INSERT INTO AGENTS (agent, id) VALUES ('Shanikia Polk', '7631')
--INSERT INTO AGENTS (agent, id) VALUES ('Ashley Tomas', '7360')


-- Ticket 1636 Christy
select * from agents where id in (7768, 7767, 7766, 7765)

-- 1689 CHristy
select * from agents where id in (7874, 7767, 7766, 7765, 7768)

-- 1694 Christy

select * from agents where id = 7305

--ticket 2149 Lauren
select * from TechCompanyLookup where TechEntityLookupID = 190
update TechCompanyLookup set TechEntity = 'Neurophysiologic Interpretive Services, LLC' where TechEntityLookupID = 190

--ticket 2222 lauren
select * from correctentityexceptions
select * from correctentityexceptions where claimid = 894105
insert into correctentityexceptions (claimid, PID, correctentity) values (894105,738120,'Neurodiagnostics & Neuromonitoring Institute, Inc.')