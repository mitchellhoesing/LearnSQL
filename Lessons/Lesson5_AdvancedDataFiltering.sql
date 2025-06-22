# Filter data where vend_id = 'DLL01' AND prod_price <= 4, with ORDER BY clause
SELECT vend_id, prod_id, prod_price, prod_name 
FROM products 
WHERE vend_id = 'DLL01' AND prod_price <= 4 
ORDER BY prod_name;

# Filter data where vend_id = 'DLL01' or vend_id = 'BRS01'
SELECT vend_id, prod_name, prod_price 
FROM products 
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

# Filter data where vend_id = 'DLL01' or vend_id = 'BRS01' and prod_price >= 10. Order of evaluation matters.
SELECT prod_name, prod_price 
FROM products 
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01') AND prod_price >= 10;

# Does NOT WORK as intended, see above. Filter data where vend_id = 'DLL01' or vend_id = 'BRS01' and prod_price >= 10.
SELECT prod_name, prod_price 
FROM products 
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01' AND prod_price >= 10;

# Filter data where vend_id IN ('DLL01', 'BRS01'). Works the same as OR operator.
SELECT vend_id, prod_name, prod_price 
FROM products 
WHERE vend_id IN ('DLL01', 'BRS01'); -- Is equivalent to below.

SELECT vend_id, prod_name, prod_price 
FROM products 
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

# Filter data where vend_id does not equal 'DLL01'. Works the same as != operator.
SELECT vend_id, prod_name 
FROM products 
WHERE NOT vend_id = 'DLL01' 
ORDER BY prod_name; -- Is equivalent to below.

SELECT vend_id, prod_name 
FROM products
WHERE vend_id != 'DLL01' 
ORDER BY prod_name;