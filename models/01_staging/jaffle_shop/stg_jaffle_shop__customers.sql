with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        id as customer,
        name as customer_name

    from source

)

select * from renamed