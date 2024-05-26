select
    a.guid,
    a.name,
    a.fqn,
    round(a.balance, 2) as balance,
    a.unit,
    a.latest_transaction,
    round(a.balance * value_myr, 2) as balance_myr
from {{ ref("dim_accounts") }} a
left join {{ ref("dim_prices") }} p on p.commodity_mnemonic = a.unit
