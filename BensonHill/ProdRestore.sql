USE [master]
RESTORE DATABASE [crestoT1] FROM  
DISK = N'F:\PRODUCTION_Landing\cresto01.bak' 
WITH  FILE = 1,  
MOVE N'cresto01' TO N'F:\data\crestonT1.mdf',  
MOVE N'cresto01_log' TO N'F:\log\crestonT1_log.ldf',  
NOUNLOAD,  STATS = 5

GO


--Befor IFI enabled, restore took 1 hour and 12 minutes

/*
Processed 38272512 pages for database 'crestoT1', file 'cresto01' on file 1.
Processed 8 pages for database 'crestoT1', file 'cresto01_log' on file 1.
RESTORE DATABASE successfully processed 38272520 pages in 1815.579 seconds (164.687 MB/sec).

Completion time: 2023-08-06T14:10:27.0608334-05:00

*/