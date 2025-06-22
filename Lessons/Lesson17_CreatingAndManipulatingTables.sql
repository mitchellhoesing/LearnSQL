# NOTES:
# Values that can be NULL, cannot be primary keys

# CREATE a TABLE and disallow NULL values
CREATE TABLE OrdersCopy (
			 order_num INTEGER NOT NULL,
             order_date DATETIME NOT NULL,
             cust_id CHAR(10) NOT NULL
);

# CREATE a TABLE with a mixture of NULL and NOT NULL. Some DBMS's require NULL but the absence of NOT NULL sometimes suffices
CREATE TABLE VendorsCopy (
			 vend_id CHAR(10) NOT NULL,
             vend_name CHAR(50) NOT NULL,
             vend_address CHAR(50),
             vend_city CHAR(50),
             vend_state CHAR(5),
             vend_zip CHAR(10),
             vend_country CHAR(50)
);

# CREATE a TABLE and specify DEFAULT values
CREATE TABLE OrderItemsCopy (
			 order_num INTEGER NOT NULL,
             order_item INTEGER NOT NULL,
             prod_id CHAR(10) NOT NULL,
             quantity INTEGER NOT NULL DEFAULT 1,
             item_price DECIMAL(8, 2) NOT NULL
);

# ALTERING TABLES:
# NOTES:
# CAUTION: USE ALTER CAREFULLY. ENSURE YOU HAVE BACKUPS BEFORE USE. YOU MAY BE ABLE TO ADD A COLUMN BUT SOMETIMES YOU CANNOT DROP THEM. IF YOU DROP A COLUMN YOU CANNOT GET IT BACK.
# Ideally, tables are never altered after they contain data

# ADD a column to a table
ALTER TABLE VendorsCopy
ADD vend_phone CHAR(20);

# DROP a column to a table
ALTER TABLE VendorsCopy
DROP vend_phone;

# DROP an entire table
DROP TABLE VendorsCopy;

SELECT *
FROM VendorsCopy;


