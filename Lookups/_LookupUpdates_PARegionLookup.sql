--DROP Table PARegionLookup
CREATE TABLE PARegionLookup (    
  [PA]				NCHAR (50) NOT NULL,
  [AssignedRegion]	NCHAR (50) NOT NULL,
  [PAName]			NCHAR (50) NOT NULL,
  [Status]			NCHAR (50) NOT NULL)

--DELETE FROM PARegionLookup
--Begin Ticket #2376
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Chris Perez, PA-C','PA - South Texas','Chris Perez','Not Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Corey McClellan, PA-C','Ohio','Corey McClellan','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Don Morris, PA-C','PA - South Texas','Don Morris','PA ActiveT')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('James Jelen, Ph.D., PA-C','PA - South Texas','James Jelen, Ph.D.','Not Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Jeffery Perkins, CSFA','PA - DFW','Jeffery Perkins','PA Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('John Smith, PA-C','PA - DFW','John Smith','PA Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Kim Stewart, PA-C','PA - South Texas','Kimberly Stewart','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Kimberly Stewart','PA - South Texas','Kimberly Stewart','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Kimberly Stewart, MPAS, PA-C','PA - South Texas','Kimberly Stewart','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Kimmy Nguyen, PA-C','PA - Austin','Kimmy Nguyen','PA ActiveT')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Kyle Bartschmid, PA-C','PA - Austin','Kyle Bartschmid','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Matt Musick, PA-C','PA - South Texas','Matt Musick','PA ActiveT')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Matt Wiggins, PA-C','PA - DFW','Matt Wiggins','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Paula Harrison, APRN','PA - DFW','Paula Harrison','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Selena Vela, PA-C','PA - South Texas','Selena Vela','Not Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Shaun Shore, PA-C','PA - DFW','Shaun Shore','PA Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Stephanie Choi, PA-C','PA - Austin','Stephanie Choi','PA ActiveT')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Steve Greer, LSA','PA - Austin','Steve Greer','PA Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Toni Wells, PA-C','PA - DFW','Toni Wells','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Helena Bruce','PA - Austin','Helena Bruce','PA Active')
--End Ticket #2376

Update PARegionLookup set Status = 'Not Active' where PA = 'Steve Greer, LSA'		--#30 kta

<<<<<<< HEAD
--Hybrid Tech Unassigned amm
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('* Unassigned *','ALL','* Unassigned *','SurgeonPA')
=======
--dr 1/24/18
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Nickolas Garcia, PA-C','PA - South Texas','Nickolas Garcia','PA ActiveT')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Jose Fuentez, PA-C','PA - South Texas', 'Jose Fuentez', 'SurgeonPA')  
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('Scott Naples, PA-C', 'Ohio', 'Scott Naples','SurgeonPA')  
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) VALUES ('William Gronberg, PA-C', 'Arizona','William Gronberg','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Bridget Karl Haslam, PA-C','Maryland','Bridget Karl Haslam','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Christie Robbins, NP','Maryland','Christi Robbins','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Lesli Bullock, NP', 'Oklahoma','Lesli Bullock','SurgeonPA')                         
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Vanessa Scialom, PA-C','PA - Austin','Vanessa Scialom','SurgeonPA')                                       
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Michael Craig, PA-C','Alaska','Michael Craig','SurgeonPA')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Darren Richards, PA-C','California''Darren Richards','PA Active')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status]) Values ('Sandra Ballehr, PA-C','Arizona','Sandra Ballehr','PA Active')

Update PARegionLookup set Status = 'Not Active' where PAName = 'Jeffery Perkins'
Update PARegionLookup set Status = 'Not Active' where PAName = 'Kimmy Nguyen'

ALTER TABLE [dbo].[PARegionLookup]
ADD Tech_Web_ID int

ALTER TABLE [dbo].[PARegionLookup]
ADD Proliant_ID int

Update [dbo].[PARegionLookup] SET Proliant_ID = 14751 WHERE PA = 'Stephanie Choi, PA-C'
Update [dbo].[PARegionLookup] SET Proliant_ID = 14755 WHERE PA = 'Shaun Shore, PA-C'  
Update [dbo].[PARegionLookup] SET Proliant_ID = 14756 WHERE PA = 'John Smith, PA-C'   
Update [dbo].[PARegionLookup] SET Proliant_ID = 14757 WHERE PA = 'Matt Wiggins, PA-C'  
Update [dbo].[PARegionLookup] SET Proliant_ID = 14758 WHERE PA = 'Don Morris, PA-C' 
Update [dbo].[PARegionLookup] SET Proliant_ID = 14762 WHERE PA = 'Matt Musick, PA-C' 
Update [dbo].[PARegionLookup] SET Proliant_ID = 14770 WHERE PA = 'Steve Greer, LSA' 
Update [dbo].[PARegionLookup] SET Proliant_ID = 14771 WHERE PA = 'Sandra Ballehr, PA-C' 
Update [dbo].[PARegionLookup] SET Proliant_ID = 14772 WHERE PA = 'Helena Bruce' 
Update [dbo].[PARegionLookup] SET Proliant_ID = 14773 WHERE PA = 'Darren Richards, PA-C' 
Update [dbo].[PARegionLookup] SET Proliant_ID = 14774 WHERE PA = 'Nickolas Garcia, PA-C' 

Update [dbo].[PARegionLookup] Set Tech_Web_ID = 3266 WHERE PAName = 'Chris Perez'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 9027 WHERE PAName = 'Christi Robbins'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 7621 WHERE PAName = 'Corey McClellan'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8864 WHERE PAName = 'Darren Richards'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 7002 WHERE PAName = 'Don Morris'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8719 WHERE PAName = 'Helena Bruce'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6219 WHERE PAName = 'James Jelen, Ph.D.'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 7999 WHERE PAName = 'Jeffery Perkins'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6576 WHERE PAName = 'John Smith'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8779 WHERE PAName = 'Jose Fuentez'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6951 WHERE PAName = 'Kimberly Stewart'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6583 WHERE PAName = 'Kimmy Nguyen'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8068 WHERE PAName = 'Kyle Bartschmid'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 7843 WHERE PAName = 'Matt Musick'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6986 WHERE PAName = 'Matt Wiggins'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8876 WHERE PAName = 'Nickolas Garcia'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6183 WHERE PAName = 'Paula Harrison'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8629 WHERE PAName = 'Sandra Ballehr'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8849 WHERE PAName = 'Scott Naples'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 5772 WHERE PAName = 'Selena Vela'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 3265 WHERE PAName = 'Shaun Shore'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 5674 WHERE PAName = 'Stephanie Choi'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 6093 WHERE PAName = 'Steve Greer'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8988 WHERE PAName = 'Vanessa Scialom'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 8937 WHERE PAName = 'Chris Perez'
Update [dbo].[PARegionLookup] Set Tech_Web_ID = 3266 WHERE PAName = 'William Gronberg'



>>>>>>> ad9952adf2b8134959d2ee4e64a3a1e11baeb889

--PA new credentials amm
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status],Tech_Web_ID,Proliant_ID) VALUES ('Helena Bruce, PA-C','PA - Austin','Helena Bruce','PA Active','8719','14772')
INSERT INTO PARegionLookup (PA,AssignedRegion,PAName,[Status],Tech_Web_ID,Proliant_ID) VALUES ('Don Morris, MPAS, PA-C','PA - South Texas','Don Morris','PA ActiveT','7002','14758')



