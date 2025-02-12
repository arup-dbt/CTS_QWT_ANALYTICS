{{config(materialized='table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
b.empid, 
b.firstname,
b.lastname,
b.title,
b.hiredate,
iff(b.extension= '-','NA',b.extension) as extension,
b.yearsalary,
ifnull(a.firstname,b.firstname) as ManagerName, 
ifnull(a.title,b.title) ManagerTitle,
c.address,
c.city,
c.country
from 
{{ref('stg_employees')}} a 
right outer join 
{{ref('stg_employees')}} b
on 
a.empid =b.reportsto
left join 
{{ref('stg_offices')}} c
on
b.office = c.office