select sum(balance_myr) as balance_myr
from {{ ref("rpt_balance_sheet") }}
where account_category in ('Assets', 'Liabilities')
