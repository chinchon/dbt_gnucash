with
    source as (select * from {{ source("gnucash", "taxtables") }}),

    renamed as (select guid, name, refcount, invisible, parent from source)

select *
from renamed
