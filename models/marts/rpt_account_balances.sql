select guid, name, fqn, round(balance, 2) as balance, unit, latest_transaction
from {{ ref("dim_accounts") }}
