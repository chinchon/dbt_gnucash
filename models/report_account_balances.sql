SELECT fullname, SUM(VALUE)
FROM {{ ref("fct_splits") }} s
LEFT JOIN {{ ref("dim_accounts") }} a ON a.guid = s.account_guid
GROUP BY 1
ORDER BY 1