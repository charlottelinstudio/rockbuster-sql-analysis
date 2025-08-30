/* =========================================================
   Additional Analysis: Find countries whose revenue per customer exceeds the global median
   ========================================================= */
WITH country_rpc AS (
  SELECT
    co.country,
    COUNT(DISTINCT c.customer_id)                AS customers,
    SUM(p.amount)                                AS total_revenue,
    ROUND(SUM(p.amount) / NULLIF(COUNT(DISTINCT c.customer_id), 0), 2) AS revenue_per_customer
  FROM country co
  JOIN city     ci ON ci.country_id = co.country_id
  JOIN address  a  ON a.city_id     = ci.city_id
  JOIN customer c  ON c.address_id  = a.address_id
  JOIN payment  p  ON p.customer_id = c.customer_id
  GROUP BY co.country
)
SELECT *
FROM country_rpc
WHERE revenue_per_customer >
      (
        SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY revenue_per_customer)
        FROM country_rpc
      )
ORDER BY revenue_per_customer DESC;
