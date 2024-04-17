select *
from {{ source("gnucash", "accounts") }}