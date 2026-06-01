USE Simpsons;
GO
DROP TABLE IF EXISTS dbo.t_category_spending;
CREATE TABLE dbo.t_category_spending (
    Category VARCHAR(100) NOT NULL,
    Total_Spent DECIMAL(18,2) NOT NULL,
    CONSTRAINT PK_CategorySpending PRIMARY KEY (Category)
);