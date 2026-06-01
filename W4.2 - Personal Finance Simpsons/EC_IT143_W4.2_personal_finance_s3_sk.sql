USE Simpsons;
GO
SELECT Category, SUM(Amount) AS Total_Spent
FROM dbo.Planet_Express
GROUP BY Category;