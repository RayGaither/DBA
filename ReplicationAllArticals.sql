<<<<<<< HEAD
SELECT
P.[publication] AS [Publication Name]
,A.[publisher_db] AS [Database Name]
,A.[source_owner] AS [Schema]
,A.[article] AS [Article Name]
,A.[source_object] AS [Object]
FROM
[distribution].[dbo].[MSarticles] AS A
INNER JOIN [distribution].[dbo].[MSpublications] AS P
ON (A.[publication_id] = P.[publication_id])
WHERE 1 = 1
--A.[publisher_db] = 'ERM'
--A.[source_object] like 'I210_Matchpoint_Data'
and P.[publication] = 'pub_KVPROD'
ORDER BY
P.[publication], A.[source_owner], A.[article];


--select count(1) from 
--[KVDBA].[tphoenix_cal_constants] --23
--[KVDBA].tssn_option -- 72
--[KVDBA].tstd_limit -- 1
--[KVDBA].tsys_control -- 1
--[KVDBA].ttrilliant_cr_option -- 21
--[KVDBA].ttst_prog -- 1305
--[KVDBA].tturbotest -- 171295
--[KVDBA].tvoltfactors --21
=======
SELECT
P.[publication] AS [Publication Name]
,A.[publisher_db] AS [Database Name]
,A.[source_owner] AS [Schema]
,A.[article] AS [Article Name]
,A.[source_object] AS [Object]
FROM
[distribution].[dbo].[MSarticles] AS A
INNER JOIN [distribution].[dbo].[MSpublications] AS P
ON (A.[publication_id] = P.[publication_id])
WHERE 1 = 1
--A.[publisher_db] = 'ERM'
--A.[source_object] like 'I210_Matchpoint_Data'
and P.[publication] = 'pub_KVPROD'
ORDER BY
P.[publication], A.[source_owner], A.[article];


--select count(1) from 
--[KVDBA].[tphoenix_cal_constants] --23
--[KVDBA].tssn_option -- 72
--[KVDBA].tstd_limit -- 1
--[KVDBA].tsys_control -- 1
--[KVDBA].ttrilliant_cr_option -- 21
--[KVDBA].ttst_prog -- 1305
--[KVDBA].tturbotest -- 171295
--[KVDBA].tvoltfactors --21
>>>>>>> master
