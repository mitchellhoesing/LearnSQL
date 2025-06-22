# WHERE clause operators (=, !=, <, >, <=, >=, BETWEEN, IS NULL)

# Filter data where prod_price = 3.49
SELECT prod_name, prod_price 
FROM products 
WHERE prod_price;

# Filter data where prod_price < 10
SELECT prod_name, prod_price 
FROM products 
WHERE prod_price < 10;

# Filter not equal on a string
SELECT vend_id, prod_name 
FROM products 
WHERE vend_id != 'DLL01';

# Filter data where prod_price is between 5 and 10 inclusive
SELECT prod_name, prod_price 
FROM products 
WHERE prod_price BETWEEN 5 AND 10;

# Filter data where cust_email is null
SELECT cust_name 
FROM customers 
WHERE cust_email IS NULL;

