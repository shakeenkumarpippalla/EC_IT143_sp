-- Step 6: Compare UDF results to ad hoc query results.
SELECT t.ContactName
     , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name
     , dbo.udf_parse_first_name(t.ContactName) AS first_name2
FROM dbo.t_w3_schools_customers AS t
ORDER BY 1;