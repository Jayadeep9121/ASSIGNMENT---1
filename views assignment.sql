###===================== VIEWS =============##
## 10. List all payments that are greater than the average of all payments.
CREATE OR REPLACE VIEW payments_above_avg AS
SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

SELECT * FROM payments_above_avg;