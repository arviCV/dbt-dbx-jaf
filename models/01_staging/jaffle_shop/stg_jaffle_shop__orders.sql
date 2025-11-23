select
    id as order_id,
    customer,
    ordered_at,
    store_id,
    subtotal,
    tax_paid,
    order_total

from raw.jaffle_shop.orders
