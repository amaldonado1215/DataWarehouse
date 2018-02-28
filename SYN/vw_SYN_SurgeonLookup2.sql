ALTER VIEW vw_SYN_SurgeonLookup2 as
SELECT [SurgeonID]
      ,[Surgeon]
      ,[ProEntity]
      ,[StartDate]
      ,[EndDate]
      ,[Specialty]
      ,[Payor]
      ,[Region]
      ,[Ranking]
      ,[SurgeonContract]
      ,[SurgeonNo]	
FROM 	dbo.SurgeonLookup2	
WHERE SurgeonContract = 'Elite' 
