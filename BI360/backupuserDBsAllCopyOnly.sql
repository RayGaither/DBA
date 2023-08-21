EXECUTE [dbo].[DatabaseBackup]
@Databases = 'USER_DATABASES',
@Directory = N'E:\SQLBackups',
@BackupType = 'FULL',
@Verify = 'Y',
@CleanupTime = 48,
@CheckSum = 'Y',
@LogToTable = 'Y',
@copyonly = 'Y'