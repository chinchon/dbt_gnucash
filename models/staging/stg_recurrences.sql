with
    source as (select * from {{ source('gnucash', 'recurrences') }}),

    renamed as (

        select
            id,
            obj_guid,
            recurrence_mult,
            recurrence_period_type,
            recurrence_period_start,
            recurrence_weekend_adjust

        from source

    )

select *
from renamed
