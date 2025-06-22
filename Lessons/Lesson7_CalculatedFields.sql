# Supports basic mathematical operations

# Concatenate columns vend_name and vend_country into one column and trim any spaces to the right.
SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') 
FROM Vendors 
ORDER BY vend_name;

# Concatenate columns vend_name and vend_country into one column and trim any spaces to the right and assign an alias to the column header.
SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') AS vend_name_country 
FROM Vendors 
ORDER BY vend_name;

# Calculate the expanded price (quantity*item_price) AS expanded price. Can use parantheses here for order of evaluation
SELECT order_num, prod_id, quantity, item_price, quantity*item_price AS expanded_price 
FROM OrderItems 
WHERE order_num = 20008;

