
use ankura_dw
go

--which files are growing by %

SELECT d.name as database_name,
    mf.name as file_name,
    mf.type_desc as file_type,
    mf.growth as current_percent_growth
FROM sys.master_files mf (NOLOCK)
JOIN sys.databases d (NOLOCK) on mf.database_id=d.database_id
WHERE is_percent_growth=1
GO

--set recomended size

USE [master];
GO
ALTER DATABASE [ankura_dw] MODIFY FILE (NAME='ankura_dwdata1', FILEGROWTH = 256MB);
ALTER DATABASE [ankura_dw] MODIFY FILE (NAME='ankura_dwlog1', FILEGROWTH = 128MB);
GO