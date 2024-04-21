select
    a.guid,
    name,
    fqn,
    account_type,
    is_placeholder,
    last_reconcile_date,
    count_of_splits,
    count_of_splits_reconciled,
    count_of_splits_unreconciled,
    balance,
    c.mnemonic as unit
from {{ ref("stg_accounts") }} a
left join {{ ref("int_splits_aggregated_to_accounts") }} using (guid)
left join {{ ref("int_accounts_joined_parent_accounts") }} using (guid)
left join {{ ref("stg_commodities") }} c on a.commodity_guid = c.guid
