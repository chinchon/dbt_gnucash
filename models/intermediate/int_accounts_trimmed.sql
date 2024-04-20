select guid, name, parent_guid from {{ ref("stg_accounts") }}
