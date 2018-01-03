alter view vwDenialsOverturned as 
select distinct claim_seq, 
				First_Name, 
				Last_Name, 
				Region_Short_Name, 
				Biller, 
				Insurance_Type, 
				Payer, 
				Surgeon,
				DOS,
				Payment_Collected,
				date_collected
from insurance_deposits_3300 

where comment like '%ota%'

create view vwDenialsOverturnedDetail as 
select * from vwCPTCollectionDetail where denialcode  like '%OTA%'



