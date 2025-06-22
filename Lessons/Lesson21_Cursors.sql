# Cursor: is a database query stored on the DBMS server -not a select statement, but the result set is retrieved by that statement and iterable by an application because of the cursor
# Cursor options (variable based on DBMS):
# 1) Flag a cursor as read-only so that data can be read but not updated or deleted
# 2) Directional operations (forward, backward, first, last, absolute position, relative position, and more)
# 3) Flag some columns as editable and some as not editable
# 4) Scope specification: accessible to a specific request that created it or to all requests
# 5) Make a copy of the retrieved data so that the data does not change in the time the cursor is opened and the time it is accessed

# Mandatory steps for using Cursors:
    # DECLARE cursor
    # OPEN cursor
    # FETCH rows in a loop
    # CLOSE cursor
DELIMITER //

# NOTE: This cursor works but is impractical. We wouldn't want to return all customers with NULL emails and add them to the same table. This is just an example.
CREATE PROCEDURE SelectNullCustomerEmails()
BEGIN

	DECLARE c_cust_id CHAR(10);
    DECLARE c_cust_name CHAR(50);
    DECLARE c_cust_address CHAR(50);
    DECLARE c_cust_city CHAR(50);
    DECLARE c_cust_state CHAR(5);
    DECLARE c_cust_zip CHAR(10);
    DECLARE c_cust_country CHAR(50);
    DECLARE c_cust_contact CHAR(50);
    DECLARE c_cust_email CHAR(255);
    
    # Flag for cursor loop
    DECLARE done INT DEFAULT FALSE;
    
    # Create a variable for the order number
    DECLARE generated_cust_id CHAR(10);
    
    # Create a cursor
	DECLARE CustCursor CURSOR
	FOR
	SELECT cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email 
    FROM Customers
	WHERE cust_email IS NULL;
    
    # Handler for when no more rows found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    # Get highest current customer id
    SET generated_cust_id = (SELECT MAX(cust_id)
					   FROM Customers);
    
    # Determine the next customer id
    SET generated_cust_id = generated_cust_id+1;
    
    # Using the Cursor
	OPEN CustCursor;
    
    # Start processing rows
    customer_loop: LOOP
    
		# Get highest current customer id
		SET generated_cust_id = (SELECT MAX(cust_id)
						   FROM Customers);
		
		# Determine the next customer id
		SET generated_cust_id = generated_cust_id+1;
    
		# Fetch Rows
		FETCH CustCursor INTO c_cust_name, c_cust_address, c_cust_city, c_cust_state, c_cust_zip, c_cust_country, c_cust_contact, c_cust_email;
    
		# Exit loop if no more rows
		IF done THEN
			LEAVE customer_loop;
		END IF;
		
		INSERT INTO Customers (cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
		VALUES (generated_cust_id, c_cust_name, c_cust_address, c_cust_city, c_cust_state, c_cust_zip, c_cust_country, c_cust_contact, c_cust_email);
    
	END LOOP;
    
    # Close Cursor
    CLOSE CustCursor;

END //

DELIMITER ;

SELECT * FROM Customers;

CALL SelectNullCustomerEmails();
