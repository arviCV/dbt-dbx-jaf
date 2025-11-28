select
    id as store_id,
    name as location,
    opened_at,
    tax_rate

from {{ source('inventory', 'stores') }}