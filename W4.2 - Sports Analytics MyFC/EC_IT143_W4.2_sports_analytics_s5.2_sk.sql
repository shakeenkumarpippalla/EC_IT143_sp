USE MyFC;
GO
DROP TABLE IF EXISTS dbo.t_position_counts;
CREATE TABLE dbo.t_position_counts (
    Position_Name VARCHAR(100) NOT NULL,
    Total_Players INT NOT NULL,
    CONSTRAINT PK_PositionCounts PRIMARY KEY (Position_Name)
);