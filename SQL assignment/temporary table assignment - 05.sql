USE sakila;

##========== TEMPORARY TABLE ===============##

## 9. Find all customers who have the same address as customer with ID 1.
DROP TEMPORARY TABLE IF EXISTS temp_customer1_address;
CREATE TEMPORARY TABLE temp_customer1_address AS
SELECT address_id
FROM customer
WHERE customer_id = 1;
SELECT c.*
FROM customer c
JOIN temp_customer1_address t 
	ON c.address_id = t.address_id
WHERE c.customer_id <> 1;
DROP TEMPORARY TABLE IF EXISTS temp_customer1_address;
