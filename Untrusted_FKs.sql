SELECT '[' + s.name + '].[' + o.name + '].[' + i.name + ']' AS keyname
from sys.foreign_keys i
INNER JOIN sys.objects o ON i.parent_object_id = o.object_id
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE i.is_not_trusted = 1 AND i.is_not_for_replication = 0;
GO

SELECT '[' + s.name + '].[' + o.name + '].[' + i.name + ']' AS keyname
from sys.check_constraints i
INNER JOIN sys.objects o ON i.parent_object_id = o.object_id
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE i.is_not_trusted = 1 AND i.is_not_for_replication = 0 AND i.is_disabled = 0;
GO



/*

to fix them

ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Dim2
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Dim4
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Dim3
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_TimePeriod
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Category
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Dim0
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Dim1
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Account
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Entity
ALTER TABLE [dbo].f_Trans_GL WITH CHECK CHECK CONSTRAINT FK_GL_Scenario
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Dim2
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Dim3
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_TimePeriod
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Category
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Dim0
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Dim1
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Account
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Entity
ALTER TABLE [dbo].f_Trans_GL_Detail WITH CHECK CHECK CONSTRAINT FK_GL_Detail_Scenario



*/