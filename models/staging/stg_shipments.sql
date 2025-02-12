{{config(materialized= 'table')}}

select 
OrderID,
LineNo,
ShipperID,
CustomerID,
ProductID,
employeeid,
date(left(ShipmentDate,9)) as ShipmentDate,
Status
from 
{{source('raw_qwt', 'raw_shipments')}}