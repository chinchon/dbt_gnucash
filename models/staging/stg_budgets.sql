with
    source as (select * from {{ source("gnucash", "budgets") }}),

    renamed as (select guid, name, description, num_periods from source)

select *
from renamed
