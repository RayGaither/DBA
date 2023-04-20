SELECT			bs.database_name
				, bs.[type],
				Case 
					when bs.is_copy_only = 1 then 'Yes'
					when bs.is_copy_only = 0 then 'No'
					else 'UnKnown'
				End as' Copy Only',

                bs.backup_start_date,
                bmf.physical_device_name,
                  Ordinal = ROW_NUMBER() OVER( PARTITION BY bs.database_name ORDER BY bs.backup_start_date DESC ),*
          FROM  msdb.dbo.backupmediafamily bmf
                  JOIN msdb.dbo.backupmediaset bms ON bmf.media_set_id = bms.media_set_id
                  JOIN msdb.dbo.backupset bs ON bms.media_set_id = bs.media_set_id
          WHERE   1 = 1
				  --and	bs.[type] = 'L'
      --            AND bs.is_copy_only = 0
				  and database_name = 'TestReporter'
				
		order by bs.backup_set_id desc
				
/*
9927MV1-BKP
AIKSCAPPS
CENMOENTRE
CHACASAGESQL
CHEIN-ADSK
HAPPYNEW
JBTSGV02-2019
SQL14PRIMARY
SQL2014TEST
SQLREP2014
*/