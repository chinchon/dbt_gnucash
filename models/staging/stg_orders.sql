with
    source as (select * from {{ source('gnucash', 'orders') }}),

    renamed as (

        select
            guid,
            id,
            notes,
            reference,
            active,
            date_opened,
            date_closed,
            owner_type,
            owner_guid

        from source

    )

select *
from renamed
