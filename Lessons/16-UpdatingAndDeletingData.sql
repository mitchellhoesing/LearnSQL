# CAUTION: Be careful not to update or delete every row if it not intended as it is easy to do so
# Updating: to update specific or all rows in a table
# Best Practices:
# 1) Never UPDATE or DELETE without a WHERE clause unless you really want to update or delete every row
# 2) Make sure every table has a primary key and use it as the WHERE clause whenever possible
# 3) Before you use a WHERE clause in an UPDATE or DELETE statement, use it in a SELECT statement to ensure it is filtering the right records

# Basic UPDATEs have 3 parts: the table to be updated, the field to update and its new value, and the condition that specifies the row to update
UPDATE Customers
SET cust_email = 'kim@thetoystore.com'
WHERE cust_id = '1000000005';

# Update multiple fields at once
UPDATE Customers
SET cust_email = 'sam@toyland.com',
	cust_contact = 'Sam Roberts'
WHERE cust_id = '1000000006';

# To DELETE a column, you can set its value to NULL
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = '1000000005';

# Like UPDATES, you can delete single or multiple rows at a time. Be careful here.
# DELETE specific row. CAUTION: If the WHERE clause is omitted, every row will be deleted
DELETE FROM Customers
WHERE cust_id = '1000000006';

# If you want to DELETE all rows in a table, do not use delete. Use a TRUNCATE TABLE statement instead for speed. TRUNCATE TABLE does not log the changes

SELECT *
FROM Customers;
