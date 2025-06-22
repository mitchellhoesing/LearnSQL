# Aggregate functions are functions that operate on a set of rows or columns to calculate and return a single value.

# Aggregate functions: AVG(), COUNT(), MAX(), MIN(), SUM()

# Return the average of prod_price
SELECT AVG(prod_price) AS average_price
FROM products;

# Return the average of prod_price for the vendor with the DLL01 vend_id
SELECT AVG(prod_price) AS average_price
FROM products
WHERE vend_id = 'DLL01';

# COUNT how many rows are in the customers table
SELECT COUNT(*) AS num_customers
FROM customers;

# COUNT how many customers have an email.
SELECT COUNT(cust_email) AS num_customers
FROM customers;

# Find the max value from the prod_price field
SELECT MAX(prod_price) AS max_prod_price
FROM products;

# Find the min value from the prod_price field
SELECT MIN(prod_price) AS min_prod_price
FROM products;

# Use SUM() to calculcate how many items were ordered for order 20005
SELECT SUM(quantity) AS items_ordered
FROM orderitems
WHERE order_num = 20005;

# Use SUM() to calculcate the total price of order 20005
SELECT SUM(quantity*item_price) AS order_total_price
FROM orderitems
WHERE order_num = 20005;

# Calculcate the average price of products from vendor DLL01.
SELECT AVG(DISTINCT prod_price) AS average_price
FROM products
WHERE vend_id = 'DLL01';

# Putting it all together
SELECT COUNT(*) AS num_items,
	MIN(prod_price) AS min_price,
	MAX(prod_price) AS max_price,
	AVG(prod_price) AS average_price
FROM products;