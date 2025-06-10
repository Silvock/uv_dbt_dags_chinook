SELECT
  InvoiceId,
  CustomerId,
  DATE(InvoiceDate) as _converted_invoice_date,
  BillingAddress,
  BillingCity,
  BillingState,
  BillingCountry,
  BillingPostalCode,
  Total
FROM
  {{source('chin_db','Invoice')}}
