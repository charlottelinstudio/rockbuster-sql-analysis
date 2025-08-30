/* =========================================================
   Additional Analysis: Rank customers by total spend, show % of total revenue
   ========================================================= */
WITH customer_revenue AS (
  SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    ROUND(SUM(p.amount), 2)            AS total_amount
  FROM customer c
  JOIN payment  p ON p.customer_id = c.customer_id
  GROUP BY c.customer_id, customer_name
)
SELECT
  RANK() OVER (ORDER BY total_amount DESC)                      AS revenue_rank,
  customer_id,
  customer_name,
  total_amount,
  ROUND(100 * total_amount / NULLIF(SUM(total_amount) OVER (), 0), 2) AS pct_of_total_revenue
FROM customer_revenue
ORDER BY revenue_rank
LIMIT 20;
