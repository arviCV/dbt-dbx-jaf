with customers as (

    select
        id as customer,
        name as cutomer_name

    from raw.jaffle_shop.customers

),

orders as (

    select
        id as order_id,
        customer,
        ordered_at,
        store_id,
        subtotal,
        tax_paid,
        order_total,

    from jaffle_shop.orders

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
        customers.name,
        customer_orders.minimum_order_value,
        customer_orders.maximum_order_value,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer)

)

select * from final
