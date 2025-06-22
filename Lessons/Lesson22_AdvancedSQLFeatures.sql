# Constraints: Rules govern how database data is inserted or manipulated. This serves to ensure that only valid data is inserted

# Primary Keys: Any column can be a Primary key if the following conditions are met:
# 1) No two rows may have the same primary key value
# 2) Every row must have a primary key value (columns must not enable NULL values)
# 3) The column containing primary key values can never be modified or updated
# 4) Primary key values can never be reused. If a row is deleted from the table, its primary key must not be assigned to any new rows.

# Foreign Keys: a column in a table whose values must be listed in a primary key in another table. Defined so that a column can accept only values that are in another table's primary key.
# I.e. a forgeign key defined on the customer ID column in the Orders table so that the column can accept only values that are in the Customer's table primary key. Logically, a customer's ID in Orders must be a customer in the Customer table. This enforces that.

# Unique Constraints: used to ensure that all data in a column, or set of columns, is unique. 
# This differs from a primary key in that:
# 1) A table may contain multiple unique constraints 
# 2) They can be NULL
# 3) They can be modified or updated
# 4) Their column values can be reused
# 5) Cannot be used to define foreign keys

# Check constraints: used to ensure that data in a column, or set of columns, meets a set of specified criteria
# Common use cases:
# 1) Checking minimum or maximum values. I.e. preventing an order of 0 items
# 2) Specifying ranges. I.e. making sure that a ship date is greater than or equal to today's date and not greater than a year from now
# 3) Allowing only specific values. I.e. allowing only M or F in a sex field

# Indexes: used to sort data logically to improve the speed of searching and sorting operations, like an index in the back of a book
# Considerations when using indexes:
# 1) Indexes improve the performance of retrieval operations but they degrade the performance of data insertion, modification, and deletion as the DBMS will update the index for each of these
# 2) Index data can take up lots of storage space
# 3) Not all data is suitable for indexing. Data that is not sufficiently unique (State, for example) will not benefit as much from indexing as data that has more possible values (First Name or Last Name, for example).
# 4) Indexes are used for data filtering and sorting. If you frequently sort data in a specific order, that data might be a candidate for indexing.
# 5) Multiple columns can be defined in an index, i.e. State plus city. Such an index will be of use only when data is sorted in State plus City order. If you want to sort by City, this index would not be of any use

# Triggers: special stored procedures that are executed automatically when specified database activity occurs. They might be associated with INSERT, UPDATE, and DELETE or any combination thereof.
# Considerations for triggers:
# Constraints are processed more quickly than triggers, so when possible, use constraints instead.
# Within triggers, your code has access to the following:
# 1) All new data in INSERT operations
# 2) All new data and old data in UPDATE operations
# 3) Deleted data in DELETE operations
# Common trigger use cases:
# 1) Ensuring data consistency. I.e. converting all state names to uppercase during an INSERT or UPDATE operation
# 2) Performing actions on other tables based on changes to a table. I.e. writing an audit trail record to a log table each time a row is updated or deleted
# 3) Performing additional validation and rolling back data if needed. I.e. making sure a customer's available credit has not been exceeded and blocking the insertion if it has
# 4) Calculating computed column values or updating timestamps

# Database Security Notes
# Commonly secured operations:
# 1) Access to adatabase admin features (creating tables, altering or dropping existing tables and so on)
# 2) Access to specific databases or tables
# 3) The type of access (read-only, access to specific columns and so on)
# 4) Access to tables via views or stored procedures only
# 5) Creation of multiple levels of security, thus allowing varying degrees of access and control based on login
# 6) Restricting the ability to manage user accounts
# NOTE: Security is managed via the SQL GRANT and REVOKE statements although most DBMSs provide interactive admin utilities.

# One way to define a primary key
CREATE TABLE VendorsPrimaryKeyExample
(
	vend_id CHAR(10) NOT NULL PRIMARY KEY,
    vend_name CHAR(50) NOT NULL, 
    vend_address CHAR(50) NULL, 
    vend_city CHAR(50) NULL, 
    vend_state CHAR(5) NULL, 
    vend_zip CHAR(10) NULL, 
    vend_country CHAR(50) NULL
);


SELECT * 
FROM VendorsPrimaryKeyExample;

# Another example of creating a primary key but the CONSTRAINT syntax is used instead. This syntax can be used in CREATE TABLE and ALTER TABLE statements
ALTER TABLE VendorsPrimaryKeyExample
ADD CONSTRAINT PRIMARY KEY (vend_id);

# Here REFERENCES is used to state that any values in cust_id must be in cust_id in the Customers table.
CREATE TABLE OrdersForeignKeyExample
(
	order_num INTEGER NOT NULL PRIMARY KEY,
    order_date DATETIME NOT NULL,
    cust_id CHAR(10) NOT NULL REFERENCES Customers(cust_id)
);

# Defined cust_id to be a foreign key in the "OrdersForeignKeyExample" table which refers to the cust_id of the Customers table.
ALTER TABLE OrdersForeignKeyExample
ADD CONSTRAINT
FOREIGN KEY (cust_id) REFERENCES Customers (cust_id);

# Check constraint used to ensure that the quantity for OrderItems is > 0
CREATE TABLE OrderItemsCheckConstraintExample
(
	order_num INTEGER NOT NULL,
    order_item INTEGER NOT NULL,
    prod_id CHAR(10) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    item_price DECIMAL(8, 2) NOT NULL
);

# Check constraint alternative way to add with a name
CREATE TABLE OrderItemsCheckConstraintExample
(
	order_num INTEGER NOT NULL,
    order_item INTEGER NOT NULL,
    prod_id CHAR(10) NOT NULL,
    quantity INTEGER NOT NULL,
    item_price DECIMAL(8, 2) NOT NULL,
    CONSTRAINT check_quantity CHECK (quantity > 0)
);

# Add a check constraint. Note: No Users table exists
ALTER TABLE Users
ADD CONSTRAINT sex_check CHECK (sex LIKE '[MF]');

# Drop a check constraint
ALTER TABLE Users
DROP CHECK sex_check;

# Create a simple index
CREATE INDEX prod_name_ind
ON Products (prod_name);

# Create a trigger that converts the cust_state column in the Customers table to uppercase BEFORE all INSERT and UPDATE operations. MySQL does not support multiple events in a single trigger definition. INSERT and UPDATE event triggers must be separated.
DELIMITER $$
CREATE TRIGGER customer_state_insert_trigger
	BEFORE INSERT
	ON Customers
	FOR EACH ROW
BEGIN
	UPDATE Customers
	SET cust_state = UPPER(cust_state)
	WHERE Customers.cust_id = NEW.cust_id;
END$$
DELIMITER ;

# Same trigger as above but for update events
DELIMITER $$
CREATE TRIGGER customer_state_update_trigger
	BEFORE UPDATE
	ON Customers
	FOR EACH ROW
BEGIN
	UPDATE Customers
	SET cust_state = UPPER(cust_state)
	WHERE Customers.cust_id = NEW.cust_id;
END$$
DELIMITER ;

# Show all triggers
SHOW TRIGGERS;

# Show triggers for a specified table
SHOW TRIGGERS FROM learn_sql WHERE `Table` = 'Customers';

# Drop a trigger
DROP TRIGGER IF EXISTS customer_state_trigger;

# View a trigger definition
SHOW CREATE TRIGGER customer_state_insert_trigger;

