select

    case
        when l2.name is null
        then l1.guid
        when l3.name is null
        then l2.guid
        when l4.name is null
        then l3.guid
        when l5.name is null
        then l4.guid
        when l6.name is null
        then l5.guid
        when l7.name is null
        then l6.guid
        when l8.name is null
        then l7.guid
        when l9.name is null
        then l8.guid
    end as guid,
    concat_ws(
        ':',
        l1.name,
        l2.name,
        l3.name,
        l4.name,
        l5.name,
        l6.name,
        l7.name,
        l8.name,
        l9.name
    ) as fqn
from {{ ref("stg_accounts") }} r
left join {{ ref("stg_accounts") }} l1 on l1.parent_guid = r.guid
left join {{ ref("stg_accounts") }} l2 on l2.parent_guid = l1.guid
left join {{ ref("stg_accounts") }} l3 on l3.parent_guid = l2.guid
left join {{ ref("stg_accounts") }} l4 on l4.parent_guid = l3.guid
left join {{ ref("stg_accounts") }} l5 on l5.parent_guid = l4.guid
left join {{ ref("stg_accounts") }} l6 on l6.parent_guid = l5.guid
left join {{ ref("stg_accounts") }} l7 on l7.parent_guid = l6.guid
left join {{ ref("stg_accounts") }} l8 on l8.parent_guid = l7.guid
left join {{ ref("stg_accounts") }} l9 on l9.parent_guid = l8.guid
where r.name = 'Root Account'
