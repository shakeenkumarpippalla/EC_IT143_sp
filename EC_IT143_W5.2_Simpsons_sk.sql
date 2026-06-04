/*****************************************************************************************************************
NAME:        EC_IT143_W5.2_Simpsons_sk.sql
PURPOSE:     Answer-Focused Data Manipulation for the Simpsons Personal Finance Community.
MODIFIED:    2026-06-04
------------------------------------------------------------------------------------------------------------------
VER  | DATE       | AUTHOR           | DESCRIPTION
-----|------------|------------------|----------------------------------------------------------------------------
1.0  | 2026-06-04 | Shakeen Kumar    | Recalibrated schema script to remove invalid column references.
******************************************************************************************************************/

-- Point directly to your Simpsons database context
USE Simpsons;
GO

-- ==========================================
-- Q1: Authored by Shakeen Kumar (Me)
-- Question: What is the cumulative transactional expenditure calculated across categories?
-- ==========================================
PRINT 'Executing Answer to Question 1...';

SELECT 
    Category,
    SUM(Amount) AS Total_Expenditure,
    COUNT(*) AS Row_Count
FROM 
    dbo.Planet_Express
GROUP BY 
    Category
ORDER BY 
    Total_Expenditure DESC;

-- ==========================================
-- Q2: Authored by Shakeen Kumar (Me)
-- Question: Which tracking entries point to highest value category trends?
-- ==========================================
PRINT 'Executing Answer to Question 2...';

SELECT 
    Category,
    AVG(Amount) AS Average_Category_Spent
FROM 
    dbo.Planet_Express
GROUP BY 
    Category;

-- ==========================================
-- Q3: Authored by Shakeen Kumar (Me)
-- Question: Can we view transaction rows matching the card log layout?
-- ==========================================
PRINT 'Executing Answer to Question 3...';

SELECT 
    Category,
    Amount
FROM 
    dbo.Planet_Express;

-- ==========================================
-- Q4: Authored by Peer Student (Alice Eric)
-- Question: Which classifications accumulate the highest single line-item spending spikes?
-- ==========================================
PRINT 'Executing Answer to Question 4...';

SELECT 
    Category,
    MAX(Amount) AS Highest_Single_Transaction
FROM 
    dbo.Planet_Express
GROUP BY 
    Category
ORDER BY 
    Highest_Single_Transaction DESC;