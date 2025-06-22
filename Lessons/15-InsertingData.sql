# INSERT can be used to insert a single complete row, partial row, and results from a query, to a table.

# INSERT entry into Customers. Entry value order must be the same as the table definition
INSERT INTO Customers
VALUES('1000000006',
	   'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA',
       NULL,
       NULL);

# This insert works the same as above but the column names are specified. Column order must still be maintained. Can use tilde's apparently, and specify db.table to be more specific 
# ALWAYS use column list as this will increase the probability that your SQL continues to work even if the table changes
INSERT INTO `learn_sql`.`customers`
			(`cust_id`,
			`cust_name`,
			`cust_address`,
			`cust_city`,
			`cust_state`,
			`cust_zip`,
			`cust_country`,
			`cust_contact`,
			`cust_email`)
VALUES('1000000007',
	   'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA',
       NULL,
       NULL);

# Partial INSERT. Not all columns are specified here. Unspecified values will be NULL
INSERT INTO `learn_sql`.`customers`
			(`cust_id`,
			`cust_name`,
			`cust_address`,
			`cust_city`,
			`cust_state`,
			`cust_zip`,
			`cust_country`)
VALUES('1000000008',
	   'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA');
       
# CREATE CustNew table for INSERTING retrieved data examples and retrieve an example
CREATE TABLE CustNew (`cust_id` varchar(10),
					  `cust_name` varchar(50),
					  `cust_address` varchar(50),
					  `cust_city` varchar(50),
					  `cust_state` varchar(5),
					  `cust_zip` varchar(10),
					  `cust_country` varchar(50),
                      `cust_contact` varchar(50),
                      `cust_email` varchar(255));
INSERT INTO CustNew (`cust_id`,
					  `cust_name`,
					  `cust_address`,
					  `cust_city`,
					  `cust_state`,
					  `cust_zip`,
					  `cust_country`,
                      `cust_contact`,
                      `cust_email`)
VALUES('1000000008',
	   'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA',
       NULL,
       NULL);

# INSERTING all data from CustNew into Customers
INSERT INTO `learn_sql`.`customers`
			(`cust_id`,
			`cust_name`,
			`cust_address`,
			`cust_city`,
			`cust_state`,
			`cust_zip`,
			`cust_country`)
SELECT cust_id,
	   cust_name,
       cust_address,
       cust_city,
       cust_state,
       cust_zip,
       cust_country
FROM CustNew;

# SELECT INTO Exports data while INTO SELECT Imports data
# SELECT INTO Example. This does not work in MySQL. See MySQL example below
SELECT *
INTO CustCopy
FROM Customers;

# Create a copy of Customers and call it CustCopy
CREATE TABLE CustCopy AS
SELECT * FROM Customers;

SELECT * 
FROM CustCopy;
