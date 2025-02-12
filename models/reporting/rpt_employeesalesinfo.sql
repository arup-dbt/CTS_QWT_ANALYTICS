{{config(materialized='view', schema = 'reporting_dev')}}

select 
e.firstname, 
count(c.customerid) as TotalCustomer,
count(p.productid) as TotalProducts,
sum(o.linesalesamount) as TotalAmt
from
{{ref('fct_orders')}} o
left join
{{ref('dim_employees')}} e
on
o.employeeid=e.empid
left join
{{ref('dim_customers')}} c
on
o.customerid=c.customerid
left join
{{ref('dim_products')}} p
on
o.productid=p.productid
group by
e.firstname
order by 4 desc