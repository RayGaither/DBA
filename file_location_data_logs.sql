<<<<<<< HEAD

=======
--<<<<<<< HEAD
>>>>>>> d866662978d00ef8d8c6d1b74502fb2dfcf1e60d
SELECT 
mdf.database_id, 
mdf.name, 
sd.cmptlevel,
mdf.physical_name as data_file, 
ldf.physical_name as log_file, 
db_size_Mb = CAST((mdf.size * 8.0)/1024 AS DECIMAL(8,2)), 
log_size_Mb = CAST((ldf.size * 8.0 / 1024) AS DECIMAL(8,2))
FROM (SELECT * FROM sys.master_files WHERE type_desc = 'ROWS' ) mdf
	JOIN (SELECT * FROM sys.master_files WHERE type_desc = 'LOG' ) ldf
		    ON mdf.database_id = ldf.database_id
join master.dbo.sysdatabases sd on mdf.database_id = sd.dbid
where 1 = 1
and mdf.database_id > 4
and mdf.name not in ('_DBAdmin','Aux_DBA_Utilities', 'master', 'model','MSDB')
order by 1;

/*
SELECT * --name, cmptlevel 
FROM master.dbo.sysdatabases
where dbid > 4
order by name

=======
SELECT 
mdf.database_id, 
mdf.name, 
sd.cmptlevel,
mdf.physical_name as data_file, 
ldf.physical_name as log_file, 
db_size_Mb = CAST((mdf.size * 8.0)/1024 AS DECIMAL(8,2)), 
log_size_Mb = CAST((ldf.size * 8.0 / 1024) AS DECIMAL(8,2))
FROM (SELECT * FROM sys.master_files WHERE type_desc = 'ROWS' ) mdf
	JOIN (SELECT * FROM sys.master_files WHERE type_desc = 'LOG' ) ldf
		    ON mdf.database_id = ldf.database_id
join master.dbo.sysdatabases sd on mdf.database_id = sd.dbid
where 1 = 1
and mdf.database_id > 4
and mdf.name not in ('_DBAdmin','Aux_DBA_Utilities', 'master', 'model','MSDB')
order by 1;
<<<<<<< HEAD


=======
*/
/*
>>>>>>> d866662978d00ef8d8c6d1b74502fb2dfcf1e60d
SELECT * --name, cmptlevel 
FROM master.dbo.sysdatabases
where dbid > 4
order by name

>>>>>>> master
*/