{% set max_parent = 10 %}
select
    l1.guid,
    -- fully qualified name
    concat_ws(
        ':',
        {% for i in range(1, max_parent) | reverse %}
            (l{{ i }}.name){% if not loop.last %},{% endif %}
        {% endfor %}
    ) as fqn,
    -- depth= 1:root, 2:assets/liabilities/income/expenses/equity
    case
        {% for i in range(1, max_parent) %}
            when l{{ i }}.name is null then {{ i - 1 }}
        {% endfor %}
    end as depth,
    -- account names of all level
    l1.name as l1_name,
    {% for i in range(2, max_parent) %}
        l{{ i }}.name as l{{ i }}_name{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref("int_accounts_trimmed") }} l1
{% for i in range(2, max_parent) %}
    left join
        {{ ref("int_accounts_trimmed") }} l{{ i }}
        on l{{ i }}.guid = l{{ i - 1 }}.parent_guid
{% endfor %}
