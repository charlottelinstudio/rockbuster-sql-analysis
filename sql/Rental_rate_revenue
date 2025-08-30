/* =========================================================
   File: rental_rate_revenue.sql
   Purpose: Revenue and rental volume by rental_rate tier,
            with the count of films available at each tier.
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

WITH films_by_rate AS (
  SELECT
    f.rental_rate,
    COUNT(*) AS number_of_movies
  FROM film f
  GROUP BY f.rental_rate
),
rentals_by_rate AS (
  SELECT
    f.rental_rate,
    COUNT(r.rental_id)            AS total_rentals,
    SUM(p.amount)                 AS total_revenue
  FROM film f
  LEFT JOIN inventory i ON i.film_id = f.film_id
  LEFT JOIN rental   r ON r.inventory_id = i.inventory_id
  LEFT JOIN payment  p ON p.rental_id = r.rental_id
  GROUP BY f.rental_rate
)

SELECT
  fr.rental_rate,
  fr.number_of_movies,
  COALESCE(rr.total_rentals, 0)                       AS total_rentals,
  COALESCE(rr.total_revenue, 0)::numeric(12,2)        AS total_revenue
FROM films_by_rate fr
LEFT JOIN rentals_by_rate rr
  ON rr.rental_rate = fr.rental_rate
ORDER BY fr.rental_rate;
