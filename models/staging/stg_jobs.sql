with
    source as (select * from {{ source('gnucash', 'jobs') }}),

    renamed as (

        select guid, id, name, reference, active, owner_type, owner_guid from source

    )

select *
from renamed
