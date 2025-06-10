SELECT
  InvoiceId,
  InvoiceLineId,
  TrackId,
  UnitPrice,
  Quantity,
  UnitPrice * Quantity as _invoice_line_total_amt
FROM
  {{source('chin_db','InvoiceLine')}}
