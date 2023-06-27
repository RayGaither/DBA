use DBA_Inventory
go


SELECT a.ServerName, 
      CASE
    WHEN a.[Metric] IN (24) THEN 'OS Memory Alerts'
    WHEN a.[Metric] IN (26) THEN 'OS CPU Alerts'
    WHEN a.[Metric] IN (29) THEN 'OS Processor Queue Alerts'
    WHEN a.[Metric] IN (33) THEN 'Blocking Alerts'
    WHEN a.[Metric] IN (76) THEN 'Page Life Expectancy Alerts'
    WHEN a.[Metric] IN (64) THEN 'Disk Alerts'
    WHEN a.[Metric] IN (88) THEN 'SQL Agent Job Failure Alerts'
    END AS Metric,
    Count(1) As Count
FROM [SQLdmRepository].[dbo].[Alerts] a
INNER JOIN [SQLdmRepository].[dbo].[MonitoredSQLServers] b (NOLOCK) ON a.[ServerName] = b.[InstanceName]
INNER JOIN [SQLdmRepository].[dbo].[ServerTags] c (NOLOCK) ON b.[SQLServerID] = c.[SQLServerId]
WHERE dateadd(minute, datediff(minute, 0, a.[UTCOccurrenceDateTime]), 0) between dateadd(DD, -2, GetDate()-3) and GetDate()-3
and a.[Severity] = 4
and a.[Metric] in (24, 26, 29, 33, 64, 76, 88)
and c.[TagId] = 2
GROUP BY a.[ServerName],a.[Metric]
ORDER BY Count(1) desc, a.[ServerName],a.[Metric]