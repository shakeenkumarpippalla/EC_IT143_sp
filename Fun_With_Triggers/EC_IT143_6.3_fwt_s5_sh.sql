-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger

-- Q3: Did it work?
-- A3: Well, lets see...yup

-- See if the initial table values exist
SELECT t.*
  FROM dbo.t_w3_schools_customers AS t;

-- Try changing a row's metadata value to fire the update trigger
UPDATE dbo.t_w3_schools_customers SET City = 'New Town'
 WHERE CustomerID = 1;

-- See if the trigger worked automatically!
SELECT t.*
  FROM dbo.t_w3_schools_customers AS t;