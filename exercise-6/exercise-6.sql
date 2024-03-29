-- customer ranking by total amount spent on *rentals*
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order
SELECT
customer.email,
RANK() OVER (ORDER BY SUM(amount) DESC)
FROM
customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
INNER JOIN payment
ON rental.rental_id = payment.rental_id
GROUP BY customer.email;
