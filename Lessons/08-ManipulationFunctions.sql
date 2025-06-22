# Common functions: 
# Text functions: SUBSTRING(), LEFT(), LENGTH(), LTRIM(), RTRIM(), UPPER(), SOUNDEX() (sounds similar function, useful to address potential typos in fields) 
# Numerical functions: ABS(), COS(), EXP(), PI(), SIN(), SQRT(), TAN()
# Datatype functions: CONVERT(), EXTRACT(FORMAT_PARAM FROM field). FORMAT_PARAM = (YEAR, YEAR_MONTH, DAY_MINUTE, MICROSECOND), CAST()
# Date and time functions: CURDATE(), CURTIME()
# System functions i.e. user login info

# UPPER function to uppercase vend_name
SELECT vend_name, UPPER(vend_name) AS uppercase_vend_name
FROM vendors
ORDER BY vend_name;

# SOUNDEX function to find Michelle Green when typo of Michael Green was used
SELECT cust_name, cust_contact 
FROM customers 
WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

# EXTRACT function to extract the year from order_date WHERE year = 2012. Can also simply use YEAR().
SELECT order_num, order_date, EXTRACT(YEAR FROM order_date) AS 'year'
FROM orders
WHERE YEAR(order_date) = 2012;

# CAST the year from order_date to an UNSIGNED INTEGER.
SELECT order_num, order_date, EXTRACT(YEAR FROM order_date) AS 'year'
FROM orders
WHERE CAST(YEAR(order_date) AS UNSIGNED) = 2012;

# Filter the current date
SELECT CURDATE();

# Filter the current time
SELECT CURTIME();

