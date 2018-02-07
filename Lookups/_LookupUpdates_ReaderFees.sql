


/************
***** READER PAYROLL
*************/

CREATE TABLE [dbo].[Readers] (
    [Reader_ID]  NUMERIC    NOT NULL IDENTITY,
    [ReaderName]     NVARCHAR (255) NULL,
    [PayrollType]       NVARCHAR (255) NULL,
    [Fee1Max] INTEGER NULL, 
	[Fee2Max] INTEGER Null,
	PRIMARY KEY (Reader_ID)
);


INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Badreldin Ibrahim, M.D.', '1099')

INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Bruce Katuna, M.D.', '1099')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Chuong Le, M.D.', '1099')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Bjorn Krane, M.D.', '1099')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Joel Wolinsky, M.D.', '1099')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Keith Preston, M.D.', '1099')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Thomas Mitchell, M.D.',	'PR')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('William High, M.D.', 'PR')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('William High, M.D., Ph.D.', 'PR')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Jane Doe', 'no pay')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('* Unassigned *', 'no pay')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Peter Tarbox, M.D.', 'PR')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('William VanNess, M.D.' ,'1099')
INSERT INTO READERS  (ReaderName, PayrollType) VALUES ('Craig Carroll, D.O.' , '1099')

UPDATE READERS set PayrollType = 'REGULAR' where PayrollType = 'PR'
UPDATE READERS set Fee1Max = 9999, fee2Max = 9999
UPDATE READERS set Fee1Max = 49, Fee2Max = 99 where Reader_ID = 5

-- Ticket #562

INSERT INTO READERS (ReaderName, PayrollType) VALUES ('Joseph Acosta, M.D.', 'PR')
INSERT INTO READERS (ReaderName, PayrollType) VALUES ('Bill Gulledge, M.D.', 'PR')
INSERT INTO READERS (ReaderName, PayrollType) VALUES ('Cary Sternick, M.D.', 'PR')

update readers set payrolltype = '1099' where reader_id = 17
UPDATE READERS set Fee1Max = 9999, fee2Max = 9999 where reader_id in (15,16)

update readers set fee1max = 20, fee2max=40 where reader_id = 16

select * from READERS where Readername in ('Joseph Acosta, M.D.','Bill Gulledge, M.D.','Cary Sternick, M.D.')

-- Ticket #954
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Ankit Nayyar, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Douglas Porter, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Eli Neiman, M.D.', 'REGULAR',9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Gregory Ward, M.D.', '1099',9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Jeffrey Halsell, D.O.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Kevin Callerame, M.D.', 'REGULAR', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Lon Steinberg, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Megan Alcauskas, M.D.', '1099',9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Morton Hyson, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Roman Kutsy, M.D.', 'REGULAR', 10, 40)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Romina Shirka, D.O.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('RTNA Reader, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Steve Zak, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Vivian Hoang, M.D.', '1099', 9999, 9999)

select * from readers where reader_ID > 17


-- Ticket #983
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Michael Leonard, M.D.', '1099', 9999, 9999)
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max) VALUES ('Meyer Proler, M.D.', '1099', 9999, 9999)

select * from readers where readername like '%Proler%' or readername like '%leonard%'

-- Ticket #1297

INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup) 
		VALUES ('Michelle Mora, D.O.', '1099', 9999, 9999, 'RTNA Reader, M.D.')
select * from readers where readername like '%mora%'



--Ticket #1389 Christy

select * from readers where ReaderName in ('George (Trey) Lee, M.D.', 'David Adams, M.D.')

INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup) 
		VALUES ('George (Trey) Lee, M.D.', '1099', 9999, 9999, 'RTNA Reader, M.D.')

INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup, timezone) 
		VALUES ('David Adams, M.D.', '1099', 9999, 9999, 'David Adams, M.D.', 'CST')

update readers set timezone = 'CST' where reader_ID = 37

--Ticket 1469 Christy

select * from readers where ReaderName = 'Cynthia Tainsh, M.D.'
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup, timezone) 
		VALUES ('Cynthia Tainsh, M.D.', '1099', '9999', '9999', 'RTNA Reader, M.D.', '')

-- Ticket 1501 Christy

select * from readers where ReaderName = 'William Gulledge, M.D.'

INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup, timezone) 
		VALUES (39, 'William Gulledge, M.D.','PR',	'20','40',	'Gulledge, M.D, William R',	'MST')

-- 1653 TIcket Christy

select * from readers where ReaderName in ('Erin Phillips, M.D.', 'Khanh Nguyen, M.D.', 'Marcos Cruz, M.D.')

INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup, timezone) 
		VALUES ('Erin Phillips, M.D.','1099','9999','9999','RTNA, PC','')	 
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup, timezone) 
		VALUES ('Khanh Nguyen, M.D.','1099','9999','9999','Real Time Neuromonitoring, Associates of California, PC','')	
INSERT INTO READERS (ReaderName, PayrollType, Fee1Max, Fee2Max, Readergroup, timezone) 
		VALUES ('Marcos Cruz, M.D.','1099','9999','9999','RTNA, PC','')


/*********

READER FEES

*********/

CREATE TABLE [dbo].[ReaderFees] (
	[ReaderFee_ID] NUMERIC Not Null Identity,
	[Reader_ID] NUMERIC FOREIGN KEY REFERENCES READERS(Reader_ID),
	[ReaderName] NVARCHAR (255) Null,
	[1st Insurance Category] NVARCHAR (255) Null,
	[Fee1] INTEGER Null,
	[Fee2] INTEGER Null,
	[Fee3] INTEGER Null
);



INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Blue Cross Blue Shield',210,210,210)

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','CHAMPVA',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Lein Case',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Letter of Protection',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Medicaid',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Medicaid Advantage Plan',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Medicare',125,125,125)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Medicare Replacement Plan',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','MVA (Motor Vehicle Accident)',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Other',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Private Insurance',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Secure Horizons',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Self Pay',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','TRICARE',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(1,'Badreldin Ibrahim, M.D.','Workmans Comp',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Blue Cross Blue Shield',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','CHAMPVA',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Lein Case',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Letter of Protection',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Medicaid',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Medicaid Advantage Plan',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Medicare',125,125,125)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Medicare Replacement Plan',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','MVA (Motor Vehicle Accident)',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Other',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Private Insurance',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Secure Horizons',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Self Pay',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','TRICARE',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(2,'Bruce Katuna, M.D.','Workmans Comp',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Blue Cross Blue Shield',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','CHAMPVA',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Lein Case',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Letter of Protection',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicaid',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicaid Advantage Plan',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicare',125,125,125)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicare Replacement Plan',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','MVA (Motor Vehicle Accident)',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Other',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Private Insurance',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Secure Horizons',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Self Pay',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','TRICARE',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Workmans Comp',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Blue Cross Blue Shield',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','CHAMPVA',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Lein Case',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Letter of Protection',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Medicaid',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Medicaid Advantage Plan',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Medicare',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Medicare Replacement Plan',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','MVA (Motor Vehicle Accident)',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Other',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Private Insurance',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Secure Horizons',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Self Pay',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','TRICARE',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(4,'Bjorn Krane, M.D.','Workmans Comp',275,275,275)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Blue Cross Blue Shield',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','CHAMPVA',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Lein Case',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Letter of Protection',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Medicare Replacement Plan',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','MVA (Motor Vehicle Accident)',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Other',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Private Insurance',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Secure Horizons',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Self Pay',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(5,'Joel Wolinsky, M.D.','Workmans Comp',170,180,190)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Blue Cross Blue Shield',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','CHAMPVA',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Lein Case',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Letter of Protection',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Medicare Replacement Plan',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','MVA (Motor Vehicle Accident)',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Other',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Private Insurance',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Secure Horizons',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Self Pay',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','TRICARE',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(6,'Keith Preston, M.D.','Workmans Comp',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Blue Cross Blue Shield',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','CHAMPVA',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Lein Case',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Letter of Protection',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Medicaid',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Medicaid Advantage Plan',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Medicare',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Medicare Replacement Plan',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','MVA (Motor Vehicle Accident)',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Other',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Private Insurance',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Secure Horizons',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Self Pay',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(7,'Thomas Mitchell, M.D.','Workmans Comp',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Blue Cross Blue Shield',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','CHAMPVA',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Lein Case',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Letter of Protection',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Medicare Replacement Plan',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','MVA (Motor Vehicle Accident)',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Other',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Private Insurance',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Secure Horizons',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Self Pay',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(8,'William High, M.D.','Workmans Comp',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Blue Cross Blue Shield',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','CHAMPVA',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Lein Case',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Letter of Protection',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Medicare Replacement Plan',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','MVA (Motor Vehicle Accident)',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Other',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Private Insurance',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Secure Horizons',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Self Pay',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(9,'William High, M.D., Ph.D.','Workmans Comp',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Blue Cross Blue Shield',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','CHAMPVA',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Lein Case',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Letter of Protection',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Medicare Replacement Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','MVA (Motor Vehicle Accident)',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Other',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Private Insurance',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Secure Horizons',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Self Pay',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(10,'Jane Doe','Workmans Comp',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Blue Cross Blue Shield',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','CHAMPVA',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Lein Case',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Letter of Protection',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Medicare Replacement Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','MVA (Motor Vehicle Accident)',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Other',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Private Insurance',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Secure Horizons',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Self Pay',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(11,'* Unassigned *','Workmans Comp',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Blue Cross Blue Shield',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','CHAMPVA',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Lein Case',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Letter of Protection',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Medicare Replacement Plan',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','MVA (Motor Vehicle Accident)',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Other',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Private Insurance',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Secure Horizons',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Self Pay',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','TRICARE',185,185,18)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(12,'Peter Tarbox, M.D.','Workmans Comp',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Blue Cross Blue Shield',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','CHAMPVA',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Lein Case',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Letter of Protection',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Medicaid',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Medicaid Advantage Plan',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Medicare Replacement Plan',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','MVA (Motor Vehicle Accident)',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Other',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Private Insurance',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Secure Horizons',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Self Pay',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','TRICARE',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(13,'William VanNess, M.D.','Workmans Comp',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Blue Cross Blue Shield',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','CHAMPVA',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Lein Case',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Letter of Protection',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Medicaid',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Medicaid Advantage Plan',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Medicare',125,125,125)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Medicare Replacement Plan',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','MVA (Motor Vehicle Accident)',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Other',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Private Insurance',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Secure Horizons',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Self Pay',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','TRICARE',210,210,210)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(14,'Craig Carroll, D.O.','Workmans Comp',210,210,210)

select * from ReaderFees


-- Ticket #562


INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Blue Cross Blue Shield',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','CHAMPVA',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Lein Case',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Letter of Protection',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Medicare Replacement Plan',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','MVA (Motor Vehicle Accident)',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Other',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Private Insurance',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Secure Horizons',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Self Pay',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','TRICARE',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(15,'Joseph Acosta, M.D.','Workmans Comp',185,185,185)

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Blue Cross Blue Shield',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','CHAMPVA',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Lein Case',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Letter of Protection',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Medicare Replacement Plan',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','MVA (Motor Vehicle Accident)',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Other',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Private Insurance',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Secure Horizons',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Self Pay',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','TRICARE',225,200,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(16,'Bill Gulledge, M.D.','Workmans Comp',225,200,175)

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Blue Cross Blue Shield',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','CHAMPVA',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Lein Case',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Letter of Protection',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Medicaid',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Medicaid Advantage Plan',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Medicare',0,0,0)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Medicare Replacement Plan',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','MVA (Motor Vehicle Accident)',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Other',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Private Insurance',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Secure Horizons',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Self Pay',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','TRICARE',300,300,300)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(17,'Cary Sternick, M.D.','Workmans Comp',300,300,300)

-- Ticket #988
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(18,'Ankit Nayyar, M.D.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(19,'Douglas Porter, M.D.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Blue Cross Blue Shield',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','CHAMPVA',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Lein Case',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Letter of Protection',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Medicare Replacement Plan',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','MVA (Motor Vehicle Accident)',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Other',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Private Insurance',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Secure Horizons',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Self Pay',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','TRICARE',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(20,'Eli Neiman, M.D.','Workmans Comp',225,225,225)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Blue Cross Blue Shield',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','CHAMPVA',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Lein Case',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Letter of Protection',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Medicare Replacement Plan',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Other',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Private Insurance',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Secure Horizons',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Self Pay',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','Workmans Comp',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(21,'Gregory Ward, M.D.','MVA (Motor Vehicle Accident)',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Blue Cross Blue Shield',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','CHAMPVA',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Lein Case',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Letter of Protection',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Medicaid',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Medicaid Advantage Plan',100,100,100)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Medicare Replacement Plan',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Other',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Private Insurance',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Secure Horizons',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Self Pay',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','TRICARE',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','Workmans Comp',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(22,'Jeffrey Halsell, D.O.','MVA (Motor Vehicle Accident)',175,175,175)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Blue Cross Blue Shield',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','CHAMPVA',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Lein Case',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Letter of Protection',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Medicaid',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Medicare Replacement Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Other',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Private Insurance',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Secure Horizons',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Self Pay',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','TRICARE',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','Workmans Comp',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(23,'Kevin Callerame, M.D.','MVA (Motor Vehicle Accident)',185,185,185)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(24,'Lon Steinberg, M.D.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(25,'Megan Alcauskas, M.D.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Blue Cross Blue Shield',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','CHAMPVA',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Lein Case',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Letter of Protection',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Medicare Replacement Plan',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Other',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Private Insurance',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Secure Horizons',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Self Pay',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','Workmans Comp',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(26,'Morton Hyson, M.D.','MVA (Motor Vehicle Accident)',200,200,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Blue Cross Blue Shield',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','CHAMPVA',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Lein Case',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Letter of Protection',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Medicaid',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Medicare Replacement Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Other',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Private Insurance',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Secure Horizons',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Self Pay',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','TRICARE',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','Workmans Comp',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(27,'Roman Kutsy, M.D.','MVA (Motor Vehicle Accident)',350,250,200)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(28,'Romina Shirka, D.O.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(29,'RTNA Reader, M.D.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(30,'Steve Zak, M.D.','MVA (Motor Vehicle Accident)',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(31,'Vivian Hoang, M.D.','MVA (Motor Vehicle Accident)',450,450,450)

delete readerfees where reader_ID = 3
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Blue Cross Blue Shield',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','CHAMPVA',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Lein Case',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Letter of Protection',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicaid',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicaid Advantage Plan',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicare',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Medicare Replacement Plan',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Other',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Private Insurance',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Secure Horizons',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Self Pay',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','TRICARE',9999,9999,9999)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','Workmans Comp',450,450,450)
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3) VALUES(3,'Chuong Le, M.D.','MVA (Motor Vehicle Accident)',450,450,450)

select * from readerfees where reader_id in (8,9) and [1st Insurance Category] in ('Medicare Replacement Plan', 'Secure Horizons') 
update readerfees set fee1 = 0, fee2 = 0, fee3=0  where reader_id in (8,9) and [1st Insurance Category] in ('Medicare Replacement Plan', 'Secure Horizons')
select * from readerfees where fee1 = 9999
update readerfees set fee1 = 0, fee2 =0, fee3 = 0 where fee1 = 9999

select * from readerfees where reader_ID in (3,8,9) or (reader_ID >=18 and reader_ID <=31) order by reader_id

-- Ticket #1010

update readers set readergroup = 'RTNA Reader, M.D.'   where readername in ('Ankit Nayyar, M.D.', 'Chuong Le, M.D.', 'Douglas Porter, M.D.','Lon Steinberg, M.D.',
		'Megan Alcauskas, M.D.', 'Romina Shirka, D.O.', 'RTNA Reader, M.D.', 'Steve Zak, M.D.', 'Vivian Hoang, M.D.')

update readers set readergroup = 'Rocky Mountain Neurodiagnostics' where readername in ('Badreldin Ibrahim, M.D.', 'Bruce Katuna, M.D.', 'Craig Carroll, D.O.')

update readers set readergroup = 'nopay' where readername in ('* Unassigned *', 'Jane Doe')

update readers set readergroup = readername where readergroup is null

select * from readers where readergroup is null

-- Ticket #1010 (part II)

select * from readers
select * from readerfees 

Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = '* Unassigned *' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Ankit Nayyar, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Badreldin Ibrahim, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Gulledge' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Gulledge' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Gulledge' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bill Gulledge, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Krane' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Krane' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Krane' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bjorn Krane, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Bruce Katuna, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Sternick' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Sternick' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Sternick' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Cary Sternick, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Chuong Le, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Rocky Mountain Neurodiagnostics' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Craig Carroll, D.O.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Douglas Porter, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Gregory Ward, M.D.' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Gregory Ward, M.D.' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Gregory Ward, M.D.' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'Gregory Ward, M.D.' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Gregory Ward, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'none' Where ReaderName = 'Jane Doe' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Jeffrey Halsell' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Jeffrey Halsell' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Jeffrey Halsell' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Jeffrey Halsell, D.O.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Joel S. Wolinsky, M.D., P.A.' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Joel S. Wolinsky, M.D., P.A.' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Joel S. Wolinsky, M.D., P.A.' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'Joel S. Wolinsky, M.D., P.A.' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joel Wolinsky, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Acosta' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Acosta' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Acosta' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Joseph Acosta, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Prestion' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Prestion' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Prestion' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Keith Preston, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Callerame' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Callerame' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Callerame' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Kevin Callerame, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Lon Steinberg, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Megan Alcauskas, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Hyson, M.D' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Hyson, M.D>' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'Dr. Hyson, M.D>' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Morton Hyson, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Tarbox' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Tarbox' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Tarbox' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Peter Tarbox, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Kutsy' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Kutsy' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Kutsy' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Roman Kutsy, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Romina Shirka, D.O.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'RTNA Reader, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Steve Zak, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. Mitchell' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. Mitchell' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. Mitchell' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'Dr. Mitchell' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Thomas Mitchell, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'RTNA' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Vivian Hoang, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'Dr. High' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William High, M.D., Ph.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'The Pain and Rehab Institute' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'The Pain and Rehab Institute' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'The Pain and Rehab Institute' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'The Pain and Rehab Institute' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'William VanNess, M.D.' and [1st insurance category] = 'Workmans Comp'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Blue Cross Blue Shield'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'CHAMPVA'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Lein Case'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Letter of Protection'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Medicaid'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Medicaid Advantage Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Medicare'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Medicare Replacement Plan'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'MVA (Motor Vehicle Accident)'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Other'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Private Insurance'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Secure Horizons'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Self Pay'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'TRICARE'
Update ReaderFees Set Billingcompany = 'ABS' Where ReaderName = 'Eli Neiman, M.D.' and [1st insurance category] = 'Workmans Comp'

-- Ticket #1062
select * from readers where readername like '%ferenz%'
INSERT INTO READERS  (ReaderName, PayrollType, fee1max,fee2max, readergroup) VALUES ('Gregory Ferenz, D.O.' , '1099',9999,9999, 'Rocky Mountain Neurodiagnostics')

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Blue Cross Blue Shield',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','CHAMPVA',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Lein Case',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Letter of Protection',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Medicaid',100,100,100,'Rocky Mountain Neurodiagnostics', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Medicaid Advantage Plan',100,100,100,'Rocky Mountain Neurodiagnostics', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Medicare',125,125,125,'Rocky Mountain Neurodiagnostics', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Medicare Replacement Plan',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','MVA (Motor Vehicle Accident)',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Other',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Private Insurance',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Secure Horizons',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Self Pay',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','TRICARE',210,210,210,'ABS', '2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(34,'Gregory Ferenz, D.O.','Workmans Comp',210,210,210,'ABS', '2010-01-01','2020-12-31')

select * from readerfees where reader_id = 34


-- Ticket #1016

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, startdate, enddate) VALUES(8,'William High, M.D.','Medicare Replacement Plan',175,175,175,'2010-01-01','2016-05-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, startdate, enddate) VALUES(9,'William High, M.D., Ph.D.','Medicare Replacement Plan',175,175,175,'2010-01-01','2016-05-31')

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, billingcompany, startdate, enddate) VALUES(8,'William High, M.D.','Secure Horizons',0,0,0,'Dr. High', '2010-01-01','2016-05-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3, billingcompany, startdate, enddate) VALUES(9,'William High, M.D., Ph.D.','Secure Horizons',0,0,0,'Dr. High', '2010-01-01','2016-05-31')


update readerfees set startdate = '2016-06-01' where readerfee_id = 113 or readerfee_id = 128
update readerfees set startdate = '2016-06-01', fee1=175, fee2=175, fee3=175, enddate = '2016-05-31', billingcompany='ABS' where readerfee_id in( 501, 502)
update readerfees set startdate = '2016-06-01', fee1=175, fee2=175, fee3=175, enddate = '2016-05-31', billingcompany='ABS' where readerfee_id = 132
update readerfees set startdate = '2016-06-01', fee1=0, fee2=0, fee3=0, enddate = '2020-12-31', billingcompany='Dr. High' where readerfee_id in( 501, 502)
update readerfees set startdate = '2010-01-01', enddate = '2016-05-31' where readerfee_id in (117,132)
update readerfees set billingcompany = 'ABS' where readerfee_id in (499,500)

select * from readerfees where reader_ID  in (8,9) and ( [1st insurance category] like '%Replacement%' or [1st insurance category] like '%secure%') order by reader_id, [1st Insurance Category], startDate
select * from readerfees where readername like '%high%' and [1st insurance category] like '%Replacement%'

select * from readerfees where [1st Insurance Category] like '%Secure%'

--Ticket #1148

select * from readerfees where (readername like '%Callerame%' or readername like '%Kutsy%') 
	and [1st Insurance Category] = 'Medicare Replacement Plan'

update readerfees set fee1 = 185, fee2 = 185, fee3 = 185 where readername like '%Callerame%'  and  [1st Insurance Category] = 'Medicare Replacement Plan'
select * from readerfees where readername like '%Callerame%'  and  [1st Insurance Category] = 'Medicare Replacement Plan'

update readerfees set fee1 = 350, fee2 = 250, fee3 = 200 where readername like '%Kutsy%'  and  [1st Insurance Category] = 'Medicare Replacement Plan'
select * from readerfees where readername like '%Kutsy%'  and  [1st Insurance Category] = 'Medicare Replacement Plan'

select * from readerfees

-- Ticket #1298 Christy

select * from ReaderFees where readername like '%Mora%'

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Blue Cross Blue Shield',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','CHAMPVA',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Lein Case',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Letter of Protection',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Medicaid',0,0,0,'RTNA','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Medicaid Advantage Plan',0,0,0,'RTNA','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Medicare',0,0,0,'RTNA','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Medicare Replacement Plan',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Other',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Private Insurance',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Secure Horizons',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Self Pay',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','TRICARE',0,0,0,'RTNA','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','Workmans Comp',250,450,450,'ABS','2010-1-1','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(35,'Michelle Mora, D.O','MVA (Motor Vehicle Accident)',250,450,450,'ABS','2010-1-1','2020-12-31')


-- Ticket #1341

alter table readers ADD timezone varchar(8)
UPDATE READERS SET timezone = 'MST' Where reader_id = 1
UPDATE READERS SET timezone = 'MST' Where reader_id = 2
UPDATE READERS SET timezone = 'PST' Where reader_id = 4
UPDATE READERS SET timezone = 'CST' Where reader_id = 5
UPDATE READERS SET timezone = 'CST' Where reader_id = 6
UPDATE READERS SET timezone = 'CST' Where reader_id = 7
UPDATE READERS SET timezone = 'CST' Where reader_id = 8
UPDATE READERS SET timezone = 'CST' Where reader_id = 9
UPDATE READERS SET timezone = 'CST' Where reader_id = 12
UPDATE READERS SET timezone = 'EDT' Where reader_id = 13
UPDATE READERS SET timezone = 'MST' Where reader_id = 14
UPDATE READERS SET timezone = 'CST' Where reader_id = 15
UPDATE READERS SET timezone = 'MST' Where reader_id = 16
UPDATE READERS SET timezone = 'CST' Where reader_id = 17
UPDATE READERS SET timezone = 'PST' Where reader_id = 21
UPDATE READERS SET timezone = 'MST' Where reader_id = 22
UPDATE READERS SET timezone = 'CST' Where reader_id = 23
UPDATE READERS SET timezone = 'PST' Where reader_id = 26
UPDATE READERS SET timezone = 'CST' Where reader_id = 27
UPDATE READERS SET timezone = 'CST' Where reader_id = 32
UPDATE READERS SET timezone = 'MST' Where reader_id = 34

select * from readers 

-- Ticket 1469 Christy 

select * from READERFEES where Readername in ('George (Trey) Lee, M.D.', 'David Adams, M.D.', 'Cynthia Tainsh, M.D.')
select * from ReaderFees where ReaderName = 'Cynthia Tainsh, M.D.'

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Blue Cross Blue Shield', 250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Letter of Protection', 250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Medicaid',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Medicaid Advantage Plan',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','CHAMPVA',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Lein Case',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','M.D.care',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Medicare Replacement Plan',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Other',	250,450,450,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Private Insurance',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Secure Horizons',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Self Pay',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','TRICARE',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','Workmans Comp',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(36,	'George (Trey) Lee, M.D.','MVA (Motor Vehicle Accident)',	250, 450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Blue Cross Blue Shield',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','CHAMPVA',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Lein Case',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Letter of Protection',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Medicaid',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Medicaid Advantage Plan',	250,250,250, 'Dr. Adams','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Medicare','','','', 'Dr. Adams','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Medicare Replacement Plan',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','MVA (Motor Vehicle Accident)',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Other',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Private Insurance',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Secure Horizons',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Self Pay',	250,250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','TRICARE','','','', 'Dr. Adams','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(37,	'David Adams, M.D.','Workmans Comp',	250, 250,250, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Blue Cross Blue Shield',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Letter of Protection',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Medicaid',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Medicaid Advantage Plan',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','CHAMPVA',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Lein Case',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Medicare',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Medicare Replacement Plan',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Other',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Private Insurance',	250, 450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Secure Horizons',	250,450,450	, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Self Pay',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','TRICARE',	0,0,0, 'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','Workmans Comp',	250,450,450, 'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(38,	'Cynthia Tainsh, M.D.','MVA (Motor Vehicle Accident)',	250,450,450, 'ABS','2010-01-01','2020-12-31')


-- Ticket #1501 Christy

select * from ReaderFees where ReaderName = 'William Gulledge, M.D.'
select * from readers

INSERT INTO READERS (ReaderName, payrollType, Fee1Max, Fee2Max, ReaderGroup, timezone) VALUES ('William Gulledge, M.D', 'PR', 20,40,'Gulledge, M.D, William R','MST')

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Blue Cross Blue Shield',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','CHAMPVA',	225, 200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Lein Case',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Letter of Protection',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Medicaid',	0,	0,	0,'Dr. Gulledge','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Medicaid Advantage Plan',	0,	0,	0,'Dr. Gulledge','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Medicare',	0,	0,	0,'Dr. Gulledge','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Medicare Replacement Plan',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','MVA (Motor Vehicle Accident)',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Other',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Private Insurance',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Secure Horizons',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Self Pay',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','TRICARE',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Workmans Comp',	225,	200,	175,'ABS','2010-01-01','2020-12-30')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(39, 'William Gulledge, M.D.','Federal Plan',	225,	200,	175,'ABS','2010-01-01','12/31/2020')


-- Ticket #1584

select * from readers where reader_id = 39
update readers set readername = 'William Gulledge, M.D.' where reader_ID = 39

-- Ticket #1654
select * from readerfees where reader_id = 40

INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Blue Cross Blue Shield',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Blue Cross Blue Shield',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','CHAMPVA',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Lein Case',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Letter of Protection',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Medicaid',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Medicaid Advantage Plan',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Medicare',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Medicare Replacement Plan',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Other',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Private Insurance',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Secure Horizons',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Self Pay',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','TRICARE',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Workmans Comp',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','MVA (Motor Vehicle Accident)',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Federal Plan',0,0,0,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Blue Cross Blue Shield',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','CHAMPVA',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Lein Case',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Letter of Protection',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Medicaid',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Medicaid Advantage Plan',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Medicare',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Medicare Replacement Plan',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Other',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Private Insurance',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Secure Horizons',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Self Pay',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','TRICARE',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Workmans Comp',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','MVA (Motor Vehicle Accident)',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(41, 'Khanh Nguyen, M.D.','Federal Plan',0,0,0,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Blue Cross Blue Shield',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','CHAMPVA',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Lein Case',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Letter of Protection',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Medicaid',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Medicaid Advantage Plan',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Medicare',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Medicare Replacement Plan',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Other',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Private Insurance',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Secure Horizons',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Self Pay',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','TRICARE',0,0,0,'RTNA','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Workmans Comp',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','MVA (Motor Vehicle Accident)',210,235,250,'ABS','2010-01-01','2020-12-31')
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(42, 'Marcos Cruz, M.D.','Federal Plan',0,0,0,'ABS','2010-01-01','2020-12-31')

delete from readerfees where reader_ID = 40 and readername = 'Erin Phillips, M.D.' and [1st Insurance Category] = 'Blue Cross Blue Shield'
INSERT INTO READERFEES (Reader_ID,ReaderName,[1st Insurance Category], Fee1, Fee2, Fee3,BillingCompany, StartDate, Enddate) VALUES(40, 'Erin Phillips, M.D.','Blue Cross Blue Shield',210,235,250,'ABS','2010-01-01','2020-12-31')

--ticket 2184 lauren
select * from readers where reader_id in (7,8,9)
update readers set payrolltype = '1099' where reader_id = 7
update readers set payrolltype = '1099' where reader_id = 8
update readers set payrolltype = '1099' where reader_id = 9

select * from readers where reader_id in (18,3,38,19,36,24,25,35,28,29,30,31)
update readers set readergroup = 'Real Time Neuromonitoring , Associates of California, PC' where reader_id = 18
update readers set readergroup = 'Real Time Neuromonitoring , Associates of California, PC' where reader_id = 3
update readers set readergroup = 'RTNA, PC' where reader_id = 38
update readers set readergroup = 'Real Time Neuromonitoring , Associates of California, PC' where reader_id = 19
update readers set readergroup = 'RTNA, PC' where reader_id = 36
update readers set readergroup = 'Real Time Neuromonitoring , Associates of California, PC' where reader_id = 24
update readers set readergroup = 'RTNA, PC' where reader_id = 25
update readers set readergroup = 'RTNA, PC' where reader_id = 35
update readers set readergroup = 'Real Time Neuromonitoring , Associates NV, PC' where reader_id = 28
update readers set readergroup = 'RTNA, PC' where reader_id = 29
update readers set readergroup = 'RTNA, PC' where reader_id = 30
update readers set readergroup = 'RTNA, PC' where reader_id = 31

select * from readers where readername = 'Shawn Masia, M.D'
INSERT INTO READERS (ReaderName, payrollType, Fee1Max, Fee2Max, ReaderGroup, timezone) VALUES ('Shawn Masia, M.D','1099',9999,9999,'RTNA, PC','')
select * from readers where readername = 'Hamid Salehi, M.D.'
INSERT INTO READERS (ReaderName, payrollType, Fee1Max, Fee2Max, ReaderGroup, timezone) VALUES ('Hamid Salehi, M.D.','1099',9999,9999,'Hamid Salehi, M.D.','')

select * from readers where reader_id = 43
update readers set readername = 'Shawn Masia, M.D.' where reader_id = 43

--ticket 2247 lauren 

select * from readers where readername = 'Grant Warmouth, M.D.'
INSERT INTO READERS (ReaderName, payrollType, Fee1Max, Fee2Max, ReaderGroup, timezone) VALUES ('Grant Warmouth, M.D.','1099',9999,9999,'Rocky Mountain Neurodiagnostics','MST')

--ReaderFees Cleanup
DELETE FROM ReaderFees WHERE Reader_ID=9
DELETE FROM ReaderFees WHERE Reader_ID=21
DELETE FROM ReaderFees WHERE Reader_ID=16
UPDATE ReaderFees SET ReaderName='Michelle Mora, D.O.' WHERE Reader_ID=35
UPDATE ReaderFees SET ReaderName='William Gulledge Jr, M.D.' WHERE Reader_ID=39
UPDATE ReaderFees SET [1st Insurance Category]='Medicare' WHERE ReaderFee_ID=557

UPDATE READERFEES SET StartDate='3/1/2011' WHERE Reader_ID=1
UPDATE READERFEES SET StartDate='3/1/2011' WHERE Reader_ID=2
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=3
UPDATE READERFEES SET StartDate='4/1/2014', EndDate='5/31/2016' WHERE Reader_ID=4
UPDATE READERFEES SET StartDate='11/1/2012', EndDate='3/31/2017' WHERE Reader_ID=5
UPDATE READERFEES SET StartDate='10/1/2011', EndDate='9/30/2014' WHERE Reader_ID=6
UPDATE READERFEES SET StartDate='3/1/2015', EndDate='6/21/2017' WHERE Reader_ID=7
UPDATE READERFEES SET StartDate='6/1/2014', EndDate='6/12/2017' WHERE Reader_ID=8
UPDATE READERFEES SET StartDate='10/1/2015', EndDate='12/31/2015' WHERE Reader_ID=12
UPDATE READERFEES SET StartDate='3/1/2011', EndDate='8/31/2017' WHERE Reader_ID=13
UPDATE READERFEES SET StartDate='3/1/2011' WHERE Reader_ID=14
UPDATE READERFEES SET StartDate='4/30/2016', EndDate='8/31/2016' WHERE Reader_ID=15
UPDATE READERFEES SET StartDate='8/1/2016' WHERE Reader_ID=17
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=18
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=19
UPDATE READERFEES SET StartDate='8/1/2016' WHERE Reader_ID=20
UPDATE READERFEES SET StartDate='7/1/2016', EndDate='7/11/2017' WHERE Reader_ID=22
UPDATE READERFEES SET StartDate='7/1/2016', EndDate='2/28/2017' WHERE Reader_ID=23
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=24
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=25
UPDATE READERFEES SET StartDate='6/1/2016', EndDate='7/31/2016' WHERE Reader_ID=27
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=28
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=29
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=30
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=31
UPDATE READERFEES SET StartDate='3/1/2011' WHERE Reader_ID=34
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=35
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=36
UPDATE READERFEES SET StartDate='9/1/2016' WHERE Reader_ID=37
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=38
UPDATE READERFEES SET StartDate='4/1/2016', EndDate='9/4/2017' WHERE Reader_ID=39
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=40
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=41
UPDATE READERFEES SET StartDate='5/1/2016' WHERE Reader_ID=42
UPDATE READERFEES SET StartDate='10/1/2016', EndDate='8/6/2017' WHERE Reader_ID=26
UPDATE READERFEES SET Group_Member='Neurodiagnostics, Rocky Mountain', PR_TYPE='1099', Emp_ID=61082, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=5639 WHERE Reader_ID=1
UPDATE READERFEES SET Group_Member='Neurodiagnostics, Rocky Mountain', PR_TYPE='1099', Emp_ID=61082, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=388 WHERE Reader_ID=2
UPDATE READERFEES SET Group_Member='Neurology PS, Seattle', PR_TYPE='1099', Emp_ID=61087, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1691 WHERE Reader_ID=4
UPDATE READERFEES SET Group_Member='Wolinsky MD PA, Joel', PR_TYPE='1099', Emp_ID=61049, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=565 WHERE Reader_ID=5
UPDATE READERFEES SET Group_Member='Keith Preston, M.D.', PR_TYPE='1099', Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=525 WHERE Reader_ID=6
UPDATE READERFEES SET Group_Member='Mitchell, Thomas A', PR_TYPE='PR', Emp_ID=61119, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1840 WHERE Reader_ID=7
UPDATE READERFEES SET Group_Member='High Jr, William L', PR_TYPE='PR', Emp_ID=61122, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1174 WHERE Reader_ID=8
UPDATE READERFEES SET Group_Member='nopay', PR_TYPE='no pay', Time_Zone='', OnCall_StartTime='', OnCall_EndTime='', SignOff_Reduction=0, Web_User_Id=391 WHERE Reader_ID=10
UPDATE READERFEES SET Group_Member='nopay', PR_TYPE='no pay', Time_Zone='', OnCall_StartTime='', OnCall_EndTime='', SignOff_Reduction=0 WHERE Reader_ID=11
UPDATE READERFEES SET Group_Member='Tarbox, Peter', PR_TYPE='PR', Emp_ID=61099, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1680 WHERE Reader_ID=12
UPDATE READERFEES SET Group_Member='The Pain &, Rehab Institute', PR_TYPE='1099', Emp_ID=61100, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=33 WHERE Reader_ID=13
UPDATE READERFEES SET Group_Member='Neurodiagnostics, Rocky Mountain', PR_TYPE='1099', Emp_ID=61082, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1818 WHERE Reader_ID=14
UPDATE READERFEES SET Group_Member='Joseph Acosta, M.D.', PR_TYPE='PR', Emp_ID=61104, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0 WHERE Reader_ID=15
UPDATE READERFEES SET Group_Member='Sternick, Cary S', PR_TYPE='1099', Emp_ID=61112, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1186 WHERE Reader_ID=17
UPDATE READERFEES SET Group_Member='Neiman, Eli S', PR_TYPE='PR', Emp_ID=61106, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=6832 WHERE Reader_ID=20
UPDATE READERFEES SET Group_Member='Halsell, D.O. PLLC, Jeffrey S', PR_TYPE='1099', Emp_ID=61108, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1527 WHERE Reader_ID=22
UPDATE READERFEES SET Group_Member='Callerame, M.D, Kevin', PR_TYPE='PR', Emp_ID=61111, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=6916 WHERE Reader_ID=23
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=739 WHERE Reader_ID=25
UPDATE READERFEES SET Group_Member='Kutsy, Roman L', PR_TYPE='PR', Emp_ID=61107, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=6766 WHERE Reader_ID=27
UPDATE READERFEES SET Group_Member='Real Time Neuromonitoring , Associates NV, PC', PR_TYPE='1099', Emp_ID=61113, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1336 WHERE Reader_ID=28
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=5812 WHERE Reader_ID=29
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1398 WHERE Reader_ID=30
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1448 WHERE Reader_ID=31
UPDATE READERFEES SET Group_Member='Neurodiagnostics, Rocky Mountain', PR_TYPE='1099', Emp_ID=61082, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=7192 WHERE Reader_ID=34
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=6975 WHERE Reader_ID=35
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=498 WHERE Reader_ID=36
UPDATE READERFEES SET Group_Member='David Adams, M.D.', PR_TYPE='1099', Emp_ID=61116, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=5900 WHERE Reader_ID=37
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1211 WHERE Reader_ID=38
UPDATE READERFEES SET Group_Member='Gulledge, M.D, William R', PR_TYPE='PR', Emp_ID=61105, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=670 WHERE Reader_ID=39
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1421 WHERE Reader_ID=40
UPDATE READERFEES SET Group_Member='RTNA, PC', PR_TYPE='1099', Emp_ID=61109, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=659 WHERE Reader_ID=42
UPDATE READERFEES SET Group_Member='Hyson, MD PC, Morton', PR_TYPE='1099', Emp_ID=61114, Time_Zone='Neurologist', OnCall_StartTime='5:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1120 WHERE Reader_ID=26
UPDATE READERFEES SET Group_Member='RTNA of California, PC', PR_TYPE='1099', Emp_ID=61110, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=5794 WHERE Reader_ID=18
UPDATE READERFEES SET Group_Member='RTNA of California, PC', PR_TYPE='1099', Emp_ID=61110, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=2993 WHERE Reader_ID=19
UPDATE READERFEES SET Group_Member='RTNA of California, PC', PR_TYPE='1099', Emp_ID=61110, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=1296 WHERE Reader_ID=24
UPDATE READERFEES SET Group_Member='RTNA of California, PC', PR_TYPE='1099', Emp_ID=61110, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=550 WHERE Reader_ID=3
UPDATE READERFEES SET Group_Member='RTNA of California, PC', PR_TYPE='1099', Emp_ID=61110, Time_Zone='Hospital', OnCall_StartTime='6:00:00 PM', OnCall_EndTime='6:00:00 AM', SignOff_Reduction=0, Web_User_Id=549 WHERE Reader_ID=41

INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Blue Cross Blue Shield',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','CHAMPVA',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Lein Case',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Letter of Protection',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','RTNA','1099','Medicaid',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','RTNA','1099','Medicaid Advantage Plan',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','RTNA','1099','Medicare',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Medicare Replacement Plan',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','MVA (Motor Vehicle Accident)',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Other',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Private Insurance',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Secure Horizons',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Self Pay',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','RTNA','1099','TRICARE',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Workmans Comp',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Aetna',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Blue Cross Blue Shield',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','CHAMPVA',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Federal Plan',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Lein Case',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Letter of Protection',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Medicaid',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Medicaid Advantage Plan',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Medicare',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Medicare Replacement Plan',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','MVA (Motor Vehicle Accident)',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Other',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Patient Responsibility',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Private Insurance',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Secure Horizons',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Self Pay',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','TRICARE',61124,0,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','none','1099','Uninsured',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','Dr. Salehi','1099','Workmans Comp',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Aetna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Blue Cross Blue Shield',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','CHAMPVA',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Federal Plan',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Lein Case',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Letter of Protection',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Medicaid',61082,100,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Medicaid Advantage Plan',61082,100,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Medicare',61082,125,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Medicare Replacement Plan',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','MVA (Motor Vehicle Accident)',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Other',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Patient Responsibility',61082,0,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Private Insurance',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Secure Horizons',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Self Pay',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','TRICARE',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','none','1099','Uninsured',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Workmans Comp',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Blue Cross Blue Shield',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','CHAMPVA',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Lein Case',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Letter of Protection',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','RTNA','1099','Medicaid',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','RTNA','1099','Medicaid Advantage Plan',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','RTNA','1099','Medicare',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Medicare Replacement Plan',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','MVA (Motor Vehicle Accident)',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Other',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Private Insurance',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Secure Horizons',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Self Pay',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','RTNA','1099','TRICARE',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Workmans Comp',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Blue Cross Blue Shield',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','CHAMPVA',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Lein Case',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Letter of Protection',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','RTNA','1099','Medicaid',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','RTNA','1099','Medicaid Advantage Plan',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','RTNA','1099','Medicare',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Medicare Replacement Plan',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Other',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Private Insurance',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Secure Horizons',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Self Pay',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','RTNA','1099','TRICARE',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Workmans Comp',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','MVA (Motor Vehicle Accident)',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Aetna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','RTNA','1099','Federal Plan',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Patient Responsibility',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','none','1099','Uninsured',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Blue Cross Blue Shield',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','CHAMPVA',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Federal Plan',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Lein Case',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Letter of Protection',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Medicaid',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Medicaid Advantage Plan',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Medicare',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Medicare Replacement Plan',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','MVA (Motor Vehicle Accident)',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Other',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Private Insurance',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Secure Horizons',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Self Pay',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','TRICARE',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','Dr. Gulledge','1099','Workmans Comp',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Blue Cross Blue Shield',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','CHAMPVA',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Lein Case',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Letter of Protection',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Medicaid',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Medicaid Advantage Plan',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Medicare',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Medicare Replacement Plan',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Other',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Private Insurance',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Secure Horizons',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Self Pay',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','TRICARE',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Workmans Comp',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','MVA (Motor Vehicle Accident)',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Blue Cross Blue Shield',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','CHAMPVA',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Lein Case',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Letter of Protection',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','Joel S. Wolinsky, M.D., P.A.','1099','Medicaid',61049,0,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','Joel S. Wolinsky, M.D., P.A.','1099','Medicaid Advantage Plan',61049,0,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','Joel S. Wolinsky, M.D., P.A.','1099','Medicare',61049,0,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Medicare Replacement Plan',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','MVA (Motor Vehicle Accident)',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Other',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Private Insurance',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Secure Horizons',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Self Pay',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','Joel S. Wolinsky, M.D., P.A.','1099','TRICARE',61049,0,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Workmans Comp',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Blue Cross Blue Shield',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','CHAMPVA',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Lein Case',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Letter of Protection',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Medicaid',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Medicaid Advantage Plan',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Medicare',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Medicare Replacement Plan',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Other',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Private Insurance',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Secure Horizons',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Self Pay',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','TRICARE',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Workmans Comp',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','MVA (Motor Vehicle Accident)',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Blue Cross Blue Shield',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','CHAMPVA',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Lein Case',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Letter of Protection',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Medicaid',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Medicaid Advantage Plan',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Medicare',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Medicare Replacement Plan',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','MVA (Motor Vehicle Accident)',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Other',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Private Insurance',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Secure Horizons',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Self Pay',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','TRICARE',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Workmans Comp',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Blue Cross Blue Shield',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','CHAMPVA',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Lein Case',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Letter of Protection',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Medicaid',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Medicaid Advantage Plan',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Medicare',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Medicare Replacement Plan',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','MVA (Motor Vehicle Accident)',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Other',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Private Insurance',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Secure Horizons',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Self Pay',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','TRICARE',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Workmans Comp',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Blue Cross Blue Shield',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','CHAMPVA',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Lein Case',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Letter of Protection',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','The Pain and Rehab Institute','1099','Medicaid',61100,175,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','The Pain and Rehab Institute','1099','Medicaid Advantage Plan',61100,175,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','The Pain and Rehab Institute','1099','Medicare',61100,0,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Medicare Replacement Plan',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','MVA (Motor Vehicle Accident)',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Other',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Private Insurance',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Secure Horizons',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Self Pay',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','The Pain and Rehab Institute','1099','TRICARE',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Workmans Comp',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(1,'Badreldin Ibrahim, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Aetna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5639)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(1,'Badreldin Ibrahim, M.D.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Federal Plan',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5639)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(1,'Badreldin Ibrahim, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Patient Responsibility',61082,0,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5639)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(1,'Badreldin Ibrahim, M.D.','Neurodiagnostics, Rocky Mountain','none','1099','Uninsured',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5639)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(2,'Bruce Katuna, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Aetna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,388)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(2,'Bruce Katuna, M.D.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Federal Plan',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,388)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(2,'Bruce Katuna, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Patient Responsibility',61082,0,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,388)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(2,'Bruce Katuna, M.D.','Neurodiagnostics, Rocky Mountain','none','1099','Uninsured',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,388)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(3,'Chuong Le, M.D.','RTNA of California, PC','ABS','1099','Aetna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,550)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(3,'Chuong Le, M.D.','RTNA of California, PC','RTNA','1099','Federal Plan',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,550)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(3,'Chuong Le, M.D.','RTNA of California, PC','ABS','1099','Patient Responsibility',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,550)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(3,'Chuong Le, M.D.','RTNA of California, PC','none','1099','Uninsured',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,550)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(4,'Bjorn Krane, M.D.','Neurology PS, Seattle','ABS','1099','Aetna',61087,275,'4/1/2014','5/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,1691)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(4,'Bjorn Krane, M.D.','Neurology PS, Seattle','Dr. Krane','1099','Federal Plan',61087,275,'4/1/2014','5/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,1691)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(4,'Bjorn Krane, M.D.','Neurology PS, Seattle','ABS','1099','Patient Responsibility',61087,0,'4/1/2014','5/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,1691)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(4,'Bjorn Krane, M.D.','Neurology PS, Seattle','none','1099','Uninsured',61087,275,'4/1/2014','5/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,1691)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Aetna',61049,170,'11/1/2012','3/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','Joel S. Wolinsky, M.D., P.A.','1099','Federal Plan',61049,0,'11/1/2012','3/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Patient Responsibility',61049,0,'11/1/2012','3/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','none','1099','Uninsured',61049,170,'11/1/2012','3/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Aetna',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','Joel S. Wolinsky, M.D., P.A.','1099','Federal Plan',61049,0,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Patient Responsibility',61049,0,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','none','1099','Uninsured',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(6,'Keith Preston, M.D.','Keith Preston, M.D.','ABS','1099','Aetna',175,'10/1/2011','9/30/2014','Neurologist','5:00:00 PM','6:00:00 AM',0,525)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(6,'Keith Preston, M.D.','Keith Preston, M.D.','Dr. Prestion','1099','Federal Plan',175,'10/1/2011','9/30/2014','Neurologist','5:00:00 PM','6:00:00 AM',0,525)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(6,'Keith Preston, M.D.','Keith Preston, M.D.','ABS','1099','Patient Responsibility',0,'10/1/2011','9/30/2014','Neurologist','5:00:00 PM','6:00:00 AM',0,525)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(6,'Keith Preston, M.D.','Keith Preston, M.D.','none','1099','Uninsured',175,'10/1/2011','9/30/2014','Neurologist','5:00:00 PM','6:00:00 AM',0,525)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','PR','Aetna',61119,200,'3/1/2015','6/21/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','PR','Federal Plan',61119,200,'3/1/2015','6/21/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','PR','Patient Responsibility',61119,0,'3/1/2015','6/21/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','none','PR','Uninsured',61119,200,'3/1/2015','6/21/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Aetna',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','Dr. Mitchell','1099','Federal Plan',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Patient Responsibility',61119,0,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','none','1099','Uninsured',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','PR','Aetna',61122,175,'6/1/2014','6/12/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','PR','Federal Plan',61122,175,'6/1/2014','6/12/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','PR','Patient Responsibility',61122,0,'6/1/2014','6/12/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','none','PR','Uninsured',61122,175,'6/1/2014','6/12/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Aetna',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','Dr. High','1099','Federal Plan',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Patient Responsibility',61122,0,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(8,'William High, M.D.','High Jr, William L','none','1099','Uninsured',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'Jane Doe','nopay','none','no pay','Aetna',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'Jane Doe','nopay','none','no pay','Federal Plan',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'Jane Doe','nopay','none','no pay','Patient Responsibility',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'Jane Doe','nopay','none','no pay','Uninsured',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'* Unassigned *','nopay','none','no pay','Aetna',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'* Unassigned *','nopay','none','no pay','Federal Plan',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'* Unassigned *','nopay','none','no pay','Patient Responsibility',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_Id) VALUES(10,'* Unassigned *','nopay','none','no pay','Uninsured',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(12,'Peter Tarbox, M.D.','Tarbox, Peter','ABS','PR','Aetna',61099,185,'10/1/2015','12/31/2015','Neurologist','5:00:00 PM','6:00:00 AM',0,1680)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(12,'Peter Tarbox, M.D.','Tarbox, Peter','Dr. Tarbox','PR','Federal Plan',61099,185,'10/1/2015','12/31/2015','Neurologist','5:00:00 PM','6:00:00 AM',0,1680)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(12,'Peter Tarbox, M.D.','Tarbox, Peter','ABS','PR','Patient Responsibility',61099,0,'10/1/2015','12/31/2015','Neurologist','5:00:00 PM','6:00:00 AM',0,1680)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(12,'Peter Tarbox, M.D.','Tarbox, Peter','none','PR','Uninsured',61099,185,'10/1/2015','12/31/2015','Neurologist','5:00:00 PM','6:00:00 AM',0,1680)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Aetna',61100,175,'3/1/2011','8/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','The Pain and Rehab Institute','1099','Federal Plan',61100,175,'3/1/2011','8/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Patient Responsibility',61100,0,'3/1/2011','8/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','none','1099','Uninsured',61100,175,'3/1/2011','8/31/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Aetna',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','The Pain and Rehab Institute','1099','Federal Plan',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Patient Responsibility',61100,0,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','none','1099','Uninsured',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(14,'Craig Carroll, D.O.','Neurodiagnostics, Rocky Mountain','ABS','1099','Aetna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1818)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(14,'Craig Carroll, D.O.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Federal Plan',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1818)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(14,'Craig Carroll, D.O.','Neurodiagnostics, Rocky Mountain','ABS','1099','Patient Responsibility',61082,0,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1818)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(14,'Craig Carroll, D.O.','Neurodiagnostics, Rocky Mountain','none','1099','Uninsured',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1818)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction) VALUES(15,'Joseph Acosta, M.D.','Joseph Acosta, M.D.','ABS','PR','Aetna',61104,185,'4/30/2016','8/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction) VALUES(15,'Joseph Acosta, M.D.','Joseph Acosta, M.D.','Dr. Acosta','PR','Federal Plan',61104,185,'4/30/2016','8/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction) VALUES(15,'Joseph Acosta, M.D.','Joseph Acosta, M.D.','ABS','PR','Patient Responsibility',61104,0,'4/30/2016','8/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction) VALUES(15,'Joseph Acosta, M.D.','Joseph Acosta, M.D.','none','PR','Uninsured',61104,185,'4/30/2016','8/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(17,'Cary Sternick, M.D.','Sternick, Cary S','ABS','1099','Aetna',61112,300,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(17,'Cary Sternick, M.D.','Sternick, Cary S','Dr. Sternick','1099','Federal Plan',61112,300,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(17,'Cary Sternick, M.D.','Sternick, Cary S','ABS','1099','Patient Responsibility',61112,0,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(17,'Cary Sternick, M.D.','Sternick, Cary S','none','1099','Uninsured',61112,300,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(18,'Ankit Nayyar, M.D.','RTNA of California, PC','ABS','1099','Aetna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5794)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(18,'Ankit Nayyar, M.D.','RTNA of California, PC','RTNA','1099','Federal Plan',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5794)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(18,'Ankit Nayyar, M.D.','RTNA of California, PC','ABS','1099','Patient Responsibility',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5794)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(18,'Ankit Nayyar, M.D.','RTNA of California, PC','none','1099','Uninsured',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5794)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(19,'Douglas Porter, M.D.','RTNA of California, PC','ABS','1099','Aetna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,2993)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(19,'Douglas Porter, M.D.','RTNA of California, PC','RTNA','1099','Federal Plan',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,2993)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(19,'Douglas Porter, M.D.','RTNA of California, PC','ABS','1099','Patient Responsibility',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,2993)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(19,'Douglas Porter, M.D.','RTNA of California, PC','none','1099','Uninsured',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,2993)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(20,'Eli Neiman, M.D.','Neiman, Eli S','ABS','PR','Aetna',61106,225,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,6832)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(20,'Eli Neiman, M.D.','Neiman, Eli S','Neiman, Eli S','PR','Federal Plan',61106,225,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,6832)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(20,'Eli Neiman, M.D.','Neiman, Eli S','ABS','PR','Patient Responsibility',61106,0,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,6832)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(20,'Eli Neiman, M.D.','Neiman, Eli S','none','PR','Uninsured',61106,225,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,6832)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Aetna',61108,175,'7/1/2016','7/11/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Federal Plan',61108,175,'7/1/2016','7/11/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Patient Responsibility',61108,0,'7/1/2016','7/11/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','none','1099','Uninsured',61108,175,'7/1/2016','7/11/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Aetna',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','Jeffrey Halsell','1099','Federal Plan',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Patient Responsibility',61108,0,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','none','1099','Uninsured',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(23,'Kevin Callerame, M.D.','Callerame, M.D, Kevin','ABS','PR','Aetna',61111,185,'7/1/2016','2/28/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,6916)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(23,'Kevin Callerame, M.D.','Callerame, M.D, Kevin','Dr. Callerame','PR','Federal Plan',61111,185,'7/1/2016','2/28/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,6916)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(23,'Kevin Callerame, M.D.','Callerame, M.D, Kevin','ABS','PR','Patient Responsibility',61111,0,'7/1/2016','2/28/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,6916)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(23,'Kevin Callerame, M.D.','Callerame, M.D, Kevin','none','PR','Uninsured',61111,185,'7/1/2016','2/28/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,6916)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(24,'Lon Steinberg, M.D.','RTNA of California, PC','ABS','1099','Aetna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1296)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(24,'Lon Steinberg, M.D.','RTNA of California, PC','RTNA','1099','Federal Plan',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1296)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(24,'Lon Steinberg, M.D.','RTNA of California, PC','ABS','1099','Patient Responsibility',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1296)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(24,'Lon Steinberg, M.D.','RTNA of California, PC','none','1099','Uninsured',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1296)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Megan Alcauskas, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,739)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Megan Alcauskas, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,739)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Megan Alcauskas, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,739)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Megan Alcauskas, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,739)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Aetna',61114,200,'10/1/2016','8/6/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Federal Plan',61114,200,'10/1/2016','8/6/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Patient Responsibility',61114,0,'10/1/2016','8/6/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','none','1099','Uninsured',61114,200,'10/1/2016','8/6/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Aetna',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','Dr. Hyson, M.D.','1099','Federal Plan',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Patient Responsibility',61114,0,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','none','1099','Uninsured',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(27,'Roman Kutsy, M.D.','Kutsy, Roman L','ABS','PR','Aetna',61107,200,'6/1/2016','7/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,6766)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(27,'Roman Kutsy, M.D.','Kutsy, Roman L','Dr. Kutsy','PR','Federal Plan',61107,200,'6/1/2016','7/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,6766)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(27,'Roman Kutsy, M.D.','Kutsy, Roman L','ABS','PR','Patient Responsibility',61107,0,'6/1/2016','7/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,6766)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(27,'Roman Kutsy, M.D.','Kutsy, Roman L','none','PR','Uninsured',61107,200,'6/1/2016','7/31/2016','Neurologist','5:00:00 PM','6:00:00 AM',0,6766)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(28,'Romina Shirka, D.O.','Real Time Neuromonitoring , Associates NV, PC','ABS','1099','Aetna',61113,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1336)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(28,'Romina Shirka, D.O.','Real Time Neuromonitoring , Associates NV, PC','RTNA','1099','Federal Plan',61113,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1336)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(28,'Romina Shirka, D.O.','Real Time Neuromonitoring , Associates NV, PC','ABS','1099','Patient Responsibility',61113,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1336)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(28,'Romina Shirka, D.O.','Real Time Neuromonitoring , Associates NV, PC','none','1099','Uninsured',61113,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1336)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(29,'RTNA Reader, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5812)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(29,'RTNA Reader, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5812)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(29,'RTNA Reader, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5812)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(29,'RTNA Reader, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5812)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(30,'Steve Zak, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1398)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(30,'Steve Zak, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1398)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(30,'Steve Zak, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1398)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(30,'Steve Zak, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1398)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(31,'Vivian Hoang, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1448)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(31,'Vivian Hoang, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1448)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(31,'Vivian Hoang, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1448)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(31,'Vivian Hoang, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1448)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(34,'Gregory Ferenz, D.O.','Neurodiagnostics, Rocky Mountain','ABS','1099','Aetna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,7192)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(34,'Gregory Ferenz, D.O.','Neurodiagnostics, Rocky Mountain','Rocky Mountain Neurodiagnostics','1099','Federal Plan',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,7192)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(34,'Gregory Ferenz, D.O.','Neurodiagnostics, Rocky Mountain','ABS','1099','Patient Responsibility',61082,0,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,7192)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(34,'Gregory Ferenz, D.O.','Neurodiagnostics, Rocky Mountain','none','1099','Uninsured',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,7192)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(35,'Michelle Mora, D.O.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,6975)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(35,'Michelle Mora, D.O.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,6975)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(35,'Michelle Mora, D.O.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,6975)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(35,'Michelle Mora, D.O.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,6975)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(36,'George (Trey) Lee, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,498)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(36,'George (Trey) Lee, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,498)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(36,'George (Trey) Lee, M.D.','RTNA, PC','RTNA','1099','Medicare',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,498)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(36,'George (Trey) Lee, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,498)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(36,'George (Trey) Lee, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,498)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(37,'David Adams, M.D.','David Adams, M.D.','ABS','1099','Aetna',61116,250,'5/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5900)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(37,'David Adams, M.D.','David Adams, M.D.','Dr. Adams','1099','Federal Plan',61116,250,'5/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5900)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(37,'David Adams, M.D.','David Adams, M.D.','ABS','1099','Patient Responsibility',61116,0,'5/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5900)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(37,'David Adams, M.D.','David Adams, M.D.','none','1099','Uninsured',61116,250,'5/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5900)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(38,'Cynthia Tainsh, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1211)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(38,'Cynthia Tainsh, M.D.','RTNA, PC','RTNA','1099','Federal Plan',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1211)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(38,'Cynthia Tainsh, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1211)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(38,'Cynthia Tainsh, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1211)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','PR','Aetna',61105,175,'1/1/2010','9/4/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','PR','Patient Responsibility',61105,0,'1/1/2010','9/4/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','none','PR','Uninsured',61105,175,'1/1/2010','9/4/2017','Neurologist','5:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Aetna',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Patient Responsibility',61105,0,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','none','1099','Uninsured',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(40,'Erin Phillips, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1421)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(40,'Erin Phillips, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1421)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(40,'Erin Phillips, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1421)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(41,'Khanh Nguyen, M.D.','RTNA of California, PC','ABS','1099','Aetna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,549)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(41,'Khanh Nguyen, M.D.','RTNA of California, PC','ABS','1099','Patient Responsibility',61110,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,549)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(41,'Khanh Nguyen, M.D.','RTNA of California, PC','none','1099','Uninsured',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,549)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(42,'Marcos Cruz, M.D.','RTNA, PC','ABS','1099','Aetna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,659)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(42,'Marcos Cruz, M.D.','RTNA, PC','ABS','1099','Patient Responsibility',61109,0,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,659)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_TYPE,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_Id) VALUES(42,'Marcos Cruz, M.D.','RTNA, PC','none','1099','Uninsured',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,659)

--Duplicates amm
  DELETE FROM ReaderFees WHERE ReaderFee_ID=470
  DELETE FROM ReaderFees WHERE ReaderFee_ID=959
  DELETE FROM ReaderFees WHERE ReaderFee_ID=471
  DELETE FROM ReaderFees WHERE ReaderFee_ID=543
  DELETE FROM ReaderFees WHERE ReaderFee_ID=549

--New Insurance Type amm
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(43,'Shawn Masia, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,658)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(44,'Hamid Salehi, M.D.','A Professional Medical Corp','ABS','1099','Cigna',61124,225,'6/9/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,8186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(45,'Grant Warmouth, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Cigna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1022)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(1,'Badreldin Ibrahim, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Cigna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5639)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(2,'Bruce Katuna, M.D.','Neurodiagnostics, Rocky Mountain','ABS','1099','Cigna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,388)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(3,'Chuong Le, M.D.','RTNA of California, PC','ABS','1099','Cigna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,550)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(5,'Joel Wolinsky, M.D.','Wolinsky MD PA, Joel','ABS','1099','Cigna',61049,200,'4/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',30,565)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(7,'Thomas Mitchell, M.D.','Mitchell, Thomas A','ABS','1099','Cigna',61119,225,'6/22/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1840)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(8,'William High, M.D.','High Jr, William L','ABS','1099','Cigna',61122,225,'6/13/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1174)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_ID) VALUES(10,'Jane Doe','nopay','none','no pay','Cigna',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],fee1,StartDate,EndDate,SignOff_Reduction,Web_User_ID) VALUES(10,'* Unassigned *','nopay','none','no pay','Cigna',0,'1/1/1999','12/31/2020',0,391)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(13,'William VanNess, M.D.','The Pain &, Rehab Institute','ABS','1099','Cigna',61100,250,'9/1/2017','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,33)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(14,'Craig Carroll, D.O.','Neurodiagnostics, Rocky Mountain','ABS','1099','Cigna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1818)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(17,'Cary Sternick, M.D.','Sternick, Cary S','ABS','1099','Cigna',61112,300,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,1186)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(18,'Ankit Nayyar, M.D.','RTNA of California, PC','ABS','1099','Cigna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5794)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(19,'Douglas Porter, M.D.','RTNA of California, PC','ABS','1099','Cigna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,2993)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(20,'Eli Neiman, M.D.','Neiman, Eli S','ABS','PR','Cigna',61106,225,'8/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,6832)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(22,'Jeffrey Halsell, D.O.','Halsell, D.O. PLLC, Jeffrey S','ABS','1099','Cigna',61108,225,'7/12/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1527)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(24,'Lon Steinberg, M.D.','RTNA of California, PC','ABS','1099','Cigna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1296)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(25,'Megan Alcauskas, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,739)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(25,'Morton Hyson, M.D.','Hyson, MD PC, Morton','ABS','1099','Cigna',61114,225,'8/7/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,1120)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(28,'Romina Shirka, D.O.','Real Time Neuromonitoring , Associates NV, PC','ABS','1099','Cigna',61113,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1336)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(29,'RTNA Reader, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,5812)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(30,'Steve Zak, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1398)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(31,'Vivian Hoang, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1448)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(34,'Gregory Ferenz, D.O.','Neurodiagnostics, Rocky Mountain','ABS','1099','Cigna',61082,210,'3/1/2011','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,7192)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(35,'Michelle Mora, D.O.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,6975)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(36,'George (Trey) Lee, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,498)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(37,'David Adams, M.D.','David Adams, M.D.','ABS','1099','Cigna',61116,250,'5/1/2016','12/31/2020','Neurologist','5:00:00 PM','6:00:00 AM',0,5900)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(38,'Cynthia Tainsh, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1211)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(39,'William Gulledge Jr, M.D.','Gulledge, M.D, William R','ABS','1099','Cigna',61105,225,'9/5/2017','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',25,670)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(40,'Erin Phillips, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,1421)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(41,'Khanh Nguyen, M.D.','RTNA of California, PC','ABS','1099','Cigna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,549)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(42,'Marcos Cruz, M.D.','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,659)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(46,'Contact RTNA Support, ','RTNA, PC','ABS','1099','Cigna',61109,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8677)
INSERT INTO READERFEES (Reader_ID,ReaderName,Group_Member,BillingCompany,PR_Type,[1st Insurance Category],Emp_ID,fee1,StartDate,EndDate,Time_Zone,OnCall_StartTime,OnCall_EndTime,SignOff_Reduction,Web_User_ID) VALUES(47,'Brian Ahuja, M.D.','RTNA of California, PC','ABS','1099','Cigna',61110,185,'5/1/2016','12/31/2020','Hospital','6:00:00 PM','6:00:00 AM',0,8460)

--ReaderFees Cleanup amm
UPDATE READERFEES SET Reader_ID=11 WHERE ReaderName='* Unassigned *'
UPDATE READERFEES SET fee1=185 WHERE Group_Member='RTNA, PC' or Group_Member='RTNA of California, PC' or Group_Member='Real Time Neuromonitoring,, Associates NV, PC'

UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=614
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1025
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1043
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=514
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=530
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=548
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=615
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=822
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=890
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=894
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=914
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=918
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=934
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=938
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=942
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=946
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=954
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=958
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=967
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1026
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1058
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=246
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=261
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=336
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=351
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=396
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=411
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=426
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=441
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=456
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=468
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=503
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=519
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=535
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=553
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=583
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=618
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1029
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1046
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=247
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=262
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=337
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=352
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=397
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=412
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=427
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=442
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=457
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=469
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=504
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=520
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=536
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=554
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=584
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=248
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=263
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=338
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=353
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=398
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=413
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=428
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=443
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=458
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=490
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=505
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=521
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=537
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=557
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=587
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=620
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1031
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1048
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=624
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=823
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=891
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=895
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=915
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=919
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=935
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=939
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=943
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=947
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=955
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=960
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=968
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=977
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=980
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=983
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1035
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1059
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=254
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=269
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=344
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=359
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=404
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=419
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=434
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=449
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=464
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=496
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=511
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=527
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=545
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=563
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=593
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=628
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1039
UPDATE READERFEES SET fee1=0 WHERE ReaderFee_ID=1054
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=392
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=393
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=394
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=395
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=399
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=400
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=401
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=402
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=403
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=405
UPDATE READERFEES SET fee1=185 WHERE ReaderFee_ID=406
