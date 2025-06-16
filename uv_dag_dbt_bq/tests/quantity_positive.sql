-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where total_amount < 0 to make the test fail.
select
    InvoiceLineId,
from  {{ ref('stg_chin__invoice_lines.sql') }}
where Quantity < 0
