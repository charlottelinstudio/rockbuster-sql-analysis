/* =========================================================
   Additional Analysis: Show each customer's most recent rental
   ========================================================= */
SELECT
  c.customer_id,
  c.first_name || ' ' || c.last_name AS customer_name,
  r.rental_id,
  r.rental_date
FROM customer c
JOIN rental r
  ON r.customer_id = c.customer_id
WHERE r.rental_date = (
  SELECT MAX(r2.rental_date)
  FROM rental r2
  WHERE r2.customer_id = c.customer_id
)
ORDER BY r.rental_date DESC
LIMIT 50;
