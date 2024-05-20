with
    source as (select * from {{ source('gnucash', 'prices') }}),

    renamed as (

        select
            guid,
            commodity_guid,
            currency_guid,
            date,
            source,
            type,
            value_num,
            value_denom

        from source

    )

select *
from renamed
