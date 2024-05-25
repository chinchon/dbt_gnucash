with
    source as (select * from {{ source("gnucash", "lots") }}),

    renamed as (select guid, account_guid, is_closed from source)

select *
from renamed
