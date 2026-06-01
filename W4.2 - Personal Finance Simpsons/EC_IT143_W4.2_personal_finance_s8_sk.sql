USE Simpsons;
GO
EXEC dbo.usp_load_category_spending;
SELECT * FROM dbo.t_category_spending;