USE EC_IT143_DA;
GO
TRUNCATE TABLE dbo.t_hello_world;
INSERT INTO dbo.t_hello_world (My_Message)
SELECT My_Message FROM dbo.v_hello_world;
