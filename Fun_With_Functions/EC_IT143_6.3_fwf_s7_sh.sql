-- Step 7: Perform a "0 results expected" test.
WITH s1 
AS (
    SELECT t.ContactName
         , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name
         , dbo.udf_parse_first_name(t.ContactName) AS first_name2
    FROM dbo.t_w3_schools_customers AS t
)
SELECT s1.*
FROM s1
WHERE s1.first_name <> s1.first_name2; -- Expected result is 0 rows