select *
from {{ ref('stg_jaffle_shop__orders') }}
where subtotal + tax_paid != order_total
