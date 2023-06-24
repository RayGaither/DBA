EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'QADB-Mail',
    @recipients = 'rgaither@hubbell.com',
    @body = 'The stored procedure finished successfully.',
    @subject = 'Automated Success Message';
