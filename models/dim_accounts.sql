SELECT
  a.guid,
  Replace(
    CONCAT_WS(':', parent7.name, parent6.name, parent5.name, parent4.name, parent3.name, parent2.name, parent.name, a.name),
    'Root Account:', ''
  ) AS fullname,
  a.name,
  a.account_type, 
  a.description,
  CONCAT_WS(':', c.namespace, mnemonic) AS commodity
FROM {{ source("gnucash", "accounts") }} a
LEFT JOIN {{ source("gnucash", "commodities") }} c ON c.guid = commodity_guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent ON a.parent_guid = parent.guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent2 ON parent.parent_guid = parent2.guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent3 ON parent2.parent_guid = parent3.guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent4 ON parent3.parent_guid = parent4.guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent5 ON parent4.parent_guid = parent5.guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent6 ON parent5.parent_guid = parent6.guid
LEFT JOIN {{ source("gnucash", "accounts") }} AS parent7 ON parent6.parent_guid = parent7.guid
