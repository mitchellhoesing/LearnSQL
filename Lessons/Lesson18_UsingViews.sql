# Reasons to use views:
# 1) To reuse SQL statements
# 2) To simplify complex SQL statements
# 3) To expose parts of a table rather than the complete table
# 4) To secure data. Users can be given access to specific subsets of tables instead of to entire tables

# Create a view to simplify a complex join SQL statement
CREATE VIEW ProductCustomers AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
AND OrderItems.order_num = Orders.order_num;

# To use the view and continue filtering. NOTE: It is a good idea to create views to retrieve all of the joined data, not filtered like this query does with RGAN01
SELECT prod_id, cust_name, cust_contact
FROM ProductCustomers
WHERE prod_id = 'RGAN01';

# Using a view to reformat retrieved data, say if you needed to perform this reformat often
CREATE VIEW VendorLocations AS
SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')')
AS vend_title
FROM Vendors;

SELECT * 
FROM VendorLocations;

# Using views to filter unwanted data. Retrieve a mailing list excluding those who do not have an email.
CREATE VIEW CustomerEmailList AS
SELECT cust_id, cust_name, cust_email
FROM Customers
WHERE cust_email IS NOT NULL;

# Mail list
SELECT *
FROM CustomerEmailList;

# Original List
SELECT cust_id, cust_name, cust_email
FROM Customers;

# Using views with Calculated Fields
CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
	   prod_id,
       quantity, 
       item_price,
       quantity*item_price AS expanded_price
FROM OrderItems;

SELECT *
FROM OrderItemsExpanded
WHERE order_num = 20008;


