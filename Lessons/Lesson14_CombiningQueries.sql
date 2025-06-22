# Queries can be combined using the UNION keyword
# Rules of UNION:
# 1) UNIONs must consist of two SELECT statements each separated by the UNION keyword. If combining 4 SELECT statements, then you would have 3 UNIONs
# 2) Each query in a UNION must contain the same columns, aggregate functions, or expressions
# 3) Column datatypes must be compatible. They need not be the same type but types that the DBMS can implicitly convert


# Retrieve information about customers who reside in IL, IN, or MI
SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI');

# Retrieve information about the customer named Fun4All
SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_name = 'Fun4All';

# The above two queries can be combined using UNION. The SELECT statements must contain the same columns.
SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')

UNION

SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;

# This can also be achieved by using multiple WHERE clauses.
SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
OR cust_name = 'Fun4All';

# If you do not want UNION to remove duplicate rows, you can use ALL with UNION
SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')

UNION All

SELECT cust_name, cust_email, cust_contact, cust_state
FROM Customers
WHERE cust_name = 'Fun4All';