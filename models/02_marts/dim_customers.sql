with customers as (

    select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

customer_orders as (

    select
        customer,
        min(order_total) as minimum_order_value,
        max(order_total) as maximum_order_value,
        count(order_id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        customers.customer,
        customers.customer_name,
        customer_orders.minimum_order_value,
        customer_orders.maximum_order_value,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer)

)

select * from final
