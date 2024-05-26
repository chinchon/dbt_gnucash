select
    sum(balance_myr) as balance_myr,
    sum(balance_sgd) as balance_sgd,
    sum(balance_usd) as balance_usd
from {{ ref("rpt_balance_sheet") }}
where account_category in ('Assets', 'Liabilities')
