<<<<<<< HEAD
select schema, [artical name] from(

SELECT
P.[publication] AS [Publication Name]
,A.[publisher_db] AS [Database Name]
,A.[source_owner] AS [Schema]
,A.[article] AS [Article Name]
,A.[source_object] AS [Object]
FROM
[distribution].[dbo].[MSarticles] AS A
INNER JOIN [distribution].[dbo].[MSpublications] AS P
ON (A.[publication_id] = P.[publication_id]))
WHERE 1 = 1
and P.[publication] = 'pub_KVPROD'
--A.[publisher_db] = 'ERM'
--A.[source_object] like 'I210_Matchpoint_Data')
ORDER BY
=======
select schema, [artical name] from(

SELECT
P.[publication] AS [Publication Name]
,A.[publisher_db] AS [Database Name]
,A.[source_owner] AS [Schema]
,A.[article] AS [Article Name]
,A.[source_object] AS [Object]
FROM
[distribution].[dbo].[MSarticles] AS A
INNER JOIN [distribution].[dbo].[MSpublications] AS P
ON (A.[publication_id] = P.[publication_id]))
WHERE 1 = 1
and P.[publication] = 'pub_KVPROD'
--A.[publisher_db] = 'ERM'
--A.[source_object] like 'I210_Matchpoint_Data')
ORDER BY
>>>>>>> master
P.[publication], A.[source_owner], A.[article];