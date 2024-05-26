select
    name as account_category,
    round(subtotal_myr, 2) as subtotal_myr,
    round(subtotal_sgd, 2) as subtotal_sgd,
    round(subtotal_usd, 2) as subtotal_usd
from {{ ref("rpt_account_balances") }}
join {{ ref("int_accounts_joined_parent_accounts") }} using (guid)
where depth = 2
