/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_Sp.sql
PURPOSE: Provide clean, multi-schema T-SQL solutions to 8 business and metadata questions using AdventureWorks2025.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2026   Your Initials 1. Formatted questions and engineered structured JOIN/Metadata answer queries.


RUNTIME: 
0m 1s

NOTES: 
This script answers 2 marginal, 2 moderate, 2 increased complexity, and 2 metadata questions using 
the Production, Sales, HumanResources, and Person schemas in the AdventureWorks database.
 
******************************************************************************************************************/

-- ==========================================
-- CATEGORY 1: MARGINAL COMPLEXITY
-- ==========================================

-- Q1: What are the first names and last names of all our active sales representatives?
-- A1: This query filters the core Person table specifically for 'SP' (Sales Person) staff types.
SELECT 
    FirstName, 
    LastName
FROM Person.Person
WHERE PersonType = 'SP';


-- Q2: Which ten products have the highest list price in AdventureWorks?
-- A2: This query sorts our complete production catalog descending by retail list price to return the top 10 items.
SELECT TOP 10 
    Name, 
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


-- ==========================================
-- CATEGORY 2: MODERATE COMPLEXITY
-- ==========================================

-- Q3: Our logistics team needs to optimize shipping. Which five customer states or provinces registered the absolute highest number of individual sales orders?
-- A3: This query joins our operational sales headers to geography tables to aggregate total order counts per state.
SELECT TOP 5 
    SP.Name AS StateProvinceName, 
    COUNT(SOH.SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Person.Address AS A 
    ON SOH.ShipToAddressID = A.AddressID
INNER JOIN Person.StateProvince AS SP 
    ON A.StateProvinceID = SP.StateProvinceID
GROUP BY SP.Name
ORDER BY TotalOrders DESC;


-- Q4: I want to compare bicycle sales by category. Which product categories generated the highest total sales revenue in 2013?
-- A4: This query links transactional tables back up through subcategories to isolate specific revenue metrics for the calendar year 2013.
SELECT 
    PC.Name AS CategoryName,
    SUM(SOD.LineTotal) AS TotalSalesRevenue
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD 
    ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product AS P 
    ON SOD.ProductID = P.ProductID
INNER JOIN Production.ProductSubcategory AS PS 
    ON P.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC 
    ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE YEAR(SOH.OrderDate) = 2013
GROUP BY PC.Name
ORDER BY TotalSalesRevenue DESC;


-- ==========================================
-- CATEGORY 3: INCREASED COMPLEXITY
-- ==========================================

-- Q5: A regional manager believes our online sales channel outperformed physical stores during a specific promotional period. Can you pull the total sales amounts for July 2011? I need this broken down by online orders versus store orders, including total tax paid and total freight costs.
-- A5: This conditional query groups our financial parameters using the boolean online transaction indicator.
SELECT 
    CASE 
        WHEN OnlineOrderFlag = 1 THEN 'Online Order'
        ELSE 'Store Order'
    END AS SalesChannel,
    SUM(SubTotal) AS TotalSalesAmount,
    SUM(TaxAmt) AS TotalTaxPaid,
    SUM(Freight) AS TotalFreightCosts
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-07-01' 
  AND OrderDate <= '2011-07-31'
GROUP BY OnlineOrderFlag;


-- Q6: Our luxury sales division is preparing a targeted VIP campaign in England. I need the full names of all customers residing in London who have purchased a black mountain bike frame and whose total lifetime spending exceeds $7,000.
-- A6: This advanced statement evaluates relational links across human data and physical production to isolate high-value shoppers by location.
SELECT 
    P.FirstName,
    P.LastName,
    SUM(SOH.SubTotal) AS LifetimeSpending
FROM Sales.Customer AS C
INNER JOIN Person.Person AS P 
    ON C.PersonID = P.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader AS SOH 
    ON C.CustomerID = SOH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SOD 
    ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product AS Pr 
    ON SOD.ProductID = Pr.ProductID
INNER JOIN Person.BusinessEntityAddress AS BEA 
    ON P.BusinessEntityID = BEA.BusinessEntityID
INNER JOIN Person.Address AS A 
    ON BEA.AddressID = A.AddressID
WHERE A.City = 'London'
  AND Pr.Color = 'Black'
  AND Pr.Name LIKE '%Mountain%'
GROUP BY P.FirstName, P.LastName, C.CustomerID
HAVING SUM(SOH.SubTotal) > 7000;


-- ==========================================
-- CATEGORY 4: METADATA QUESTIONS
-- ==========================================

-- Q7: Can you create a list of AdventureWorks tables containing a column named ProductID?
-- A7: This meta-query inspects the database's structural schema catalog tables to locate a targeted field reference.
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID'
  AND TABLE_SCHEMA NOT IN ('INFORMATION_SCHEMA', 'sys');


-- Q8: How many views exist in the AdventureWorks database that currently belong to the HumanResources database schema?
-- A8: This query counts system records within the structural metadata view logs filtering by schema type.
SELECT 
    COUNT(*) AS TotalViews
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'HumanResources';