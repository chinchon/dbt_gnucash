with
    source as (select * from {{ source('gnucash', 'schedxactions') }}),

    renamed as (

        select
            guid,
            name,
            enabled,
            start_date,
            end_date,
            last_occur,
            num_occur,
            rem_occur,
            auto_create,
            auto_notify,
            adv_creation,
            adv_notify,
            instance_count,
            template_act_guid

        from source

    )

select *
from renamed
