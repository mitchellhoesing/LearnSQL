# SELECT clauses and their sequence order
# SELECT
# FROM
# WHERE
# GROUP BY
# HAVING
# ORDER BY

# Group data by vend_id and count all rows in vend_id groups in products table 
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

# Use HAVING instead of WHERE to filter groups. Acts like WHERE in all aspects otherwise. Rows filtered by the WHERE clause will not be included in the HAVING clause.
# Group customers by cust_id, count all customers in each cust_id HAVING the count is >= 2
SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

# Count the number of products from each vendor WHERE the prod_price >= 4 then GROUP BY each vendor that has 2 or more products.
SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;

# Count the number of products by each vendor that has 2 or more products.
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

# It is good practice to include an ORDER BY clause any time you use a GROUP BY clause. Sometimes GROUP BY will sort properly but it should not be relied upon.
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3;

# Count the number of items in OrderItems grouped by order_num HAVING items >= 3 ORDERED BY items then order_num.
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;
