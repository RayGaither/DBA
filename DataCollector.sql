USE DBA_REP
 
SELECT ts.Location,ts.InstanceID,ts.ServerName,ts.InstanceName,sr.DescRole,
ts.DomainName,OT.BusinessName,OT.ProductName,ts.DistributionNotify,ts.VersionSQL,ts.SQLtype,ts.DBAVersion,ts.VersionOS,ts.SupportBY,ts.Processor,ts.CPUCount,
ts.IP,ts.CollectMetrics
FROM [DBA_REP].[dbo].[tblDBAServers] ts Left Join
[DBA_REP].[dbo].[tblDBAServerRole] sr on ts.ServerRole = sr.ServerRole
LEFT JOIN [DBA_Inventory].[dbo].[tblServers] OT on ts.InstanceName = OT.InstanceName
WHERE ts.status='a' and ts.SupportBY like 'dba'
order by InstanceName
