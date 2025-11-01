{{config(materialized='table')}}

with
    employee_raw as (
        select
            empid as emp_id,
            split_part(name, ' ', 1) as emp_firstname,
            split_part(name, ' ', 2) as emp_lastname,
            salary as emp_salary,
            hiredate as emp_hiredate,
            split_part(address, ',', 1) as emp_street,
            split_part(address, ',', 2) as emp_city,
            split_part(address, ',', 3) as emp_country,
            split_part(address, ',', 4) as emp_zipcode
        from {{source('employee','EMPLOYEE_RAW')}}--dbt_db.public.employee_raw
    )
select *
from employee_raw
