with
    source as (select * from {{ source('gnucash', 'invoices') }}),

    renamed as (

        select
            guid,
            id,
            date_opened,
            date_posted,
            notes,
            active,
            currency,
            owner_type,
            owner_guid,
            terms,
            billing_id,
            post_txn,
            post_lot,
            post_acc,
            billto_type,
            billto_guid,
            charge_amt_num,
            charge_amt_denom

        from source

    )

select *
from renamed
