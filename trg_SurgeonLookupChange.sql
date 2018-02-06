CREATE TRIGGER trg_SurgeonLookupChange on dbo.surgeonlookup2
FOR UPDATE
/* Inserts current date into Modify_Date in dbo.SurgeonLookup2 */
as 
BEGIN
	if(@@rowcount = 0)
		return;

	UPDATE s
	SET Modify_Date = getdate()
	FROM dbo.surgeonlookup2 s 
		INNER JOIN Inserted i on s.SurgeonID = i.SurgeonID
END 
GO
