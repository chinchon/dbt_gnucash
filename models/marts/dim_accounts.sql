select guid, name, last_reconcile_date
from {{ ref("stg_accounts") }} a
left join
    {{ ref("int_splits_aggregated_to_accounts") }} agg on a.guid = agg.account_guid
