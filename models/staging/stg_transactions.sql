with
    source as (select * from {{ source("gnucash", "transactions") }}),

    renamed as (

        select guid, currency_guid, num, post_date, enter_date, description from source

    )

select *
from renamed
