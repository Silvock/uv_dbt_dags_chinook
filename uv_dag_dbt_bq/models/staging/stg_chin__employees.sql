SELECT
  EmployeeId,
  LastName,
  FirstName,
  Title,
  ReportsTo,
  DATE(BirthDate) AS _converted_birthdate,
  DATE(HireDate) AS _converted_hiredate,
  Address,
  City,
  State,
  Country,
  PostalCode,
  Phone,
  Fax,
  Email,
  CONCAT(LastName,' ',FirstName) as _emp_fullname
FROM
  {{source('chin_db','Employee')}}
