WITH root AS (
    SELECT * FROM accounts WHERE parent_guid IS NULL
)
SELECT COALESCE(l4.guid, l3.guid, l2.guid, l1.guid) AS guid, concat_ws(':', l1.name, l2.name, l3.name, l4.name) AS fullname
FROM root r
left JOIN accounts l1 ON l1.parent_guid = r.guid
left JOIN accounts l2 ON l2.parent_guid = l1.guid
left JOIN accounts l3 ON l3.parent_guid = l2.guid
left JOIN accounts l4 ON l4.parent_guid = l3.guid
