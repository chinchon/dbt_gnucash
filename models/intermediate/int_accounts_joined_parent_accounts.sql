{% set max_parent = 10 %}
select
    l1.guid,
    concat_ws(
        ':',
        {% for i in range(1, max_parent)|reverse %}
            nullif(l{{ i }}.name, 'Root Account'){% if not loop.last %},{% endif %}
        {% endfor %}
    ) as fqn,
    l1.name as l1_name,
    {% for i in range(2, max_parent) %}
        l{{ i }}.name as l{{ i }}_name{% if not loop.last %},{% endif %}
    {% endfor %}
from int_accounts_trimmed l1
{% for i in range(2, max_parent) %}
    left join int_accounts_trimmed l{{ i }} on l{{ i }}.guid = l{{ i - 1 }}.parent_guid
{% endfor %}
