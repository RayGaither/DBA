DROP EVENT SESSION [blocked_process] ON SERVER 
GO




CREATE EVENT SESSION [blocked_process] ON SERVER
ADD EVENT sqlserver.blocked_process_report(
    ACTION(sqlserver.client_app_name,
           sqlserver.client_hostname,
           sqlserver.database_name)) ,
ADD EVENT sqlserver.xml_deadlock_report (
    ACTION(sqlserver.client_app_name,
           sqlserver.client_hostname,
           sqlserver.database_name))
ADD TARGET package0.asynchronous_file_target
(SET filename = N'G:\tmp\XEventSessions\blocked_process.xel',
     metadatafile = N'G:\tmp\XEventSessions\blocked_process.xem',
     max_file_size=(65536),
     max_rollover_files=5)
WITH (MAX_DISPATCH_LATENCY = 5 SECONDS)
GO



EXEC sp_configure 'show advanced options', 1 ;
GO
RECONFIGURE ;
GO
/* Enabled the blocked process report */
EXEC sp_configure 'blocked process threshold', '5';
RECONFIGURE
GO
/* Start the Extended Events session */
ALTER EVENT SESSION [blocked_process] ON SERVER
STATE = START;