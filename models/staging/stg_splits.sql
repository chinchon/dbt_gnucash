with
    splits as (
        select
            *,
            cast(reconcile_state = 'y' as int) as is_reconciled,
            cast(cast(value_num as double) / value_denom as double) as value,
            cast(cast(quantity_num as double) / quantity_denom as double) as quantity
        from {{ source("gnucash", "splits") }}
    )
select *, cast(value = quantity as int) as is_value_equal_quantity
from splits
