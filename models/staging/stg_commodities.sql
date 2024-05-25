with
    source as (select * from {{ source("gnucash", "commodities") }}),

    renamed as (

        select
            guid,
            namespace,
            mnemonic,
            fullname,
            cusip,
            fraction,
            quote_flag,
            quote_source,
            quote_tz

        from source

    )

select *
from renamed
