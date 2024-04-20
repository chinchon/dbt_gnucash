{% set max_parent = 10 %}
select
    l1.guid,
    l1.name,
    {% for i in range(2, max_parent) %}
        l{{ i }}.name{% if not loop.last %},{% endif %}
    {% endfor %}
from int_accounts_trimmed l1
{% for i in range(2, max_parent) %}
    left join int_accounts_trimmed l{{ i }} on l{{ i }}.guid = l{{ i - 1 }}.parent_guid
{% endfor %}
