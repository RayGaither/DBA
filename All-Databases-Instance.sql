SELECT * FROM sys.databases


select * from sys.objects where type_desc = 'USER_TABLE'

SELECT t1.name [table], t2.* 
FROM sys.objects t1
        inner join sys.columns t2 on t1.object_id = t2.object_id 
where type_desc = 'USER_TABLE'


select @@servername