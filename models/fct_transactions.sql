SELECT 
    t.guid, date(post_date) AS DATE, description, mnemonic AS currency
FROM {{ source("public", "transactions" )}} t
LEFT JOIN {{ source("public", "commodities" )}} c ON c.guid = currency_guid
