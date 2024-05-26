with
    source as (select * from {{ source("gnucash", "splits") }}),

    renamed as (

        select
            guid,
            tx_guid,
            account_guid,
            memo,
            action,
            reconcile_state,
            reconcile_date,
            value_num,
            value_denom,
            quantity_num,
            quantity_denom,
            lot_guid,
            cast(reconcile_state = 'y' as int) as is_reconciled,
            cast(value_num as double) / value_denom as value,
            cast(quantity_num as double) / quantity_denom as quantity

        from source

    )

select *, cast(value = quantity as int) as is_value_equal_quantity
from renamed
