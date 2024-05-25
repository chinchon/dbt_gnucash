with
    source as (select * from {{ source("gnucash", "taxtable_entries") }}),

    renamed as (

        select id, taxtable, account, amount_num, amount_denom, type from source

    )

select *
from renamed
