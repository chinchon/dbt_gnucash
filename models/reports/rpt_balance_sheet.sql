select account_category, sum(balance_myr) from {{ ref("rpt_account_balances") }}
