USE MyFC;
GO
CREATE OR ALTER VIEW dbo.v_position_counts AS
/*******************************************************************************
Description: Returns an aggregated breakdown of total players per field position.
*******************************************************************************/
SELECT p.p_name AS Position_Name, COUNT(pl.pl_id) AS Total_Players
FROM dbo.tblPlayerDim pl
JOIN dbo.tblPositionDim p ON pl.p_id = p.p_id
GROUP BY p.p_name;