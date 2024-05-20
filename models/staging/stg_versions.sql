with
    source as (select * from {{ source('gnucash', 'versions') }}),

    renamed as (select table_name, table_version from source)

select *
from renamed
