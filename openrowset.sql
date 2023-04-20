USE [Diagnostic]
GO
/****** Object:  StoredProcedure [dbo].[GenerateDiagTable]    Script Date: 4/7/2023 11:48:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_CoreCounts] 
as


Begin

EXEC sys.xp_readerrorlog 0, 1, N'detected', N'socket';

end -- Stored Procedure




SELECT *
INTO CoreCounts
FROM OPENROWSET('SQLNCLI', 'Server=(local);Trusted_Connection=yes;',
				'set fmtonly off
               EXEC [Diagnostic].[dbo].[sp_CoreCounts]') a;


SELECT *
INTO CoreCounts
FROM OPENROWSET('SQLNCLI', 'Server=(local);Trusted_Connection=yes;',
				'set fmtonly off
               EXEC sys.xp_readerrorlog 0, 1, N''''detected'''', N''''socket''''') a;
