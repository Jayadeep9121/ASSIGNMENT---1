USE sakila;

##================= CTE (common table expression) ============##

## 6. Display the customers who rented films in the same month as customer with ID5.
WITH customer5_months AS (
    SELECT DISTINCT YEAR(rental_date) AS yr, MONTH(rental_date) AS mth
    FROM rental
    WHERE customer_id = 5
)
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN customer5_months m
  ON YEAR(r.rental_date) = m.yr AND MONTH(r.rental_date) = m.mth
ORDER BY c.customer_id;

## 7. Find all staff members who handled a payment greater than the average payment amount. (CTE)
WITH avg_payment AS (
    SELECT AVG(amount) AS avg_amount FROM payment
)
SELECT DISTINCT s.staff_id, s.first_name, s.last_name
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
CROSS JOIN avg_payment a
WHERE p.amount > a.avg_amount;

## 8. Show the title and rental duration of films whose rental duration is greater than the average. (CTE)
WITH avg_duration AS (
    SELECT AVG(rental_duration) AS avg_dur FROM film
)
SELECT f.title, f.rental_duration
FROM film f
CROSS JOIN avg_duration a
WHERE f.rental_duration > a.avg_dur;