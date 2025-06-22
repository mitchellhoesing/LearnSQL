# Joins: multiple tables can be joined to return a single set of output.
# Joins returns rows from multiple tables conditioned on a primary key or related column between the tables

# Join using the WHERE clause. Also called an INNER JOIN or equijoin, based on the equality of two tables
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products -- equivalent to below
WHERE Vendors.vend_id = Products.vend_id; -- equivalent to below

SELECT vend_name, prod_name, prod_price
FROM Vendors INNER JOIN Products
ON Vendors.vend_id = Products.vend_id;

# Display the retrieved information for order number 20007
SELECT vend_name, prod_name, prod_price, quantity
FROM OrderItems, Products, Vendors
WHERE Vendors.vend_id = Products.vend_id
AND OrderItems.prod_id = Products.prod_id
AND order_num = 20007;

# The subquery below can be expressed using a join
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
				FROM Orders
				WHERE order_num IN (SELECT order_num
									FROM OrderItems
									WHERE prod_id = 'RGAN01'));
                                    
# Equivalent INNER Join
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
AND Orders.order_num = OrderItems.order_num
AND prod_id = 'RGAN01';
