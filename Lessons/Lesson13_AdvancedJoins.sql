# Inner join (Lesson 12): Join only matching rows from both tables, including multiple occurrences
# Self join: Joining a table with itself
# Natural Join: Join only matching rows from both table, but only a single occurrence
# Outer Join: Join rows from multiple tables that are not related
# LEFT OUTER JOIN: Retrieve all rows from the left table and only those matching from the right
# RIGHT OUTER JOIN: Retrieve all rows from the right table and only those matching from the left
# FULL OUTER JOIN: Retrieve all rows when there's a match in either table, meaning unrelated rows from both tables

# Self Join. SELECT all customers that work for the same company as Jim Jones
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1, Customers AS c2 
WHERE c1.cust_name = c2.cust_name
AND c2.cust_contact = 'Jim Jones';

# Natural Join. A wildcard is used in the customer table to select all columns. All other columns are explicitly stated so that no duplicate columns are retrieved
SELECT C.*, O.order_num, O.order_date,
	   OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
AND OI.order_num = O.order_num
AND prod_id = 'RGAN01';

# Left Outer Join. Retrieve a list of all customers, including those that have placed no orders
SELECT Customers.cust_id, Orders.order_num
FROM Customers LEFT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

# Right Outer Join. Retrieve a list of all orders, including those that have no cust_id
SELECT Customers.cust_id, Orders.order_num
FROM Customers RIGHT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

# PRODUCES ERROR (see next query): Full Join. Retrieve a list of all customers and all orders
SELECT Customers.cust_id, Orders.order_num
FROM Customers FULL OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

# MySQL does not support FULL OUTER JOINS. Can emulate by UNIONing a left outer join and a right outer join
SELECT Customers.cust_id, Orders.order_num
FROM Customers LEFT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id

UNION

SELECT Customers.cust_id, Orders.order_num
FROM Customers RIGHT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

# INNER JOIN with aggregate function. Retrieve a list of all customers and how many orders they have placed, if they have placed more than zero
SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_orders
FROM Customers INNER JOIN Orders
ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

# LEFT OUTER JOIN with aggregate function. Retrieve a list of all customers and how many orders they have placed, including customers that have made zero orders.
SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_orders
FROM Customers LEFT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id
ORDER BY num_orders DESC;