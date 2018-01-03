alter view vwhl7_Raw as
SELECT DISTINCT patient_id, [Primary Policy, Group ID/Secondary ID No] AS GroupID
FROM            dbo.hl7_raw_data_3300

create view vwPA_hl7_Raw as
SELECT DISTINCT patient_id, [Primary Policy, Group ID/Secondary ID No] AS GroupID
FROM            dbo.hl7_raw_data_3350

