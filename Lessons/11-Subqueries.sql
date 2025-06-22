# In short, subqueries are SELECT statements nested in a WHERE clause. Subqueries can only retrieve one column.
# Nesting queries are not computationally efficient
# Single Query. Returns order_num set (20007, 20008)
SELECT order_num
FROM OrderItems
WHERE prod_id = 'RGAN01';

# We could then get customer IDs for the returned order numbers
SELECT cust_id
FROM Orders
WHERE order_num IN (20007, 20008);

# Equivalently, we could use a subquery to combine these queries into one. This returns cust_id set (1000000004, 1000000005)
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
					FROM OrderItems
					WHERE prod_id = 'RGAN01');
                    

# Now if we wanted the customers name and contact, we could manually select the information based on the cust_id                    
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (1000000004, 1000000005);

# Better yet, we could use another subquery.
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
				FROM Orders
				WHERE order_num IN (SELECT order_num
									FROM OrderItems
									WHERE prod_id = 'RGAN01'));

# What if we wanted to know how many orders each customer has ordered. WHERE Customer.cust_id = Orders.cust_id.... is read as, for each cust_id in Customers, count how many rows have that cust_id in Orders. 
SELECT cust_id, cust_name, cust_state, (SELECT COUNT(*)
							   FROM Orders
                               WHERE Customers.cust_id = Orders.cust_id) AS orders
FROM Customers
Order By orders DESC;




