SELECT
    s.guid,
    date(tx.post_date) transaction_date,
    tx.description,
    a.fullname AS account_name,
    commodity,
    value_num / value_denom AS amount,
    quantity_num / quantity_denom AS quantity
FROM {{ source("gnucash", "splits") }} s