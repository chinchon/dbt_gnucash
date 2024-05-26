select
    sum(subtotal_myr) as subtotal_myr,
    sum(subtotal_sgd) as subtotal_sgd,
    sum(subtotal_usd) as subtotal_usd
from {{ ref("rpt_balance_sheet") }}
where account_category in ('Assets', 'Liabilities')
