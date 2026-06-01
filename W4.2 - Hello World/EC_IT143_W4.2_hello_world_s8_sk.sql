USE EC_IT143_DA;
GO
EXEC dbo.usp_load_hello_world;
SELECT * FROM dbo.t_hello_world;