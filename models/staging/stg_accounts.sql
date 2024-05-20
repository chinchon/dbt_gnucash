with
    source as (select * from {{ source('gnucash', 'accounts') }}),

    renamed as (

        select
            guid,
            name,
            account_type,
            commodity_guid,
            commodity_scu,
            non_std_scu,
            parent_guid,
            code,
            description,
            hidden,
            placeholder

        from source

    )

select *, placeholder = 1 as is_placeholder
from renamed
