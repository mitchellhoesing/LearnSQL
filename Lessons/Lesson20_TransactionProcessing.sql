# Transaction processing is used to maintain database integrity by ensuring that batch SQL operations execute entirely or not at all
# Terminology:
-- Transaction: A block of SQL statements
-- Rollback: The process of undoing specified SQL statements'
-- Commit: Writing unsaved SQL statements to the database tables
-- Savepoint: A temporary placeholder in a transaction set to which you can issue a rollback (as opposed to rolling back an entire transaction)

# Delete order number 12345 from the OrderItems and Orders tables
START TRANSACTION;
DELETE FROM OrderItems WHERE order_num = 12345;
DELETE FROM Orders WHERE order_num = 12345;
COMMIT;

-- BEGIN
--     DECLARE done INT DEFAULT 0;
--     DECLARE error_occurred INT DEFAULT 0;
--     
--     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
--     BEGIN
--         SET error_occurred = 1;
-- END;
    
# INSERT transaction example
START TRANSACTION;
INSERT INTO Customers (cust_id, cust_name)
VALUES('10000000010', 'Toys Emporium');
SAVEPOINT StartOrder; 

INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20100, '2001/12/1', '10000000010');

# IF @@ERROR != 0 ROLLBACK TO StartOrder; 




SELECT * FROM OrderItems, Orders;