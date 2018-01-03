USE [USMON_Local]
GO
/****** Object:  StoredProcedure [dbo].[spRefreshData]    Script Date: 8/9/2016 11:41:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spCreateTempTables]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN

	drop table tblMaster2	
	select * INTO tblMaster2 From vwMaster2

	drop table tblAgentHistory2
	SELECT  * INTO    tblAgentHistory2 FROM    AgentHistory2


END