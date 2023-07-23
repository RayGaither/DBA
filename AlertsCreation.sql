-- Add important SQL Agent Alerts
-- Change Alert names and operator_name as needed

 
USE [msdb];
GO
 
-- Change @OperatorName as needed
-- Alert Names start with the name of the server
DECLARE @OperatorName SYSNAME = N'SQLDBAs';
DECLARE @Sev19AlertName SYSNAME = N'DBA Alert - Sev 19 Error: Fatal Error in Resource';
DECLARE @Sev20AlertName SYSNAME = N'DBA Alert - Sev 20 Error: Fatal Error in Current Process';
DECLARE @Sev21AlertName SYSNAME = N'DBA Alert - Sev 21 Error: Fatal Error in Database Process';
DECLARE @Sev22AlertName SYSNAME = N'DBA Alert - Sev 22 Error Fatal Error: Table Integrity Suspect';
DECLARE @Sev23AlertName SYSNAME = N'DBA Alert - Sev 23 Error: Fatal Error Database Integrity Suspect';
DECLARE @Sev24AlertName SYSNAME = N'DBA Alert - Sev 24 Error: Fatal Hardware Error';
DECLARE @Sev25AlertName SYSNAME = N'DBA Alert - Sev 25 Error: Fatal Error';
DECLARE @Error825AlertName SYSNAME = N'DBA Alert - Error 825: Read-Retry Required';
 
 
 
-- Sev 19 Error: Fatal Error in Resource
EXEC msdb.dbo.sp_add_alert @name = @Sev19AlertName, 
              @message_id=0, 
              @Severity=19, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000';
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev19AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
-- Sev 20 Error: Fatal Error in Current Process
EXEC msdb.dbo.sp_add_alert @name = @Sev20AlertName, 
              @message_id=0, 
              @Severity=20, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000'
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev20AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
-- Sev 21 Error: Fatal Error in Database Process
EXEC msdb.dbo.sp_add_alert @name = @Sev21AlertName, 
              @message_id=0, 
              @Severity=21, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000'
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev21AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
-- Sev 22 Error: Fatal Error Table Integrity Suspect
EXEC msdb.dbo.sp_add_alert @name = @Sev22AlertName, 
              @message_id=0, 
              @Severity=22, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000'
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev22AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
-- Sev 23 Error: Fatal Error Database Integrity Suspect
EXEC msdb.dbo.sp_add_alert @name = @Sev23AlertName, 
              @message_id=0, 
              @Severity=23, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000'
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev23AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
-- Sev 24 Error: Fatal Hardware Error
EXEC msdb.dbo.sp_add_alert @name = @Sev24AlertName, 
              @message_id=0, 
              @Severity=24, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000'
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev24AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
-- Sev 25 Error: Fatal Error
EXEC msdb.dbo.sp_add_aalert @name = @Sev25AlertName, 
              @message_id=0, 
              @Severity=25, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @job_id=N'00000000-0000-0000-0000-000000000000'
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Sev25AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
 
 
 
-- Error 825: Read-Retry Required
EXEC msdb.dbo.sp_add_alert @name = @Error825AlertName, 
              @message_id=825, 
              @Severity=0, 
              @enabled=1, 
              @delay_between_responses=900, 
              @include_event_description_in=1, 
              @category_name=N'[Uncategorized]', 
              @job_id=N'00000000-0000-0000-0000-000000000000';
 
EXEC msdb.dbo.sp_add_notification @alert_name = @Error825AlertName, 
@operator_name=@OperatorName, @notification_method = 1;
