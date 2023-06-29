use master
go

drop table [dbo].[bpr]
go

CREATE TABLE bpr (
    EndTime DATETIME,
    TextData XML,
    EventClass INT DEFAULT(137)
);
GO
 
WITH events_cte AS (
    SELECT
        DATEADD(mi,
        DATEDIFF(mi, GETUTCDATE(), CURRENT_TIMESTAMP),
        xevents.event_data.value('(event/@timestamp)[1]',
           'datetime2')) AS [event_time] ,
        xevents.event_data.query('(event[@name="blocked_process_report"]/data[@name="blocked_process"]/value/blocked-process-report)[1]')
            AS blocked_process_report
    FROM    sys.fn_xe_file_target_read_file
        ('G:\tmp\XEventSessions\blocked_process*.xel',
         'G:\tmp\XEventSessions\blocked_process*.xem',
         null, null)
        CROSS APPLY (SELECT CAST(event_data AS XML) AS event_data) as xevents
)
INSERT INTO bpr (EndTime, TextData)
SELECT
    [event_time],
    blocked_process_report
FROM events_cte
WHERE blocked_process_report.value('(blocked-process-report[@monitorLoop])[1]', 'nvarchar(max)') IS NOT NULL
ORDER BY [event_time] DESC ;
 
EXEC sp_blocked_process_report_viewer @Source ='[dbo].[bpr]', @Type ='TABLE';
