with
    source as (select * from {{ source('gnucash', 'employees') }}),
    renamed as (

        select
            guid,
            username,
            id,
            language,
            acl,
            active,
            currency,
            ccard_guid,
            workday_num,
            workday_denom,
            rate_num,
            rate_denom,
            addr_name,
            addr_addr1,
            addr_addr2,
            addr_addr3,
            addr_addr4,
            addr_phone,
            addr_fax,
            addr_email

        from source

    )

select *
from renamed
