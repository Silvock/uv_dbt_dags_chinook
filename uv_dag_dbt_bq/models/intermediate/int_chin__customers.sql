WITH
  customer_counts_per_product AS (
  SELECT
    i.TrackId,
    COUNT(DISTINCT i.CustomerId) AS distinct_customer_count
  FROM
    {{ref('int_chin__invoices')}} i
  GROUP BY
    i.TrackId ),
  dominant_region_per_product AS (
  SELECT
    i.TrackId,
    c.Country,
    ROW_NUMBER() OVER (PARTITION BY i.TrackId ORDER BY COUNT(DISTINCT c.CustomerId) DESC ) AS rn
  FROM
    {{ref('int_chin__invoices')}} i
  LEFT JOIN
    {{ref('stg_chin__customers')}} c
  ON
    i.CustomerId = c.CustomerId
  GROUP BY
    i.TrackId,
    c.Country
  QUALIFY
    rn = 1 )

SELECT
  cc.TrackId,
  cc.distinct_customer_count,
  dr.Country AS dominant_customer_state
FROM
  customer_counts_per_product cc
LEFT JOIN
  dominant_region_per_product dr
ON
  dr.TrackId = cc.TrackId
