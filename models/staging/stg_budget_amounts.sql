with
    source as (select * from {{ source("gnucash", "budget_amounts") }}),

    renamed as (

        select id, budget_guid, account_guid, period_num, amount_num, amount_denom

        from source

    )

select *
from renamed
