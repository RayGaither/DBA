use master;
GO
alter database tempdb modify file (name='tempdev', filename='T:\DataTempDB\tempDB.mdf', size = 1MB);
GO
alter database tempdb modify file (name='templog', filename='L:\LOGS\templog.ldf', size = 1MB);
GO
alter database tempdb modify file (name='tempdev', size = 6656 MB);
alter database tempdb modify file (name='tempdev2', size = 6656 MB);
alter database tempdb modify file (name='tempdev3', size = 6656 MB);
alter database tempdb modify file (name='tempdev4', size = 6656 MB);
alter database tempdb modify file (name='tempdev5', size = 6656 MB);
alter database tempdb modify file (name='tempdev6', size = 6656 MB);
alter database tempdb modify file (name='tempdev7', size = 6656 MB);
alter database tempdb modify file (name='tempdev8', size = 6656 MB);

ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev2', FILENAME = N'T:\DataTempDB\tempdev2.ndf' , SIZE = 7424 MB , FILEGROWTH = 0)
GO
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev3', FILENAME = N'T:\DataTempDB\tempdev3.ndf' , SIZE = 6656 MB , FILEGROWTH = 0)
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev4', FILENAME = N'T:\DataTempDB\tempdev4.ndf' , SIZE = 7424 MB , FILEGROWTH = 0)
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev5', FILENAME = N'T:\DataTempDB\tempdev5.ndf' , SIZE = 7424 MB , FILEGROWTH = 0)
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev6', FILENAME = N'T:\DataTempDB\tempdev6.ndf' , SIZE = 7424 MB , FILEGROWTH = 0)
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev7', FILENAME = N'T:\DataTempDB\tempdev7.ndf' , SIZE = 7424 MB , FILEGROWTH = 0)
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev8', FILENAME = N'T:\DataTempDB\tempdev8.ndf' , SIZE = 6656 MB , FILEGROWTH = 0)


select @@Servername