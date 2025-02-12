{% macro min_date() -%}
 
{% set min_query %}
select min(orderdate) as orderdate
from {{ ref('fct_orders') }}
{% endset %}
 
{% set results = run_query(min_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{% endmacro %}