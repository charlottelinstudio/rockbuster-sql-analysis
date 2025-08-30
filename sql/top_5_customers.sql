/* =========================================================
   File: top_5_customers.sql
   Purpose: Identify top 5 customers by total payment amount,
            including their city and country of residence.
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name       AS customer_name,
    ci.city                                  AS city,
    co.country                               AS country,
    ROUND(SUM(p.amount), 2)                  AS total_amount
FROM customer c
JOIN address a   ON c.address_id = a.address_id
JOIN city ci     ON a.city_id = ci.city_id
JOIN country co  ON ci.country_id = co.country_id
JOIN payment p   ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name, ci.city, co.country
ORDER BY total_amount DESC
LIMIT 5;
