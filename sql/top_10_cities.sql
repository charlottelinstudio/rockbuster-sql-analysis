/* =========================================================
   File: top_10_cities.sql
   Purpose: Identify top 10 cities by number of customers,
            including their countries.
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

SELECT
    ci.city                                AS city_name,
    co.country                             AS country_name,
    COUNT(c.customer_id)                   AS customer_count
FROM customer c
JOIN address a   ON c.address_id = a.address_id
JOIN city ci     ON a.city_id = ci.city_id
JOIN country co  ON ci.country_id = co.country_id
-- Optional filter: focus only on strategic countries
WHERE co.country IN (
    'India', 'China', 'United States', 'Japan', 'Mexico',
    'Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia'
)
GROUP BY ci.city, co.country
ORDER BY customer_count DESC
LIMIT 10;
