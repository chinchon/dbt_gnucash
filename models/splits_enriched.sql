SELECT
    s.guid,
    date(tx.post_date) transaction_date,
    tx.description,
    a.fullname AS account_name,
    commodity,
    value_num / value_denom AS amount,
    quantity_num / quantity_denom AS quantity
FROM {{ source("gnucash", "splits") }} s
LEFT JOIN {{ source("gnucash", "transactions") }} tx ON tx.guid = tx_guid
LEFT JOIN {{ ref("accounts_enriched") }} a ON a.guid = account_guid
ORDER BY 2 DESC, tx_guid
