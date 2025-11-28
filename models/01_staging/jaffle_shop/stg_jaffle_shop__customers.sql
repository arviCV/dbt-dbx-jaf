select
    id as customer,
    name as cutomer_name

from {{ source('jaffle_shop', 'customers') }}