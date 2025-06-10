WITH cnt_employee_by_manager AS (
  SELECT
  m.EmployeeId,
  COUNT( DISTINCT e.EmployeeId) as nb_employees_to_manage
  FROM `thibault-bigquery-training`.`dbt_quad`.`stg_chin__reports_from_emp` m
  LEFT JOIN `thibault-bigquery-training`.`dbt_quad`.`stg_chin__employees` e
  ON m.EmployeeId = e.ReportsTo
  GROUP BY
  m.EmployeeId
)


SELECT
  _cust_full_name,
  CustomerId,
  c.Country,
  COUNT(DISTINCT e.EmployeeId) AS total_support_solicitations,
  m._manager_full_name,
  cnt_emp.nb_employees_to_manage
FROM
  {{ref('stg_chin__customers')}} c
LEFT JOIN
  {{ref('stg_chin__employees')}} e
ON
  c.SupportRepId = e.EmployeeId
LEFT JOIN
  {{ref('stg_chin__reports_from_emp')}} m
ON
  m.EmployeeId = e.ReportsTo
LEFT JOIN cnt_employee_by_manager cnt_emp
ON cnt_emp.EmployeeId = m.EmployeeId
GROUP BY
  _cust_full_name,
  CustomerId,
  c.Country,
  m._manager_full_name,
  cnt_emp.nb_employees_to_manage
