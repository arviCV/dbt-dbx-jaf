select 
    tax_rate
from {{ ref("stg_inventory__stores")}}
where tax_rate > 0.09
