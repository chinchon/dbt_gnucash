SELECT * FROM {{ ref("report_account_balances") }}
WHERE fullname LIKE 'Assets%' OR fullname LIKE 'Equity%' OR fullname LIKE 'Liabilities%'