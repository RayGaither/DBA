SELECT 'truncate table ' + name
FROM SYSOBJECTS
WHERE xtype = 'U'
order by 1

/*

truncate table AdhocQueries
truncate table AggregateBufferPoolUsage
truncate table AGStatus
truncate table AlwaysOnAGCluster
truncate table AvgTaskCounts
truncate table BIOSDate
truncate table ClusterNodeProperties
truncate table ConfigurationValues
truncate table ConnectionCountsbyIPAddress
truncate table CPUUsagebyDatabase
truncate table CPUUtilizationHistory
truncate table DatabaseFilenamesandPaths
truncate table DatabaseProperties
truncate table DB_CPU_Stat
truncate table DetectBlocking
truncate table DriveLevelLatency
truncate table HardwareInfo
truncate table IOLatencybyFile
truncate table IOUsageByDatabase
truncate table IOWarnings
truncate table LastBackupByDatabase
truncate table MemoryClerkUsage
truncate table MemoryDumpInfo
truncate table MemoryGrantsPending
truncate table MissingIndexesAllDatabases
truncate table PLEbyNUMANode
truncate table ProcessMemory
truncate table RGResourcePools
truncate table SQLServerAgentAlerts
truncate table SQLServerAgentJobs
truncate table SQLServerNUMAInfo
truncate table SQLServerServicesInfo
truncate table SuspectPages
truncate table SystemMemory
truncate table TopAvgElapsedTimeQueries
truncate table TopLogicalReadsQueries
truncate table TopWorkerTimeQueries
truncate table VersionInfo
truncate table VLFCount
truncate table VLFCounts
truncate table VolumeInfo
truncate table WindowsInfo
truncate table SystemManufacturer
truncate table TopWaits
truncate table TotalBufferUsagebyDatabase
truncate table ProcessorDescription

*/