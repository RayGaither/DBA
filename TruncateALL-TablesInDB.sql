select 'truncate table Diagnostic.dbo.' + name
from sys.tables
order by name

/*

truncate table Diagnostic.dbo.AdhocQueries
truncate table Diagnostic.dbo.AggregateBufferPoolUsage
truncate table Diagnostic.dbo.AGStatus
truncate table Diagnostic.dbo.AlwaysOnAGCluster
truncate table Diagnostic.dbo.AvgTaskCounts
truncate table Diagnostic.dbo.ClusterNodeProperties
truncate table Diagnostic.dbo.ConfigurationValues
truncate table Diagnostic.dbo.ConnectionCountsbyIPAddress
truncate table Diagnostic.dbo.CPUUsagebyDatabase
truncate table Diagnostic.dbo.CPUUtilizationHistory
truncate table Diagnostic.dbo.DatabaseFilenamesandPaths
truncate table Diagnostic.dbo.DatabaseProperties
truncate table Diagnostic.dbo.DB_CPU_Stat
truncate table Diagnostic.dbo.DetectBlocking
truncate table Diagnostic.dbo.DriveLevelLatency
truncate table Diagnostic.dbo.HardwareInfo
truncate table Diagnostic.dbo.IOLatencybyFile
truncate table Diagnostic.dbo.IOUsageByDatabase
truncate table Diagnostic.dbo.IOWarnings
truncate table Diagnostic.dbo.LastBackupByDatabase
truncate table Diagnostic.dbo.MemoryClerkUsage
truncate table Diagnostic.dbo.MemoryDumpInfo
truncate table Diagnostic.dbo.MemoryGrantsPending
truncate table Diagnostic.dbo.MissingIndexesAllDatabases
truncate table Diagnostic.dbo.PLEbyNUMANode
truncate table Diagnostic.dbo.ProcessMemory
truncate table Diagnostic.dbo.RGResourcePools
truncate table Diagnostic.dbo.SQLServerAgentAlerts
truncate table Diagnostic.dbo.SQLServerAgentJobs
truncate table Diagnostic.dbo.SQLServerNUMAInfo
truncate table Diagnostic.dbo.SQLServerServicesInfo
truncate table Diagnostic.dbo.SuspectPages
truncate table Diagnostic.dbo.SystemMemory
truncate table Diagnostic.dbo.TopAvgElapsedTimeQueries
truncate table Diagnostic.dbo.TopLogicalReadsQueries
truncate table Diagnostic.dbo.TopWorkerTimeQueries
truncate table Diagnostic.dbo.VersionInfo
truncate table Diagnostic.dbo.VLFCount
truncate table Diagnostic.dbo.VLFCounts
truncate table Diagnostic.dbo.VolumeInfo
truncate table Diagnostic.dbo.WindowsInfo

*/