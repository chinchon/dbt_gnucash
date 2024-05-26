{% set max_parent = 10 %}
with
    p1 as (
        select
            parent_guid as guid,
            sum(balance_myr) as subtotal_myr,
            sum(balance_sgd) as subtotal_sgd,
            sum(balance_usd) as subtotal_usd
        from {{ ref("dim_accounts") }}
        group by parent_guid
    ),
    {% for i in range(2, max_parent) %}
        p{{ i }} as (
            select
                parent_guid as guid,
                sum(subtotal_myr) as subtotal_myr,
                sum(subtotal_sgd) as subtotal_sgd,
                sum(subtotal_usd) as subtotal_usd
            from {{ ref("dim_accounts") }} a
            join p{{ i - 1 }} using (guid)
            group by parent_guid
        )
        {% if not loop.last %},{% endif %}
    {% endfor %}
select
    a.guid,
    a.name,
    a.fqn,
    a.account_category,
    a.latest_transaction,
    a.unit,
    a.balance,
    a.balance_myr,
    a.balance_sgd,
    a.balance_usd,
    ifnull(a.balance_myr, 0)
    {% for i in range(1, max_parent) %}
        + ifnull(p{{ i }}.subtotal_myr, 0)
    {% endfor %} as subtotal_myr,
    ifnull(a.balance_sgd, 0)
    {% for i in range(1, max_parent) %}
        + ifnull(p{{ i }}.subtotal_sgd, 0)
    {% endfor %} as subtotal_sgd,
    ifnull(a.balance_usd, 0)
    {% for i in range(1, max_parent) %}
        + ifnull(p{{ i }}.subtotal_usd, 0)
    {% endfor %} as subtotal_usd
from {{ ref("dim_accounts") }} a
{% for i in range(1, max_parent) %} left join p{{ i }} using (guid) {% endfor %}
