with
    source as (select * from {{ source("gnucash", "gnclock") }}),

    renamed as (select hostname, pid from source)

select *
from renamed
