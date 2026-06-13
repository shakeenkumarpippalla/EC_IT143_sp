-- ========================================================================
-- Assignment: 6.4 Performance Analysis Scripts
-- Database: AdventureWorks2025
-- Description: Generating missing index recommendations safely.
-- ========================================================================

USE [AdventureWorks2025];
GO

-- ========================================================================
-- QUERY 1: Searching Person.Person by an unindexed MiddleName
-- ========================================================================

-- STEP 1a: Reset the environment by dropping the index if it exists
DROP INDEX IF EXISTS IX_Person_MiddleName ON [Person].[Person];
GO

-- STEP 1b: Run this query with "Include Actual Execution Plan" turned ON (Ctrl + M)
-- This will generate your slow "Index Scan" and show the green recommendation.
SELECT BusinessEntityID, FirstName, MiddleName, LastName 
FROM Person.Person
WHERE MiddleName = 'J'; 
GO

-- STEP 1c: Create the recommended index safely
CREATE NONCLUSTERED INDEX IX_Person_MiddleName
ON [Person].[Person] ([MiddleName])
INCLUDE ([BusinessEntityID],[FirstName],[LastName]);
GO

-- STEP 1d: Re-run to verify the change from Scan to Seek
-- This execution will display a fast, high-performance "Index Seek".
SELECT BusinessEntityID, FirstName, MiddleName, LastName 
FROM Person.Person
WHERE MiddleName = 'J'; 
GO


-- ========================================================================
-- QUERY 2: Searching Sales.SalesOrderHeader by CreditCardApprovalCode
-- ========================================================================

-- STEP 2a: Reset the environment by dropping the index if it exists
DROP INDEX IF EXISTS IX_SalesOrderHeader_CreditCardApprovalCode ON [Sales].[SalesOrderHeader];
GO

-- STEP 2b: Run this query to trigger a heavy scan operator
SELECT SalesOrderID, OrderDate, CustomerID, CreditCardApprovalCode
FROM Sales.SalesOrderHeader
WHERE CreditCardApprovalCode = '105041VI84120';
GO

-- STEP 2c: Create the recommended index
CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_CreditCardApprovalCode
ON [Sales].[SalesOrderHeader] ([CreditCardApprovalCode])
INCLUDE ([SalesOrderID],[OrderDate],[CustomerID]);
GO

-- STEP 2d: Re-run to confirm optimization
SELECT SalesOrderID, OrderDate, CustomerID, CreditCardApprovalCode
FROM Sales.SalesOrderHeader
WHERE CreditCardApprovalCode = '105041VI84120';
GO