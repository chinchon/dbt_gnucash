select
    account_guid as guid,
    max(
        case reconcile_state when 'y' then reconcile_date else null end
    ) as last_reconcile_date,
    count(*) as count_of_splits
from {{ ref("stg_splits") }}
group by 1
