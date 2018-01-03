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








