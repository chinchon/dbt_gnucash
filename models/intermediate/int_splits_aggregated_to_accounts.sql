select
    account_guid as guid,
    max(
        case when is_reconciled = 1 then reconcile_date else null end
    ) as last_reconcile_date,
    count(*) as count_of_splits,
    sum(is_reconciled) as count_of_splits_reconciled,
    sum(case when is_reconciled = 1 then 0 else 1 end) as count_of_splits_unreconciled,
    sum(quantity) as balance,
    t.post_date as latest_transaction
from {{ ref("stg_splits") }} s
left join {{ ref("stg_transactions") }} t on t.guid = s.tx_guid
group by 1
