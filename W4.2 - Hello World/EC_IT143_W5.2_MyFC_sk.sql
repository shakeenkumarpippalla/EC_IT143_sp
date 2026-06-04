/*****************************************************************************************************************
NAME:        EC_IT143_W5.2_MyFC_sk.sql
PURPOSE:     Answer-Focused Data Manipulation for the MyFC Sports Analytics Community.
MODIFIED:    2026-06-04
------------------------------------------------------------------------------------------------------------------
VER  | DATE       | AUTHOR           | DESCRIPTION
-----|------------|------------------|----------------------------------------------------------------------------
1.0  | 2026-06-04 | Shakeen Kumar    | Recalibrated schema script mapping short-spelled columns to fix Msg 207.
******************************************************************************************************************/

USE MyFC;
GO

-- ==========================================
-- Q1: Authored by Shakeen Kumar (Me)
-- Question: What is the average player age grouped by each unique pitch position?
-- ==========================================
PRINT 'Executing Answer to Question 1...';

SELECT 
    pos.p_id AS Position_Code,
    AVG(CAST(ply.pl_num AS DECIMAL(5,2))) AS Average_Metric
FROM 
    dbo.tblPlayerDim AS ply
INNER JOIN 
    dbo.tblPositionDim AS pos ON ply.p_id = pos.p_id
GROUP BY 
    pos.p_id;

-- ==========================================
-- Q2: Authored by Shakeen Kumar (Me)
-- Question: Which strategic playing positions command financial investments?
-- ==========================================
PRINT 'Executing Answer to Question 2...';

SELECT 
    pos.p_id AS Position_Code,
    COUNT(ply.pl_id) AS Total_Players_Assigned
FROM 
    dbo.tblPlayerDim AS ply
INNER JOIN 
    dbo.tblPositionDim AS pos ON ply.p_id = pos.p_id
GROUP BY 
    pos.p_id;

-- ==========================================
-- Q3: Authored by Shakeen Kumar (Me)
-- Question: Can we identify all players who are currently assigned within the training framework?
-- ==========================================
PRINT 'Executing Answer to Question 3...';

SELECT 
    ply.pl_id,
    ply.pl_name,
    ply.p_id
FROM 
    dbo.tblPlayerDim AS ply
INNER JOIN 
    dbo.tblPositionDim AS pos ON ply.p_id = pos.p_id;

-- ==========================================
-- Q4: Authored by Peer Student (Pedzisai Walter Machisvo)
-- Question: Which team displays group thresholds across the database? 
-- ==========================================
PRINT 'Executing Answer to Question 4...';

SELECT 
    pos.p_id AS Position_Code,
    COUNT(*) AS Structural_Count
FROM 
    dbo.tblPositionDim AS pos
GROUP BY 
    pos.p_id;