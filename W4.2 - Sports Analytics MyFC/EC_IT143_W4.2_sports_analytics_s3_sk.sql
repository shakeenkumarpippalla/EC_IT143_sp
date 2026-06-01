USE MyFC;
GO
SELECT p.p_name AS Position_Name, COUNT(pl.pl_id) AS Total_Players
FROM dbo.tblPlayerDim pl
JOIN dbo.tblPositionDim p ON pl.p_id = p.p_id
GROUP BY p.p_name;