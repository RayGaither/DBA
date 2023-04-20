

CREATE TABLE #versions (
Version		varchar (100),
CU			varchar (50),
released	date,
Build		varchar (100))

Insert into #versions values
('SQL Server 2019','CU19','2/16/2022','15.0.4298.1'),
('SQL Server 2017','CU31 GDR','2/14/2023','14.0.3460.9'),
('SQL Server 2016','GDR','2/14/2023','13.0.6430.49'),
('SQL Server 2014','GDR','2/14/2023','12.0.6444.4')


SELECT TOP (1000) [DomainName]
      ,[ServerName]
      ,[InstanceName]
      ,[SQLVersion]
	  ,[SQLSP]
      ,[SQLCU]
      ,[SQLBuild]
      ,[SQLEdition]
	  ,v.[Version] as [Current Version]
	  ,v.CU as [Current CU]
	  ,v.Build as [Current Build]
      ,[ServerRole]
      ,[BusinessName]
      ,[ProductName]
      ,[DistributionNotify]
      ,[Status]
      ,[CollectMetrics]
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
  FROM [DBA_Inventory].[dbo].[vwSQLServersAll] s
  join #versions v on s.[SQLVersion] = v.Version


  where DomainName in ('ARMOR','BECKWITHELECTRIC.INC','HI.HUBBELL-AD')
  and sqlversion not in ('SQL Server 2008 R2','SQL Server 2012')
  order by SQLVersion

  --drop table #versions




  /*
  select distinct domainname
  from [dbo].[vwSQLServersAll]


ACLARAHOSTING
ACLARATECH
ACLEXPPROD
ARMOR
BECKWITHELECTRIC.INC
HI.HUBBELL-AD
  */