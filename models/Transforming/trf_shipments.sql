{{config(materialized='table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
ss.orderid,
ss.lineno,
s.companyname,
ss.ShipmentDate,
ss.Status
from
{{ref('shipments_snapshot')}} as ss 
inner join 
{{ref('lkp_shippers')}} as s
on 
ss.ShipperID = s.ShipperID
where
ss.dbt_valid_to is null