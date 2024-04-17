select *
from {{ source("gnucash", "splits") }}
