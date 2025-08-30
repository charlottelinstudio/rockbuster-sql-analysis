/* =========================================================
   File: descriptive_analysis.sql
   Purpose: Descriptive stats for core film attributes
   Author: Charlotte Lin
   DB: PostgreSQL (Rockbuster schema)
   ========================================================= */

SELECT
  COUNT(*)                               AS total_films,

  MIN(release_year)                      AS min_release_year,
  MAX(release_year)                      AS max_release_year,
  ROUND(AVG(release_year), 2)            AS avg_release_year,
  COUNT(release_year)                    AS nonnull_release_years,

  MIN(rental_duration)                   AS min_rental_duration,
  MAX(rental_duration)                   AS max_rental_duration,
  ROUND(AVG(rental_duration), 2)         AS avg_rental_duration,
  COUNT(rental_duration)                 AS nonnull_rental_durations,

  MIN(rental_rate)                       AS min_rental_rate,
  MAX(rental_rate)                       AS max_rental_rate,
  ROUND(AVG(rental_rate), 2)             AS avg_rental_rate,
  COUNT(rental_rate)                     AS nonnull_rental_rates,

  MIN(length)                            AS min_length,
  MAX(length)                            AS max_length,
  ROUND(AVG(length), 2)                  AS avg_length,
  COUNT(length)                          AS nonnull_lengths,

  MIN(replacement_cost)                  AS min_replacement_cost,
  MAX(replacement_cost)                  AS max_replacement_cost,
  ROUND(AVG(replacement_cost), 2)        AS avg_replacement_cost,
  COUNT(replacement_cost)                AS nonnull_replacement_costs
FROM film;

