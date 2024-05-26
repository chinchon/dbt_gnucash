select name as account_category, subtotal_myr, subtotal_sgd, subtotal_usd
from {{ ref("rpt_account_balances") }}
join {{ ref("int_accounts_joined_parent_accounts") }} using (guid)
where depth = 2
