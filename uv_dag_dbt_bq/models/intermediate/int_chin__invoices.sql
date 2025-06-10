WITH invoice_summary AS (
SELECT
  i.InvoiceId,
  SUM(_invoice_line_total_amt) as total_amt_sold,
  COUNT(DISTINCT TrackId) as total_dist_track_sold,
  SUM(Quantity) as total_qty_of_tracks_sold,
  AVG(UnitPrice) as avg_unit_price_sold
FROM
  {{ref('stg_chin__invoice_lines')}} il
LEFT JOIN
  {{ref('stg_chin__invoices')}} i
ON
  il.InvoiceId = i.InvoiceId
GROUP BY
 i.InvoiceId
)

SELECT 
 i.InvoiceId,
 il.TrackId,
 i.CustomerId,
 i._converted_invoice_date,
 i.BillingCountry,
 total_amt_sold,
 total_dist_track_sold,
 total_qty_of_tracks_sold,
 avg_unit_price_sold


FROM
  {{ref('stg_chin__invoice_lines')}} il
LEFT JOIN
  {{ref('stg_chin__invoices')}} i
ON
  il.InvoiceId = i.InvoiceId
LEFT JOIN invoice_summary isu
ON i.InvoiceId = isu.InvoiceId
