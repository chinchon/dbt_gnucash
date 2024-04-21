select
    account_guid as guid,
    max(
        case reconcile_state when 'y' then reconcile_date else null end
    ) as last_reconcile_date,
    count(*) as count_of_splits,
    sum(cast(reconcile_state = 'y' as int)) as count_of_splits_reconciled,
    sum(cast(reconcile_state != 'y' as int)) as count_of_splits_unreconciled,
    cast(sum(value) as double) as balance
from {{ ref("stg_splits") }}
group by 1
