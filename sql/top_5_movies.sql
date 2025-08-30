/* =========================================================
   File: top_5_movies.sql
   Purpose: Top 5 films by total revenue, with rental counts
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

SELECT
    f.film_id,
    f.title,
    ROUND(SUM(p.amount), 2)                 AS total_revenue,
    COUNT(DISTINCT r.rental_id)             AS total_rentals,
    ROUND(
      SUM(p.amount) / NULLIF(COUNT(DISTINCT r.rental_id), 0), 2
    )                                       AS avg_revenue_per_rental
FROM payment   p
JOIN rental    r ON p.rental_id   = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film      f ON i.film_id      = f.film_id
GROUP BY f.film_id, f.title
ORDER BY total_revenue DESC
LIMIT 5;
