with
    source as (select * from {{ source('gnucash', 'books') }}),

    renamed as (select guid, root_account_guid, root_template_guid from source)

select *
from renamed
