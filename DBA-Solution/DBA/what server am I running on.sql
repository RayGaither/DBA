use ankura_dw
go

declare @SvrName varchar(40)

Select @SvrName = @@SERVERNAME;
begin try
If @SvrName <> 'ANKSVMDWSQLP002'
	RAISERROR(N'Test', 16, 1);
Else 

Print 'Running on ' + @SvrName

begin
Print 'Doing Stuff'
end

END Try

Begin Catch

Print 'Caught'

End Catch

Print 'Completed'