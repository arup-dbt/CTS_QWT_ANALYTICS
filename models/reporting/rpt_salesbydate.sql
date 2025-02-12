{{config(materialized='view', schema = 'reporting_dev')}}

select 
a.companyname,
a.contactname,
a.mndate,
b.day_of_week_name mnWeek,
a.mxdate,
c.day_of_week_name mxweek,
a.TotalAmt
 from
(
select 
c.companyname,
c.contactname,
min(o.orderdate) mndate,
max(o.orderdate) mxdate,
sum(o.quantity) as TotalAmt
from
{{ref('fct_orders')}} o
left join
{{ref('dim_customers')}} c
on
o.customerid=c.customerid
group by
c.companyname,
c.contactname
) as a
left join
{{ref('dim_date')}} as b
on
a.mndate=b.date_day
left join
{{ref('dim_date')}} as c
on
a.mxdate=c.date_day