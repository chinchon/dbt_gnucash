select
    account_guid,
    max(
        case reconcile_state when 'y' then reconcile_date else null end
    ) as last_reconcile_date
from {{ ref("stg_splits") }}
group by 1
