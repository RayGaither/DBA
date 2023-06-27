USE [DBA_Inventory]
GO

/****** Object:  View [dbo].[vwSQLServersAll]    Script Date: 6/9/2023 9:09:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dbo].[vwSQLServersAll]
AS

SELECT [DomainName]
      ,s.[ServerName]
      ,s.[InstanceName]
	  ,A.[AppName]
	  ,A.AppRemarks
	  ,A.AppContact
	  ,A.Remarks
      ,[SQLVersion]      
      ,[SQLSP]
      ,[SQLCU]
      ,[SQLBuild]
	  ,[SQLEdition]
      ,R.DescRole AS [ServerRole]
	  ,[ServerOpsPOC]
   --   ,[BusinessName]
   --   ,[ProductName]
   --   ,[DistributionNotify]
      ,CASE [Status] WHEN 'A' THEN 'Active' ELSE 'Decommissioned' END As [Status]
      ,CASE [CollectMetrics] WHEN 1 THEN 'YES' ELSE 'NO' END AS [CollectMetrics]
      ,[OSVersion]
      ,[Processor]
      ,[SystemType]
      ,[TotalPhysicalMemory]
      ,[SQLMaxMemory]
      ,[SQLMinMemory]
      ,[IP]
      ,[SQLPort]
      ,[OSBootTime]
      ,[SQLStartTime]
      ,[TimeZone]
      ,[Location]
      ,[LoadTime]
	  ,[MaintenanceWindow]
  FROM [DBA_Inventory].[dbo].[tblServers] AS S
  LEFT JOIN [DBA_Inventory].[dbo].[tblServerRole] AS R on S.ServerRole = R.Role
  left join [DBA_Inventory].[dbo].[tblServerApp] as A on S.ServerName = A.ServerName and s.InstanceName = A.InstanceName
  --WHERE Status = 'A' and [SupportBY] = 'DBA'
  --ORDER BY [DomainName], CASE R.DescRole WHEN 'Lab, Demo' THEN 1
		--				   WHEN 'Dev' THEN 2
		--				   WHEN 'UAT' THEN 3
		--				   WHEN 'Prod' THEN 4
		--				   WHEN 'DR' THEN 5 END, InstanceName

GO


