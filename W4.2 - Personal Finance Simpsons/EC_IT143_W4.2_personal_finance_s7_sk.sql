USE Simpsons;
GO
CREATE OR ALTER PROCEDURE dbo.usp_load_category_spending AS
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE dbo.t_category_spending;
    INSERT INTO dbo.t_category_spending (Category, Total_Spent)
    SELECT Category, Total_Spent FROM dbo.v_category_spending;
END;