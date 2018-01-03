select * from readers where readername like '%allie%'


--ticket 1874

select * from agents where agent in ('Candace Stephens','Starla Williams','Lisa Garcia','Virginia Wingate')

insert into agents (agent, id) values ('Candace Stephens','8060')
insert into agents (agent, id) values ('Starla Williams','8063')
insert into agents (agent, id) values ('Lisa Garcia','8062')
insert into agents (agent, id) values ('Virginia Wingate','8061')

select * from vwmaster2 where correctentity like '%tejas%' and dos > '2017-06-01' order by dos

select * from vwpacases where pid = 682891
select * from vwpamaster where claim_id = 832753

select * from vwcases where tech = 'Sami Soleimani, M.S.' and pid = 679232

select * from vwpacases where pid = 733207
select * from vwpamaster where pid = 733207
select * from vwpamaster_test2 where pid = 733207
select * from vwpamaster where DOS >='2017-07-07' and [Insurance Type] = 'Letter of Protection'
select * from vwpamaster_test2 where DOS >='2017-07-07' and [Insurance Type] = 'Letter of Protection'
select * from vwpamaster where pid = 781816
select * from vwpamaster_test2 where pid = 781816
select * from vwpamaster where pid = 781816
select * from vwpamaster where pid = 733207
select * from vwpacases where pid = 781816
select * from vwpacases where pid = 733207

select * from vwhospitalbillings

select * from vwpamaster where claim_id in (977981,976843)

select * from vwpamaster where Surgeon = 'Adam Bruggeman, M.D.' and dos >= '2017-01-01' and [Insurance Type] = 'Blue Cross Blue Shield' 

select * from hospitallookup
select * from pasurgeonlookup where Surgeon = 'Adam Bruggeman, M.D.'

select * from vwcases where defaultentity = 'Northwestern Neuromonitoring Services, LLC' and dos >= '2017-11-01' and dos <'2017-12-01'
select * from vwcases where defaultentity = 'Northwestern Neuromonitoring Services, LLC' and dos >= '2017-11-01' and dos <'2017-11-29'

select * from vwmaster2 where correctentity = 'Northwestern Neuromonitoring Services, LLC' and billstatus =  'Not Billed'

create login synchronize1 with password = 'JustFl0ck!t';

select * from vwmaster2 where defaultentity = 'Shortwave Diagnostics LLC'