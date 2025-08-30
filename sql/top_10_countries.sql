/* =========================================================
   File: top_10_countries.sql
   Purpose: Identify top 10 countries by number of customers
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

SELECT
    co.country                       AS country_name,
    COUNT(c.customer_id)             AS customer_count
FROM customer c
JOIN address a   ON c.address_id = a.address_id
JOIN city ci     ON a.city_id = ci.city_id
JOIN country co  ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY customer_count DESC
LIMIT 10;
