with
    source as (select * from {{ source("gnucash", "slots") }}),

    renamed as (

        select
            id,
            obj_guid,
            name,
            slot_type,
            int64_val,
            string_val,
            double_val,
            timespec_val,
            guid_val,
            numeric_val_num,
            numeric_val_denom,
            gdate_val

        from source

    )

select *
from renamed
