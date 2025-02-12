{{config(materialized='table', schema = 'salesmart_dev')}}

{% set min_order_date = min_date() %}

{% set max_order_date = max_date() %}

{{ dbt_date.get_date_dimension(min_order_date, max_order_date) }}