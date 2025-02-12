{{config(materialized='table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
GET(XMLGET(CONTACTS_INFO, 'SupplierID'), '$') as SupplierID,
GET(XMLGET(CONTACTS_INFO, 'CompanyName'), '$')::varchar as CompanyName,
GET(XMLGET(CONTACTS_INFO, 'ContactName'), '$')::varchar as ContactName,
GET(XMLGET(CONTACTS_INFO, 'Address'), '$')::varchar as Address,
GET(XMLGET(CONTACTS_INFO, 'City'), '$')::varchar as City,
GET(XMLGET(CONTACTS_INFO, 'PostalCode'), '$')::varchar as PostalCode,
GET(XMLGET(CONTACTS_INFO, 'Country'), '$')::varchar as Country,
GET(XMLGET(CONTACTS_INFO, 'Phone'), '$')::varchar as Phone,
GET(XMLGET(CONTACTS_INFO, 'Fax'), '$')::varchar as Fax
from
{{ref('stg_suppliers')}}