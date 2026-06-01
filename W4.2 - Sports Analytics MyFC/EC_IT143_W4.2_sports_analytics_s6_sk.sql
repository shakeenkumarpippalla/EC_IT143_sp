USE MyFC;
GO
TRUNCATE TABLE dbo.t_position_counts;
INSERT INTO dbo.t_position_counts (Position_Name, Total_Players)
SELECT Position_Name, Total_Players FROM dbo.v_position_counts;