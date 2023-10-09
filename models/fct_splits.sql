SELECT 
    s.guid, s.account_guid, a.name, t.date, value_num::decimal(20, 2) / value_denom AS value
FROM {{ source("public", "splits") }} s
LEFT JOIN {{ ref("fct_transactions") }} t ON t.guid = tx_guid
LEFT JOIN {{ source("public", "accounts") }} a ON a.guid = s.account_guid
