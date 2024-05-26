select
    a.guid,
    name,
    fqn,
    substring(
        replace(fqn, 'Root Account:', ''),
        1,
        instr(replace(fqn, 'Root Account:', ''), ':') - 1
    ) as account_category,
    account_type,
    is_placeholder,
    last_reconcile_date,
    count_of_splits,
    count_of_splits_reconciled,
    count_of_splits_unreconciled,
    latest_transaction,
    c.mnemonic as unit,
    balance,
    balance * value_myr as balance_myr,
    balance * value_sgd as balance_sgd,
    balance * value_usd as balance_usd,
    parent_guid
from {{ ref("stg_accounts") }} a
left join {{ ref("int_splits_aggregated_to_accounts") }} using (guid)
left join {{ ref("int_accounts_joined_parent_accounts") }} using (guid)
left join {{ ref("stg_commodities") }} c on a.commodity_guid = c.guid
left join {{ ref("dim_prices") }} p on p.commodity_mnemonic = c.mnemonic
