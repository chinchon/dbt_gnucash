select *, placeholder = 1 as is_placeholder from {{ source("gnucash", "accounts") }}
