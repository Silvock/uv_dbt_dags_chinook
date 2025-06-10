SELECT
  LastName,
  EmployeeId,
  FirstName,
  Title,
  ReportsTo,
  BirthDate,
  HireDate,
  Address,
  City,
  State,
  Country,
  PostalCode,
  Phone,
  Fax,
  Email,
  CONCAT(LastName,' ',FirstName) as _manager_full_name 
FROM
  {{source('chin_db','ReportsFromEmployee')}}
WHERE EmployeeId in (
  SELECT ReportsTo FROM {{source('chin_db','Employee')}}
) 
-- On ne récupère que les informations sur les managers
