select
    a.guid,
    a.name,
    a.fqn,
    a.account_category,
    a.latest_transaction,
    a.unit,
    round(a.balance, 2) as balance,
    round(a.balance * value_myr, 2) as balance_myr,
    round(a.balance * value_sgd, 2) as balance_sgd,
    round(a.balance * value_usd, 2) as balance_usd,
    parent_guid
from {{ ref("dim_accounts") }} a
left join {{ ref("dim_prices") }} p on p.commodity_mnemonic = a.unit
