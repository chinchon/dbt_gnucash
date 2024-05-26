select account_category, sum(balance_myr) as balance_myr
from {{ ref("rpt_account_balances") }}
group by 1
