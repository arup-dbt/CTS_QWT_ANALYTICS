{% snapshot shipments_snapshot %}

{{
    config
    (
        target_database = 'DBT_DB',
        target_schema = 'SNAPSHOT_DEV',
        unique_key="orderid||'-'||lineno",
 

        strategy = 'timestamp',
        updated_at = 'ShipmentDate'
    )

}}

select * from {{ref('stg_shipments')}}

{% endsnapshot %}