USE [master]
GO

EXEC master.dbo.sp_dropserver @server=N'ANKSVMDWSQLP006', @droplogins='droplogins'
GO

EXEC master.dbo.sp_addlinkedserver @server = N'ANKSVMDWSQLP006', @srvproduct=N'', @provider=N'SQLNCLI', @datasrc=N'10.128.231.91'


 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'ANKSVMDWSQLP006',@useself=N'False',@locallogin=NULL,@rmtuser=N'TmpDBA',@rmtpassword='1122qq'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'ANKSVMDWSQLP006', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


