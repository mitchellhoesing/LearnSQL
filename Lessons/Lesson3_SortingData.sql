# Sort by column
SELECT prod_name 
FROM products 
ORDER BY prod_name;

# Sort by multiple columns (does not require columns to be selected)
SELECT prod_id, prod_price, prod_name 
FROM products 
ORDER BY prod_price, prod_name;

# Sort by multiple columns by position
SELECT prod_id, prod_price, prod_name 
FROM products 
ORDER BY 2, 3;

# Sort by prod_price in descending order but leave prod_name in ascending order within each price
SELECT prod_id, prod_price, prod_name 
FROM products 
ORDER BY prod_price DESC, prod_name; 



