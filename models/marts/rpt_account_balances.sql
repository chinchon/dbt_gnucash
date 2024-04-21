select guid, name, fqn, round(balance, 2) as balance, unit
from {{ ref("dim_accounts") }}
