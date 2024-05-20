with
    source as (select * from {{ source('gnucash', 'entries') }}),

    renamed as (

        select
            guid,
            date,
            date_entered,
            description,
            action,
            notes,
            quantity_num,
            quantity_denom,
            i_acct,
            i_price_num,
            i_price_denom,
            i_discount_num,
            i_discount_denom,
            invoice,
            i_disc_type,
            i_disc_how,
            i_taxable,
            i_taxincluded,
            i_taxtable,
            b_acct,
            b_price_num,
            b_price_denom,
            bill,
            b_taxable,
            b_taxincluded,
            b_taxtable,
            b_paytype,
            billable,
            billto_type,
            billto_guid,
            order_guid

        from source

    )

select *
from renamed
