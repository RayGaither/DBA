-- Enable xp_cmdshell
EXEC sp_configure 'xp_cmdshell', 1
RECONFIGURE

-- Define the path to the folder containing the SQL files
DECLARE @sqlFolderPath VARCHAR(100) = 'C:\Path\To\SQL\Folder\'

-- Get a list of all the SQL files in the folder
DECLARE @sqlFiles TABLE (FileName VARCHAR(100))
INSERT INTO @sqlFiles
EXEC xp_cmdshell 'dir /B ' + @sqlFolderPath + '*.sql'

-- Loop through each SQL file and execute it using sqlcmd
DECLARE @sqlFile VARCHAR(100)
DECLARE @sqlCmd VARCHAR(1000)
DECLARE cur CURSOR FOR SELECT FileName FROM @sqlFiles
OPEN cur
FETCH NEXT FROM cur INTO @sqlFile
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sqlCmd = 'sqlcmd -S localhost -d YourDatabaseName -U YourUsername -P YourPassword -i "' + @sqlFolderPath + @sqlFile + '"'
    EXEC xp_cmdshell @sqlCmd
    FETCH NEXT FROM cur INTO @sqlFile
END
CLOSE cur
DEALLOCATE cur

-- Disable xp_cmdshell
EXEC sp_configure 'xp_cmdshell', 0
RECONFIGURE
