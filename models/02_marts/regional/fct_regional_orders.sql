with orders as  (
    select * from {{ ref ('stg_jaffle_shop__orders' )}}
),

stores as (
    select * from {{ ref ('stg_inventory__stores') }}
),

store_orders as (

    select
        store_id,
        min(order_total) as minimum_order_value,
        max(order_total) as maximum_order_value,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        stores.store_id,
        stores.location,
        coalesce (store_orders.number_of_orders, 0) as number_of_orders

    from stores

    left join store_orders using (store_id)
)

select * from final