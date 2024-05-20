with
    source as (select * from {{ source('gnucash', 'customers') }}),

    renamed as (

        select
            guid,
            name,
            id,
            notes,
            active,
            discount_num,
            discount_denom,
            credit_num,
            credit_denom,
            currency,
            tax_override,
            addr_name,
            addr_addr1,
            addr_addr2,
            addr_addr3,
            addr_addr4,
            addr_phone,
            addr_fax,
            addr_email,
            shipaddr_name,
            shipaddr_addr1,
            shipaddr_addr2,
            shipaddr_addr3,
            shipaddr_addr4,
            shipaddr_phone,
            shipaddr_fax,
            shipaddr_email,
            terms,
            tax_included,
            taxtable

        from source

    )

select *
from renamed
