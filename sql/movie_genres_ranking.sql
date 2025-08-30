/* =========================================================
   File: genre_revenue_ranking.sql
   Purpose: Rank movie genres by total revenue and rental volume
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

SELECT
    cat.name                                        AS genre,
    ROUND(SUM(p.amount), 2)                         AS total_revenue,
    COUNT(DISTINCT r.rental_id)                     AS total_rentals,
    ROUND(
      SUM(p.amount) / NULLIF(COUNT(DISTINCT r.rental_id), 0), 2
    )                                               AS avg_revenue_per_rental
FROM payment        p
JOIN rental         r   ON p.rental_id    = r.rental_id
JOIN inventory      i   ON r.inventory_id = i.inventory_id
JOIN film           f   ON i.film_id      = f.film_id
JOIN film_category  fc  ON f.film_id      = fc.film_id
JOIN category       cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY total_revenue DESC, total_rentals DESC;
