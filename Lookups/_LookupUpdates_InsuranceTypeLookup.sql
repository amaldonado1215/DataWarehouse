SELECT * from insurancetypelookup

UPDATE insurancetypelookup SET  insurancegroup = 'BCBS' WHERE InsuranceType = 'Blue Cross Blue Shield'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'CHAMPVA'
UPDATE insurancetypelookup SET  insurancegroup = 'Attorney' WHERE InsuranceType = 'Lein Case'
UPDATE insurancetypelookup SET  insurancegroup = 'Attorney' WHERE InsuranceType = 'Letter of Protection'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'Medicaid'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'Medicaid Advantage Plan'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'Medicare'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'Medicare Advantage Plan'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'Medicare Replacement Plan'
UPDATE insurancetypelookup SET  insurancegroup = 'Other' WHERE InsuranceType = 'MVA (Motor Vehicle Accident)'
UPDATE insurancetypelookup SET  insurancegroup = 'Other' WHERE InsuranceType = 'Other'
UPDATE insurancetypelookup SET  insurancegroup = 'Private Insurance' WHERE InsuranceType = 'Private Insurance'
UPDATE insurancetypelookup SET  insurancegroup = 'Other' WHERE InsuranceType = 'Self Pay'
UPDATE insurancetypelookup SET  insurancegroup = 'Federal/State' WHERE InsuranceType = 'TRICARE'
UPDATE insurancetypelookup SET  insurancegroup = 'Other' WHERE InsuranceType = 'Uninsured'
UPDATE insurancetypelookup SET  insurancegroup = 'Workmans Comp' WHERE InsuranceType = 'Workmans Comp'


--sample for next time we do an update:
--first do the select to check

--begin TRAN
--update..... (put your statement here)

--commit
-- rollback (run if you want to ensure it won't hit the database)
--finish with select
