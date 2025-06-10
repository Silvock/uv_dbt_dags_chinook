WITH
    total_monthly_user_from_France as (
        select
            date_trunc(_converted_invoice_date, month) as invoice_month,
            count(distinct invoices.CustomerId) as total_monthly_users_from_France
        from {{ref('int_chin__invoices')}} invoices
        LEFT JOIN {{ref('int_chin__employees')}} as emp ON invoices.BillingCountry = emp.Country
        where emp.Country = 'France'
        group by invoice_month

    )

SELECT DATE_TRUNC(_converted_invoice_date, MONTH) AS reporting_date,
    emp._manager_full_name,
    emp.Country,
    COUNT(DISTINCT InvoiceId) AS total_invoices,
    count(distinct invoices.CustomerId) as total_monthly_users,
    total_monthly_users_from_France
FROM {{ref('int_chin__invoices')}} AS invoices
LEFT JOIN {{ref('int_chin__employees')}} as emp ON invoices.BillingCountry = emp.Country
left join total_monthly_user_from_France as fr on fr.invoice_month = DATE_TRUNC(invoices._converted_invoice_date, MONTH)
GROUP BY reporting_date,
    _manager_full_name,
    Country,
    total_monthly_users_from_France
