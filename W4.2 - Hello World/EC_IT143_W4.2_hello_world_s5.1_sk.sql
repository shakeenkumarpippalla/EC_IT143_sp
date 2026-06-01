USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_hello_world;

SELECT * INTO dbo.t_hello_world FROM dbo.v_hello_world WHERE 1 = 0;
