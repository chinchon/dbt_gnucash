select guid, name, fqn, last_reconcile_date
from {{ ref("stg_accounts") }}
left join {{ ref("int_splits_aggregated_to_accounts") }} using (guid)
left join {{ ref("int_accounts_joined_parent_accounts") }} using (guid)
