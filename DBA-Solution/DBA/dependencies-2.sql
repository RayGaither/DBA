;WITH TFV_Dependencies AS 
(
    SELECT 
         --OBJECT_SCHEMA_NAME(sysdep.referencing_id) AS Referencing_Schema 
         ReferencingO.object_id AS ReferencingObject_Id 
        ,sysschema.name AS Referencing_Schema 
        ,ReferencingO.name AS Referencing_Object_Name 
        ,sysdep.referenced_schema_name AS Referenced_Schema 
        ,sysdep.referenced_entity_name AS Referenced_Object_Name 
        --,ReferencingO.type
        ,ReferencedO.name AS RefName 
        --,ReferencedO.type AS RefType
    FROM sys.objects as ReferencingO 

    LEFT JOIN sys.schemas AS sysschema 
        ON sysschema.schema_id = ReferencingO.schema_id 

    LEFT JOIN sys.sql_expression_dependencies AS sysdep 
    LEFT JOIN sys.objects as ReferencedO 
        ON ReferencedO.name = sysdep.referenced_entity_name 
        ON sysdep.referencing_id = ReferencingO.object_id 
        AND ReferencingO.name <> sysdep.referenced_entity_name 
        --AND ReferencedO.type <> 'U' 
        AND ReferencedO.type IN ( 'IF', 'FN', 'V' ) 

    WHERE (1=1) 
    --AND ReferencingO.type NOT IN ('PK','F','UQ','SQ','D','IT', 'S')
    --AND ReferencingO.type IN ( 'U', 'V', 'FN', 'IF', 'P') 
    AND ReferencingO.type IN ( 'IF', 'FN', 'V' ) 
    AND ReferencingO.name NOT IN 
    (
         'dt_adduserobject'
        ,'dt_droppropertiesbyid'
        ,'dt_dropuserobjectbyid'
        ,'dt_generateansiname'
        ,'dt_getobjwithprop'
        ,'dt_getobjwithprop_u'
        ,'dt_getpropertiesbyid'
        ,'dt_getpropertiesbyid_u'
        ,'dt_setpropertybyid'
        ,'dt_setpropertybyid_u'
        ,'dt_verstamp006'
        ,'dt_verstamp007'

        ,'sp_helpdiagrams'
        ,'sp_creatediagram'
        ,'sp_alterdiagram'
        ,'sp_renamediagram'
        ,'sp_dropdiagram'

        ,'sp_helpdiagramdefinition'
        ,'fn_diagramobjects'
    ) 

) 

,DependencyGroup AS 
( 
    -- base case 
    SELECT 
         ReferencingObject_Id AS ObjectId 
        ,Referencing_Object_Name AS ObjectName  
        ,Referencing_Schema AS ObjectSchema 
        ,1 AS Lvl 
    FROM TFV_Dependencies 
    WHERE 1=1 
    AND Referenced_Object_Name IS NULL 

    -- recursive case
    UNION ALL 

   SELECT 
         d.ReferencingObject_Id AS ObjectId 
        ,d.Referencing_Object_Name AS ObjectName 
        ,d.Referencing_Schema AS ObjectSchema 
        ,r.Lvl + 1 AS Lvl 
    FROM TFV_Dependencies AS d 
    INNER JOIN DependencyGroup AS r 
        ON r.ObjectName = d.Referenced_Object_Name 
) 
,
CTE AS 
(
    SELECT TOP 999999999999999999 
         MAX(Lvl) AS Lvl 
        ,ObjectId 
        ,ObjectSchema
        ,ObjectName 
        --,'DELETE FROM [' + REPLACE(ObjectName, '''', '''''') + ']; ' AS DeleteCmd 
    FROM DependencyGroup 

    GROUP BY ObjectId, ObjectSchema, ObjectName 
)

SELECT 
     CTE.Lvl
    ,CTE.ObjectSchema AS SPECIFIC_SCHEMA 
    ,CTE.ObjectName AS SPECIFIC_NAME 
    ,sysSqlModules.definition AS ROUTINE_DEFINITION 
FROM CTE 

LEFT JOIN sys.sql_modules AS sysSqlModules 
    ON sysSqlModules.object_id = CTE.ObjectId 

ORDER BY Lvl, ObjectSchema, ObjectName 

OPTION (MAXRECURSION 0) 