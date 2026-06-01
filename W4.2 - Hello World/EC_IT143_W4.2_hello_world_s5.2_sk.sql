USE EC_IT143_DA;
GO
DROP TABLE IF EXISTS dbo.t_hello_world;
CREATE TABLE dbo.t_hello_world (
    My_Message VARCHAR(50) NOT NULL,
    CONSTRAINT PK_HelloWorld PRIMARY KEY (My_Message)
);