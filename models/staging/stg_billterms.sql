with
    source as (select * from {{ source("gnucash", "billterms") }}),

    renamed as (

        select
            guid,
            name,
            description,
            refcount,
            invisible,
            parent,
            type,
            duedays,
            discountdays,
            discount_num,
            discount_denom,
            cutoff

        from source

    )

select *
from renamed
