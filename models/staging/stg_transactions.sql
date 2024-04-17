select *
from {{ source("gnucash", "transactions") }}
