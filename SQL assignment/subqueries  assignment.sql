USE sakila;

## ========== SUBQUERIES ============== ##

## 1. Display all customer details who have made more than 5 payments. 
SELECT * FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(*) > 5
);

## 2. Find the names of actors who have acted in more than 10 films. 
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(film_id) > 10
);

## 3. Find the names of customers who never made a payment. 
SELECT first_name, last_name
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id FROM payment
);

## 4. List all films whose rental rate is higher than the average rental rate of all films. 
SELECT *
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

## 5. List the titles of films that were never rented.
SELECT title FROM film
WHERE film_id NOT IN (
SELECT DISTINCT i.film_id FROM inventory i
JOIN rental r ON r.inventory_id = i.inventory_id
 );

