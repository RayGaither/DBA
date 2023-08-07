SELECT  servicename as Service_Display_Name,
	   service_account as Service_Account,
        instant_file_initialization_enabled as Instant_File_Initialization_Enabled
FROM    sys.dm_server_services
WHERE   servicename LIKE 'SQL Server (%'



SELECT  @@SERVERNAME AS [Server Name] ,
        RIGHT(@@version, LEN(@@version) - 3 - CHARINDEX(' ON ', @@VERSION)) AS [OS Info] ,
        LEFT(@@VERSION, CHARINDEX('-', @@VERSION) - 2) + ' '
        + CAST(SERVERPROPERTY('ProductVersion') AS NVARCHAR(300)) AS [SQL Server Version] ,
        service_account ,
        instant_file_initialization_enabled
FROM    sys.dm_server_services
WHERE   servicename LIKE 'SQL Server (%'

