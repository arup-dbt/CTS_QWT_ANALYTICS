{{config(materialized='view', schema = 'reporting_dev')}}

select 
e.country, 
c.companyname,
c.contactname,
count(o.orderid) as OrderCount,
sum(o.quantity) as TotalQty,
sum(o.linesalesamount) as TotalAmt,
avg(o.margin) as AvgMargin
from
{{ref('fct_orders')}} o
join
{{ref('dim_employees')}} e
on
o.employeeid=e.empid
join
{{ref('dim_customers')}} c
on
o.customerid=c.customerid
where e.country = '{{var('v_country','France')}}'
group by
e.country, 
c.companyname,
c.contactname