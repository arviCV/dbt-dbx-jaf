with 

source as (

    select * from {{ source('inventory', 'stores') }}

),

renamed as (

    select
        id as store_id,
        name as location,
        opened_at,
        tax_rate

    from source

)

select * from renamed