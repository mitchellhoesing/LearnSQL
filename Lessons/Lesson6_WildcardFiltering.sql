# % = any number of occurrences. 
# _ = a single occurence
# [] = Filter a set of characters from a specified position. MySQL Does not support bracket wildcards. Must use RLIKE and regexs
# ^ = begins with or in brackets, negates.

# Filter WHERE prod_name begins with 'Fish'
SELECT prod_id, prod_name 
FROM products 
WHERE prod_name LIKE 'Fish%';

# Filter WHERE prod_name contains 'bean bag' anywhere
SELECT prod_id, prod_name 
FROM products 
WHERE prod_name LIKE '%bean bag%';

# Filter WHERE prod_name begins with 'F' and ends with 'y', for the whole column. This returns 'Fish bean bag toy'
SELECT prod_name 
FROM products 
WHERE prod_name LIKE 'F%y';

# Filter WHERE prod_name contains two characters then '__ inch teddy bear'
SELECT prod_id, prod_name 
FROM products 
WHERE prod_name LIKE '__ inch teddy bear';

# Filter WHERE prod_name contains any number of characters then '% inch teddy bear'
SELECT prod_id, prod_name 
FROM products 
WHERE prod_name LIKE '% inch teddy bear';

# Filter WHERE customer name begins with J or M. MySQL Does not support bracket wildcards. Must use RLIKE and regexs
SELECT cust_contact 
FROM Customers 
WHERE cust_contact RLIKE '^[JM]+' 
ORDER BY cust_contact;

# Filter WHERE customer name DOES NOT begin with J or M. MySQL Does not support bracket wildcards. Must use RLIKE and regexs
SELECT cust_contact 
FROM Customers 
WHERE cust_contact RLIKE '^[^JM]+' 
ORDER BY cust_contact;

