USE Simpsons;
GO
CREATE OR ALTER VIEW dbo.v_category_spending AS
SELECT Category, SUM(Amount) AS Total_Spent
FROM dbo.Planet_Express
WHERE Category IS NOT NULL  -- 🌟 ADD THIS EXACT LINE HERE!
GROUP BY Category;