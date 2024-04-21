select *
from {{ ref("dim_accounts") }}
where
    not is_placeholder
    and count_of_splits > 0
    and account_type not in ('INCOME', 'EXPENSE', 'TRADING', 'EQUITY')
order by count_of_splits_unreconciled desc, last_reconcile_date
