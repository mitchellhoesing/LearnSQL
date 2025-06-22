SELECT prod_name 
FROM products;

# Retrieve multiple columns
SELECT prod_id, prod_name, prod_price 
FROM products;

# Retrieve all columns
SELECT * 
FROM products;

# Retrieve distinct values
SELECT DISTINCT vend_id 
FROM products;

# Retrieve top-k rows
SELECT prod_name 
FROM products 
LIMIT 3;

# Retrieve top-k rows starting from row 3
SELECT prod_name 
FROM products 
LIMIT 3 OFFSET 3;

