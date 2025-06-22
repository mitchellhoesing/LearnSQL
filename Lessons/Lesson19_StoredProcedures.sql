# Reasons to use stored procedures:
# 1) To simplify complex operations, by encapsulating processes into a single easy-to-use unit
# 2) To ensure data consistency and reduce errors by not requiring that a series of steps be created over and over 
# 3) To simplify change management. If tables, column names, or business logic changes, then only the stored procedure code needs to be updated. Also aids security by restricting access to underlying data
# 4) Stored procedures are usually compiled which means less work by the DBMS to perform the command
# 5) There are SQL language elements and features that are available only within single requests. Stored procedures can use these to write code that is more powerful and flexible
# In short, improved simplicity, security, and performance

# Use // to terminate the statement instead of ; so it doesn't prematurely end the procedure.
DELIMITER //
# Create a procedure to return the amount of users that have emails
CREATE PROCEDURE MailingListCount ( 
	 OUT ListCount INTEGER
    )
BEGIN
    # Count users where email is not null and not empty
    SELECT COUNT(*) INTO ListCount
    FROM Customers
    WHERE NOT cust_email IS NULL
    AND LENGTH(cust_email) > 0;
END //

# Redefine the statement delimiter as ;
DELIMITER ;

# CALL the stored procedure and SELECT the returned variable
CALL MailingListCount(@ReturnValue);
SELECT @ReturnValue;

# We can see the returned value of 3 is correct as only 3 customers have emails
SELECT cust_name, cust_email
FROM Customers;

DELIMITER //

# Create a new order in the order table
CREATE PROCEDURE NewOrder(
	cust_id CHAR(10)
	)
BEGIN
	# Create a variable for the order number
    DECLARE generated_order_num INTEGER;
    
    # Get highest current order number
    SET generated_order_num = (SELECT MAX(order_num)
					   FROM Orders);
    
    # Determine the next order number
    SET generated_order_num = generated_order_num+1;

    # Insert new order
    INSERT INTO learn_sql.Orders (order_num, 
						order_date, 
                        cust_id)
    VALUES(generated_order_num, CURDATE(), cust_id);
    
END //

DELIMITER ;

CALL NewOrder('1000000001');
SELECT * FROM orders;
