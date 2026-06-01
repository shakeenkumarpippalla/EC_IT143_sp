USE MyFC;
GO
EXEC dbo.usp_load_position_counts;
SELECT * FROM dbo.t_position_counts;