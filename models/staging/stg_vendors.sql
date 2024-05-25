with
    source as (select * from {{ source("gnucash", "vendors") }}),

    renamed as (

        select
            guid,
            name,
            id,
            notes,
            currency,
            active,
            tax_override,
            addr_name,
            addr_addr1,
            addr_addr2,
            addr_addr3,
            addr_addr4,
            addr_phone,
            addr_fax,
            addr_email,
            terms,
            tax_inc,
            tax_table

        from source

    )

select *
from renamed
