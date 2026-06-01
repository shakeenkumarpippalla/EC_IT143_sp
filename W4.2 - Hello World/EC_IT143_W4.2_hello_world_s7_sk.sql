USE EC_IT143_DA;
GO
CREATE OR ALTER PROCEDURE dbo.usp_load_hello_world AS
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE dbo.t_hello_world;
    INSERT INTO dbo.t_hello_world (My_Message)
    SELECT My_Message FROM dbo.v_hello_world;
END;