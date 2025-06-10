SELECT
  CustomerId,
  FirstName,
  LastName,
  Company,
  Address,
  City,
  State,
  Country,
  PostalCode,
  Phone,
  Fax,
  Email,
  SupportRepId,
  CONCAT(FirstName,' ',LastName) as _cust_full_name
FROM
{{source('chin_db','Customer')}}
