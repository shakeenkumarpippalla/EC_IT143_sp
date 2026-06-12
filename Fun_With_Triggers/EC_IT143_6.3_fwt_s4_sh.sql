CREATE TRIGGER dbo.tr_t_w3_schools_customers_last_mod ON dbo.t_w3_schools_customers
AFTER UPDATE
AS

/*****************************************************************************************************************
NAME:    dbo.tr_t_w3_schools_customers_last_mod
PURPOSE: W3 Schools Customers - Last Modified By Trigger

MODIFICATION LOG:
Ver     Date        Author        Description
-----   ----------  -----------   -------------------------------------------------------------------------------
1.0     2026-06-12  Shakeen       1. Built this script for EC_IT143

RUNTIME: 
1s

NOTES: 
Keep track of the last modified date for each row in the table
******************************************************************************************************************/

BEGIN
    UPDATE dbo.t_w3_schools_customers
       SET last_modified_date = GETDATE()
     WHERE CustomerID IN
     (
        SELECT DISTINCT
               CustomerID
          FROM Inserted
     );
END;