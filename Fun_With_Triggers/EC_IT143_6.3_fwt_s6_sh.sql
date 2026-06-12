-- Q4: How to keep track of who last modified a record?
-- A4: This works for server user and the initial INSERT...

-- ALTER TABLE dbo.t_w3_schools_customers
-- ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();

GO
CREATE OR ALTER TRIGGER dbo.tr_t_w3_schools_customers_user_mod 
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Safety Check: If this trigger is firing recursively (because of itself), EXIT IMMEDIATELY.
    IF (TRIGGER_NESTLEVEL(@@PROCID) > 1)
    BEGIN
        RETURN;
    END;

    -- Now it is safe to update the table without looping infinitely
    UPDATE t
       SET t.last_modified_by = SUSER_NAME()
      FROM dbo.t_w3_schools_customers t
INNER JOIN Inserted i ON t.CustomerID = i.CustomerID;

END;
GO

-- Fire your evaluation test statement again (it will work perfectly now!):
UPDATE dbo.t_w3_schools_customers 
SET City = 'Alternate City'
WHERE CustomerID = 2;

-- Check your tracking results
SELECT CustomerID, CustomerName, City, last_modified_date, last_modified_by 
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 2;
