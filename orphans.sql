<<<<<<< HEAD
USE ankura_dw
 
EXEC SP_CHANGE_USERS_LOGIN 'REPORT'
GO


USE
MASTER
CREATE LOGIN ANKURADW_TableauRpts WITH PASSWORD = '0nly$hyft6',
SID = 0x482A81F1EE5E5F489A73F0EBCEE1A414


-- script from rev login
-- Login: DWScheduler
--CREATE LOGIN [DWScheduler] 
--WITH PASSWORD = 0x020075F4BDF9BE1D151721D5EE7E23F1CA2779403BABBEF5590CBCCB5049BC144AE760F98CBED46CDBEE4B9D68861BC7B87D54DB1416331BEDE1804061625E44C4D4F4E0D466 HASHED
--, SID = 0x0851C3A475392042AAE5358ACEA03630, 
--DEFAULT_DATABASE = [ankura_dw], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
=======
USE ankura_dw
 
EXEC SP_CHANGE_USERS_LOGIN 'REPORT'
GO


USE
MASTER
CREATE LOGIN ANKURADW_TableauRpts WITH PASSWORD = '0nly$hyft6',
SID = 0x482A81F1EE5E5F489A73F0EBCEE1A414


-- script from rev login
-- Login: DWScheduler
--CREATE LOGIN [DWScheduler] 
--WITH PASSWORD = 0x020075F4BDF9BE1D151721D5EE7E23F1CA2779403BABBEF5590CBCCB5049BC144AE760F98CBED46CDBEE4B9D68861BC7B87D54DB1416331BEDE1804061625E44C4D4F4E0D466 HASHED
--, SID = 0x0851C3A475392042AAE5358ACEA03630, 
--DEFAULT_DATABASE = [ankura_dw], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
>>>>>>> master
 