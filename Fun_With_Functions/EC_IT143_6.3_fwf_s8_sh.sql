-- Step 8: Ask the next question -> How to extract last name from Contact Name?

SELECT t.CustomerID
     , t.CustomerName
     , t.ContactName
     , dbo.udf_parse_first_name(t.ContactName) AS ContactName_first_name
     , '' AS ContactName_last_name -- How to extract last name from Contact Name?
     , t.Address
     , t.City
     , t.Country
FROM dbo.t_w3_schools_customers AS t
ORDER BY 3;