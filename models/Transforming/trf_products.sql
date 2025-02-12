{{config(materialized='table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
p.productid,
p.productname,
s.CompanyName,
s.ContactName,
s.Address,
s.City,
s.Country,
c.categoryname,
p.quantityperunit,
p.UnitCost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
to_decimal((p.unitprice - p.UnitCost),9,2) as profit,
iff(p.unitsinstock - p.unitsonorder < 0, 'not available', 'available') as productavailability
from
{{ref('stg_products')}} p
left join 
{{ref('trf_suppliers')}} s
on
p.SupplierID = s.SupplierID
left join 
{{ref('lkp_categories')}} c
on
p.categoryid = c.categoryid