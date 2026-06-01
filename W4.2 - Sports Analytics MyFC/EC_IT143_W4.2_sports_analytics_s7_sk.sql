USE MyFC;
GO
CREATE OR ALTER PROCEDURE dbo.usp_load_position_counts AS
/*******************************************************************************
Description: Truncates and updates the t_position_counts data tracking table.
*******************************************************************************/
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE dbo.t_position_counts;
    INSERT INTO dbo.t_position_counts (Position_Name, Total_Players)
    SELECT Position_Name, Total_Players FROM dbo.v_position_counts;
END;