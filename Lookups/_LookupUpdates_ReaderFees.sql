


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
