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
(SET filename = N'c:\temp\XEventSessions\blocked_process.xel',
     metadatafile = N'c:\temp\XEventSessions\blocked_process.xem',
     max_file_size=(65536),
     max_rollover_files=5)
WITH (MAX_DISPATCH_LATENCY = 5 SECONDS)
GO