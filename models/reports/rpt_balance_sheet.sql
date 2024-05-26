select
    account_category,
    sum(balance_myr) as balance_myr,
    sum(balance_sgd) as balance_sgd,
    sum(balance_usd) as balance_usd
from {{ ref("rpt_account_balances") }}
group by 1
