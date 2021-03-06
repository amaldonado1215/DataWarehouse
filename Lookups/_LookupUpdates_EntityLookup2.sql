﻿create table EntityLookup2  ( 
					EntityLookupID int NOT NULL IDENTITY(1,1), 
					Entity  varchar(150) not null, 
					IsPMCompany varchar(5) not null, 
					Region varchar(50) not null, 
					clm_billing_type varchar(20) not null, 
					status varchar(20) not null,
					MgmtFee decimal(5,4))


					
--- ***********
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('ABK Monitoring Inc., PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('ABV Neuromonitoring, PLLC','Yes','Texas - South Texas','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Acadian IOM, LLC','No','Missouri','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('AccuZone Diagnostics, LLC','No','Arizona','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('ACME Medical, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Acquisition Billing Services','No','ALL','Med Rec','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Adeneuro Inc., PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Ahai, PLLC','Yes','Texas - DFW','Pro Only','Active',0.37)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('AINeurology, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Alamo City Neurodiagnostics, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Allegiant Diagnostics, LLC','No','Arizona','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Alph Monitoring, LLC','No','South Carolina','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Andaz Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('AO IOM, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Apex Health Monitoring, LLC','No','Texas - Houston','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Argo Spine IOM, PLLC','Yes','Texas - DFW','Pro Only','Active',0.35)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Arizona Neurological Monitoring, PLLC','Yes','Arizona','Pro Only','Inactive',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Atlas IOM, LLC','Yes','Ohio','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Austx Neuro, PLLC','Yes','Texas - Austin','Pro Only','Inactive',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Axon Neuromonitoring, PLLC ','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('BINA Diagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('BK Neuromonitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Borpan Monitoring, PLLC','Yes','Arizona','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Capitol Neurodiagnostics, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('CareSource IOM, LLC','No','California','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Central Texas Neuromonitoring, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Cerebral Axis, PLLC','Yes','Texas - DFW','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Cerebri Monitoring, LLC','No','Texas - South Texas','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Chandler Newsome Corp, PLLC','Yes','Texas - DFW','Pro Only','Inactive',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Chiflauda Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Clan IOM, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Collin County Neuromonitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Core Neurodiagnostics, LLC','No','Mississippi - South','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Correxa IOM, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Cortex Neuromonitoring, LLC','No','Oklahoma','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Cortico Spinal Diagnostics, LLC','No','Colorado','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('CSPNM, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('CTSI Monitoring, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Cushing Neuromonitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Delta Neuromonitoring, LLC','No','Texas - Austin','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Denali Neuromonitoring, LLC','Yes','Alaska','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Dendrite Monitoring Services, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Desert Neuromonitoring Group, LLC','Yes','Nevada - Las Vegas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('DJNR, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('East Texas Spinal Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Echo Therapeutics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Egyptian Doberman, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Electric Knife, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Elite Neuromonitoring, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Energy Diagnostics IOM, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('F&S Neuromonitoring, LLC','Yes','Ohio','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Flag Ship Diagnostics, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Flexion Neuromonitoring, LLC','No','Texas - DFW','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Frisco Neuromonitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Frisco Neurosurgical Products, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Frontline Healthcare, LLC','No','Pennsylvania','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Garuda Neuromonitoring, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Gateway IOM, LLC','Yes','Missouri','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Gemini Health, LLC','No','Georgia-North','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('GJ & D Medical Resources, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Grand Canyon Neurology, PLLC','Yes','Arizona','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('GRMNM, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('GSGNM, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('HKJ Med, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('HMC Neuromonitoring, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Horizon Neurodiagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Houston Neuroscience PLLC','Yes','Texas - Houston','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Hypnic Diagnostics, LLC','No','Texas - DFW','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Illuminate Monitoring Resources, LLC','No','Maryland','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Independent Neurophysiology, PLLC','Yes','Texas - South Texas','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('In-Site Surgical Monitoring Services','No','ALL','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('IOM Potential, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('JJDNM, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('JW Neuro, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('JWJMDNM, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Laser Accurate IOM, LLC','No','Louisiana','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Legacy Neuromonitoring, LLC','Yes','Alaska','Pro Only','Inactive',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('LoneStar Diagnostics, LLC','No','Arizona','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('M & M Neurology, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Magnolia Neuro Monitoring, LLC','Yes','Mississippi','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Marvosa, LLC','Yes','Colorado','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('MDR Monitoring, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('MediMetro, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Microfuse Neuromonitoring, LLC','Yes','Ohio','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Mission Diagnostics, LLC','No','Texas - South Texas','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Modern Neuromonitoring, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('MODK Monitoring, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Montlake Diagnostics, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Monument Diagnosotics, LLC','No','Missouri','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Mustang Neurodiagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('National IOM, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('National Neuromonitoring Services','No','Texas - DFW','Tech Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('National Physician Neuromonitoring, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neon Diagnostics, LLC','No','Nevada - Las Vegas','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Nerve and Cord Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Nerve Pro, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neurassure, LLC','No','Oklahoma','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neuraxis Monitoring, LLC','Yes','Georgia-North','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuriom, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neurite Monitoring, LLC','No','Texas - DFW','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuro DPM, Inc.','Yes','California','Pro Only','Active',0.4)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neuro Wave Physiology, LLC','No','Washington','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('NeuroCept Diagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('NeuroCept, LLC','Yes','Louisiana','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuroden, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neurodiagnostics & Neuromonitoring Institute, Inc.','No','ALL','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuroguide IOM, PLLC','Yes','Texas - DFW','Pro Only','Inactive',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuroguide, PLLC','Yes','Texas - West Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neuromon IOM, LLC','Yes','Louisiana','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('NeuroMon IOM, PLLC','Yes','Oklahoma','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuromonitoring of Texas, PLLC ','Yes','Texas - South Texas','Pro Only','Inactive',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neurophysiologic Interpretive Services LLC','No','Texas - Austin','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neuroplexus, LLC','No','Louisiana','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuroservice of California, PC','Yes','California','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Neuroservice of Maryland, PC','Yes','Maryland','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuroservice of Pennsylvania, PC','Yes','Pennsylvania','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neuroservice of Virginia, PC','Yes','Virginia','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neurospine Associates, PLLC','Yes','Arizona','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neurospine Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('NeuroTex Diagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('NeuroTronics, LLC','Yes','Ohio','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Neurovital, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('North Texas Neuromonitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Northside Neurodiagnostics, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Northwest Integer, LLC','Yes','Washington','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('NS Monitoring, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Occipital IOM, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('OKC Synapses, LLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('OLJ IOM, PLLC','Yes','Oklahoma','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Omega Southwest','Yes','','Pro Only','Inactive')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('One Care Monitoring, LLC','No','Ohio','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Over the Horizon IOM, LLC','No','Ohio','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Palmetto Axon Neuromonitoring, LLC','Yes','South Carolina','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Pelican IOM, LLC','Yes','Louisiana','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('PGBH Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Physiologic Diagnostic Services','No','Texas - DFW','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Pinnacle Diagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('PJW Medical, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Plametto Axon Neuromonitoring, LLC','Yes','South Carolina','Pro Only','Inactive',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('PONO Neuromonitoring, PLLC','Yes','Oklahoma','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Precision Neuromonitoring, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Priority Neurodiagnostics, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Pro Read, LLC','Yes','Louisiana','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Professional Connections Analysis, PLLC','Yes','Oklahoma','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Proguidance IOM, PLLC','Yes','Texas - DFW','Pro Only','Active',0.27)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Radiant Neuromonitoring, LLC','No','South Carolina','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Red River Neurodiagnostics, LLC','No','Oklahoma','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('River Valley Neurophysiology, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('RRV Neuromonitoring PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Safe Guidance, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Safe Spine Intraoperative Monitoring, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('SafeGuard Neuromonitoring, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Safety Spine, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('SCJ Monitoring, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Select Neuromonitoring Consultants, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Shortwave Diagnostics LLC','No','Texas - DFW','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Sooner Neuromonitoring, PLLC','Yes','Oklahoma','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Southeast Texas Neuromonitoring, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Southern Neuromonitoring, LLC','Yes','Louisiana','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('SPC Horizons, PLLC','Yes','Texas - DFW','Pro Only','Inactive',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Spine Shield, PLLC','Yes','Oklahoma','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Spineguard, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Stimulen Diagnostics, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Stirrup Medical Services, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Synapse Neuro, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Synergy Neuromonitoring LLC','No','Texas - Houston','Tech Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Tejas Neuromonitoring, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Tempered Medical Holdings, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Teveta IOM, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Texoma IOM, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('TLJ Neurology, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Travis County Neuromonitoring, PLLC','Yes','Texas - Austin','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Turk Neurology, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Urology Neuromonitoring, PLLC','Yes','Texas - South Texas','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('US Neurological, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Verbena IOM, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Vitalnerve, PLLC','Yes','Texas - Houston','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Wellspine Monitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Wilcox Neuromonitoring, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status) values ('Willamette Valley IOM, LLC','Yes','Oregon','Pro Only','Active')
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('XYZ Neurology, PLLC','Yes','Oklahoma','Pro Only','Active',0.25)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('York Drive Investments, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)
INSERT INTO ENTITYLOOKUP2 (entity, IsPMCompany, Region, clm_billing_type, status, mgmtfee) values ('Zalexa Enterprises, PLLC','Yes','Texas - DFW','Pro Only','Active',0.3)