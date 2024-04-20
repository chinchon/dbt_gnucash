select *
from {{ ref('dim_accounts') }}
where not is_placeholder and count_of_splits > 0
order by last_reconcile_date
