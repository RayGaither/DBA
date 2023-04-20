<<<<<<< HEAD
--exec sp_changepublication FisherKing_Copyication,allow_anonymous,false
--GO
--exec sp_changepublication FisherKing_Copyication,immediate_sync,false
--GO


--EXEC sp_dropsubscription FisherKing_Copyication,Info_Class, 'DDBBServer1\DUB' ,FisherKing_COPY
--GO
--EXEC sp_droparticle  FisherKing_Copyication,Info_Class




exec sp_changepublication 'pub_KVPROD', allow_anonymous,  false
go
exec sp_changepublication 'pub_KVPROD', immediate_sync,false
go

EXEC sp_dropsubscription N'pub_KVPROD', TRSN_REJ, 'JBLPRODSQL03\COMMERCIAL', KVPROD
go
EXEC sp_droparticle N'pub_KVPROD', TRSN_REJ
go

exec sp_changepublication 'pub_KVPROD', immediate_sync,true
go
exec sp_changepublication 'pub_KVPROD', allow_anonymous,  true
go


--DECLARE @publication AS sysname;
--DECLARE @subscriber AS sysname;
--SET @publication = N'pub_KVPRODn';
--SET @subscriber = $(SubServer);

--USE [AdventureWorks2012]
--EXEC sp_dropsubscription 
--  @publication = @publication, 
--  @article = N'all',
--  @subscriber = @subscriber;
--GO
=======
--exec sp_changepublication FisherKing_Copyication,allow_anonymous,false
--GO
--exec sp_changepublication FisherKing_Copyication,immediate_sync,false
--GO


--EXEC sp_dropsubscription FisherKing_Copyication,Info_Class, 'DDBBServer1\DUB' ,FisherKing_COPY
--GO
--EXEC sp_droparticle  FisherKing_Copyication,Info_Class




exec sp_changepublication 'pub_KVPROD', allow_anonymous,  false
go
exec sp_changepublication 'pub_KVPROD', immediate_sync,false
go

EXEC sp_dropsubscription N'pub_KVPROD', TRSN_REJ, 'JBLPRODSQL03\COMMERCIAL', KVPROD
go
EXEC sp_droparticle N'pub_KVPROD', TRSN_REJ
go

exec sp_changepublication 'pub_KVPROD', immediate_sync,true
go
exec sp_changepublication 'pub_KVPROD', allow_anonymous,  true
go


--DECLARE @publication AS sysname;
--DECLARE @subscriber AS sysname;
--SET @publication = N'pub_KVPRODn';
--SET @subscriber = $(SubServer);

--USE [AdventureWorks2012]
--EXEC sp_dropsubscription 
--  @publication = @publication, 
--  @article = N'all',
--  @subscriber = @subscriber;
--GO
>>>>>>> master
