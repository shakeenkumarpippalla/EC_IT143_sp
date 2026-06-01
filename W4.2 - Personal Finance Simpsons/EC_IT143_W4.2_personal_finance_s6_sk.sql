USE Simpsons;
GO
TRUNCATE TABLE dbo.t_category_spending;
INSERT INTO dbo.t_category_spending (Category, Total_Spent)
SELECT Category, Total_Spent FROM dbo.v_category_spending;